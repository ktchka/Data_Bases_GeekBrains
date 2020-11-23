ALTER DATABASE vk DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE vk;
ALTER TABLE vk.users CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
show table status;

-- п.1
alter table friend_requests alter status set default "requested";
alter table users rename column create_at to created_at;

-- п.2 был сделан в прошлой домашке

-- п.3
use test1;
create table `users` (
  `id` serial primary key, -- serial = bigint unsigned not null auto_increment unique
	firstname varchar(50),
	lastname varchar(50) comment 'Фамилия пользователя',
	email varchar(120) unique,
	phone varchar(20) unique,
	birthday date,
	hometown varchar(100),
	gender char(1),
	photo_id bigint unsigned,
	create_at datetime default now(),
	pass char(40)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Дарья','Попова','rthomazinb@ox.ac.uk',8151557164,'f','1984-11-28','Воронеж',NULL,'32afa0b02c8399d1960509c3fbd4cc75ab4dcce2','2020-09-25 22:09:27.0')
,('Ирина','Гончарова','gambridgec@sakura.ne.jp',2907266453,'f','1984-08-24','Самара',NULL,'afd3e457d3b9f6f880623163ea8f72889777a58b','2020-09-25 22:09:27.0')
,('Марина','Закусилова','mantosikd@tinypic.com',5949091863,'f','1981-04-16','Новосибирск',NULL,'9154186410a62369bdf4fd2bd632ca3511b270a7','2020-09-25 22:09:27.0')
,('Елена','Нагина','rtabere@admin.ch',6966471579,'f','1988-08-10','Пермь',NULL,'9bc443a6e52541784d52b69acc39343526886b11','2020-09-25 22:09:27.0')
,('Валерия','Платошкина','ckendellf@bloglines.com',1078902682,'f','1980-01-07','Красноярск',NULL,'229aedb0a417bccab3ee0cbd89a4b1afaa080c51','2020-09-25 22:09:27.0')
,('Станислав','Светляков','amckeandg@behance.net',9642922963,'m','1984-05-19','Тюмень',NULL,'584b9241b06cfe87131bfdba7b53e877ec3bd940','2020-09-25 22:09:27.0')
,('Ирина','Черникова','csantryh@mit.edu',3118473791,'f','1982-10-20','Екатеринбург',NULL,'129797dcb95127ce0541faa8d91d8f1969da0f45','2020-09-25 22:09:27.0')
,('Алиса','Зайцева','dharcasei@dailymotion.com',4568198247,'f','1989-04-03','Воронеж',NULL,'ea63b484704b7a8316da4025260b864453adb948','2020-09-25 22:09:27.0')
,('Ольга','Застрожнова','drouthamj@senate.gov',9259428337,'f','1983-05-07','Москва',NULL,'9b1f31426e9caf75d46b9b4a7c58c1941daa33f0','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Ирина','Сушкова','eshetliff0@virginia.edu',9442875153,'f','1984-12-19','Волгоград',NULL,'9d0f9f7cdbe467af211a5d5bc91e2e16da891521','2020-09-25 22:09:27.0')
,('Анна','Бавыкина','ldeguara1@bing.com',6774820315,'f','1982-04-19','Казань',NULL,'3866567f83079af02f517913d98a34e8a5514111','2020-09-25 22:09:27.0')
,('Марина','Киреева','cdominick2@cnn.com',4056088011,'f','1984-04-26','Казань',NULL,'37cda6f77b46bb92ebfea535bdd89d6a145ee28a','2020-09-25 22:09:27.0')
,('Елена','Михайлова','dbydaway3@hugedomains.com',2159168663,'f','1980-02-08','Красноярск',NULL,'340287d956987900a051e920136b2c1c17351321','2020-09-25 22:09:27.0')
,('Любовь','Чиликова','hpullin4@state.gov',2619617364,'f','1983-11-22','Тольятти',NULL,'d4a54226f86124d38f463d60c3658a32be191e0e','2020-09-25 22:09:27.0')
,('Елена','Селиванова','lhulme5@tamu.edu',1315489478,'f','1982-03-27','Волгоград',NULL,'4cbd30f625fd3440804baf6f509246e8ff81d46b','2020-09-25 22:09:27.0')
,('Сергей','Лисовой','ngrzesiak6@blogspot.com',1253462931,'m','1988-08-03','Краснодар',NULL,'89d65795895ed1c2f48114474ef37c92e1796dee','2020-09-25 22:09:27.0')
,('Михаил','Назарьев','ewathall7@slate.com',8696039405,'m','1984-06-06','Волгоград',NULL,'011af674acb2a19440bb6a013d33dd9a231d53a4','2020-09-25 22:09:27.0')
,('Алексей','Метлицкий','epindar8@oracle.com',2981339919,'m','1980-04-24','Краснодар',NULL,'e3e589b0cc498fb982ed1cbae5d20d3766e97b36','2020-09-25 22:09:27.0')
,('Эльвира','Белоусова','jdelacoste9@chicagotribune.com',4051023201,'f','1987-12-19','Челябинск',NULL,'2def62b6a77064a15b157222f1b43bb538a0293e','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Екатерина','Власова','sdowgilla@salon.com',7146665929,'f','1984-04-11','Краснодар',NULL,'eb7fabdc4b4f70445a27467544e2a742dfad7bbb','2020-09-25 22:09:27.0')
,('Юрий','Волчкевич','mhouchenb@jalbum.net',5826283675,'m','1981-10-15','Воронеж',NULL,'1e65c000a98a92396d4ef31ec8d7740cbf578830','2020-09-25 22:09:27.0')
,('Евгений','Волынкин','rcogarc@storify.com',9707035248,'m','1981-03-19','Саратов',NULL,'3627f911a7a4141f007ff0d25aa85f061f734742','2020-09-25 22:09:27.0')
,('Владимир','Воробьев','gbartold@guardian.co.uk',8788528067,'m','1980-06-23','Красноярск',NULL,'0be3ef277eac3ac46d547b579848cea67e075952','2020-09-25 22:09:27.0')
,('Дмитрий','Лопухов','dcuffline@harvard.edu',7107508285,'m','1983-11-03','Нижний Новгород',NULL,'5d3e5e579aa758ea28c1f53a6de174ee1f714701','2020-09-25 22:09:27.0')
,('Ольга','Лохмачева','ctymf@uiuc.edu',6146928162,'f','1980-01-23','Самара',NULL,'f89b2d6443e511fd742d16a5404b19d541f89f10','2020-09-25 22:09:27.0')
,('Маргарита','Овчинникова','vshelveyg@census.gov',5013560236,'f','1981-05-20','Казань',NULL,'14aac374085e2782a8f1510f1bf49722b040731c','2020-09-25 22:09:27.0')
,('Вячеслав','Погорельский','sworboyh@about.me',6068012327,'m','1988-01-05','Пермь',NULL,'5530cf46cf0b1b5e787723e83012f93a5cd6b832','2020-09-25 22:09:27.0')
,('Владимир','Полищук','cmayhoi@xrea.com',6081230164,'m','1987-10-25','Ростов-на-Дону',NULL,'7ee4a9f5be784f551cfcb2d23698bc31b4e4069f','2020-09-25 22:09:27.0')
,('Игорь','Токарев','jromushkinj@census.gov',8843970434,'m','1985-07-08','Новосибирск',NULL,'a430faa2a1494af65cfa7cd72a7f46e1fad301c6','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Евгений','Турбин','npesselk@buzzfeed.com',6414312198,'m','1987-08-18','Москва',NULL,'1fa46ebf47f51c03b98c8379934b4b0182853ec3','2020-09-25 22:09:27.0')
,('Анна','Колтакова','nhackettl@omniture.com',9059884608,'f','1989-03-04','Пермь',NULL,'e59558fde6118d3eb58c5b624bedf28b41da0ac7','2020-09-25 22:09:27.0')
,('Максим','Попов','cwillimentm@livejournal.com',6549392162,'m','1989-05-01','Санкт-Петербург',NULL,'1bc1a0536d38b6216b74a2819436ba0a925206c8','2020-09-25 22:09:27.0')
,('Юлия','Черепнина','civensn@deliciousdays.com',8361146361,'f','1982-04-09','Самара',NULL,'47c16b5079e4409b613bcedfe75fcfa8c486963f','2020-09-25 22:09:27.0')
,('Андрей','Мошкин','rbrougho@elegantthemes.com',7586396136,'m','1980-04-06','Екатеринбург',NULL,'ebb1057b6e438535963f3706ba15dd6a2df8926b','2020-09-25 22:09:27.0')
,('Евгений','Бучнев','aandersenp@cisco.com',8482399498,'m','1982-01-29','Тюмень',NULL,'9aeec57f845984b9ec57d44acd8d4990b2f21824','2020-09-25 22:09:27.0')
,('Екатерина','Кретинина','anorquoyq@home.pl',5605843880,'f','1989-07-09','Пермь',NULL,'b1ac483a02563c28d48284145535076aa39931ab','2020-09-25 22:09:27.0')
,('Павел','Трунтаев','bferrieresr@amazon.co.jp',8608680584,'m','1986-03-07','Уфа',NULL,'e430a8c6a2f7272b9e5f295a7ecac609555be589','2020-09-25 22:09:27.0')
,('Юлия','Печенкина','soffilers@biblegateway.com',1682297034,'f','1987-03-26','Краснодар',NULL,'8ac622757e94e702a3798d851b21d6d1d3ee5450','2020-09-25 22:09:27.0')
,('Михаил','Хрипков','srobilartt@wix.com',4765849891,'m','1987-02-04','Новосибирск',NULL,'44c2349e85e97eda950d824a82ab37c2da75bf92','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Ольга','Черникова','adabbotdoyleu@latimes.com',3659256004,'f','1980-07-25','Самара',NULL,'151acd87edd4c6d68ce4a92bc846f2abeae49b8e','2020-09-25 22:09:27.0')
,('Максим','Бахтерев','gmedlerv@desdev.cn',7849899275,'m','1986-12-27','Санкт-Петербург',NULL,'4613c2845f696b03d37b801e0cdab710fb6beaea','2020-09-25 22:09:27.0')
,('Екатерина','Попова','pschonfelderw@icio.us',9788815521,'f','1989-01-09','Нижний Новгород',NULL,'3a4548bbbbed1c9d604750295dd22b34b706427f','2020-09-25 22:09:27.0')
,('Марина','Свиридова','klilleyx@ftc.gov',7449749232,'f','1982-12-26','Казань',NULL,'07dc7b613035be338b2d299bf481d9ced8731129','2020-09-25 22:09:27.0')
,('Сергей','Цурканов','dtribey@foxnews.com',9461404246,'m','1985-07-24','Казань',NULL,'4f2d890e00efe71d86b23d64aa3ab7c7f6c2262b','2020-09-25 22:09:27.0')
,('Алла','Толмачева','alukockz@google.co.jp',5057501481,'f','1984-08-18','Омск',NULL,'cd21e4ceb76f06cbe1d3ecd30345701dfc01f28c','2020-09-25 22:09:27.0')
,('Алексей','Суворов','acorrington10@barnesandnoble.com',2034001863,'m','1984-08-12','Санкт-Петербург',NULL,'7fe1c2e54c91bb20754abe19f3633ecb294f69ce','2020-09-25 22:09:27.0')
,('Виталия','Бредихина','lradbourn11@diigo.com',5033419317,'f','1988-09-01','Пермь',NULL,'a1313b86956b58564bf1bc069cfdeaec107b235b','2020-09-25 22:09:27.0')
,('Елена','Бумакова','hdudeney12@digg.com',6621801231,'f','1987-01-10','Москва',NULL,'b29ff9bce316ab42dfe8b8ae997b551fd05ba3a4','2020-09-25 22:09:27.0')
,('Галина','Максимова','bpressnell13@cargocollective.com',9315587169,'f','1988-05-14','Уфа',NULL,'3f88873d6babca57eb1c5371be6a431c415c6ae5','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Евгения','Мельченко','gtaber14@ask.com',2634109732,'f','1981-07-24','Самара',NULL,'af711421307bf3ea53e2a1fd5c7cdc47bc0464d4','2020-09-25 22:09:27.0')
,('Татьяна','Переславцева','harchell15@businessinsider.com',9437670910,'f','1985-08-23','Омск',NULL,'6da0975df3909e3928a20d54fbbca3c0361ff060','2020-09-25 22:09:27.0')
,('Татьяна','Ситало','ssullly16@umn.edu',2822890926,'f','1988-02-03','Санкт-Петербург',NULL,'e02ed0156bcadbc65c407e4f6d0c907449dcfb49','2020-09-25 22:09:27.0')
,('Ирина','Анисимова','ndunkerly17@elpais.com',6667018887,'f','1989-11-15','Нижний Новгород',NULL,'e08d50568524e1712fd178b2d453eccaec3497d9','2020-09-25 22:09:27.0')
,('Наталья','Домарева','bbass18@cloudflare.com',4094890532,'f','1985-09-18','Уфа',NULL,'52bb52432e2afd23c8da1f5587ba6dcfc5321b3e','2020-09-25 22:09:27.0')
,('Ирина','Сидельникова','hrivett19@nyu.edu',3198003378,'f','1988-03-18','Красноярск',NULL,'ecabdafeec47fe7ae2303f3482e875ec47a504aa','2020-09-25 22:09:27.0')
,('Ираида','Воронюк','bpiggen1a@networkadvertising.org',6147416992,'f','1983-04-04','Москва',NULL,'efaf246cf8b3e0fe4795e9a6bc33e852dcf76bb2','2020-09-25 22:09:27.0')
,('Юлия','Азарова','epiers1b@constantcontact.com',5283489590,'f','1983-10-13','Казань',NULL,'c7f7a47fbda0cd6cd1e0d34265521b26dd561592','2020-09-25 22:09:27.0')
,('Мария','Ефимова','mizod1c@1und1.de',9077450643,'f','1988-06-04','Казань',NULL,'2cddeecac91feeb2f03c5b2eb5a0cda8407bf25b','2020-09-25 22:09:27.0')
,('Юлия','Кондратьева','iwhetnell1d@kickstarter.com',4854790930,'f','1981-07-19','Уфа',NULL,'1e570efd00e3262785cf1dcd9eb0dc4ecb6a213d','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Юлия','Косарева','clamonby1e@boston.com',5239735195,'f','1987-11-04','Новосибирск',NULL,'659c44b7d1deec5ba15d5c2a24345a655f536cf8','2020-09-25 22:09:27.0')
,('Ирина','Лакомова','ssimeons1f@scribd.com',8902784216,'f','1981-11-11','Санкт-Петербург',NULL,'b48da6b9f87aa771566ab1d75cb69081105f6a50','2020-09-25 22:09:27.0')
,('Анна','Полуэктова','lroggerone1g@engadget.com',8414878509,'f','1981-10-20','Уфа',NULL,'2d10eec8cdac3f29976908c3efa65aed77028732','2020-09-25 22:09:27.0')
,('Ольга','Никулина','astandfield1h@themeforest.net',9347973825,'f','1989-09-28','Омск',NULL,'8113bb2b1039acc5d314fb74840c11963c2d0671','2020-09-25 22:09:27.0')
,('Юлия','Максименко','educkit1i@globo.com',4777653528,'f','1987-11-29','Новосибирск',NULL,'49c2e20c7e932772449c133770fcb6fababacdae','2020-09-25 22:09:27.0')
,('Татьяна','Асеева','khudless1j@oakley.com',9035161534,'f','1989-05-27','Волгоград',NULL,'5009a649664092e862d0eaaf055391e453889bbb','2020-09-25 22:09:27.0')
,('Екатерина','Шипилова','msandiland1k@unesco.org',4366159925,'f','1984-11-30','Пермь',NULL,'94b83db9e43e7aed7fa9bcf13adc71aa179f89cb','2020-09-25 22:09:27.0')
,('Елена','Янкова','mtrevers1l@amazon.com',7266747785,'f','1988-11-26','Новосибирск',NULL,'2cee62ceb700cc6f95e628d60a75b17b1732ef65','2020-09-25 22:09:27.0')
,('Евгений','Красавин','uruffle1m@free.fr',7366490172,'m','1984-10-16','Ростов-на-Дону',NULL,'b02744a3459bf40c24434c311c7028547ad70889','2020-09-25 22:09:27.0')
,('Анна','Яньшина','lpetruskevich1n@statcounter.com',8016989162,'f','1984-11-18','Воронеж',NULL,'3314213f61429d374db27ef36b8caf681f649050','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Наталья','Мироненко','awinnett1o@hao123.com',5606350937,'f','1986-07-13','Екатеринбург',NULL,'012724188466775fd1b41ce9803a36dca24a63b6','2020-09-25 22:09:27.0')
,('Людмила','Дадонова','bfurphy1p@nifty.com',9375852898,'f','1982-06-07','Краснодар',NULL,'9f3614ed85067d90f9a882975f6a8d4dfc3f43df','2020-09-25 22:09:27.0')
,('Ольга','Мордасова','sstemp1q@theglobeandmail.com',6523490247,'f','1981-01-16','Краснодар',NULL,'44ffb111616d23edfc480f0639b63d4d065147aa','2020-09-25 22:09:27.0')
,('Елена','Рыжкова','gmazin1r@fotki.com',5301390113,'f','1986-06-25','Новосибирск',NULL,'c5e9fcc1e5c3991df06be270bdc1ccb4cd8c5ac1','2020-09-25 22:09:27.0')
,('Екатерина','Богомолова','lkrale1s@google.com.br',8271364242,'f','1982-03-10','Пермь',NULL,'99d6158bc261ca00d6dcf348dbf9ea368a1ae46b','2020-09-25 22:09:27.0')
,('Марина','Голощапова','ojosefs1t@shinystat.com',3192842536,'f','1988-06-07','Москва',NULL,'7ba41712fe6615ae0cf36ee45daf697ccb143563','2020-09-25 22:09:27.0')
,('Инна','Дибцева','apietesch1u@marketwatch.com',4447992090,'f','1986-12-17','Ростов-на-Дону',NULL,'3d7d5ac699eef8151fe1b7bfd533a321b56bb59d','2020-09-25 22:09:27.0')
,('Дмитрий','Попов','lgow1v@example.com',7897075774,'m','1981-08-23','Ростов-на-Дону',NULL,'176936e9534c8e4b7fa4e2823745770ee0b64880','2020-09-25 22:09:27.0')
,('Галина','Рукавицына','cmarte1w@globo.com',2396829153,'f','1986-03-14','Новосибирск',NULL,'e396e8928248b9331ee11b9c0c5a4653d6ad2fad','2020-09-25 22:09:27.0')
,('Никита','Рыкунов','lruddock1x@wikimedia.org',8866042922,'m','1981-09-03','Москва',NULL,'5750b294231512ca402800e4eef400036e08507d','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Анастасия','Рыкунова','jscirman1y@about.me',9518059825,'f','1989-06-12','Красноярск',NULL,'deb3e4b9c818260e9adf17b225f45234390713cf','2020-09-25 22:09:27.0')
,('Юрий','Саблин','tkitchingman1z@omniture.com',9061846141,'m','1988-02-24','Тюмень',NULL,'dc4a7a560f689bf62ddc9aa22bbd64becceffca6','2020-09-25 22:09:27.0')
,('Алексей','Самсонов','mlangman20@biblegateway.com',6284148195,'m','1981-07-20','Екатеринбург',NULL,'3b802df74686705a1d5ed6c253b0d588bb02103c','2020-09-25 22:09:27.0')
,('Екатерина','Соколова','jtuff21@yandex.ru',6686191671,'f','1984-09-14','Волгоград',NULL,'32800bf3d9a44c1e74c4c697989d4d265c100716','2020-09-25 22:09:27.0')
,('Татьяна','Афанасьева','dtidbold22@forbes.com',4804069885,'f','1987-05-15','Москва',NULL,'fb762d0873e171610eace7e45c4728888990524d','2020-09-25 22:09:27.0')
,('Алексей','Болгов','hspivie23@artisteer.com',9391944702,'m','1987-11-26','Омск',NULL,'581e202c66b30b0c2382af4e8d3eac3c831d0ddd','2020-09-25 22:09:27.0')
,('Дмитрий','Древаль','dsimkiss24@youtu.be',8197243501,'m','1983-01-19','Краснодар',NULL,'6b1258bd81342cb6d68ecb3b2fbeeba913bf70f3','2020-09-25 22:09:27.0')
,('Максим','Дубатовкин','ttichelaar25@i2i.jp',1835522933,'m','1985-10-13','Москва',NULL,'0e903f53c20657667ee04e67eba9bf70d13e8248','2020-09-25 22:09:27.0')
,('Сергей','Простаков','vbyard26@dedecms.com',3912001914,'m','1980-03-11','Воронеж',NULL,'e0d1f2c5ea78335ecc106a2d371616cedfc21505','2020-09-25 22:09:27.0')
,('Александр','Пономарев','lduigenan27@list-manage.com',9018710320,'m','1986-12-08','Саратов',NULL,'8b8123b5ccb6aa6c06dbda8c75f91f62f44d5fe3','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Андрей','Косяков','svery28@nsw.gov.au',1155125246,'m','1981-11-12','Казань',NULL,'965cbe4558dce829055d547a3866f7d982997940','2020-09-25 22:09:27.0')
,('Дмитрий','Косяков','slitzmann29@timesonline.co.uk',4947082181,'m','1983-03-05','Краснодар',NULL,'460c92435c10f0ae5c3bb7596bc3ed757cbee69f','2020-09-25 22:09:27.0')
,('Людмила','Скаба','jgiacomini2a@youtu.be',1236239169,'f','1989-01-28','Воронеж',NULL,'a1cc4ab2add1ed470fa93495ece29978a51f8c00','2020-09-25 22:09:27.0')
,('Дмитрий','Смольянинов','edurston2b@google.ca',2249473665,'m','1987-10-17','Тольятти',NULL,'1976170ea8cb1a94b5572e5e67baad29c1a569fa','2020-09-25 22:09:27.0')
,('Вячеслав','Допперт','kfoulks2c@sphinn.com',8301549057,'m','1981-10-02','Тюмень',NULL,'5de1843e1bce099134f41d1522c17363245fc778','2020-09-25 22:09:27.0')
,('Елена','Стрыгина','jboken2d@wordpress.com',1086531264,'f','1988-05-04','Волгоград',NULL,'deddfab8a1ec0d8b3395b3d692ddae01aafcfc22','2020-09-25 22:09:27.0')
,('Сергей','Анисимов','gcottage2e@prlog.org',5525263441,'m','1982-03-13','Саратов',NULL,'e6582cbf8420fc471078f4e118fade0afb9830eb','2020-09-25 22:09:27.0')
,('Вячеслав','Гамов','hstrotone2f@devhub.com',7393531761,'m','1982-11-10','Красноярск',NULL,'4fdd2cbb6dfa134449dc7c0186f8ab86c56058f2','2020-09-25 22:09:27.0')
,('Юрий','Довка','vtremmel2g@ed.gov',6139086790,'m','1980-01-29','Саратов',NULL,'c2230720a13c0dbe4123d982a09fdfb421d85ae1','2020-09-25 22:09:27.0')
,('Александр','Калинин','jcarlesso2h@google.co.jp',3392340667,'m','1982-10-29','Воронеж',NULL,'1e32b1e9e9066c24064cafebf9ed40aaf3aa647b','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Николай','Пивоваров','mrucklidge2i@amazon.co.jp',7988872107,'m','1988-05-20','Краснодар',NULL,'204b2aedb33e12cdf4a3a0e9737e945870b17081','2020-09-25 22:09:27.0')
,('Алексей','Тимошенко','aprydie2j@vistaprint.com',6741632937,'m','1989-09-17','Саратов',NULL,'ce449325f74a523bc1556da3d19921c684259925','2020-09-25 22:09:27.0')
,('Екатерина','Богомолова','dbeardsall2k@dmoz.org',3151907707,'f','1988-12-27','Тольятти',NULL,'f1967dc12ed090fa0dd7259e2485cce97865e4d1','2020-09-25 22:09:27.0')
,('Марина','Голощапова','rbulford2l@goodreads.com',7783646176,'f','1986-02-11','Екатеринбург',NULL,'60ada1812162902fdf036cd8f41aed0b1ae31866','2020-09-25 22:09:27.0')
,('Инна','Дибцева','rblankenship2m@aol.com',4963297188,'f','1986-01-05','Волгоград',NULL,'74f7ad69beb17f40608046522c6cfe2ab75ffdfb','2020-09-25 22:09:27.0')
,('Дмитрий','Попов','lsiveter2n@cnbc.com',9517280949,'m','1982-02-26','Красноярск',NULL,'c99c810a5782926b16d2aae0f5a029c3ca0de755','2020-09-25 22:09:27.0')
,('Галина','Рукавицына','csamples2o@wordpress.com',3923826386,'f','1984-11-06','Челябинск',NULL,'3a19575039593db8300b30e3051cf15890783bbc','2020-09-25 22:09:27.0')
,('Никита','Рыкунов','bwhitby2p@furl.net',8487221955,'m','1984-06-03','Краснодар',NULL,'404bb0046780c0377ef1e96ce9001a701668c6c6','2020-09-25 22:09:27.0')
,('Анастасия','Рыкунова','sbearman2q@ebay.co.uk',8066940781,'f','1986-02-13','Тюмень',NULL,'2d9f4c408a47c268a31fc39809d2fb04a2a04ec3','2020-09-25 22:09:27.0')
,('Юрий','Саблин','kscobie2r@sciencedaily.com',8186433808,'m','1982-11-23','Уфа',NULL,'d0f98fc4b115f0ca2122f1ea0f53cdff006e0a90','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Алексей','Самсонов','afickena@businessweek.com',1437600801,'m','1986-03-09','Самара',NULL,'a6042fbaffba5d97f05baf9bfe6163722d1d640d','2020-09-25 22:09:27.0')
,('Екатерина','Соколова','mbaynhamb@howstuffworks.com',9798286372,'f','1982-08-25','Пермь',NULL,'60fb33d672eff5d474f18309e11320f40b7e7b4f','2020-09-25 22:09:27.0')
,('Татьяна','Афанасьева','doxterbyc@ovh.net',5794027202,'f','1981-09-06','Волгоград',NULL,'9967a9836ae9a490691dc6a7abf921c13de7693b','2020-09-25 22:09:27.0')
,('Алексей','Болгов','ndurekd@facebook.com',4243478042,'m','1986-08-21','Челябинск',NULL,'f0fe0f1cc166c63a8a8ec4ed6b0d56d4a6dc12c5','2020-09-25 22:09:27.0')
,('Дмитрий','Древаль','echildse@sohu.com',7191538491,'m','1983-05-17','Красноярск',NULL,'c94230c5967832c1cab80d57668a6d2418f3ce0e','2020-09-25 22:09:27.0')
,('Максим','Дубоваткин','agrigorushkinf@infoseek.co.jp',5466692275,'m','1984-05-26','Волгоград',NULL,'81d0d1ebcd2d75030d7f2fceab8e229e2795b1f2','2020-09-25 22:09:27.0')
,('Сергей','Простаков','hmcganng@umn.edu',3805318987,'m','1987-02-03','Уфа',NULL,'b896871061ded2bcdd77430613f262046c0465e5','2020-09-25 22:09:27.0')
,('Александр','Пономарев','mcumberpatchh@macromedia.com',9972401583,'m','1984-07-17','Пермь',NULL,'4ecb30007604ee7baf41e5b68cf4bb5e45cfb9c9','2020-09-25 22:09:27.0')
,('Максим','Паршин','ebankei@senate.gov',1672124574,'m','1985-04-26','Санкт-Петербург',NULL,'7bc86a9ac9b93f30c1af49c7423cc27c2773bd57','2020-09-25 22:09:27.0')
,('Алексей','Петров','tbrandij@cyberchimps.com',6387066678,'m','1987-06-13','Краснодар',NULL,'6b3dd04daee595084ee9ff21279fe2b27cf87d3b','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Николай','Сидоров','kbarthramk@springer.com',4521952112,'m','1984-09-21','Самара',NULL,'6c99e35fcb1313640ecc9ef074767cd912cb5fa3','2020-09-25 22:09:27.0')
,('Александр','Ворфоломеев','snewlandl@qq.com',4552946215,'m','1983-09-08','Челябинск',NULL,'9e27dbd35bf80d7b000b78987f8136742db78694','2020-09-25 22:09:27.0')
,('Алексей','Алехин','rstredderm@slideshare.net',5019199432,'m','1981-03-28','Екатеринбург',NULL,'162f709959774d806963d0f4cf7946c3fd2d8a48','2020-09-25 22:09:27.0')
,('Екатерина','Паршина','gpimn@github.com',8393364396,'f','1984-05-16','Челябинск',NULL,'6213391ec7ef13d231e308d9e37d27bc3826f5d0','2020-09-25 22:09:27.0')
,('Наталья','Трубицына','lbiniono@examiner.com',6376414090,'f','1987-08-20','Москва',NULL,'c416fe919541a2135942fae312c6b9fa450b9910','2020-09-25 22:09:27.0')
,('Екатерина','Паршина','jkreberp@i2i.jp',7506356015,'f','1987-08-27','Челябинск',NULL,'59c2c1bab5ce4f157ca65c0008d9dded06f77747','2020-09-25 22:09:27.0')
,('Евгения','Кривцова','mburnhamsq@baidu.com',1633500921,'f','1987-11-28','Красноярск',NULL,'d39dd4390bdcd9c5d439c0fe6a3c4a327af221eb','2020-09-25 22:09:27.0')
,('Анастасия','Бурмистрова','wlangtreer@example.com',9894901275,'f','1980-11-03','Уфа',NULL,'b703cb35fb2298673e577f461482a2faeaaf1eab','2020-09-25 22:09:27.0')
,('Елена','Воронова','cburlays@pen.io',2018695545,'f','1980-04-12','Тольятти',NULL,'b00c41bb74b9ae30d9513d48a1245e618fc5b210','2020-09-25 22:09:27.0')
,('Наталья','Заводскова','filymanovt@nydailynews.com',3372167202,'f','1986-10-29','Пермь',NULL,'1b79c1723c0a8c65120d12a6be69a8fb9970a5b6','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Сергей','Воронин','ckluliseku@theguardian.com',2624066456,'m','1985-06-21','Тюмень',NULL,'d92336e60a1c39ef40a442db8758173836d127ad','2020-09-25 22:09:27.0')
,('Юлия','Баранова','fpointinv@yale.edu',8826412568,'f','1986-04-11','Челябинск',NULL,'6b3a60494a2592cf1f643059de580662cc6cc524','2020-09-25 22:09:27.0')
,('Марина','Семикоз','hsisnerosw@surveymonkey.com',2822165316,'f','1981-04-23','Самара',NULL,'b8d39e2a6a1b8add765f7f8cc02785f15d692c1c','2020-09-25 22:09:27.0')
,('Андрей','Буланый','gbretonx@clickbank.net',1823731974,'m','1989-06-04','Казань',NULL,'83097b2b4d64b3e3c90487facd26beb9515434f4','2020-09-25 22:09:27.0')
,('Мария','Тафинцева','smcivery@networkadvertising.org',9835391400,'f','1987-02-07','Екатеринбург',NULL,'97f853a5ca84ffbd28b671b50e4da74c31091289','2020-09-25 22:09:27.0')
,('Ольга','Аксененкова','cmacnamaraz@arstechnica.com',3841390714,'f','1984-05-14','Пермь',NULL,'c559cb1c9fc131914c12fe954f336adfcfce9dc0','2020-09-25 22:09:27.0')
,('Виктория','Лунева','mseamer10@uol.com.br',7213293360,'f','1985-04-28','Уфа',NULL,'8d9633614bbba01c2321c8ae792e81076353018e','2020-09-25 22:09:27.0')
,('Александр','Федоров','mjanew11@tuttocitta.it',5226134225,'m','1986-12-29','Саратов',NULL,'bc80127d933e0d328ecdae39339f46eee4466085','2020-09-25 22:09:27.0')
,('Любовь','Корчагина','isibbald12@livejournal.com',9967628912,'f','1980-09-13','Омск',NULL,'83ddcad57c2f0fdad119f7ef5b0868b5bbc6db39','2020-09-25 22:09:27.0')
,('Ольга','Щербинина','ocuardall13@mashable.com',9827001278,'f','1983-02-13','Нижний Новгород',NULL,'7d73b3cf8f25f66e0dcda5cdf5b86cc95a40087f','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Александр','Лебедев','cwelbourn14@unblog.fr',1243478465,'m','1982-09-05','Воронеж',NULL,'7d5b5340ccd8aa195530d45b0d531874c3157744','2020-09-25 22:09:27.0')
,('Павел','Островерхов','mheyball15@wordpress.com',9958667317,'m','1980-04-20','Ростов-на-Дону',NULL,'38ceff79c9a3dc3022a29d4a321b8e1c1f9d573c','2020-09-25 22:09:27.0')
,('Юлия','Гаршина','wbirth16@virginia.edu',4644317051,'f','1982-11-19','Челябинск',NULL,'0705130b93d6ad48ed4a4cf1121b6c2da22451a5','2020-09-25 22:09:27.0')
,('Юлия','Якушева','tpenas17@yahoo.com',5124099962,'f','1986-12-01','Казань',NULL,'a4855604e4b371d4fc08269aadf4e53f41572af2','2020-09-25 22:09:27.0')
,('Александр','Поротиков','nwinder18@mail.ru',2443934792,'m','1989-01-27','Ростов-на-Дону',NULL,'7736a217376b568df8b3ccf9abb2b33d369651ab','2020-09-25 22:09:27.0')
,('Антон','Гончаров','lforsard19@spotify.com',3353138089,'m','1984-05-12','Воронеж',NULL,'5e89b185348a2952d14d63ca8a8e918cbe76ffb6','2020-09-25 22:09:27.0')
,('Юлия','Захарова','sfenech1a@multiply.com',9601298201,'f','1988-05-29','Тюмень',NULL,'29836521a8aaf747e81a4b73815567d2f0c391f2','2020-09-25 22:09:27.0')
,('Елена','Тарасова','jlehrle1b@trellian.com',3135058629,'f','1985-05-20','Челябинск',NULL,'1a774e0a50f50122bf651dfcac8fbd7093fbadfe','2020-09-25 22:09:27.0')
,('Татьяна','Белоусова','rrowbrey1c@engadget.com',9137682198,'f','1989-04-11','Пермь',NULL,'6612e2fcf05eb06abf6a270836c6bb0929881d2d','2020-09-25 22:09:27.0')
,('Кристина','Комова','gboken1d@pbs.org',7535680736,'f','1983-08-14','Санкт-Петербург',NULL,'bb35c705937669867fcb722070e7beb2d10ab622','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Максим','Никитин','ebakhrushin1e@nationalgeographic.com',7735098294,'m','1980-05-29','Краснодар',NULL,'ae2706b4f4b393f95331b1686ed391bc4d5c997a','2020-09-25 22:09:27.0')
,('Оксана','Снегирева','rdrugan1f@domainmarket.com',7267503662,'f','1986-05-20','Волгоград',NULL,'117e128e47bf9990fb42667c532fea870148154e','2020-09-25 22:09:27.0')
,('Виктория','Руднева','ladamec1g@businessweek.com',6437005614,'f','1981-06-21','Пермь',NULL,'e161196978199abbf0aae9db3646c92160edb97a','2020-09-25 22:09:27.0')
,('Елена','Аржанова','sdehooch1h@liveinternet.ru',3264294858,'f','1980-11-03','Тюмень',NULL,'27a45adcbb383228b8998eb3074059471a3143f0','2020-09-25 22:09:27.0')
,('Федор','Шипко','glammertz1i@go.com',8854406327,'m','1989-05-14','Самара',NULL,'f6576f732765b8b40fd758bcc0a83b65dea45ca1','2020-09-25 22:09:27.0')
,('Юлия','Тамбовцева','ghuzzey1j@creativecommons.org',5792854326,'f','1983-01-10','Саратов',NULL,'27c2a6980f55455a7de39f0f4afbe96a112ae5c7','2020-09-25 22:09:27.0')
,('Ольга','Козаренко','tcubbini1k@list-manage.com',8076928589,'f','1981-09-01','Краснодар',NULL,'8da5db5f87ef06c2f7fb67846068d728e1f4fde2','2020-09-25 22:09:27.0')
,('Наталья','Волкова','pdanels1l@studiopress.com',3467878579,'f','1985-12-07','Омск',NULL,'60c3e33d3702766312b99c42d1be3a98b5e3eeaa','2020-09-25 22:09:27.0')
,('Юлия','Лысакова','mlarrett1m@china.com.cn',6804310209,'f','1981-06-26','Саратов',NULL,'3cfb6181608ca073d4d59432c71d36ce3fb1bdbe','2020-09-25 22:09:27.0')
,('Владимир','Почепцов','dswancott1n@time.com',4101819985,'m','1987-01-02','Нижний Новгород',NULL,'c3b0adc093cbc45a0e02275a13a1f7e3609b257e','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Евгения','Конникова','cmorsey1o@purevolume.com',4578422856,'f','1989-10-09','Волгоград',NULL,'9f85a0b32ae7fb3e952fa6f38de5a5405fc03810','2020-09-25 22:09:27.0')
,('Наталья','Козлитина','bkennler1p@reddit.com',5302291765,'f','1983-03-02','Новосибирск',NULL,'c75642bc2173f416bae563603aef9c3cee7a220e','2020-09-25 22:09:27.0')
,('Марат','Назмиев','chuckett1q@istockphoto.com',3696664396,'m','1989-02-16','Санкт-Петербург',NULL,'632cad88930380e011ef6423ac7a615cb62d81c7','2020-09-25 22:09:27.0')
,('Дмитрий','Тимашов','dhowbrook1r@go.com',4771920220,'m','1983-02-13','Тюмень',NULL,'38860af616b46f31444b2e0e570318a3b6491f77','2020-09-25 22:09:27.0')
,('Александр','Маричев','mosiaghail1s@dagondesign.com',1703242914,'m','1981-08-01','Казань',NULL,'6403618b2d91965c995eeb165fb1810c5494a3e1','2020-09-25 22:09:27.0')
,('Дина','Савельева','tvanni1t@soundcloud.com',1277342028,'f','1987-12-03','Ростов-на-Дону',NULL,'1e031de4f2b7a76c2f622b63cb1c6844c90094ec','2020-09-25 22:09:27.0')
,('Федор','Шипко','athickin1u@linkedin.com',5234996624,'m','1989-02-21','Санкт-Петербург',NULL,'9f02e6161b06ca3568c93d900f54cf24334c6c97','2020-09-25 22:09:27.0')
,('Василий','Безрученко','dhaylands1v@list-manage.com',3877536636,'m','1982-04-26','Санкт-Петербург',NULL,'8b70f86d265f5e021b157d3ead188efb0ea3374f','2020-09-25 22:09:27.0')
,('Дмитрий','Литаврин','gtaplow1w@imgur.com',9947066870,'m','1983-05-10','Омск',NULL,'5ea7a3f00a784345a7c7df7dbf303921565c4bf2','2020-09-25 22:09:27.0')
,('Константин','Стародубцев','ccatto1x@intel.com',9286831036,'m','1986-08-23','Волгоград',NULL,'fabb15a627158fbc7f8be2119755ef0ecf08e81a','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Ольга','Кузнецова','jselway1y@odnoklassniki.ru',3532624836,'f','1986-09-15','Нижний Новгород',NULL,'0558138813a372455cce703fefc719b65604da68','2020-09-25 22:09:27.0')
,('Антон','Борников','goflaherty1z@umich.edu',7377444639,'m','1983-02-10','Казань',NULL,'73351c9bf23a7e4e03f29ebd37b949ae1b866d09','2020-09-25 22:09:27.0')
,('Роман','Тарарыков','bhercules20@ycombinator.com',3451661646,'m','1988-04-13','Саратов',NULL,'ab4de688bf85cf865982dc2f2dc5a7e062ba54e5','2020-09-25 22:09:27.0')
,('Ольга','Ищенко','njirzik21@utexas.edu',1132812314,'f','1985-12-04','Екатеринбург',NULL,'843d6df418382066775420211bf9f923b6885c62','2020-09-25 22:09:27.0')
,('Павел','Трунтаев','lbradbeer22@pinterest.com',2312476133,'m','1985-05-21','Тольятти',NULL,'a34f88e21214740c1f0713a0b7158f035371ae52','2020-09-25 22:09:27.0')
,('Марина','Власова','vtosney23@lycos.com',5978627731,'f','1983-09-18','Санкт-Петербург',NULL,'a90f3046a469a20d596d46f5868a3236cb56b410','2020-09-25 22:09:27.0')
,('Сергей','Беляев','pfairnington24@baidu.com',2489356708,'m','1986-07-11','Уфа',NULL,'78239b73d2286ecc07f0931666564f334b39bf0e','2020-09-25 22:09:27.0')
,('Татьяна','Морозова','jskellion25@about.me',8806637099,'f','1989-07-02','Екатеринбург',NULL,'ef981b22143faa2ddd2e3e7938bf604de1020059','2020-09-25 22:09:27.0')
,('Татьяна','Нестерова','lnealon26@hexun.com',9413536022,'f','1986-05-01','Казань',NULL,'5eccaf8d7038358b307c14336cd565cb49f365c3','2020-09-25 22:09:27.0')
,('Евгений','Волынкин','bpresland27@ihg.com',5752887260,'m','1989-09-16','Москва',NULL,'c2b671c251b4ed3838644585b047d0a1a3704133','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Надежда','Реукова','cemlyn28@wikispaces.com',9404156548,'f','1982-12-22','Казань',NULL,'95c0a7d5089c0ccf6fe8c88113462c2ab6950a17','2020-09-25 22:09:27.0')
,('Марина','Лямзина','lokinedy29@aboutads.info',5614317170,'f','1984-02-11','Екатеринбург',NULL,'425f5bab4afc290c1ec5e904cbed27fcf4c97f71','2020-09-25 22:09:27.0')
,('Любовь','Карташова','ewestgarth2a@home.pl',9468369832,'f','1981-12-25','Тольятти',NULL,'4b069e5454103bc745477798dd66ea134c242a92','2020-09-25 22:09:27.0')
,('Алексей','Золототрубов','adebell2b@netlog.com',2003010211,'m','1984-08-30','Красноярск',NULL,'2d7566a285d69d24b2ad0753bbaeddc945aecc83','2020-09-25 22:09:27.0')
,('Татьяна','Гуляева','cwinchcomb2c@friendfeed.com',9006045417,'f','1989-07-27','Воронеж',NULL,'c4ec50ac1c3064f80f4cfd877ba2563928a33e27','2020-09-25 22:09:27.0')
,('Юлия','Сысоева','yzanardii2d@google.com.au',9613106434,'f','1987-11-14','Новосибирск',NULL,'87acb7a49196ed113ddf732a9a41a1291a68cb87','2020-09-25 22:09:27.0')
,('Александр','Борисов','jpierce2e@ftc.gov',6559915444,'m','1982-05-17','Краснодар',NULL,'10253a915f1b47f3032c84c71d7fd86a5a6624e8','2020-09-25 22:09:27.0')
,('Анатолий','Косинов','lbottini2f@whitehouse.gov',3036324530,'m','1983-06-01','Самара',NULL,'d1532c3b8e8682bc769b2606320a1a0f54fc5925','2020-09-25 22:09:27.0')
,('Ольга','Меланьина','wweaben2g@amazon.com',3193637029,'f','1981-05-06','Красноярск',NULL,'6df61ed9ad812e2f327ae87bc855302c28f1c2e0','2020-09-25 22:09:27.0')
,('Ольга','Дубищева','dborrow2h@oaic.gov.au',3234549546,'f','1987-04-11','Москва',NULL,'4e33f3ac62368f7104b84612d0b1ab5181cdd11b','2020-09-25 22:09:27.0')
;
INSERT INTO users (firstname,lastname,email,phone,gender,birthday,hometown,photo_id,pass,create_at) VALUES 
('Федор','Шипко','pcoverdill2i@youtube.com',9608691146,'m','1984-06-14','Ростов-на-Дону',NULL,'5ccde04c88913a29f096d5ccfc1e9ec0cce67a71','2020-09-25 22:09:27.0')
,('Татьяна','Севостьянова','lbaldam2j@qq.com',8065210191,'f','1980-07-11','Новосибирск',NULL,'26a73caff7a0774d854d085586394becd291dc84','2020-09-25 22:09:27.0')
,('Инна','Красникова','rdunstan2k@gmpg.org',2141664371,'f','1987-11-03','Казань',NULL,'b6f4fe122245e18ccbdf12bcf354bd693a87fedc','2020-09-25 22:09:27.0')
,('Светлана','Гарьковская','mmcglade2l@google.de',9804639490,'f','1981-05-20','Красноярск',NULL,'c6ae3d969345bc2cacf2cf324468e5bae8fd449c','2020-09-25 22:09:27.0')
,('Эльза','Самороковская','fantal2m@hp.com',8894215795,'f','1987-05-10','Красноярск',NULL,'e643ae9bdbefd5da4c4e18a47c46f2db8b33f603','2020-09-25 22:09:27.0')
,('Елена','Орлова','brichings2n@dropbox.com',3913069006,'f','1988-08-11','Самара',NULL,'5f37954b9fce380080982e51adba07e0718d0052','2020-09-25 22:09:27.0')
,('Галина','Стрельникова','lmundy2o@yellowbook.com',3699040307,'f','2020-09-05','Тюмень',NULL,'0b5fcf87309858b956cc164df1a61acf8ca4773a','2020-09-25 22:09:27.0')
,('Светлана','Назарова','aelsom2p@engadget.com',2811501912,'f','1984-04-07','Омск',NULL,'ad20ef3e300cc51ec105d937689feecfca82b66c','2020-09-25 22:09:27.0')
,('Антон','Шарыкин','sholleran2q@technorati.com',8866959892,'m','1989-03-04','Санкт-Петербург',NULL,'e28882d420f3f02df4ef85cf57a7900520dd19bf','2020-09-25 22:09:27.0')
,('Ирина','Хусаинова','jpalfreeman2r@example.com',6843424170,'f','1983-12-28','Тольятти',NULL,'b607f0f3ba714a20ee76785f523585be6fa4a022','2020-09-25 22:09:27.0')
;

select * from users limit 10,20;
select hometown, count(hometown) from users group by 1 order by 1;
select concat(firstname, ' ', lastname), hometown from users group by hometown having count(hometown) > 7 order by 1;
select concat(firstname, ' ', lastname), hometown, gender from users where lastname like 'Л%' order by 1;

delete from users
where email not like '%.com';

update users set photo_id = 0 where photo_id is null;

set foreign_key_checks = 0; 
truncate table users;
set foreign_key_checks = 1;