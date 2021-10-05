--  -- -- -- -- -- -- -- -- -
--  drop tables  
--  -- -- -- -- -- -- -- -- -
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
-- DROP TABLE IF EXISTS `fiminputitermquantitytype`;
DROP TABLE IF EXISTS `fiminputsubtype`;
DROP TABLE IF EXISTS `fiminputtype`;
DROP TABLE IF EXISTS `noncontestableothercosts`;
DROP TABLE IF EXISTS `noncontestableothercostsiterm`;
DROP TABLE IF EXISTS `noncontestableprojectcomponent`;
DROP TABLE IF EXISTS `projectnoncontestableprojectcomponent`;
DROP TABLE IF EXISTS `noncontestabletype`;
DROP TABLE IF EXISTS `notice`;
DROP TABLE IF EXISTS `project`;
DROP TABLE IF EXISTS `projectattachment`;
DROP TABLE IF EXISTS `projecttype`;
DROP TABLE IF EXISTS `quantityinput`;
DROP TABLE IF EXISTS `quantityinputbasicdata`;
DROP TABLE IF EXISTS `quantityinputitermgroup`;
-- DROP TABLE IF EXISTS `quantityinputiterm`;
-- DROP TABLE IF EXISTS `quantityinputitermsubtypeprice`;
-- DROP TABLE IF EXISTS `quantityinputitermtype`;
-- DROP TABLE IF EXISTS `quantityinputsubtype`;
-- DROP TABLE IF EXISTS `quantityinputtype`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `usertype`;
DROP TABLE IF EXISTS `avoidedcostassetreplacementcosts`;
DROP TABLE IF EXISTS `avoidedcostescguideline`;
DROP TABLE IF EXISTS `avoidedcostmaintenancecosts`;
DROP TABLE IF EXISTS `avoidedcosttype`;
DROP TABLE IF EXISTS `avoidedcostassetreplacementiterm`;
DROP TABLE IF EXISTS `design`;
DROP TABLE IF EXISTS `connectionhandover`;

--  -- -- -- -- -- -- -- -- -
--  create tables 
--  -- -- -- -- -- -- -- -- -
CREATE TABLE `connectionhandover`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectRef` varchar(255) ,
  `portalNo` int(11) NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `coustomerBusinesName` varchar(255) ,
  `projectAddress` varchar(255) ,
  `customerContactName` varchar(255) ,
  `customerContactNumber` varchar(255) ,
  `customerContactEmail` varchar(255) ,
  `maximumAllocatedCapacityPhases` varchar(255) ,
  `maximumAllocatedCapacityAmps` varchar(255) ,
  `maximumAllocatedCapacitykVA` varchar(255) ,
  `existingConnection` varchar(255) ,
  `embeddedNetwork` varchar(255) ,
  `reCadvisedofCTarrangement` varchar(255) ,
  `propertyRequirement` varchar(255) ,
  `projectManagerName` varchar(255) ,
  `projectManagerPhone` varchar(255) ,
  `ugCrewRequired` varchar(255) ,
  `networkOperatorRequired` varchar(255) ,
  `complianceReviewedDesign` varchar(255) ,
  `supplyPointDetails` varchar(255) ,
  `supplyPointComments` varchar(255) ,
  `silVonissue` varchar(255) ,
  `silVonissueComments` varchar(255) ,
  PRIMARY KEY (`id`) USING BTREE
) ;
CREATE TABLE `design`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WBSElement` varchar(32) ,
  `worksDescription` varchar(255) ,
  `retirements` varchar(255) ,
  PRIMARY KEY (`id`) USING BTREE
) ;
CREATE TABLE `avoidedcosttype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) ,
  PRIMARY KEY (`id`) USING BTREE
);

CREATE TABLE `avoidedcostmaintenancecosts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `unit` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `costPa` double(10, 2) NULL DEFAULT NULL,
  `ameExist` double(10, 2) NULL DEFAULT NULL,
  `avoidedCostInputTypeId` int(11) NULL DEFAULT NULL,
  `name` varchar(256) ,
  `source` varchar(128) ,
  `maint` varchar(32) ,
  `vegMgt` varchar(32) ,
  PRIMARY KEY (`id`) USING BTREE
); 
CREATE TABLE `avoidedcostescguideline`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `assumptions` varchar(256) ,
  `source` varchar(32) ,
  `constant` varchar(32) ,
  `notes` varchar(32) ,
  PRIMARY KEY (`id`) USING BTREE
); 
CREATE TABLE `avoidedcostassetreplacementcosts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `avoidedCostassetReplacementItermId` int(11) ,
  `source` varchar(32) ,
  `unitCost` double(10, 2) NULL DEFAULT NULL,
  `unit` varchar(32) ,
  `quantity` int(11) NULL DEFAULT NULL,
  `totalCost` double(10, 2) NULL DEFAULT NULL,
  `assetAge` int(11) NULL DEFAULT NULL,
  `stdLife` double(10, 2) NULL DEFAULT NULL,
  `remLife` double(10, 2) NULL DEFAULT NULL,
  `presentValueRC` double(10, 2) NULL DEFAULT NULL,
  `avoidedCostInputTypeId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
); 
CREATE TABLE `avoidedcostassetreplacementIterm` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `assertName` VARCHAR(256) NULL DEFAULT NULL,
    `assertLife` int(32) NULL DEFAULT NULL,
    `units` VARCHAR(128) NULL DEFAULT NULL,
    `newAssertCost` double(24, 14) NULL DEFAULT NULL,
    `maintenanceCost` double(24, 14) NULL DEFAULT NULL,
    `vegetationManagementCost` double(24, 14) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
);
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
  `name` varchar(256)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `cicfinanicaldistributiontype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `cicprojectdetails`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `wbsElements` varchar(128)  NULL DEFAULT NULL,
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
  `name` varchar(128)  NULL DEFAULT NULL,
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
  `projectType` varchar(128) NULL DEFAULT NULL,
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
  `name` varchar(128)  NULL DEFAULT NULL,
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
  `currency` varchar(32)  NULL DEFAULT NULL,
  `unitCost` double(10, 2) NULL DEFAULT NULL,
  `fIMinputItermId` int(11) NULL DEFAULT NULL,
  `acturalQuantity` int(11) NULL DEFAULT NULL,
  `jenFoundedQuantity` int(11) NULL DEFAULT NULL,
  `lctaQuantity` int(11) NULL DEFAULT NULL,
  `acturalSubTotal` double(10, 2) NULL DEFAULT NULL,
  `jenFoundedTotal` double(10, 2) NULL DEFAULT NULL,
  `lctaTotal` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
-- CREATE TABLE `fiminputitermquantitytype`  (
--  `id` int(11) NOT NULL AUTO_INCREMENT,
--  `name` varchar(128)  NULL DEFAULT NULL,
--  PRIMARY KEY (`id`) USING BTREE
-- );
CREATE TABLE `fiminputsubtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fIMinputTypeID` int(11) NULL DEFAULT NULL,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `fiminputtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `noncontestableothercosts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `nonContestableOtherCostsItemId` int(11) NULL DEFAULT NULL,
  `unit` varchar(32)  NULL DEFAULT NULL,
  `rate` double(10, 2) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `total` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `noncontestableothercostsiterm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonContestableTypeId` int(11) NULL DEFAULT NULL,
  `unit` varchar(32)  NULL DEFAULT NULL,
  `rate` double(10, 2) NULL DEFAULT NULL,
  `description` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `noncontestableprojectcomponent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectTypeId` int(11) NULL DEFAULT NULL,
  `cost` double(10, 2) NULL DEFAULT NULL,
  `description` varchar(128)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

CREATE TABLE `projectnoncontestableprojectcomponent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `nonContestableProjectComponentId` int(11) NULL DEFAULT NULL,
  `cost` double(10, 2) NULL DEFAULT NULL,
  `hours` int(11) NULL DEFAULT NULL,
  `total` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

CREATE TABLE `noncontestabletype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `notice`  (
  `sender` int(11) NULL DEFAULT NULL,
  `recipient` int(11) NULL DEFAULT NULL,
  `content` varchar(256)  NULL DEFAULT NULL,
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
  `name` varchar(128)  NULL DEFAULT NULL,
  `description` varchar(256)  NULL DEFAULT NULL,
  `projectManagement` varchar(256)  NULL DEFAULT NULL,
  `design` varchar(256)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ;
CREATE TABLE `quantityinput`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `quantityInputBasicDataId` int(11) NULL DEFAULT NULL,
  `unit` varchar(32) NULL DEFAULT NULL,
  `labour` double(10, 2) NULL DEFAULT NULL,
  `material` double(10, 2) NULL DEFAULT NULL,
  `plant` double(10, 2) NULL DEFAULT NULL,
  `subcontract` double(10, 2) NULL DEFAULT NULL,
  `unitRate` double(10, 2) NULL DEFAULT NULL,
  `manhours` double(10, 2) NULL DEFAULT NULL,
  `actuals` int(11) NULL DEFAULT NULL,
  `recouverable` int(11) NULL DEFAULT NULL,
  `jemena` int(11) NULL DEFAULT NULL,
  `lcat` int(11) NULL DEFAULT NULL,
  `actualsSubTotal` double(10, 2) NULL DEFAULT NULL,
  `recouverableSubTotal` double(10, 2) NULL DEFAULT NULL,
  `jemenaSubTotal` double(10, 2) NULL DEFAULT NULL,
  `lcatSubTotal` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `quantityinputbasicdata`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantityInputItermGroupId` int(11) ,
  `code` varchar(32) ,
  `description` varchar(32) ,
  `unit` varchar(32) ,
  `labour` double(10, 2) ,
  `material` double(10, 2) ,
  `plant` double(10, 2) ,
  `subcontract` double(10, 2) ,
  `unitRate` double(10, 2) ,
  `manhours` double(10, 2) ,
  PRIMARY KEY (`id`) USING BTREE
) ;
CREATE TABLE `quantityinputitermgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) ,
  `code` varchar(32) ,
  PRIMARY KEY (`id`) USING BTREE
) ;
-- CREATE TABLE `quantityinputiterm`  (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `quantityInputItermTypeId` int(11) NULL DEFAULT NULL,
--   `code` varchar(32)  NULL DEFAULT NULL,
--   `description` varchar(32)  NULL DEFAULT NULL,
--   `unit` varchar(32)  NULL DEFAULT NULL,
--   PRIMARY KEY (`id`) USING BTREE
-- );
-- CREATE TABLE `quantityinputitermsubtypeprice`  (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `quantityInputItemId` int(11) NULL DEFAULT NULL,
--   `quantityInputSubTypeId` int(11) NULL DEFAULT NULL,
--   `price` decimal(10, 2) NULL DEFAULT NULL,
--   PRIMARY KEY (`id`) USING BTREE
-- );
-- CREATE TABLE `quantityinputitermtype`  (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `name` varchar(256)  NULL DEFAULT NULL,
--   `code` varchar(64)  NULL DEFAULT NULL,
--   PRIMARY KEY (`id`) USING BTREE
-- );
-- CREATE TABLE `quantityinputsubtype`  (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `quantityInputTypeId` int(11) NULL DEFAULT NULL,
--   `name` varchar(128)  NULL DEFAULT NULL,
--   PRIMARY KEY (`id`) USING BTREE
-- );
-- CREATE TABLE `quantityinputtype`  (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `name` varchar(128)  NULL DEFAULT NULL,
--   PRIMARY KEY (`id`) USING BTREE
-- );
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(32)  NULL DEFAULT NULL,
  `lastName` varchar(32)  NULL DEFAULT NULL,
  `password` varchar(32)  NULL DEFAULT NULL,
  `email` varchar(32)  NULL DEFAULT NULL,
  `userTypeId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ;
CREATE TABLE `usertype` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(64) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
);


--  -- -- -- -- -- -- -- -- -
--  insert data 
--  -- -- -- -- -- -- -- -- -
INSERT INTO `avoidedcosttype` VALUES (123, '123');
INSERT INTO `avoidedcosttype` VALUES (456, '456');

INSERT INTO `notice` VALUES (123, 123, '123', '123', 123, '2021-08-31 17:43:18', '123');
INSERT INTO `notice` VALUES (123, 123, '123', '123', 456, '2020-04-30 17:01:09', '123');
INSERT INTO `notice` VALUES (123, 123, '123', '123', 457, '2020-04-30 17:01:09', '123');
INSERT INTO `notice` VALUES (123, 123, '123', '123', 458, '2020-04-30 17:01:09', '123');

INSERT INTO `usertype` VALUES (1, 'Super Administrator');
INSERT INTO `usertype` VALUES (2, 'Financial Administrator');
INSERT INTO `usertype` VALUES (3, 'Tariff Administrator');
INSERT INTO `usertype` VALUES (4, 'Pricing Administrator');
INSERT INTO `usertype` VALUES (5, 'Commercial & Operational Administrator');
INSERT INTO `usertype` VALUES (6, 'Final Approvers');
INSERT INTO `usertype` VALUES (7, 'Senior Project Mnager');
INSERT INTO `usertype` VALUES (8, 'Project Manager');
INSERT INTO `usertype` VALUES (9, 'Estimator');

INSERT INTO `user` VALUES (1, 'admin', 'admin', 'admin','admin@wemccm.com',1);

INSERT INTO `currentoccupy` VALUES (7, 999, 456);

INSERT INTO `quantityInputItermgroup` VALUES (1, '66kV Construction', '1.01');
INSERT INTO `quantityInputItermgroup` VALUES (2, 'HV Construction', '1.02');
INSERT INTO `quantityInputItermgroup` VALUES (3, 'LV Construction', '1.03');
INSERT INTO `quantityInputItermgroup` VALUES (4, 'HV Line Switches, Isolators & Fuses', '1.04');
INSERT INTO `quantityInputItermgroup` VALUES (5, 'Sub Assemblies', '1.05');
INSERT INTO `quantityInputItermgroup` VALUES (6, 'String Bare Conductors', '1.06');
INSERT INTO `quantityInputItermgroup` VALUES (7, 'String Insulated Conductors', '1.07');
INSERT INTO `quantityInputItermgroup` VALUES (8, 'Advanced Metering Infrastructure', '1.08');
INSERT INTO `quantityInputItermgroup` VALUES (9, 'Pole Substation Structure (Concrete)', '1.09');
INSERT INTO `quantityInputItermgroup` VALUES (10, 'Overhead Servicing', '1.10');
INSERT INTO `quantityInputItermgroup` VALUES (11, 'HV Cable Head Poles', '1.11');
INSERT INTO `quantityInputItermgroup` VALUES (12, 'Street Lighting, Major Road', '2.01');
INSERT INTO `quantityInputItermgroup` VALUES (13, 'Street Lighting, Minor Road', '2.02');
INSERT INTO `quantityInputItermgroup` VALUES (14, 'Lanterns, Globes, PE Cells', '2.03');
INSERT INTO `quantityInputItermgroup` VALUES (15, 'Underground Cable Construction - HV Termination & Joints', '3.01');
INSERT INTO `quantityInputItermgroup` VALUES (16, 'Underground Cable Construction - LV Termination & Joints', '3.02');
INSERT INTO `quantityInputItermgroup` VALUES (17, 'Underground Cable Only', '3.04');
INSERT INTO `quantityInputItermgroup` VALUES (18, 'Cable Installation', '3.05');
INSERT INTO `quantityInputItermgroup` VALUES (19, 'Cable Testing', '3.06');
INSERT INTO `quantityInputItermgroup` VALUES (20, 'Civil Reinstatements and miscellaneous', '3.07');
INSERT INTO `quantityInputItermgroup` VALUES (21, 'Indoor Substations', '4.01');
INSERT INTO `quantityInputItermgroup` VALUES (22, 'Indoor HV Switchgear', '4.01');
INSERT INTO `quantityInputItermgroup` VALUES (23, 'Install HV Switching Station', '4.03');
INSERT INTO `quantityInputItermgroup` VALUES (24, 'Install Transformer Kiosk', '4.04');
INSERT INTO `quantityInputItermgroup` VALUES (25, 'Install Transformer Cable Entry', '4.05');
INSERT INTO `quantityInputItermgroup` VALUES (26, 'Earthing, Pole HV Structure', '4.06');
INSERT INTO `quantityInputItermgroup` VALUES (27, 'Earthing, Kiosk Padmount Substation', '4.07');
INSERT INTO `quantityInputItermgroup` VALUES (28, 'Earthing, HV Switching Station', '4.08');
INSERT INTO `quantityInputItermgroup` VALUES (29, 'Earthing, Installation Methods', '4.09');
INSERT INTO `quantityInputItermgroup` VALUES (30, 'Design & Project Management Services - Standard Projects', '5.01');
INSERT INTO `quantityInputItermgroup` VALUES (31, 'Minor - minimum charging activity for simplest scope (supply available, offer letter only)', '5.01');
INSERT INTO `quantityInputItermgroup` VALUES (32, 'Type A - include new Pit, RW single LV pole relocations, minor P/L, Line of mains (supply available, offer letter only)', '5.01');
INSERT INTO `quantityInputItermgroup` VALUES (33, 'Type B - LV Underground project, OH or UG substation upgrade with minor line works, Medium RW HV/LV relocations', '5.01');
INSERT INTO `quantityInputItermgroup` VALUES (34, 'Type C - URD project , New OH or UG substation, Large RW HV/LV relocations ', '5.01');
INSERT INTO `quantityInputItermgroup` VALUES (35, 'Type D - Project with combined OH and UG activities, Industrial U/G Subdivisions with a substation, New Indoor Substation, Complex RW projects', '5.01');
INSERT INTO `quantityInputItermgroup` VALUES (36, 'Major - project requiring customised number of hours (single Hourly rate)', '5.01');
INSERT INTO `quantityInputItermgroup` VALUES (37, 'Other Design Services', '5.01');
INSERT INTO `quantityInputItermgroup` VALUES (38, 'Operating', '5.03');
INSERT INTO `quantityInputItermgroup` VALUES (39, 'Retirements', '6.01');
INSERT INTO `quantityInputItermgroup` VALUES (40, 'Additional Labour - Excludes plant', '7.01');
INSERT INTO `quantityInputItermgroup` VALUES (41, 'Additional Plant', '7.02');
INSERT INTO `quantityInputItermgroup` VALUES (42, 'Extra Overtime cost (for itemised activities)', '8.01');
INSERT INTO `quantityInputItermgroup` VALUES (43, 'Plant & Equipment', '9.01');
INSERT INTO `quantityInputItermgroup` VALUES (44, 'Subcontracts', '10.01');

-- INSERT INTO `quantityinputiterm` VALUES (1, 1, '10.01-01','66kV SC Intermediate, AT1A SL24','pole');
-- INSERT INTO `quantityinputiterm` VALUES (2, 2, '10.02-01','22kV SC Intermediate, AT1A Wood','pole');
-- 
-- INSERT INTO `QuantityInputType` VALUES (1, 'General');
-- INSERT INTO `QuantityInputType` VALUES (2, 'Estimated Actuals');
-- INSERT INTO `QuantityInputType` VALUES (3, 'Recoverable Works');
-- INSERT INTO `QuantityInputType` VALUES (4, 'JEN Funded');
-- INSERT INTO `QuantityInputType` VALUES (5, 'LCTA');
-- 
-- INSERT INTO `quantityinputsubtype` VALUES (1, 1, 'Labour');
-- INSERT INTO `quantityinputsubtype` VALUES (2, 1, 'Material');
-- INSERT INTO `quantityinputsubtype` VALUES (3, 1, 'Plant');
-- INSERT INTO `quantityinputsubtype` VALUES (4, 1, 'Subcontract');
-- INSERT INTO `quantityinputsubtype` VALUES (5, 1, 'Unit Rate');
-- INSERT INTO `quantityinputsubtype` VALUES (6, 1, 'Manhours');
-- INSERT INTO `quantityinputsubtype` VALUES (7, 1, 'Total Manhours Actual');
-- INSERT INTO `quantityinputsubtype` VALUES (8, 0, 'Total Manhours Recoverable');
-- INSERT INTO `quantityinputsubtype` VALUES (9, 0, 'Total Manhours JEN');
-- INSERT INTO `quantityinputsubtype` VALUES (10, 0, 'Total Manhours LCTA');
-- INSERT INTO `quantityinputsubtype` VALUES (11, 2, 'Labour');
-- INSERT INTO `quantityinputsubtype` VALUES (12, 2, 'Material');
-- INSERT INTO `quantityinputsubtype` VALUES (13, 2, 'Plant');
-- INSERT INTO `quantityinputsubtype` VALUES (14, 2, 'Subcontract');
-- INSERT INTO `quantityinputsubtype` VALUES (15, 2, 'Subtotal');
-- INSERT INTO `quantityinputsubtype` VALUES (16, 3, 'Labour');
-- INSERT INTO `quantityinputsubtype` VALUES (17, 3, 'Material');
-- INSERT INTO `quantityinputsubtype` VALUES (18, 3, 'Plant');
-- INSERT INTO `quantityinputsubtype` VALUES (19, 3, 'Subcontract');
-- INSERT INTO `quantityinputsubtype` VALUES (20, 3, 'Subtotal');
-- INSERT INTO `quantityinputsubtype` VALUES (21, 4, 'Labour');
-- INSERT INTO `quantityinputsubtype` VALUES (22, 4, 'Material');
-- INSERT INTO `quantityinputsubtype` VALUES (23, 4, 'Plant');
-- INSERT INTO `quantityinputsubtype` VALUES (24, 4, 'Subcontract');
-- INSERT INTO `quantityinputsubtype` VALUES (25, 4, 'Subtotal');
-- INSERT INTO `quantityinputsubtype` VALUES (26, 5, 'Labour');
-- INSERT INTO `quantityinputsubtype` VALUES (27, 5, 'Material');
-- INSERT INTO `quantityinputsubtype` VALUES (28, 5, 'Plant');
-- INSERT INTO `quantityinputsubtype` VALUES (29, 5, 'Subcontract');
-- INSERT INTO `quantityinputsubtype` VALUES (30, 5, 'Subtotal');

INSERT INTO `projecttype` VALUES (1, 'Minor', '', '', '');
INSERT INTO `projecttype` VALUES (2, 'Type A', '', '', '');
INSERT INTO `projecttype` VALUES (3, 'Type B', '', '', '');
INSERT INTO `projecttype` VALUES (4, 'Type C', '', '', '');
INSERT INTO `projecttype` VALUES (5, 'Type D', '', '', '');
INSERT INTO `projecttype` VALUES (6, 'Major', '', '', '');

INSERT INTO `noncontestableprojectcomponent` VALUES (1, '1','526.46','Minor Project Management & Design - 5 Hours');
INSERT INTO `noncontestableprojectcomponent` VALUES (2, '2','1310.01','Type A - Project Management (Delivery)');
INSERT INTO `noncontestableprojectcomponent` VALUES (3, '2','1105.58','Type A - Design');
INSERT INTO `noncontestableprojectcomponent` VALUES (4, '2','1116.80','Type A - Project Management (Offer)');
INSERT INTO `noncontestableprojectcomponent` VALUES (5, '3','2093.55','Type B - Project Management (Delivery)');
INSERT INTO `noncontestableprojectcomponent` VALUES (6, '3','1947.92','Type B - Design');
INSERT INTO `noncontestableprojectcomponent` VALUES (7, '3','2017.23','Type B - Project Management (Offer)');
INSERT INTO `noncontestableprojectcomponent` VALUES (8, '4','2678.10','Type C - Project Management (Delivery)');
INSERT INTO `noncontestableprojectcomponent` VALUES (9, '4','2211.15','Type C - Design');
INSERT INTO `noncontestableprojectcomponent` VALUES (10, '4','3449.91','Type C - Project Management (Offer)');
INSERT INTO `noncontestableprojectcomponent` VALUES (11, '5','3578.52','Type D - Project Management (Delivery)');
INSERT INTO `noncontestableprojectcomponent` VALUES (12, '5','4159.07','Type D - Design');
INSERT INTO `noncontestableprojectcomponent` VALUES (13, '5','4455.62','Type D - Project Management (Offer)');
INSERT INTO `noncontestableprojectcomponent` VALUES (14, '6','132.16','Major - Project Management (Delivery)');
INSERT INTO `noncontestableprojectcomponent` VALUES (15, '6','118.15','Major - Design');
INSERT INTO `noncontestableprojectcomponent` VALUES (16, '6','133.32','Major - Project Management (Offer)');

INSERT INTO `noncontestabletype` VALUES (1, 'Other Design Services');
INSERT INTO `noncontestabletype` VALUES (2, 'Retirements');
INSERT INTO `noncontestabletype` VALUES (3, 'Operating');
INSERT INTO `noncontestabletype` VALUES (4, 'Additional Labour - Excludes plant');
INSERT INTO `noncontestabletype` VALUES (5, 'Extra Overtime cost (for itemised activities)');

-- INSERT INTO `fiminputitermquantitytype` VALUES (1, 'Actural');
-- INSERT INTO `fiminputitermquantitytype` VALUES (2, 'JENfounded');
-- INSERT INTO `fiminputitermquantitytype` VALUES (3, 'LCTA');

INSERT INTO `fiminputtype` VALUES (1, 'Pole TX Estimates');
INSERT INTO `fiminputtype` VALUES (2, 'Kiosk TX');

INSERT INTO `fiminputsubtype` VALUES (1, 1, 'Transformer 22kV');
INSERT INTO `fiminputsubtype` VALUES (2, 1, 'Transformer 11kV');
INSERT INTO `fiminputsubtype` VALUES (3, 1, 'Transformer 11-6.6kV');
INSERT INTO `fiminputsubtype` VALUES (4, 1, 'Other Transformers');
INSERT INTO `fiminputsubtype` VALUES (5, 2, 'PAD 11kV');
INSERT INTO `fiminputsubtype` VALUES (6, 2, 'Kiosk 22kV');
INSERT INTO `fiminputsubtype` VALUES (7, 2, 'PAD 22kV');


INSERT INTO `customercontributionpricetype` VALUES (1, 'Zinfra Fixed Price ');
INSERT INTO `customercontributionpricetype` VALUES (2, 'Other Costs (O/Hs, FIM) ');
INSERT INTO `customercontributionpricetype` VALUES (3, 'Total Assset Value (JEN Project Budget) ');
INSERT INTO `customercontributionpricetype` VALUES (4, 'ZRO ∆ ');
INSERT INTO `customercontributionpricetype` VALUES (5, 'TOTAL CUSTOMER CONTRIBUTION ');
INSERT INTO `customercontributionpricetype` VALUES (6, 'BALANCE OF CONTRIBUTION AFTER PROJECT FEE ');
INSERT INTO `customercontributionpricetype` VALUES (7, 'JEN Contribution to Project ');
INSERT INTO `customercontributionpricetype` VALUES (8, 'Customer Supply Requested Target Date ');

INSERT INTO `avoidedcostassetreplacementiterm` VALUES (1,'Wooden Pole - HV',54,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (2,'Wooden Pole - LV',54,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (3,'Concrete Pole - HV',70,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (4,'Concrete Pole - LV',70,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (5,'Steel Pole - LV',40,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (6,'Steel Cross Arms (incl. Insulators) - HV',70,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (7,'Wood Cross Arms (incl. Insulators) - HV',45,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (8,'Wood Cross Arms (incl. Insulators) - LV',45,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (9,'Bare Conductors (Al)',60,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (10,'Insulated Conductors - LV',60,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (11,'Underground Cables and Cablehead - HV, XLPE',40,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (12,'Underground Cables and Cablehead - LV, XLPE',55,'$/Pole',14417.69623,14.81813663,11.05945032);