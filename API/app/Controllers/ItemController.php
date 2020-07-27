<?php
namespace App\Controllers;

use Config\App;

class ItemController extends Origin001
{
    protected $format = 'json';

    protected $mst_unit;
    protected $mst_item;

    /**
     * Constructure class
     */
    public function initController( \CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger )
    {

        // Do Not Edit This Line
        parent::initController( $request, $response, $logger );

        //--------------------------------------------------------------------
        // Preload any models, libraries, etc, here.
        //--------------------------------------------------------------------
        // E.g.:
        // $this->session = \Config\Services::session();

        $this->mst_unit = $this->db->table( 'mst_unit' );
        $this->mst_item = $this->db->table( 'mst_item' );

    }

    /**
     * delete data by id
     */
    public function delete_data_by_id()
    {
        $data = $this->request->getJSON();

        //init data
        $token     = $this->getAuthHeader();
        $item_code = isset( $data->item_code ) ? $data->item_code : -1;

        $result = $this->_checkToken( $token );
        //print_r($result);
        if ( $result->user_id > 0 ) {
            $insert_data['active_flag'] = false;
            $insert_data['update_date'] = date( "Y-m-d H:i:s" );
            $insert_data['update_user'] = $result->user_id;

            $this->mst_item->update( $insert_data, ['item_code' => $item_code] );

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $dataDB['status']  = "success";
            $dataDB['message'] = "";
            $dataDB['data']    = $data;

        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

        return $this->respond( $dataDB, 200 );
    }

    /**
     * get data by id
     */
    public function get_data_by_id()
    {
        $token = $this->getAuthHeader();
        $data  = $this->request->getJSON();

        //init data
        $item_code = isset( $data->item_code ) ? $data->item_code : -1;

        $result = $this->_checkToken( $token );
        if ( $result->user_id > 0 ) {
            $query_str = "
			SELECT *
			FROM mst_item
			WHERE item_code = :item_code:
				AND active_flag = true
			";

            $itemn_data = $this->db->query( $query_str, ['item_code' => $item_code] )->getRow();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $dataDB['status']  = "success";
            $dataDB['message'] = $query_str;
            $dataDB['data']    = $itemn_data;

        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

        return $this->respond( $dataDB, 200 );
    }

    public function get_all_item_by_location()
    {
        $token = $this->getAuthHeader();
        $data  = $this->request->getJSON();

        //init data
        $factory_code  = isset( $data->factory_code ) ? $data->factory_code : '';
        $location_code = isset( $data->location_code ) ? $data->location_code : '';

        $result = $this->_checkToken( $token );
        if ( $result->user_id > 0 ) {
            $query_str = "
            SELECT ps.*,i.item_name
            from prg_stock ps inner join mst_item i on ps.item_code  = i.item_code
            where ps.factory_code =:factory_code and ps.location_code = :location_code
				AND i.active_flag = true and ps.quantity > 0
			";

            $itemn_data = $this->db->query( $query_str, ['factory_code' => $factory_code, 'location_code' => $location_code] )->getResult();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $dataDB['status']  = "success";
            $dataDB['message'] = $query_str;
            $dataDB['data']    = $itemn_data;

        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

        return $this->respond( $dataDB, 200 );
    }

    private function _getCond( $s )
    {
        $strCond = "";
        $params  = [];

        foreach ( $s as $key => $val ) {

            if ( $val == "" ) {
                continue;
            }

            switch ( $key ) {
                //case "example":
                //        $strCond .= "(example == false OR example IS NULL) \n";    // placeholders
                //        //$params["{$key}"] = "%{$val}%";                        // bindParam
                //    break;
                //case "start_date":
                //        $strCond .= "start_date >= :{$key} AND \n";    // placeholders
                //        $params["{$key}"] = "%{$val}%";                // bindParam
                //    break;
                //case "name":
                //        $strCond .= "name like :{$key} AND \n";        // placeholders
                //        $params["{$key}"] = "%{$val}%";                // bindParam
                //    break;

                case "item_name":
                    $strCond .= " LOWER(item_name) like '%" . strtolower( $val ) . "%' AND \n"; // placeholders
                    break;
                case "item_code":
                    $strCond .= " LOWER(item_code) like '%" . strtolower( $val ) . "%' AND \n"; // placeholders
                    break;
                case "rowsPerpage":
                case "page_index":
                case "sort":
                case "sort_preset":
                case "direction":
                    break;
                default:
                    $strCond .= "{$key}='{$val}' AND \n"; // placeholders        "key" = :key
                    $params["{$key}"] = "{$val}"; // bindParam        "key"=>val
                    break;
            }
        }

        return [$strCond, $params];
    }

    /**
     * get list data
     */
    public function get_data_list()
    {
        $data  = $this->request->getJSON();
        $token = $this->getAuthHeader();

        //Validate Data

        $limit  = intval( $data->rowsPerpage );
        $offset = ( $data->page_index - 1 ) * $limit;

        $result = $this->_checkToken( $token );
        if ( $result->user_id >= 0 ) {

            // ???? Condition
            list( $strCond, $params ) = $this->_getCond( $data );

            $query_str = "
			SELECT *
			FROM mst_item
			WHERE " . $strCond . " active_flag = true
			ORDER BY item_code
			LIMIT {$limit} OFFSET {$offset}
			";
            //print_r($query_str);exit;
            $query_count = "
			SELECT count(item_code) as my_count
			FROM mst_item
			WHERE " . $strCond . " active_flag = true
			ORDER BY item_code
			";

            $itemn_data = $this->db->query( $query_str, [$result->company_id] )->getResult();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $itemn_count = $this->db->query( $query_count, [$result->company_id] )->getResult();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $dataDB['status']   = "success";
            $dataDB['message']  = "";
            $dataDB['data']     = $itemn_data;
            $dataDB['max_rows'] = $itemn_count[0]->my_count;

        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

        return $this->respond( $dataDB, 200 );
    }

    /**
     * ีupdate / insert data to database
     */
    public function update_data()
    {
        $token = $this->getAuthHeader();
        $data  = $this->request->getJSON();

        //init data
        $old_item_code = isset( $data->old_item_code ) ? trim( $data->old_item_code ) : '';

        $item_code = isset( $data->item_code ) ? trim( $data->item_code ) : '';
        $item_name = isset( $data->item_name ) ? trim( $data->item_name ) : '';
        $item_type = isset( $data->item_type ) ? trim( $data->item_type ) : '';

        $lot_flag             = isset( $data->lot_flag ) ? $data->lot_flag : -1;
        $unit_code            = isset( $data->unit_code ) ? trim( $data->unit_code ) : '';
        $production_lead_time = isset( $data->production_lead_time ) ? trim( $data->production_lead_time ) : 0;
        $request_decimal      = isset( $data->request_decimal ) ? $data->request_decimal : 0;

        $mrp_flag          = isset( $data->mrp_flag ) ? $data->mrp_flag : false;
        $standard_location = isset( $data->standard_location ) ? trim( $data->standard_location ) : '';

        $remark = isset( $data->remark ) ? trim( $data->remark ) : '';

        //Validation Data
        if ( $token == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token is empty";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        if ( $item_name == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุชื่อวัตถุดิบ";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        if ( $item_code == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุรหัสวัตถุดิบ";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        //get data from token
        $result = $this->_checkToken( $token );

        if ( $result->user_id > 0 ) {

            if ( $this->is_dupplicate_data( $old_item_code, $item_code ) ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = "รหัสวัตถุดิบนี้มีการใช้งานแล้ว";
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            if ( $old_item_code == -1 ) {
                $old_data = $this->mst_item->getWhere( ['item_code' => $item_code, 'active_flag' => false] )->getRow();
                if ( isset( $old_data ) ) {
                    $old_item_code = $old_data->item_code;
                }
            }

            $insert_data = [];

            //$insert_data['m_company_id']    = $result->company_id;

            //set data to array for add or update
            $insert_data['item_code']            = $item_code;
            $insert_data['item_name']            = $item_name;
            $insert_data['item_type']            = $item_type;
            $insert_data['lot_flag']             = $lot_flag;
            $insert_data['unit_code']            = $unit_code;
            $insert_data['standard_location']    = $standard_location;
            $insert_data['production_lead_time'] = $production_lead_time;
            $insert_data['request_decimal']      = $request_decimal;
            $insert_data['mrp_flag']             = $mrp_flag;

            $insert_data['remark']      = $remark;
            $insert_data['active_flag'] = true;

            $this->db->transStart();

            if ( $old_item_code == '-1' ) {
                $insert_data['create_date'] = date( "Y-m-d H:i:s" );
                $insert_data['create_user'] = $result->user_id;
                $this->mst_item->insert( $insert_data );

                if ( $this->db->error()['message'] !== '' ) {
                    $dataDB['status']  = "error";
                    $dataDB['message'] = $this->db->error()['message'];
                    $dataDB['data']    = "";

                    return $this->respond( $dataDB, 200 );
                }
            } else {
                $insert_data['update_date'] = date( "Y-m-d H:i:s" );
                $insert_data['update_user'] = $result->user_id;

                $this->mst_item->update( $insert_data, ['item_code' => $old_item_code] );

                if ( $this->db->error()['message'] !== '' ) {
                    $dataDB['status']  = "error";
                    $dataDB['message'] = $this->db->error()['message'];
                    $dataDB['data']    = "";

                    return $this->respond( $dataDB, 200 );
                }
            }
            $this->db->transComplete();

            $dataDB['status']  = "success";
            $dataDB['message'] = "";
            $dataDB['data']    = $insert_data;
        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

        return $this->respond( $dataDB, 200 );
    }

    /**
     * check suppliser code dupplicate
     *
     * @param $m_company_id company id
     * @param $currency_code currency code
     *
     * @return boolean true= dupplicate, false not dupplicate
     */
    private function is_dupplicate_data( $old_item_code, $item_code )
    {
        $is_check = true;

        if ( $old_item_code == $item_code ) {
            return false; // OK data
        }

        $data = $this->mst_item->getWhere( [
            'item_code'    => $item_code,
            'item_code !=' => $old_item_code,
            'active_flag'  => true,
        ] )->getRow();

        if ( isset( $data ) ) {

        } else {
            $is_check = false;
        }

        return $is_check;
    }

    public function get_unit()
    {
        $token = $this->getAuthHeader();
        $data  = $this->request->getJSON();

        $query_str = " SELECT * FROM mst_unit where active_flag = true and unit_name like :unit_name: order by unit_code asc";

        $itemn_data = $this->db->query( $query_str, ['unit_name' => '%' . $data->unit_name . '%'] )->getResult();

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $itemn_data;

        return $this->respond( $dataDB, 200 );
    }

    public function get_unit_by_code()
    {
        $token = $this->getAuthHeader();
        $data  = $this->request->getJSON();

        if ( $token == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token is empty";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        //get data from token
        $result = $this->_checkToken( $token );

        if ( $result->user_id > 0 ) {
            $unit_data = $this->mst_unit->getWhere( ['unit_code' => $data->unit_code, 'active_flag' => true] )->getRow();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            if ( isset( $unit_data ) ) {
                $dataDB['status']  = "success";
                $dataDB['message'] = "";
                $dataDB['data']    = $unit_data;

            } else {
                $dataDB['status']  = "error";
                $dataDB['message'] = "unit code not found";
                $dataDB['data']    = "";
            }
        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

        return $this->respond( $dataDB, 200 );
    }

    public function get_unit_code()
    {
        $token = $this->getAuthHeader();
        $data  = $this->request->getJSON();

        if ( $token == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token is empty";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        //get data from token
        $result = $this->_checkToken( $token );

        if ( $result->user_id > 0 ) {
            //print_r($query_str);exit;
            $query = "
			SELECT *
			FROM mst_unit
			WHERE (unit_code = :unit_name: or unit_name = :unit_name: ) and active_flag = true
			";

            $data = $this->db->query( $query, ['unit_name' => $data->unit_name] )->getRow();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $unit_code = "";

            if ( isset( $data ) ) {
                $unit_code = $data->unit_code;
            }
            $dataDB['status']  = "success";
            $dataDB['message'] = "";
            $dataDB['data']    = $unit_code;

        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

        return $this->respond( $dataDB, 200 );
    }
}
