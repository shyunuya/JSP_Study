//mysql
'CREATE TABLE `bbs` (
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Title` varchar(50) DEFAULT ''No Title'',
  `Content` varchar(1000) DEFAULT ''No Content'',
  `Created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `Views` int(11) DEFAULT ''0'',
  `Ref` int(11) DEFAULT ''0'',
  `Indent` int(11) DEFAULT ''0'',
  `Step` int(11) DEFAULT ''0'',
  PRIMARY KEY (`Number`)
);
