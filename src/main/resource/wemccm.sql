
-- -----------------
-- drop tables 
-- -----------------
DROP TABLE IF EXISTS `cicauthorisation`;
DROP TABLE IF EXISTS `cicfinanicaldistribution`;
DROP TABLE IF EXISTS `cicfinanicaldistributioniterm`;
DROP TABLE IF EXISTS `cicfinanicaldistributiontype`;
DROP TABLE IF EXISTS `cicprojectdetails`;
DROP TABLE IF EXISTS `cicprojectestimate`;
DROP TABLE IF EXISTS `cicprojecttask`;
DROP TABLE IF EXISTS `currentoccupy`;
DROP TABLE IF EXISTS `customercontribution`;
DROP TABLE IF EXISTS `customercontributionauthoris`;
DROP TABLE IF EXISTS `customercontributionprice`;
DROP TABLE IF EXISTS `customercontributionpricetype`;
DROP TABLE IF EXISTS `fiminputiterm`;
DROP TABLE IF EXISTS `fiminputitermquantity`;
DROP TABLE IF EXISTS `fiminputitermquantitytype`;
DROP TABLE IF EXISTS `fiminputsubtype`;
DROP TABLE IF EXISTS `fiminputtype`;
DROP TABLE IF EXISTS `noncontestableothercosts`;
DROP TABLE IF EXISTS `noncontestableprojectcomponent`;
DROP TABLE IF EXISTS `noncontestabletype`;
DROP TABLE IF EXISTS `notice`;
DROP TABLE IF EXISTS `project`;
DROP TABLE IF EXISTS `projectattachment`;
DROP TABLE IF EXISTS `projecttype`;
DROP TABLE IF EXISTS `quantityinput`;
DROP TABLE IF EXISTS `quantityinputiterm`;
DROP TABLE IF EXISTS `quantityinputitermsubtypeprice`;
DROP TABLE IF EXISTS `quantityinputitermtype`;
DROP TABLE IF EXISTS `quantityinputsubtype`;
DROP TABLE IF EXISTS `quantityinputtype`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `usertype`;

-- -----------------
-- create tables 
-- -----------------
CREATE TABLE `cicauthorisation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cicProjectDetailsID` int(11) NULL DEFAULT NULL,
  `useId` int(11) NULL DEFAULT NULL,
  `title` varchar(32)  NULL DEFAULT NULL,
  `authorDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `cicfinanicaldistribution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cicProjectDetailsId` int(11) NULL DEFAULT NULL,
  `finanicalDistributionItermID` int(11) NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `cicfinanicaldistributioniterm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finanicalDistributionTypeId` int(11) NULL DEFAULT NULL,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `cicfinanicaldistributiontype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `cicprojectdetails`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `wbsElements` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `cicprojectestimate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cicProjectTaskId` int(11) NULL DEFAULT NULL,
  `cicProjectDetailsId` int(11) NULL DEFAULT NULL,
  `labour` double(10, 2) NULL DEFAULT NULL,
  `materials` double(10, 2) NULL DEFAULT NULL,
  `plants` double(10, 2) NULL DEFAULT NULL,
  `contracts` double(10, 2) NULL DEFAULT NULL,
  `total` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `cicprojecttask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `currentoccupy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `projectId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ;
CREATE TABLE `customercontribution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `jemenaWBS` varchar(32)  NULL DEFAULT NULL,
  `inquiryNumber` int(11) NULL DEFAULT NULL,
  `jemenaSapPmOrder` varchar(32)  NULL DEFAULT NULL,
  `zinfraWBS` varchar(32)  NULL DEFAULT NULL,
  `projectTitle` varchar(32)  NULL DEFAULT NULL,
  `projectTypeId` int(11) NULL DEFAULT NULL,
  `supplyAddress` varchar(32)  NULL DEFAULT NULL,
  `customerReasonForWorks` varchar(32)  NULL DEFAULT NULL,
  `customerScopeOfWork` varchar(32)  NULL DEFAULT NULL,
  `jemenaScopeOfWork` varchar(32)  NULL DEFAULT NULL,
  `jemenaScopeExclusions` varchar(32)  NULL DEFAULT NULL,
  `assumption` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `customercontributionauthoris`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerContributionId` int(11) NULL DEFAULT NULL,
  `details` varchar(32)  NULL DEFAULT NULL,
  `dateOfRevision` datetime NULL DEFAULT NULL,
  `isAuthorised` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `customercontributionprice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerContributionId` int(11) NULL DEFAULT NULL,
  `customerContributionPriceTypeId` int(11) NULL DEFAULT NULL,
  `originalPrice` double(10, 2) NULL DEFAULT NULL,
  `revisedPrice` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `customercontributionpricetype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `fiminputiterm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fIMinputSubTypeID` int(11) NULL DEFAULT NULL,
  `description` varchar(32)  NULL DEFAULT NULL,
  `currency` varchar(32)  NULL DEFAULT NULL,
  `unitCost` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `fiminputitermquantity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `fIMinputItermId` int(11) NULL DEFAULT NULL,
  `fIMinputItermTypeId` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `cost` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `fiminputitermquantitytype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `fiminputsubtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fIMinputTypeID` int(11) NULL DEFAULT NULL,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `fiminputtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `noncontestableothercosts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `nonContestableTypeId` int(11) NULL DEFAULT NULL,
  `unit` varchar(32)  NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `rate` double(10, 2) NULL DEFAULT NULL,
  `total` double(10, 2) NULL DEFAULT NULL,
  `description` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `noncontestableprojectcomponent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `unit` varchar(32)  NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `rate` double(10, 2) NULL DEFAULT NULL,
  `total` double(10, 2) NULL DEFAULT NULL,
  `description` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `noncontestabletype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `notice`  (
  `sender` int(11) NULL DEFAULT NULL,
  `recipient` int(11) NULL DEFAULT NULL,
  `content` varchar(32)  NULL DEFAULT NULL,
  `type` varchar(32)  NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NULL DEFAULT NULL,
  `status` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(32)  NULL DEFAULT NULL,
  `statues` varchar(32)  NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ;
CREATE TABLE `projectattachment`  (
  `url` varchar(32)  NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `projecttype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  `description` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ;
CREATE TABLE `quantityinput`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `quantityInputItemId` int(11) NULL DEFAULT NULL,
  `quantityInputTypeId` int(11) NULL DEFAULT NULL,
  `quatity` int(11) NULL DEFAULT NULL,
  `cost` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `quantityinputiterm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `quantityInputItermTypeId` int(11) NULL DEFAULT NULL,
  `code` varchar(32)  NULL DEFAULT NULL,
  `description` varchar(32)  NULL DEFAULT NULL,
  `unit` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `quantityinputitermsubtypeprice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantityInputItemId` int(11) NULL DEFAULT NULL,
  `quantityInputSubTypeId` int(11) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `quantityinputitermtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256)  NULL DEFAULT NULL,
  `code` varchar(64)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `quantityinputsubtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantityInputTypeId` int(11) NULL DEFAULT NULL,
  `name` varchar(64)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `quantityinputtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32)  NULL DEFAULT NULL,
  `firstName` varchar(32)  NULL DEFAULT NULL,
  `lastName` varchar(32)  NULL DEFAULT NULL,
  `password` varchar(32)  NULL DEFAULT NULL,
  `email` varchar(32)  NULL DEFAULT NULL,
  `userTypeId` int(11) NULL DEFAULT NULL,
  `leaderId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ;
CREATE TABLE `usertype` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
);

-- -----------------
-- insert data 
-- -----------------
INSERT INTO `notice` VALUES (123, 123, '123', '123', 123, '2021-08-31 17:43:18', '123');
INSERT INTO `notice` VALUES (123, 123, '123', '123', 456, '2020-04-30 17:01:09', '123');
INSERT INTO `notice` VALUES (123, 123, '123', '123', 457, '2020-04-30 17:01:09', '123');
INSERT INTO `notice` VALUES (123, 123, '123', '123', 458, '2020-04-30 17:01:09', '123');
INSERT INTO `projecttype` VALUES (1, '123', '123');
INSERT INTO `projecttype` VALUES (2, '123', '123');
INSERT INTO `usertype` VALUES (123, 'uio');
INSERT INTO `currentoccupy` VALUES (7, 999, 456);

INSERT INTO `quantityinputitermtype` VALUES (1, '66kV Construction', '1.01');
INSERT INTO `quantityinputitermtype` VALUES (2, 'HV Construction', '1.02');
INSERT INTO `quantityinputitermtype` VALUES (3, 'LV Construction', '1.03');
INSERT INTO `quantityinputitermtype` VALUES (4, 'HV Line Switches, Isolators & Fuses', '1.04');
INSERT INTO `quantityinputitermtype` VALUES (5, 'Sub Assemblies', '1.05');
INSERT INTO `quantityinputitermtype` VALUES (6, 'String Bare Conductors', '1.06');
INSERT INTO `quantityinputitermtype` VALUES (7, 'String Insulated Conductors', '1.07');
INSERT INTO `quantityinputitermtype` VALUES (8, 'Advanced Metering Infrastructure', '1.08');
INSERT INTO `quantityinputitermtype` VALUES (9, 'Pole Substation Structure (Concrete)', '1.09');
INSERT INTO `quantityinputitermtype` VALUES (10, 'Overhead Servicing', '1.10');
INSERT INTO `quantityinputitermtype` VALUES (11, 'HV Cable Head Poles', '1.11');
INSERT INTO `quantityinputitermtype` VALUES (12, 'Street Lighting, Major Road', '2.01');
INSERT INTO `quantityinputitermtype` VALUES (13, 'Street Lighting, Minor Road', '2.02');
INSERT INTO `quantityinputitermtype` VALUES (14, 'Lanterns, Globes, PE Cells', '2.03');
INSERT INTO `quantityinputitermtype` VALUES (15, 'Underground Cable Construction - HV Termination & Joints', '3.01');
INSERT INTO `quantityinputitermtype` VALUES (16, 'Underground Cable Construction - LV Termination & Joints', '3.02');
INSERT INTO `quantityinputitermtype` VALUES (17, 'Underground Cable Only', '3.04');
INSERT INTO `quantityinputitermtype` VALUES (18, 'Cable Installation', '3.05');
INSERT INTO `quantityinputitermtype` VALUES (19, 'Cable Testing', '3.06');
INSERT INTO `quantityinputitermtype` VALUES (20, 'Civil Reinstatements and miscellaneous', '3.07');
INSERT INTO `quantityinputitermtype` VALUES (21, 'Indoor Substations', '4.01');
INSERT INTO `quantityinputitermtype` VALUES (22, 'Indoor HV Switchgear', '4.01');
INSERT INTO `quantityinputitermtype` VALUES (23, 'Install HV Switching Station', '4.03');
INSERT INTO `quantityinputitermtype` VALUES (24, 'Install Transformer Kiosk', '4.04');
INSERT INTO `quantityinputitermtype` VALUES (25, 'Install Transformer Cable Entry', '4.05');
INSERT INTO `quantityinputitermtype` VALUES (26, 'Earthing, Pole HV Structure', '4.06');
INSERT INTO `quantityinputitermtype` VALUES (27, 'Earthing, Kiosk Padmount Substation', '4.07');
INSERT INTO `quantityinputitermtype` VALUES (28, 'Earthing, HV Switching Station', '4.08');
INSERT INTO `quantityinputitermtype` VALUES (29, 'Earthing, Installation Methods', '4.09');
INSERT INTO `quantityinputitermtype` VALUES (30, 'Design & Project Management Services - Standard Projects', '5.01');
INSERT INTO `quantityinputitermtype` VALUES (31, 'Minor - minimum charging activity for simplest scope (supply available, offer letter only)', '5.01');
INSERT INTO `quantityinputitermtype` VALUES (32, 'Type A - include new Pit, RW single LV pole relocations, minor P/L, Line of mains (supply available, offer letter only)', '5.01');
INSERT INTO `quantityinputitermtype` VALUES (33, 'Type B - LV Underground project, OH or UG substation upgrade with minor line works, Medium RW HV/LV relocations', '5.01');
INSERT INTO `quantityinputitermtype` VALUES (34, 'Type C - URD project , New OH or UG substation, Large RW HV/LV relocations ', '5.01');
INSERT INTO `quantityinputitermtype` VALUES (35, 'Type D - Project with combined OH and UG activities, Industrial U/G Subdivisions with a substation, New Indoor Substation, Complex RW projects', '5.01');
INSERT INTO `quantityinputitermtype` VALUES (36, 'Major - project requiring customised number of hours (single Hourly rate)', '5.01');
INSERT INTO `quantityinputitermtype` VALUES (37, 'Other Design Services', '5.01');
INSERT INTO `quantityinputitermtype` VALUES (38, 'Operating', '5.03');
INSERT INTO `quantityinputitermtype` VALUES (39, 'Retirements', '6.01');
INSERT INTO `quantityinputitermtype` VALUES (40, 'Additional Labour - Excludes plant', '7.01');
INSERT INTO `quantityinputitermtype` VALUES (41, 'Additional Plant', '7.02');
INSERT INTO `quantityinputitermtype` VALUES (42, 'Extra Overtime cost (for itemised activities)', '8.01');
INSERT INTO `quantityinputitermtype` VALUES (43, 'Plant & Equipment', '9.01');
INSERT INTO `quantityinputitermtype` VALUES (44, 'Subcontracts', '10.01');

INSERT INTO `QuantityInputType` VALUES (1, 'General');
INSERT INTO `QuantityInputType` VALUES (2, 'Estimated Actuals');
INSERT INTO `QuantityInputType` VALUES (3, 'Recoverable Works');
INSERT INTO `QuantityInputType` VALUES (4, 'JEN Funded');
INSERT INTO `QuantityInputType` VALUES (5, 'LCTA');

INSERT INTO `quantityinputsubtype` VALUES (1, 1, 'Labour');
INSERT INTO `quantityinputsubtype` VALUES (2, 1, 'Material');
INSERT INTO `quantityinputsubtype` VALUES (3, 1, 'Plant');
INSERT INTO `quantityinputsubtype` VALUES (4, 1, 'Subcontract');
INSERT INTO `quantityinputsubtype` VALUES (5, 1, 'Unit Rate');
INSERT INTO `quantityinputsubtype` VALUES (6, 1, 'Manhours');
INSERT INTO `quantityinputsubtype` VALUES (7, 1, 'Total Manhours Actual');
INSERT INTO `quantityinputsubtype` VALUES (8, 0, 'Total Manhours Recoverable');
INSERT INTO `quantityinputsubtype` VALUES (9, 0, 'Total Manhours JEN');
INSERT INTO `quantityinputsubtype` VALUES (10, 0, 'Total Manhours LCTA');
INSERT INTO `quantityinputsubtype` VALUES (11, 2, 'Labour');
INSERT INTO `quantityinputsubtype` VALUES (12, 2, 'Material');
INSERT INTO `quantityinputsubtype` VALUES (13, 2, 'Plant');
INSERT INTO `quantityinputsubtype` VALUES (14, 2, 'Subcontract');
INSERT INTO `quantityinputsubtype` VALUES (15, 2, 'Subtotal');
INSERT INTO `quantityinputsubtype` VALUES (16, 3, 'Labour');
INSERT INTO `quantityinputsubtype` VALUES (17, 3, 'Material');
INSERT INTO `quantityinputsubtype` VALUES (18, 3, 'Plant');
INSERT INTO `quantityinputsubtype` VALUES (19, 3, 'Subcontract');
INSERT INTO `quantityinputsubtype` VALUES (20, 3, 'Subtotal');
INSERT INTO `quantityinputsubtype` VALUES (21, 4, 'Labour');
INSERT INTO `quantityinputsubtype` VALUES (22, 4, 'Material');
INSERT INTO `quantityinputsubtype` VALUES (23, 4, 'Plant');
INSERT INTO `quantityinputsubtype` VALUES (24, 4, 'Subcontract');
INSERT INTO `quantityinputsubtype` VALUES (25, 4, 'Subtotal');
INSERT INTO `quantityinputsubtype` VALUES (26, 5, 'Labour');
INSERT INTO `quantityinputsubtype` VALUES (27, 5, 'Material');
INSERT INTO `quantityinputsubtype` VALUES (28, 5, 'Plant');
INSERT INTO `quantityinputsubtype` VALUES (29, 5, 'Subcontract');
INSERT INTO `quantityinputsubtype` VALUES (30, 5, 'Subtotal');

