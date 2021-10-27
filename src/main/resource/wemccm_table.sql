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
DROP TABLE IF EXISTS `assetrelocation`;
DROP TABLE IF EXISTS `urd`;
DROP TABLE IF EXISTS `negotiatedconnection`;
DROP TABLE IF EXISTS `uplaodedfiles`;
DROP TABLE IF EXISTS `approver`;
--  -- -- -- -- -- -- -- -- -
--  create tables 
--  -- -- -- -- -- -- -- -- -
CREATE TABLE `uplaodedfiles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) ,
  `projectId` int(11) NULL DEFAULT NULL,
  `module` varchar(255) ,
  `localURL` varchar(255) ,
  `s3URL` varchar(255) ,
  PRIMARY KEY (`id`) USING BTREE
) ;
CREATE TABLE `assetrelocation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiryNumber` int(11) NULL DEFAULT NULL,
  `worksAddress` varchar(255) ,
  `scopeofWorks` varchar(255) ,
  `contestableContributionChargesforWorksCompletedbyJemena` varchar(255) ,
  `nonContestableContributionChargesforWorksCompletedbyJemena` varchar(255) ,
  `jemenaResponsibleOfficer` varchar(255) ,
  `projectId` int(11) NULL DEFAULT NULL,
  `typeofDistributionWork` varchar(255) ,
  `offerValidityPeriod` varchar(255) ,
  `plannedConstructionPeriod` varchar(255) ,
  `commencementofWorksObligations` varchar(255) ,
  `interestRateforOverduePayment` varchar(255) ,
  `customerResponsibleOfficer` varchar(255) ,
  `leaseorEasementifrequired` varchar(255) ,
  PRIMARY KEY (`id`) USING BTREE
) ;




CREATE TABLE `urd`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `subdivision` varchar(255) ,
  `inquiryNumber` varchar(255) ,
  `supplyAddress` varchar(255) ,
  `jemenaResponsibleOfficer` varchar(255) ,
  `descriptionofConnectionWorkstobeundertakenbyJemena` varchar(255) ,
  `descriptionofConnectionWorkstobeundertakenbyDeveloper` varchar(255) ,
  `statutoryandOtherApprovals` varchar(255) ,
  `supplyCapacityperLot` varchar(255) ,
  `date` datetime NULL DEFAULT NULL,
  `numberoflots` varchar(255) ,
  `lotnumbers` varchar(255) ,
  `leaseorEasement` varchar(255) ,
  `validityPeriod` varchar(255) ,
  `security` varchar(255) ,
  `plannedConstructionPeriod` varchar(255) ,
  `connectionAssetsandConnectionPoint` varchar(255) ,
  `networkExtensionorAugmentationifrequired` varchar(255) ,
  `premisesConnectionAssetsandPartiesResponsibleforInstallation` varchar(255) ,
  `costofNetworkExtensionofAugmentation` varchar(255) ,
  `meterInformation` varchar(255) ,
  `tenderFeeifapplicable` varchar(255) ,
  `applicableInterestRate` varchar(255) ,
  `developerResponsibleOfficer` varchar(255) ,
  `companyTradingName` varchar(255) ,
  `ABN` varchar(255) ,
  `otherJobSpecificRequirements` varchar(255) ,
  `projectId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ;

CREATE TABLE `negotiatedconnection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiryNumber` int(11) NULL DEFAULT NULL,
  `maximumAllocatedCapacity` varchar(255) ,
  `minimumContractDemandPrimary` varchar(255) ,
  `scopeofWorksCustomerFunded` varchar(255) ,
  `scopeofWorksJemenaFunded` varchar(255) ,
  `exclusions` varchar(255) ,
  `assumptions` varchar(255) ,
  `supplyAddress` varchar(255) ,
  `projectReference` varchar(255) ,
  `jemenaResponsibleOfficer` varchar(255) ,
  `date` datetime NULL DEFAULT NULL,
  `minimumContractDemandReserveFeeder` varchar(255) ,
  `validityPeriod` varchar(255) ,
  `plannedConstructionPeriod` varchar(255) ,
  `nominalSupplyVoltage` varchar(255) ,
  `supplyPhasing` varchar(255) ,
  `embeddedNetwork` varchar(255) ,
  `interestrateforoverduepayment` varchar(255) ,
  `Security` varchar(255) ,
  `connectionAssetandConnectionPointLocation` varchar(255) ,
  `premisesConnectionAssetsandPartiesResponsibleforInstallation` varchar(255) ,
  `statutoryorOtherApprovalstobeobtainedbyJemena` varchar(255) ,
  `leaseorEasementRequired` varchar(255) ,
  `customerResponsibleOfficer` varchar(255) ,
  `companyTradingName` varchar(255) ,
  `ABN` varchar(255) ,
  `networkExtensionorAugmentation` varchar(255) ,
  `projectId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ;

CREATE TABLE `connectionhandover`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
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
 `projectId` int(11) NULL DEFAULT NULL,
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
  `name` varchar(128) ,
  `type` varchar(128) ,
  `source` varchar(32) ,
  `unitCost` double(10, 2) NULL DEFAULT NULL,
  `unit` varchar(32) ,
  `quantity` int(11) NULL DEFAULT NULL,
  `totalCost` double(10, 2) NULL DEFAULT NULL,
  `assetAge` int(11) NULL DEFAULT NULL,
  `stdLife` double(10, 2) NULL DEFAULT NULL,
  `remLife` double(10, 2) NULL DEFAULT NULL,
  `presentValueRC` double(10, 2) NULL DEFAULT NULL,
  `avoidedCostassetReplacementItermId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
); 
CREATE TABLE `avoidedcostassetreplacementiterm` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(256) NULL DEFAULT NULL,
    `stdLife` int(32) NULL DEFAULT NULL,
    `unit` VARCHAR(128) NULL DEFAULT NULL,
    `unitCost` double(24, 14) NULL DEFAULT NULL,
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
  `jemenaWBS` varchar(128)  NULL DEFAULT NULL,
  `inquiryNumber` varchar(128) NULL DEFAULT NULL,
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
  `isLCTA` varchar(32)  NULL DEFAULT NULL,
  `isNonConstestable` varchar(32)  NULL DEFAULT NULL,
  `isAvoidCosts` varchar(32)  NULL DEFAULT NULL,
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
  `description` varchar(50)  NULL DEFAULT NULL,
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
  `labour` double(10, 2) NULL DEFAULT 0,
  `material` double(10, 2) NULL DEFAULT 0,
  `plant` double(10, 2) NULL DEFAULT 0,
  `subcontract` double(10, 2) NULL DEFAULT 0,
  `unitRate` double(10, 2) NULL DEFAULT 0,
  `manhours` double(10, 2) NULL DEFAULT 0,
  `actuals` int(11) NULL DEFAULT 0,
  `recouverable` int(11) NULL DEFAULT 0,
  `jemena` int(11) NULL DEFAULT 0,
  `lcat` int(11) NULL DEFAULT 0,
  `actualsSubTotal` double(10, 2) NULL DEFAULT 0,
  `recouverableSubTotal` double(10, 2) NULL DEFAULT 0,
  `jemenaSubTotal` double(10, 2) NULL DEFAULT 0,
  `lcatSubTotal` double(10, 2) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
);
CREATE TABLE `quantityinputbasicdata`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantityinputitermgroupId` int(11) ,
  `code` varchar(32) ,
  `description` varchar(32) ,
  `unit` varchar(32) ,
  `labour` double(10, 2) NULL DEFAULT 0,
  `material` double(10, 2) NULL DEFAULT 0,
  `plant` double(10, 2) NULL DEFAULT 0,
  `subcontract` double(10, 2) NULL DEFAULT 0,
  `unitRate` double(10, 2) NULL DEFAULT 0,
  `manhours` double(10, 2) NULL DEFAULT 0,
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

CREATE TABLE `approver`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `approverUserId` int(11) NULL DEFAULT NULL,
  `approverPost` varchar(32)  NULL DEFAULT NULL,
  `approverName` varchar(32)  NULL DEFAULT NULL,
  `approvalDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ;

