USE my_test;

DROP TABLE nation;
CREATE TABLE nation (      
	`nation_code` VARCHAR(5) NOT NULL PRIMARY KEY ,      
	`nation_name` varchar(20) NOT NULL       
);   
  
INSERT INTO nation VALUES('01','汉族');
INSERT INTO nation VALUES('02','蒙古族');   
INSERT INTO nation VALUES('03','回族');   
INSERT INTO nation VALUES('04','藏族');   
INSERT INTO nation VALUES('05','维吾尔族');   
INSERT INTO nation VALUES('06','苗族');   
INSERT INTO nation VALUES('07','彝族');   
INSERT INTO nation VALUES('08','壮族');   
INSERT INTO nation VALUES('09','布依族');   
INSERT INTO nation VALUES('10','朝鲜族');   
INSERT INTO nation VALUES('11','满族');   
INSERT INTO nation VALUES('12','侗族');   
INSERT INTO nation VALUES('13','瑶族');   
INSERT INTO nation VALUES('14','白族');   
INSERT INTO nation VALUES('15','土家族');   
INSERT INTO nation VALUES('16','哈尼族');   
INSERT INTO nation VALUES('17','哈萨克族');   
INSERT INTO nation VALUES('18','傣族');   
INSERT INTO nation VALUES('19','黎族');   
INSERT INTO nation VALUES('20','傈僳族');   
INSERT INTO nation VALUES('21','佤族');   
INSERT INTO nation VALUES('22','畲族');   
INSERT INTO nation VALUES('23','高山族');   
INSERT INTO nation VALUES('24','拉祜族');   
INSERT INTO nation VALUES('25','水族');   
INSERT INTO nation VALUES('26','东乡族');   
INSERT INTO nation VALUES('27','纳西族');   
INSERT INTO nation VALUES('28','景颇族');   
INSERT INTO nation VALUES('29','柯尔克孜族');   
INSERT INTO nation VALUES('30','土族');   
INSERT INTO nation VALUES('31','达斡尔族');   
INSERT INTO nation VALUES('32','仫佬族');   
INSERT INTO nation VALUES('33','羌族');   
INSERT INTO nation VALUES('34','布朗族');   
INSERT INTO nation VALUES('35','撒拉族');   
INSERT INTO nation VALUES('36','毛难族');   
INSERT INTO nation VALUES('37','仡佬族');   
INSERT INTO nation VALUES('38','锡伯族');   
INSERT INTO nation VALUES('39','阿昌族');   
INSERT INTO nation VALUES('40','普米族');   
INSERT INTO nation VALUES('41','塔吉克族');   
INSERT INTO nation VALUES('42','怒族');   
INSERT INTO nation VALUES('43','乌孜别克族');   
INSERT INTO nation VALUES('44','俄罗斯族');   
INSERT INTO nation VALUES('45','鄂温克族');   
INSERT INTO nation VALUES('46','崩龙族');   
INSERT INTO nation VALUES('47','保安族');   
INSERT INTO nation VALUES('48','裕固族');   
INSERT INTO nation VALUES('49','京族');   
INSERT INTO nation VALUES('50','塔塔尔族');   
INSERT INTO nation VALUES('51','独龙族');   
INSERT INTO nation VALUES('52','鄂伦春族');   
INSERT INTO nation VALUES('53','赫哲族');   
INSERT INTO nation VALUES('54','门巴族');   
INSERT INTO nation VALUES('55','珞巴族');   
INSERT INTO nation VALUES('56','基诺族');   
  
SELECT * FROM nation;