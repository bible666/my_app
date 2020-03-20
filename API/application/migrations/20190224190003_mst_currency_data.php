<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_currency_data extends CI_Migration {

    public function up()
    {
        $data = [
            [
                "currency_id"   => 1,
                "currency_code" => 'USD',
                "description"   => 'USD',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 2,
                "currency_code" => 'GBP',
                "description"   => 'GBP',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 3,
                "currency_code" => 'EUR',
                "description"   => 'EUR',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 4,
                "currency_code" => 'JPY',
                "description"   => 'JPY',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 5,
                "currency_code" => 'HKD',
                "description"   => 'HKD',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 6,
                "currency_code" => 'MYR',
                "description"   => 'MYR',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 7,
                "currency_code" => 'SGD',
                "description"   => 'SGD',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 8,
                "currency_code" => 'BND',
                "description"   => 'BND',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 9,
                "currency_code" => 'PHP',
                "description"   => 'PHP',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 10,
                "currency_code" => 'IDR',
                "description"   => 'IDR',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 11,
                "currency_code" => 'INR',
                "description"   => 'INR',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 12,
                "currency_code" => 'CHF',
                "description"   => 'CHF',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 13,
                "currency_code" => 'AUD',
                "description"   => 'AUD',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 14,
                "currency_code" => 'NZD',
                "description"   => 'NZD',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 15,
                "currency_code" => 'PKR',
                "description"   => 'PKR',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 16,
                "currency_code" => 'CAD',
                "description"   => 'CAD',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 17,
                "currency_code" => 'SEK',
                "description"   => 'SEK',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 18,
                "currency_code" => 'DKK',
                "description"   => 'DKK',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 19,
                "currency_code" => 'NOK',
                "description"   => 'NOK',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 20,
                "currency_code" => 'CNY',
                "description"   => 'CNY',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "currency_id"   => 21,
                "currency_code" => 'THB',
                "description"   => 'THB',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ]
        ];

        $this->db->insert_batch('mst_currenct', $data);
    }

    public function down()
    {
        $this->db->query("
    DELETE TABLE mst_currenct(
        currency_id INT AUTO_INCREMENT PRIMARY KEY,
        currency_code VARCHAR(10),
        description VARCHAR(255),
        create_date VARCHAR(14) NOT NULL,
        update_date VARCHAR(14) ,
        create_user INT NOT NULL,
        update_user INT 
    )
        ");
    }
}
?>