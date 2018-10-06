--------------------------------------------------------
--  文件已创建 - 星期六-十月-06-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table FRIEND
--------------------------------------------------------

  CREATE TABLE "MYINFO"."FRIEND" 
   (	"CREATEDATE" VARCHAR2(20 BYTE) DEFAULT to_char(sysdate,'yyyy-mm-dd'), 
	"NAME" VARCHAR2(20 BYTE), 
	"SEX" VARCHAR2(2 BYTE), 
	"BIRTHDAY" VARCHAR2(20 BYTE) DEFAULT '未知', 
	"TELEPHONE" VARCHAR2(20 BYTE) DEFAULT '未知', 
	"QQ" VARCHAR2(20 BYTE) DEFAULT '未知', 
	"HOBBY" VARCHAR2(100 BYTE) DEFAULT '未知', 
	"SCHOOL" VARCHAR2(100 BYTE) DEFAULT '未知', 
	"EDUCATION_BACKGROUND" VARCHAR2(20 BYTE) DEFAULT '未知', 
	"MAJOR" VARCHAR2(30 BYTE) DEFAULT '未知', 
	"ADDRESS" VARCHAR2(100 BYTE) DEFAULT '未知', 
	"COMPANY" VARCHAR2(40 BYTE) DEFAULT '未知', 
	"RELATION" VARCHAR2(20 BYTE) DEFAULT '无'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "MYINFO"."FRIEND"."CREATEDATE" IS '创建时间';
 
   COMMENT ON COLUMN "MYINFO"."FRIEND"."HOBBY" IS '爱好';
 
   COMMENT ON COLUMN "MYINFO"."FRIEND"."SCHOOL" IS '学校';
 
   COMMENT ON COLUMN "MYINFO"."FRIEND"."EDUCATION_BACKGROUND" IS '教育背景';
 
   COMMENT ON COLUMN "MYINFO"."FRIEND"."MAJOR" IS '专业';
 
   COMMENT ON COLUMN "MYINFO"."FRIEND"."ADDRESS" IS '地址';
 
   COMMENT ON COLUMN "MYINFO"."FRIEND"."COMPANY" IS '公司';
 
   COMMENT ON COLUMN "MYINFO"."FRIEND"."RELATION" IS '关系';
 
   COMMENT ON TABLE "MYINFO"."FRIEND"  IS 'select *
from friend
where birthday!                                =''未知''
and 
substr(
        birthday,
        decode(substr(birthday,0,2),''新历'',3,0),
        decode(substr(birthday,0,2),''新历'',7,4)
)<''1994''
order by substr(birthday,instr(birthday, ''-''),length(birthday)) asc;  --按生日排序


select * from friend
where regexp_like (birthday,''^[[:digit:]]+[[:punct:]][[:digit:]]+[[:punct:]][[:digit:]]+$'');

select * from friend
where regexp_like (birthday,''^\d+'');//查询匹配生日要求正规化


同步数据的代码
insert into friend
select
t2.createdate,t2.name,t2.sex,t2.birthday,t2.telephone,t2.qq,t2.hobby,t2.school,t2.education_background,t2.major,t2.address,t2.company,t2.relation
from person t2 where t2.name not in(select t1.name from friend t1);';
--------------------------------------------------------
--  DDL for Table LOG_RECORD
--------------------------------------------------------

  CREATE TABLE "MYINFO"."LOG_RECORD" 
   (	"CREATE_TIME" VARCHAR2(20 BYTE) DEFAULT to_char(sysdate,'yyyy-MM-dd hh:mm:ss'), 
	"OPERATE_NAME" VARCHAR2(64 BYTE), 
	"OPERATE_DES" VARCHAR2(250 BYTE), 
	"OPERATE_OBJ" VARCHAR2(1024 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "MYINFO"."LOG_RECORD"."CREATE_TIME" IS '创建时间';
 
   COMMENT ON COLUMN "MYINFO"."LOG_RECORD"."OPERATE_NAME" IS '操作名称';
 
   COMMENT ON COLUMN "MYINFO"."LOG_RECORD"."OPERATE_DES" IS '操作描述';
 
   COMMENT ON COLUMN "MYINFO"."LOG_RECORD"."OPERATE_OBJ" IS '操作对象';
REM INSERTING into MYINFO.FRIEND
SET DEFINE OFF;
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:05:17','刘婷','女','未知','未知','2501990535','未知','福建师范大学旗山校区','本一','软件工程','福建省高新技术创业园','华博','大学学妹');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:05:17','曾俊祥','男','未知','未知','674334638','未知','福建师范大学旗山校区','本一','软件工程','未知','福建省高新技术创业园','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:17','黄嘉飞','男','未知','15280428578','849720915','调戏妹子','福建师范大学旗山校区','本1','未知','福建福州','福建高速信息科技有限公司','同事');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:17','黄俊文','男','未知','18396189506','575698600','喜欢玩手机','福建师范大学旗山校区','本1','软件学院软件工程','福建南平','努比亚','大学同学-室友-306');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:17','丁诗斌','男','未知','18060611645','275934879','喜欢看日本的动漫','福建师范大学旗山校区','本1','软件学院软件工程','福建泉州','未知','大学同学-室友-306');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:17','林馨','男','新历1993-10-15','18344972610','736217484','喜欢打游戏','福建师范大学旗山校区','本1','软件学院软件工程','未知','未知','大学同学-室友-306');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:20','唐文明','男','未知','18396189109','876974423','装逼','福建师范大学旗山校区','本1','软件学院软件工程','四川广安','未知','大学同学-老乡');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:20','陈杰','男','未知','18850493684','982082427','未知','福建师范大学旗山校区','本1','软件学院软件工程','未知','未知','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:20','胡婷','女','未知','15084356663','741961020','未知','福建师范大学旗山校区','本1','材料科学与工程（化材）','重庆','未知','大学学妹');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:20','邓小淑','女','未知','未知','991523548','未知','福建师范大学旗山校区','本1','经济学院','重庆','未知','大学学妹');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:02:05','高飞','男','未知','18396189097','1432220483','写代码','福建师范大学旗山校区','本1','软件工程','未知','未知','同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','王怡','女','1994-01-17','未知','844252316','目前不明确','福州大学-至诚学院','本2','未知','福建','用友','无');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','小笨蛋','女','1995-02-11','17805964177','1422819852','喜欢吃紫菜蛋汤','福建师范大学仓山校区','本1','文学院','重庆涪陵','未知','女朋友');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','张燕红','女','1991-10-14 4:40','18359196171','892276612','貌似对什么都有兴趣,对什么都无所谓','福建师范大学旗山校区','本1','法学院','福建泉州惠安','未知','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','张婷','女','新历1996-12-15','15736404554','1102280269','未知','福建师范大学旗山校区','本1','物理学','重庆','未知','女儿');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','范慧怡','女','1997-07-6？','15523403867','1179256635','未知','福建师范大学仓山校区','本1','外语学院','重庆','未知','大学学妹');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','杨梅','女','1993-08-29','18649754776','1947483032','玩货一个','福建师范大学旗山校区','本1','数计学院','四川眉山','未知','大学学妹');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','杨玉兰','女','1968-11-10','15908431582','4443335555','未知','未知','未知','未知','四川广安','未知','妈');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','张季秋','女','1992-09-16','15980266115','790024966','睡觉','未知','未知','未知','四川广安','待业中','姐');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','粟潘','男','1993-06-2？','未知','312567356','喜欢玩CS','未知','大专','未知','四川广安','未知','初中同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','杨端婷','女','1994-10-14','18359109356','569604894','喜欢玩,travel to every points','福建师范大学旗山校区','本1','软件学院软件工程','福建三明','新大陆,','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','郑何菲','女','未知','18396189219','977151023','未知','福建师范大学旗山校区','本1','软件学院软件工程','浙江','未知','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','粟欢','男','1992-07-27？','13506986864','386371977','未知','未知','大专','未知','四川广安','未知','姐夫');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','庄智敏','男','1992-10-21 8:00','15005993570','714751331','lol,装逼','福建师范大学旗山校区','本1','软件学院软件工程','福建漳州','易联众','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','秦兰','女','1997-04-03 早上7,8点','18784855271','484481944','玩英雄联盟','未知','未知','未知','四川渠县','未知','好朋友');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','张应','男','1968-05-17','13158728318','3338953365','未知','未知','未知','未知','四川广安','未知','爸');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','周春承','男','未知','18850459786','478627642','未知','福建师范大学旗山校区','本1','软件学院软件工程','四川达州','未知','老乡');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','钟媛琳','女','未知','18359192760','971097528','未知','福建师范大学旗山校区','本1','软件学院数字媒体','福建龙岩','未知','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','张涛','男','1994','未知','923859262','未知','未知','未知','未知','四川广安','未知','好朋友');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:16','江于谦','男','未知','15259148066','544301393','未知','福建师范大学旗山校区','本1','数字媒体技术','未知','福州一所教育机构','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:25','杜成煜','男','未知','18960871081','86101611','未知','福建师范大学旗山校区','本1','文学院','未知','学校','大学辅导员');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:25','林秋','男','未知','18605086307','137590332','未知','福建师范大学旗山校区','本1','软件学院软件工程','福建福州','新大陆支付-软件事业部(文山里小区)','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:25','林县生','男','未知','18359192522','1024193233','未知','福建师范大学旗山校区','本1','软件学院软件工程','未知','未知','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:27','郑震培','男','未知','18060864205','987003476','喜欢吹牛逼','福建师范大学旗山校区','本1','软件学院软件工程','福建泉州','北京枫林（百度91）->同花顺','大学同学-项目合伙人');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:27','肖如良','男','未知','13625082469','531707905','未知','未知','博士-教授','未知','未知','未知','大学导师');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:27','韦建华','男','未知','15980230895','184892434','未知','未知','未知','未知','未知','福建高速公路信息科技有限公司','公司领导');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:27','宋亮亮','男','未知','15705957065','210989252','玩游戏（lol，dnf）','福建师范大学旗山校区','本1','软件学院软工程','未知','未知','大学同学-3班');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2015:12:27','黄慧玲','女','未知','未知','15345049998','未知','未知','未知','未知','未知','用友福州分公司','工作同事');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:01:18','谢小东','男','未知','13960994824','124137478','zb','福建师范大学旗山校区','本1','应用科技学院','未知','福建高速信息科技有限公司','高速-同事');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:05:04','陈永燥','男','未知','18046066032','513528050','未知','福州大学','研究生','未知','未知','福建高速信息科技有限公司','高速-同事');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:07:04','杨思慧','女','未知','未知','282570836','郁郁寡欢,殊不知,市场推广','福建师范大学旗山校区','本1','市场营销','福建漳州','未知','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:06:15','向春梅','女','未知','未知','1163493668','未知','西南石油大学','本1','会计','四川广安','未知','高中同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:08:01','卢钰杰','女','1996-10-20','15022266075','1403192692','喜欢紫色,外号张超紫','天津师范大学','本1','数学科学学院','天津西青区精武镇宾水西道393号天津师范大学','未知','女儿');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:08:01','刘勤','男','1993','13655086080','937770621','lol,篮球','福建师范大学旗山校区','本1','软件学院软件工程','福建福州平潭','顶点软件股份有限公司','大学同学-3班');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:08:17','粟诗慧','女','2013-07-13','未知','1234','未知','未知','未知','未知','未知','未知','侄女');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:09:13','徐艳','女','未知','15305018984','895036082','未知','福建工程学院','本2','未知','福建','顶点软件股份有限公司,离职','无');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:10:17','张超红','男','1994-10-15','18060478928','251305396','佛学和科技1','福建师范大学','本科','软件工程','四川','顶点软件','我');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:11:23','秦金融','女','未知','未知','1713152830','各种生气,而且还不知道为什么生气,还喜欢删人','未知','本科','计算机','四川武胜','未知','高中同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2018-09-06','林丽梅','女','1996-04-03 23:00','13110530380','4444444444443333','喜欢吃百香果   喜欢聊天','福建师范大学-仓山校区','本科','英语师范','四川-成都','未知','学妹');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2017:02:14','啊飒飒','男','未知','12132324543','1213234543545','？涨12','未知','未知','未知','未知','未知','未知');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2017:02:13','林容','女','1993','未知','756857471','fadai','福州大学','本科','未知','福建-宁德','顶点软件股份有限公司','同事');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2018-01-22','冉娟','女','1994-01-16 12:00','18523200691','909090909090','本地','未知','未知','未知','未知','未知','杨银舍友');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:11:14','徐心雨','女','1997-09-03 凌晨4点','15279208038','1824897680',null,'南昌师范高等专科学校','专科','英语','江西湖口','未知','网友');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2017:08:08','周闻','女','新历1993-06-07 18点','18020740235','810161582','未知','福建师范大学','本科','软件工程','浙江绍兴人现居厦门（21）','未知','未知');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2017:09:03','周闻家虎爷猫','雌','新历2016-08-27','未知','未知','未知','未知','未知','喵喵','厦门','未知','喵喵');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2017:10:11','周颖玮','女','1995-06-10 8:45','15800864997','1250995998','唱歌，玩游戏；跟我啪啪啪啊','未知','本科','未知','襄阳-宜城','北京汉克时代杭州分公司','男女朋友');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2017-11-11','杨银','女','1994','15723230575','136537769','看综艺节目','中国石油大学（华东）','本1','计算机','重庆-两江新区','未知','高中同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:11:23','陈洋','男','1994-10-15','未知','774931273','调戏妹子','未知','本科','未知','四川武胜石盘','未知','初中同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:11:23','郭明耀','男','未知','18668066820','857481315','各种爱好,,,实在不知','福建师范大学旗山校区','本1','软件工程','福建','未知','大学同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:11:23','刘文君','女','未知','15282352882','734459929','未知','未知','专科','幼师','四川武胜','未知','堂姐');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2017:10:11','娄文隆','男','双鱼','13055409458','1402912047','篮球 跑步','福建师范大学','本科','软件工程','贵州-贵阳','未知','同学');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2016:12:27','林瑶','女','未知','未知','1014796186','未知','未知','未知','彩妆','河南洛阳','未知','网友');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2017:11:01','谭秀珍','女','2017-10-26忌日','未知','909009090','佛学','未知','未知','未知','四川','未知','奶奶');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2017-11-26','粟仕铭','男','2017','未知','粟思铭','未知','未知','未知','未知','四川省岳池县平摊镇','未知','侄子');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2017-11-27','张兰岚','女','1994-03-06 02:00','18650086448','1061269734','未知','福州大学','本1','未知','未知','未知','男女');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2018-10-06','王鸿程','女','未知','13738152694','13738152694','追剧','未知','未知','未知','杭州','北京汉克时代','前同事');
Insert into MYINFO.FRIEND (CREATEDATE,NAME,SEX,BIRTHDAY,TELEPHONE,QQ,HOBBY,SCHOOL,EDUCATION_BACKGROUND,MAJOR,ADDRESS,COMPANY,RELATION) values ('2018-10-06','同青波','男','未知','13175023356','微信号：bobo905323','滑轮、看书','未知','本1','计算机','陕西','杭州海康威视数字技术股份有限公司','现同事');
REM INSERTING into MYINFO.LOG_RECORD
SET DEFINE OFF;
Insert into MYINFO.LOG_RECORD (CREATE_TIME,OPERATE_NAME,OPERATE_DES,OPERATE_OBJ) values ('2018-10-06 06:08:46','updateByPrimaryKey','正在完成：updateByPrimaryKey方法','MyFriend{createdate=''null'', name=''林丽梅'', sex=''女'', birthday=''1997-04-03 23:00'', telephone=''13110530380'', qq=''4444444444443333'', hobby=''喜欢吃百香果   喜欢聊天'', school=''福建师范大学-仓山校区'', education_background=''本科'', major=''英语师范'', address=''四川-成都'', company=''未知'', relation=''学妹''}');
Insert into MYINFO.LOG_RECORD (CREATE_TIME,OPERATE_NAME,OPERATE_DES,OPERATE_OBJ) values ('2018-10-06 06:10:21','updateByPrimaryKey','正在完成：updateByPrimaryKey方法','MyFriend{createdate=''null'', name=''林丽梅'', sex=''女'', birthday=''1996-04-03 23:00'', telephone=''13110530380'', qq=''4444444444443333'', hobby=''喜欢吃百香果   喜欢聊天'', school=''福建师范大学-仓山校区'', education_background=''本科'', major=''英语师范'', address=''四川-成都'', company=''未知'', relation=''学妹''}');
Insert into MYINFO.LOG_RECORD (CREATE_TIME,OPERATE_NAME,OPERATE_DES,OPERATE_OBJ) values ('2018-10-06 02:33:40','updateByPrimaryKey','正在完成：updateByPrimaryKey方法','MyFriend{createdate=''null'', name=''林丽梅'', sex=''女'', birthday=''1996-04-03 23:00'', telephone=''13110530380'', qq=''4444444444443333'', hobby=''喜欢吃百香果   喜欢聊天'', school=''福建师范大学-仓山校区'', education_background=''本科'', major=''英语师范'', address=''四川-成都'', company=''未知'', relation=''学妹''}');
Insert into MYINFO.LOG_RECORD (CREATE_TIME,OPERATE_NAME,OPERATE_DES,OPERATE_OBJ) values ('2018-10-06 02:34:15','updateByPrimaryKey','正在完成：updateByPrimaryKey方法','MyFriend{createdate=''null'', name=''杨银'', sex=''女'', birthday=''1994'', telephone=''15723230575'', qq=''136537769'', hobby=''看综艺节目'', school=''中国石油大学（华东）'', education_background=''本1'', major=''计算机'', address=''重庆-两江新区'', company=''未知'', relation=''高中同学''}');
Insert into MYINFO.LOG_RECORD (CREATE_TIME,OPERATE_NAME,OPERATE_DES,OPERATE_OBJ) values ('2018-10-06 05:55:00','insertMyFriend','正在完成：insertMyFriend方法','MyFriend{createdate=''null'', name=''王鸿程'', sex=''女'', birthday=''未知'', telephone=''13738152694'', qq=''13738152694'', hobby=''追剧'', school=''未知'', education_background=''未知'', major=''未知'', address=''杭州'', company=''北京汉克时代'', relation=''前同事''}');
Insert into MYINFO.LOG_RECORD (CREATE_TIME,OPERATE_NAME,OPERATE_DES,OPERATE_OBJ) values ('2018-10-06 05:55:33','deleteMyfriend','正在完成：deleteMyfriend方法','MyFriend{createdate=''null'', name=''null'', sex=''null'', birthday=''null'', telephone=''null'', qq=''57317367'', hobby=''null'', school=''null'', education_background=''null'', major=''null'', address=''null'', company=''null'', relation=''null''}');
Insert into MYINFO.LOG_RECORD (CREATE_TIME,OPERATE_NAME,OPERATE_DES,OPERATE_OBJ) values ('2018-10-06 05:58:54','deleteMyfriend','正在完成：deleteMyfriend方法','MyFriend{createdate=''2016:07:01'', name=''王亚虾'', sex=''女'', birthday=''未知'', telephone=''15806019412'', qq=''1909484488'', hobby=''未知'', school=''福建师范大学'', education_background=''本1'', major=''未知'', address=''未知'', company=''福建新大陆支付公司'', relation=''新大陆支付-同事''}');
Insert into MYINFO.LOG_RECORD (CREATE_TIME,OPERATE_NAME,OPERATE_DES,OPERATE_OBJ) values ('2018-10-06 06:02:52','insertMyFriend','正在完成：insertMyFriend方法','MyFriend{createdate=''null'', name=''同青波'', sex=''男'', birthday=''未知'', telephone=''13175023356'', qq=''微信号：bobo905323'', hobby=''滑轮、看书'', school=''未知'', education_background=''本1'', major=''计算机'', address=''陕西'', company=''杭州海康威视数字技术股份有限公司'', relation=''现同事''}');
--------------------------------------------------------
--  DDL for Index FRIEND_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MYINFO"."FRIEND_PK" ON "MYINFO"."FRIEND" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FRIEND_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MYINFO"."FRIEND_PK1" ON "MYINFO"."FRIEND" ("QQ", "TELEPHONE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table FRIEND
--------------------------------------------------------

  ALTER TABLE "MYINFO"."FRIEND" ADD CONSTRAINT "FRIEND_PK" PRIMARY KEY ("QQ", "TELEPHONE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "MYINFO"."FRIEND" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MYINFO"."FRIEND" MODIFY ("COMPANY" NOT NULL ENABLE);
 
  ALTER TABLE "MYINFO"."FRIEND" MODIFY ("CREATEDATE" NOT NULL ENABLE);
 
  ALTER TABLE "MYINFO"."FRIEND" MODIFY ("QQ" NOT NULL ENABLE);
 
  ALTER TABLE "MYINFO"."FRIEND" MODIFY ("TELEPHONE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOG_RECORD
--------------------------------------------------------

  ALTER TABLE "MYINFO"."LOG_RECORD" MODIFY ("CREATE_TIME" NOT NULL ENABLE);
 
  ALTER TABLE "MYINFO"."LOG_RECORD" MODIFY ("OPERATE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MYINFO"."LOG_RECORD" MODIFY ("OPERATE_OBJ" NOT NULL ENABLE);
