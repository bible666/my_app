ALTER SEQUENCE ms_knows_group_knows_group_id_seq RESTART WITH 1;
ALTER SEQUENCE tx_knows_data_knows_data_id_seq RESTART WITH 1;
ALTER SEQUENCE tx_knows_upload_knows_upload_id_seq RESTART WITH 1;

DELETE FROM tx_knows_upload;
DELETE FROM tx_knows_data;
DELETE FROM ms_knows_group;


INSERT INTO ms_knows_group
(group_name, types,created, create_by )
VALUES
('ทั่วไป','n',NOW(),1);

INSERT INTO ms_knows_group
(group_name, types,created, create_by )
VALUES
('ทั่วไป','k',NOW(),1);

-- Case 1
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok1','my body',NOW(),NOW() ,NOW() + INTERVAL '2 HOURS','o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(1,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 1 WHERE knows_data_id = 1;


--Case 2
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok2','my body',NOW(),NOW() - INTERVAL '1 DAY',NOW() + INTERVAL '2 HOURS','o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(2,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 2 WHERE knows_data_id = 2;

--Case 3
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok3','my body',NOW(),NOW(),NOW() + INTERVAL '2 HOURS','o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(3,'/image/','image1.jpg','a',NOW(),'0000001');


-- Case 4
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok4','my body',NOW(),NOW(),NOW() + INTERVAL '2 HOURS','o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(4,'/image/','noimage1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 4 WHERE knows_data_id = 4;

--Case 5
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'','my body',NOW(),NOW(),NOW() + INTERVAL '2 HOURS','o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(5,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 5 WHERE knows_data_id = 5;


-- Case 6 no body
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok6','',NOW(),NOW(),NOW() + INTERVAL '2 HOURS','o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(6,'/image/','noimage1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 6 WHERE knows_data_id = 6;


-- Case 7 no show date
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, start_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok7','my body',NOW(),NOW() + INTERVAL '2 HOURS','o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(7,'/image/','noimage1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 7 WHERE knows_data_id = 7;

-- Case 8 no start date
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok8','my body',NOW(),NOW() + INTERVAL '2 HOURS','o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(8,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 8 WHERE knows_data_id = 8;


-- Case 9 no start date and end date > today
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok9','my body',NOW(),NOW() + INTERVAL '1 DAY','o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(9,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 9 WHERE knows_data_id = 9;

-- Case 10 no end date
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok10','my body',NOW(),NOW() ,'o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(10,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 10 WHERE knows_data_id = 10;


-- Case 11 start date < today
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok11','my body',NOW(),NOW() - INTERVAL '1 DAY',NOW() + INTERVAL '2 HOURS','o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(11,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 11 WHERE knows_data_id = 11;

-- Case 12 start date < today and end date > today
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok12','my body',NOW(),NOW() - INTERVAL '1 DAY',NOW() + INTERVAL '1 DAY','o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(12,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 12 WHERE knows_data_id = 12;

-- Case 13 approve date < today
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ok13','my body',NOW(),NOW() ,NOW() + INTERVAL '2 HOURS','o'
    ,'m',NOW() - INTERVAL '1 DAY','0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(13,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 13 WHERE knows_data_id = 13;

-- Case 14 no approved
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ng1','my body',NOW(),NOW() ,NOW() + INTERVAL '2 HOURS','o'
    ,'m','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(14,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 14 WHERE knows_data_id = 14;


-- Case 15 no approved start date < today
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ng2','my body',NOW(),NOW() - INTERVAL '1 DAY',NOW() + INTERVAL '2 HOURS','o'
    ,'m','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(15,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 15 WHERE knows_data_id = 15;

-- Case 16 no approved start date < today and end date < today
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ng3','my body',NOW(),NOW() - INTERVAL '1 DAY',NOW() - INTERVAL '1 DAY','o'
    ,'m','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(16,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 16 WHERE knows_data_id = 16;

-- Case 17 no approved start date < today and end date > today
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ng4','my body',NOW(),NOW() - INTERVAL '1 DAY',NOW() + INTERVAL '1 DAY','o'
    ,'m','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(17,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 17 WHERE knows_data_id = 17;

-- Case 18 no approved start date > today
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ng5','my body',NOW(),NOW() + INTERVAL '1 DAY',NOW() + INTERVAL '2 HOURS','o'
    ,'m','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(18,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 18 WHERE knows_data_id = 18;

-- Case 19  no start date and end date
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ng6','my body',NOW(),'o'
    ,'m',NOW(),'0000001','y',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(19,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 19 WHERE knows_data_id = 19;


-- Case 20 active flag = close
INSERT INTO tx_knows_data
(   types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status
    ,piority, approve_date, approve_by,active_flag, created, create_by
)
VALUES
(   'n','0000001',1,'test ng7','my body',NOW(),NOW() ,NOW() + INTERVAL '2 HOURS','o'
    ,'m',NOW(),'0000001','n',NOW(),'000001');

INSERT INTO tx_knows_upload
( fk_knows_data, upload_path, file_name, status, created, create_by )
VALUES
(20,'/image/','image1.jpg','a',NOW(),'0000001');

UPDATE tx_knows_data SET cover_image = 20 WHERE knows_data_id = 20;