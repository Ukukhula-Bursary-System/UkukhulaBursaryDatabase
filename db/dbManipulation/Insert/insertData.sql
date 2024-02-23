


USE BBD_BursaryDB3;
GO
-- Populate Race table
INSERT INTO Race (Race)
VALUES ('Asian'), ('Black'), ('White'), ('Coloured'), ('Indian');

-- Populate Roles table
INSERT INTO Roles (Role)
VALUES ('HOD'), ('Admin'), ('Student'),('reviewer');

-- Contact_Details.    
insert into Contact_Details (PhoneNumber, Email) values ('423 184 5449', 'eankrett0@tuttocitta.it');
insert into Contact_Details (PhoneNumber, Email) values ('879 939 0268', 'jweond1@hubpages.com');
insert into Contact_Details (PhoneNumber, Email) values ('778 996 9846', 'mgilfoy2@fc2.com');
insert into Contact_Details (PhoneNumber, Email) values ('431 521 2255', 'ahaugeh3@storify.com');
insert into Contact_Details (PhoneNumber, Email) values ('102 328 5521', 'loflynn4@e-recht24.de');
insert into Contact_Details (PhoneNumber, Email) values ('585 465 7393', 'szanicchi5@xing.com');
insert into Contact_Details (PhoneNumber, Email) values ('593 194 1311', 'gplaxton6@mapy.cz');
insert into Contact_Details (PhoneNumber, Email) values ('770 406 6370', 'npaynton7@acquirethisname.com');
insert into Contact_Details (PhoneNumber, Email) values ('515 521 8243', 'ltutin8@liveinternet.ru');
insert into Contact_Details (PhoneNumber, Email) values ('777 966 5120', 'mwalcot9@dot.gov');
insert into Contact_Details (PhoneNumber, Email) values ('111 742 2960', 'eorvissa@hhs.gov');
insert into Contact_Details (PhoneNumber, Email) values ('762 126 1537', 'pjaumeb@wufoo.com');
insert into Contact_Details (PhoneNumber, Email) values ('460 372 0350', 'palgeoc@baidu.com');
insert into Contact_Details (PhoneNumber, Email) values ('136 643 6599', 'ksavined@tripadvisor.com');
insert into Contact_Details (PhoneNumber, Email) values ('617 482 1820', 'csmallacombee@who.int');
insert into Contact_Details (PhoneNumber, Email) values ('243 966 6816', 'broycroftf@spiegel.de');
insert into Contact_Details (PhoneNumber, Email) values ('461 697 7936', 'cvalekg@i2i.jp');
insert into Contact_Details (PhoneNumber, Email) values ('540 650 1401', 'hcalderah@scientificamerican.com');
insert into Contact_Details (PhoneNumber, Email) values ('305 109 4847', 'lhaddyi@imgur.com');
insert into Contact_Details (PhoneNumber, Email) values ('900 404 1551', 'raylingj@mayoclinic.com');
insert into Contact_Details (PhoneNumber, Email) values ('952 229 2916', 'lgerardk@ocn.ne.jp');
insert into Contact_Details (PhoneNumber, Email) values ('512 707 2492', 'dlistonl@cafepress.com');
insert into Contact_Details (PhoneNumber, Email) values ('472 589 4073', 'mbellwardm@devhub.com');
insert into Contact_Details (PhoneNumber, Email) values ('919 705 5326', 'msisnerosn@illinois.edu');
insert into Contact_Details (PhoneNumber, Email) values ('973 830 0884', 'gemeryo@cafepress.com');
insert into Contact_Details (PhoneNumber, Email) values ('714 614 8976', 'skilloughp@quantcast.com');
insert into Contact_Details (PhoneNumber, Email) values ('474 139 6587', 'driguardq@discuz.net');
insert into Contact_Details (PhoneNumber, Email) values ('728 978 0757', 'cbeaur@squarespace.com');
insert into Contact_Details (PhoneNumber, Email) values ('806 165 9417', 'ckettoes@simplemachines.org');
insert into Contact_Details (PhoneNumber, Email) values ('324 965 0598', 'ttriggst@soundcloud.com');
insert into Contact_Details (PhoneNumber, Email) values ('159 213 3580', 'crennocksu@pcworld.com');
insert into Contact_Details (PhoneNumber, Email) values ('107 112 3470', 'dpollyv@cisco.com');
insert into Contact_Details (PhoneNumber, Email) values ('256 908 8733', 'arixonw@wsj.com');
insert into Contact_Details (PhoneNumber, Email) values ('859 841 4115', 'jdefrainex@bigcartel.com');
insert into Contact_Details (PhoneNumber, Email) values ('825 565 3672', 'mmoncury@t-online.de');
insert into Contact_Details (PhoneNumber, Email) values ('264 206 7061', 'aarmalz@cnn.com');
insert into Contact_Details (PhoneNumber, Email) values ('905 313 7673', 'sstebbings10@springer.com');
insert into Contact_Details (PhoneNumber, Email) values ('913 773 4320', 'odomelaw11@seattletimes.com');
insert into Contact_Details (PhoneNumber, Email) values ('376 947 0041', 'pyurygyn12@wunderground.com');
insert into Contact_Details (PhoneNumber, Email) values ('985 835 7080', 'jsonley13@nhs.uk');
insert into Contact_Details (PhoneNumber, Email) values ('408 863 5320', 'bfrensch14@youku.com');
insert into Contact_Details (PhoneNumber, Email) values ('385 354 2739', 'gaven15@imageshack.us');
insert into Contact_Details (PhoneNumber, Email) values ('436 832 2326', 'condrusek16@free.fr');
insert into Contact_Details (PhoneNumber, Email) values ('129 910 5470', 'bgregorowicz17@technorati.com');
insert into Contact_Details (PhoneNumber, Email) values ('104 135 4824', 'lwickrath18@sogou.com');
insert into Contact_Details (PhoneNumber, Email) values ('898 670 0349', 'lcastleman19@prweb.com');
insert into Contact_Details (PhoneNumber, Email) values ('151 240 0038', 'oseger1a@delicious.com');
insert into Contact_Details (PhoneNumber, Email) values ('413 142 4228', 'acallacher1b@hostgator.com');
insert into Contact_Details (PhoneNumber, Email) values ('380 823 6921', 'pdarrell1c@cyberchimps.com');
insert into Contact_Details (PhoneNumber, Email) values ('123 920 7548', 'pgalfour1d@biglobe.ne.jp');


-- User_Details

insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Janela', 'Dreini', 3, 1);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Dalli', 'Broseke', 1, 2);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Tallulah', 'Simonnot', 3, 3);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Marcelline', 'Bauer', 2, 4);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Paolo', 'Winn', 1, 5);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Oliviero', 'Philippon', 2, 6);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Shaine', 'Stathor', 3, 7);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Julie', 'Lambillion', 2, 8);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Modestine', 'Humphrey', 2, 9);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Meggie', 'Garr', 2, 10);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Othella', 'Le Hucquet', 2, 11);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Frederigo', 'Markwell', 2, 12);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Hashim', 'Moss', 3, 13);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Karney', 'Stollenhof', 3, 14);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Margit', 'Garham', 3, 15);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Cassandry', 'MacMenamy', 2, 16);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Kaylyn', 'Duetschens', 3, 17);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Humfrey', 'Goodrum', 1, 18);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Juan', 'ducarme', 1, 19);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Winfield', 'Glencros', 2, 20);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Pavlov', 'Skeat', 2, 21);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Carr', 'Lansly', 1, 22);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Harriot', 'Gethyn', 1, 23);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Giorgia', 'Sabater', 1, 24);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Maura', 'Gipp', 3, 25);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Roz', 'Sapsed', 3, 26);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Dukie', 'Smart', 3, 27);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Brant', 'Cumberledge', 3, 28);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Tersina', 'Messer', 2, 29);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Camella', 'Gossipin', 2, 30);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Isidore', 'Worcester', 2, 31);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Hermann', 'Darwent', 1, 32);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Shelby', 'Rountree', 3, 33);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Hugibert', 'Cavaney', 1, 34);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Thedric', 'Wesgate', 1, 35);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Alexandro', 'Wabersinke', 3, 36);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Waylin', 'Farrell', 2,    37);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Emera', 'Wrassell', 1, 38);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Johnny', 'Sysland', 3, 39);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Pearle', 'Glison', 3, 40);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Tatiania', 'McLucky', 3, 41);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Orion', 'Castro', 1, 42);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Ike', 'Coners', 1, 43);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Charlotta', 'MacGibbon', 2, 44);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Tomkin', 'Aggett', 3, 45);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Aurea', 'Dancey', 1, 46);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Bernadette', 'Lismer', 3, 47);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Early', 'Helwig', 1, 48);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Shawn', 'Heinecke', 3, 49);
insert into User_Details (firstname, lastname, RoleID, ContactdetailsID) values ('Susan', 'Maccaddie', 2, 50);

