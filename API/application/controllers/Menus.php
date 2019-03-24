<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');


class Menus extends Origin001
{

    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> ""){ //check post data
            $token = $data['token'];

            $dbData = new db_class();
            $this->addTokenTransactions($token,"Menus",json_encode($data));
            $checkToken = $this->checkToken($token)->status;
            if($checkToken){ //checkToken

                $this->load->database();
                $user_id = 0;
                $query = $this->db->query("
                    SELECT d.*,f.*
                    FROM tokens a, users b, user_types c, user_type_menu_permissions d, menus f
                    WHERE a.token_id = '".$token."' AND a.status = '1' 
                    AND a.user_id = b.user_id AND b.user_type_id = c.user_type_id 
                    AND c.user_type_id = d.user_type_id AND d.menu_id = f.menu_id AND f.parent_menu_id is null
                    ORDER BY f.order ASC
                ");

                $count = 0;

                $PAGES_MENU = new PAGES_MENU();
                $PAGES_MENU->path = "pages"; 

                foreach ($query->result() as $row){

                    $menuData = new children_class();
                    $menuData->path = $row->path; 
                    $menuData->data = new menu_data();

                    $menuDData = new menusD_class();

                    $menuData->data->menu = $menuDData; 

                    $menuDData->title = $row->menu_name_local;
                    $menuDData->icon = $row->icon;

                    //submenu
                    $menu_id = $row->menu_id; 
                    $query1 = $this->db->query("
                        SELECT d.*,f.*
                        FROM tokens a, users b, user_types c, user_type_menu_permissions d, menus f
                        WHERE a.token_id = '".$token."' AND a.status = '1' 
                        AND a.user_id = b.user_id AND b.user_type_id = c.user_type_id 
                        AND c.user_type_id = d.user_type_id AND d.menu_id = f.menu_id AND f.parent_menu_id = '".$menu_id."'
                        ORDER BY f.order ASC
                    ");     
                    foreach ($query1->result() as $row1){	
                        $menuDataS = new children_class();
                        $menuDataS->path = $row1->path; 
                        $menuDataS->data = new menu_data();
    
                        $menuDDataS = new menusD_class();
    
                        $menuDataS->data->menu = $menuDDataS; 


                        $menuDDataS->title = $row1->menu_name_local;
                        $menuDDataS->icon = $row1->icon;
                        
                        array_push($menuData->children,$menuDataS);
                        //array_push($menuDData->children,$menuDataS);
                        $count++;
                    }
                    //submenu         

                   // array_push($menuData->children,$menuDataS);

                    array_push($PAGES_MENU->children,$menuData);
                    $count++;

                }
                
                $dbData->data = new menu_data();
                $dbData->data = $PAGES_MENU;
                
                if($count > 0){ //check db data
                    $dbData->status = "success";
                    $dbData->message = "";
                    
                }else{ //check db data
                    $dbData->status = "error";
                    $dbData->message = "menu data is empty.";
                } //check db data

            }else{ //checkToken
                $dbData->status = "error";
                $dbData->message = "token error.";
                $this->response($dbData,401);
            } //checkToken

        }else{ //check post data
            $dbData->status = "error";
            $dbData->message = "post data is null.";
        } //check post data

        
        $this->response($dbData,200);

    }
}

class PAGES_MENU{
    public $path =  '';
    public $children = [];
}

class children_class{
    public $path =  '';
    public $data =  '';
    public $children = [];
}

class menu_data{
}

class menusD_class{
    public $title =   '';
    public $icon = '';
}