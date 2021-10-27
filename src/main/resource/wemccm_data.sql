
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

INSERT INTO `quantityinputitermgroup` VALUES (1, '66kV Construction', '1.01');
INSERT INTO `quantityinputitermgroup` VALUES (2, 'HV Construction', '1.02');
INSERT INTO `quantityinputitermgroup` VALUES (3, 'LV Construction', '1.03');
INSERT INTO `quantityinputitermgroup` VALUES (4, 'HV Line Switches, Isolators & Fuses', '1.04');
INSERT INTO `quantityinputitermgroup` VALUES (5, 'Sub Assemblies', '1.05');
INSERT INTO `quantityinputitermgroup` VALUES (6, 'String Bare Conductors', '1.06');
INSERT INTO `quantityinputitermgroup` VALUES (7, 'String Insulated Conductors', '1.07');
INSERT INTO `quantityinputitermgroup` VALUES (8, 'Advanced Metering Infrastructure', '1.08');
INSERT INTO `quantityinputitermgroup` VALUES (9, 'Pole Substation Structure (Concrete)', '1.09');
INSERT INTO `quantityinputitermgroup` VALUES (10, 'Overhead Servicing', '1.10');
INSERT INTO `quantityinputitermgroup` VALUES (11, 'HV Cable Head Poles', '1.11');
INSERT INTO `quantityinputitermgroup` VALUES (12, 'Street Lighting, Major Road', '2.01');
INSERT INTO `quantityinputitermgroup` VALUES (13, 'Street Lighting, Minor Road', '2.02');
INSERT INTO `quantityinputitermgroup` VALUES (14, 'Lanterns, Globes, PE Cells', '2.03');
INSERT INTO `quantityinputitermgroup` VALUES (15, 'Underground Cable Construction - HV Termination & Joints', '3.01');
INSERT INTO `quantityinputitermgroup` VALUES (16, 'Underground Cable Construction - LV Termination & Joints', '3.02');
INSERT INTO `quantityinputitermgroup` VALUES (17, 'Underground Cable Only', '3.04');
INSERT INTO `quantityinputitermgroup` VALUES (18, 'Cable Installation', '3.05');
INSERT INTO `quantityinputitermgroup` VALUES (19, 'Cable Testing', '3.06');
INSERT INTO `quantityinputitermgroup` VALUES (20, 'Civil Reinstatements and miscellaneous', '3.07');
INSERT INTO `quantityinputitermgroup` VALUES (21, 'Indoor Substations', '4.01');
INSERT INTO `quantityinputitermgroup` VALUES (22, 'Indoor HV Switchgear', '4.01');
INSERT INTO `quantityinputitermgroup` VALUES (23, 'Install HV Switching Station', '4.03');
INSERT INTO `quantityinputitermgroup` VALUES (24, 'Install Transformer Kiosk', '4.04');
INSERT INTO `quantityinputitermgroup` VALUES (25, 'Install Transformer Cable Entry', '4.05');
INSERT INTO `quantityinputitermgroup` VALUES (26, 'Earthing, Pole HV Structure', '4.06');
INSERT INTO `quantityinputitermgroup` VALUES (27, 'Earthing, Kiosk Padmount Substation', '4.07');
INSERT INTO `quantityinputitermgroup` VALUES (28, 'Earthing, HV Switching Station', '4.08');
INSERT INTO `quantityinputitermgroup` VALUES (29, 'Earthing, Installation Methods', '4.09');
INSERT INTO `quantityinputitermgroup` VALUES (30, 'Design & Project Management Services - Standard Projects', '5.01');
INSERT INTO `quantityinputitermgroup` VALUES (31, 'Minor - minimum charging activity for simplest scope (supply available, offer letter only)', '5.01');
INSERT INTO `quantityinputitermgroup` VALUES (32, 'Type A - include new Pit, RW single LV pole relocations, minor P/L, Line of mains (supply available, offer letter only)', '5.01');
INSERT INTO `quantityinputitermgroup` VALUES (33, 'Type B - LV Underground project, OH or UG substation upgrade with minor line works, Medium RW HV/LV relocations', '5.01');
INSERT INTO `quantityinputitermgroup` VALUES (34, 'Type C - URD project , New OH or UG substation, Large RW HV/LV relocations ', '5.01');
INSERT INTO `quantityinputitermgroup` VALUES (35, 'Type D - Project with combined OH and UG activities, Industrial U/G Subdivisions with a substation, New Indoor Substation, Complex RW projects', '5.01');
INSERT INTO `quantityinputitermgroup` VALUES (36, 'Major - project requiring customised number of hours (single Hourly rate)', '5.01');
INSERT INTO `quantityinputitermgroup` VALUES (37, 'Other Design Services', '5.01');
INSERT INTO `quantityinputitermgroup` VALUES (38, 'Operating', '5.03');
INSERT INTO `quantityinputitermgroup` VALUES (39, 'Retirements', '6.01');
INSERT INTO `quantityinputitermgroup` VALUES (40, 'Additional Labour - Excludes plant', '7.01');
INSERT INTO `quantityinputitermgroup` VALUES (41, 'Additional Plant', '7.02');
INSERT INTO `quantityinputitermgroup` VALUES (42, 'Extra Overtime cost (for itemised activities)', '8.01');
INSERT INTO `quantityinputitermgroup` VALUES (43, 'Plant & Equipment', '9.01');
INSERT INTO `quantityinputitermgroup` VALUES (44, 'Subcontracts', '10.01');

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
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (2,'Wooden Pole - LV',54,'$/Pole',9390.405133,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (3,'Concrete Pole - HV',70,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (4,'Concrete Pole - LV',70,'$/Pole',9390.405133,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (5,'Steel Pole - LV',40,'$/Pole',9390.405133,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (6,'Steel Cross Arms (incl. Insulators) - HV',70,'$/Cross Arm',3509.397807,0,0);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (7,'Wood Cross Arms (incl. Insulators) - HV',45,'$/Cross Arm',3509.397807,0,0);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (8,'Wood Cross Arms (incl. Insulators) - LV',45,'$/Cross Arm',2799.119837,0,0);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (9,'Bare Conductors (Al)',60,'$/Pole',14417.69623,14.81813663,11.05945032);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (10,'Insulated Conductors - LV',60,'$/metre',131.3722217,0.154763897,0.259578461);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (11,'Underground Cables and Cablehead - HV, XLPE',40,'$/metre',711.55,0.016655326,0);
INSERT INTO `avoidedcostassetreplacementiterm` VALUES (12,'Underground Cables and Cablehead - LV, XLPE',55,'$/metre',574.69,0.016655326,0);




INSERT INTO `cicprojecttask` VALUES (1, 'Project Management & Design');
INSERT INTO `cicprojecttask` VALUES (2, 'Overhead Estimate');
INSERT INTO `cicprojecttask` VALUES (3, 'Underground Estimate');
INSERT INTO `cicprojecttask` VALUES (4, 'Substations Estimate');
INSERT INTO `cicprojecttask` VALUES (5, 'Public Lighting Estimate');
INSERT INTO `cicprojecttask` VALUES (6, 'Additional Overtime');
INSERT INTO `cicprojecttask` VALUES (7, 'Additional Labour');
INSERT INTO `cicprojecttask` VALUES (8, 'Additional Plant');
INSERT INTO `cicprojecttask` VALUES (9, 'Additional Subcontracts');
INSERT INTO `cicprojecttask` VALUES (10, 'Retirements');
INSERT INTO `cicprojecttask` VALUES (11, 'Recoverable Works');
INSERT INTO `cicprojecttask` VALUES (12, 'Road Consent');
INSERT INTO `cicprojecttask` VALUES (13, 'CUSTOMER SUB TOTAL');
INSERT INTO `cicprojecttask` VALUES (14, 'JEMENA Funded Additional Works');
INSERT INTO `cicprojecttask` VALUES (15, 'Total Zinfra Direct Costs (Zinfra Budget');
INSERT INTO `cicprojecttask` VALUES (16, 'Zinfra Margin');
INSERT INTO `cicprojecttask` VALUES (17, 'Total Zinfra Template Fixed Price');

INSERT INTO `fiminputiterm` VALUES (1, 1, 'TRANSFORMER,22KV, 500KVA,3PH,433-250V', 'AUD', 12673);
INSERT INTO `fiminputiterm` VALUES (2, 1, 'TRANSFORMER,22KV/433-250V 315 KVA 3PH BT', 'AUD', 8857);
INSERT INTO `fiminputiterm` VALUES (3, 1, 'TRANSFORMER,22KV/433-250V 100KVA 3PH BT', 'AUD', 5191);
INSERT INTO `fiminputiterm` VALUES (4, 1, 'TRANSFORMER,22KV,  63KVA,3PH,433-250V', 'AUD', 3856);
INSERT INTO `fiminputiterm` VALUES (5, 1, 'TRANSFORMER 22KV/433-250V 25KVA 3PH BT', 'AUD', 2849);
INSERT INTO `fiminputiterm` VALUES (6, 1, 'TRANSFORMER,22KV/500-250V 50KVA 1PH BT', 'AUD', 2612);
INSERT INTO `fiminputiterm` VALUES (7, 1, 'TRANSFORMER,22KV/500-250V 25KVA 1PH BT', 'AUD', 1833);
INSERT INTO `fiminputiterm` VALUES (8, 1, 'TRANSFORMER,22KV,  16KVA,1PH,500-250V', 'AUD', 1447);
INSERT INTO `fiminputiterm` VALUES (9, 1, 'TRANSFORMER,22KV/433-250V 500KVA 3PH CE', 'AUD', 12747);
INSERT INTO `fiminputiterm` VALUES (10, 1, 'TRANSFORMER,22KV/433-250V 1000KVA 3PH CE', 'AUD', 23633);
INSERT INTO `fiminputiterm` VALUES (11, 1, 'TRANSFORMER,22KV/433-250V 1500KVA 3PH CE', 'AUD', 28705);
INSERT INTO `fiminputiterm` VALUES (12, 1, 'TRANSFORMER,22KV/433-250V 2000KVA 3PH CE', 'AUD', 34565);
INSERT INTO `fiminputiterm` VALUES (13, 2, 'TRANSFORMER,11KV/433-250V 500KVA 3PH BT', 'AUD', 12349);
INSERT INTO `fiminputiterm` VALUES (14, 2, 'TRANSFORMER,11KV/433-250V 315 KVA 3PH BT', 'AUD', 8395);
INSERT INTO `fiminputiterm` VALUES (15, 2, 'TRANSFORMER,11KV,500KVA,3P,433-250V,CE', 'AUD', 16440);
INSERT INTO `fiminputiterm` VALUES (16, 2, 'TRANSFORMER,11KV,1000KVA,3P,433-250V,CE', 'AUD', 23601);
INSERT INTO `fiminputiterm` VALUES (17, 2, 'TRANSFORMER,11KV,1500KVA,3P,433-250V,CE', 'AUD', 29205);
INSERT INTO `fiminputiterm` VALUES (18, 2, 'TRANSFORMER,11KV,2000KVA,3P,433-250V,CE', 'AUD', 35575);
INSERT INTO `fiminputiterm` VALUES (19, 3, 'TRANSFORMER,11-6.6KV, 500KVA,3P,433-250V', 'AUD', 15423);
INSERT INTO `fiminputiterm` VALUES (20, 3, 'TRANSFORMER,11-6.6KV, 315KVA,3P,433-250V', 'AUD', 11176);
INSERT INTO `fiminputiterm` VALUES (21, 3, 'TRANSFORMER,11-6.6KV, 500KVA,3P,433V,CE', 'AUD', 19392);
INSERT INTO `fiminputiterm` VALUES (22, 4, 'TRANSFORMER,DR,6.6-11KV/415 240V 1000KVA', 'AUD', 27278);
INSERT INTO `fiminputiterm` VALUES (23, 4, 'TRANSFORMER,SWER 12.7KV/480-240V 25KVA', 'AUD', 1619);
INSERT INTO `fiminputiterm` VALUES (24, 4, 'TRANSFORMER, SWER 1SO 100kVA', 'AUD', 5203);
INSERT INTO `fiminputiterm` VALUES (25, 5, 'PAD,11KV/433V, 315KVA,RING,4FS', 'AUD', 31245);
INSERT INTO `fiminputiterm` VALUES (26, 5, 'PAD,11KV/433V, 500KVA,RING,4FS', 'AUD', 33733);
INSERT INTO `fiminputiterm` VALUES (27, 5, 'PAD,11-6.6KV/433V, 500KVA, RING, 4FS', 'AUD', 35175);
INSERT INTO `fiminputiterm` VALUES (28, 5, 'PAD,11KV/433V,1000KVA,RING,1FS', 'AUD', 43985);
INSERT INTO `fiminputiterm` VALUES (29, 5, 'PAD,11KV/433V,1000KVA,RING,1600A LBS,3FS', 'AUD', 45420);
INSERT INTO `fiminputiterm` VALUES (30, 5, 'PAD,11KV/433V,1500KVA,RING,1FS', 'AUD', 51577);
INSERT INTO `fiminputiterm` VALUES (31, 5, 'PAD,11KV/433V,1500KVA,RING,2x1600A LBS,2', 'AUD', 54066);
INSERT INTO `fiminputiterm` VALUES (32, 5, 'PAD,11KV/433V,1500KVA,RING,2500A LBS,3FS', 'AUD', 56028);
INSERT INTO `fiminputiterm` VALUES (33, 5, 'PAD,11KV/433V,2000KVA,RAD,1FS', 'AUD', 61326);
INSERT INTO `fiminputiterm` VALUES (34, 5, 'PAD,11KV/433V, 315KVA,IFT,4FS', 'AUD', 34625);
INSERT INTO `fiminputiterm` VALUES (35, 5, 'PAD,11KV/433V, 500KVA,IFT,4FS', 'AUD', 37607);
INSERT INTO `fiminputiterm` VALUES (36, 5, 'PAD,11KV/433V,1000KVA,IFT,1FS', 'AUD', 45533);
INSERT INTO `fiminputiterm` VALUES (37, 5, 'PAD,11KV/433V,1000KVA,IFT,1600A LBS,3FS', 'AUD', 47229);
INSERT INTO `fiminputiterm` VALUES (38, 5, 'PAD,11KV/433V,1500KVA,IFT,1FS', 'AUD', 55679);
INSERT INTO `fiminputiterm` VALUES (39, 5, 'PAD,11KV/433V,1500KVA,IFT,2x1600A LBS,2F', 'AUD', 57552);
INSERT INTO `fiminputiterm` VALUES (40, 5, 'PAD,11KV/433V,1500KVA,IFT,2500A LBS,3FS', 'AUD', 58260);
INSERT INTO `fiminputiterm` VALUES (41, 5, 'PAD,11KV/433V,2000KVA,IFT,1FS', 'AUD', 66338);
INSERT INTO `fiminputiterm` VALUES (42, 5, 'PAD,11KV/433V, 100KVA, 3 PH, RADIAL', 'AUD', 18460);
INSERT INTO `fiminputiterm` VALUES (43, 6, 'KIOSK/SUB,22KV/433-250V 500KVA RMU', 'AUD', 40867);
INSERT INTO `fiminputiterm` VALUES (44, 6, 'KIOSK,22KV/433V, 500KVA,IFT,4FS', 'AUD', 44993);
INSERT INTO `fiminputiterm` VALUES (45, 6, 'KIOSK,22KV/433V, 1000KVA,RING,6FS', 'AUD', 72228);
INSERT INTO `fiminputiterm` VALUES (46, 7, 'PAD,22KV/433V 100KVA LOOP THROU,1 CB', 'AUD', 17171);
INSERT INTO `fiminputiterm` VALUES (47, 7, 'PAD,22KV/433V, 315KVA, RING, 4FS', 'AUD', 28060);
INSERT INTO `fiminputiterm` VALUES (48, 7, 'PAD,22KV/433V, 500KVA, RING,4FS', 'AUD', 33526);
INSERT INTO `fiminputiterm` VALUES (49, 7, 'PAD,22KV/433V,1000KVA,RING,1FS', 'AUD', 44527);
INSERT INTO `fiminputiterm` VALUES (50, 7, 'PAD,22KV/433V,1000KVA,RING,1600A LBS,3FS', 'AUD', 45547);
INSERT INTO `fiminputiterm` VALUES (51, 7, 'PAD,22KV/433V, 1500KVA, RING, 1FS', 'AUD', 56270);
INSERT INTO `fiminputiterm` VALUES (52, 7, 'PAD,22KV/433V,1500KVA,RING,2x1600A LBS,2', 'AUD', 53541);
INSERT INTO `fiminputiterm` VALUES (53, 7, 'PAD,22KV/433V,1500KVA,RING,2500A LBS,3FS', 'AUD', 56101);
INSERT INTO `fiminputiterm` VALUES (54, 7, 'PAD,22KV/433V, 2000KVA,RING,1FS', 'AUD', 61003);
INSERT INTO `fiminputiterm` VALUES (55, 7, 'PAD,22KV/433V, 315KVA,IFT,4FS', 'AUD', 33162);
INSERT INTO `fiminputiterm` VALUES (56, 7, 'PAD,22KV/433V, 500KVA,IFT,4FS', 'AUD', 37186);
INSERT INTO `fiminputiterm` VALUES (57, 7, 'PAD,22KV/433V,1000KVA,IFT,1FS', 'AUD', 47605);
INSERT INTO `fiminputiterm` VALUES (58, 7, 'PAD,22KV/433V,1000KVA,IFT,1600A LBS,2FS', 'AUD', 48768);
INSERT INTO `fiminputiterm` VALUES (59, 7, 'PAD,22KV/433V,1500KVA,ITF,1FS', 'AUD', 55518);
INSERT INTO `fiminputiterm` VALUES (60, 7, 'PAD,22KV/433V,1500KVA,IFT,2x1600A LBS,2F', 'AUD', 57518);
INSERT INTO `fiminputiterm` VALUES (61, 7, 'PAD,22KV/433V,1500KVA,IFT,2500A LBS,3FS', 'AUD', 58007);
INSERT INTO `fiminputiterm` VALUES (62, 7, 'PAD,22KV/433V,2000KVA,IFT,1FS', 'AUD', 68222);
