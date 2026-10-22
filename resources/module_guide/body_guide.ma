//Maya ASCII 2023 scene
//Name: body_guide.ma
//Last modified: Fri, Oct 23, 2026 12:06:04 AM
//Codeset: 936
requires maya "2023";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2023";
fileInfo "version" "2023";
fileInfo "cutIdentifier" "202211021031-847a9f9623";
fileInfo "osv" "Windows 11 Pro v2009 (Build: 26200)";
fileInfo "UUID" "2F3B98EB-43E0-FEDC-A5B5-69B2EE3F92B6";
createNode transform -n "grp_md_body_guide_001";
	rename -uid "D48DF4C1-4987-F0DD-6001-DDAFF803D688";
createNode joint -n "jnt_md_root_guide_001" -p "grp_md_body_guide_001";
	rename -uid "3C67513A-4C9F-80FC-7F25-8998149D587E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.5505488262748902e-17 89.520696060436919 -4.7392802238464409 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0.10459177908219575 -0.10060738962014636 -46.112429265125151 ;
	setAttr ".pa" -type "double3" -2.5444437451708134e-14 9.541664044390544e-15 -2.2263882770244621e-14 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 6.4560376483287606e-27 97.722709655761719 -4.7392802238464355 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pelvisIkLocal001";
	setAttr ".radi" 3;
createNode joint -n "jnt_lf_upperLeg_guide_001" -p "jnt_md_root_guide_001";
	rename -uid "BCE882EF-4EE0-A3DE-CCD6-2D9E431BF3E6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "angle" -ln "angle" -min 0 -max 180 -at "double";
	addAttr -ci true -k true -sn "direction" -ln "direction" -min 0 -max 360 -at "double";
	setAttr ".t" -type "double3" 5.347078632157678 5.6860185033622752 1.3192471773196703e-12 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -90.145352434304158 2.4837255212599354 -43.893961513143779 ;
	setAttr ".pa" -type "double3" 0.00042207211725204554 0 0 ;
	setAttr ".bps" -type "matrix" 2.2204460492503131e-16 -0.99909356459532384 -0.042568171022599632 0
		 -2.2204460492503131e-16 -0.042568171022599577 0.99909356459532384 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158203 89.608867645263672 -4.719511492177844 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "upperLeg001";
	setAttr ".radi" 2.65;
	setAttr -k on ".angle" 0.044019770400893318;
	setAttr -k on ".direction" 179.994873046875;
createNode joint -n "jnt_lf_knee_guide_001" -p "jnt_lf_upperLeg_guide_001";
	rename -uid "0E23E67B-48AD-2CE7-16E6-2E88CE4A979C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "MeshPosInfo" -ln "MeshPosInfo" -dt "string";
	setAttr ".t" -type "double3" 38.642177581787152 -9.7048061424828461e-16 1.2553502720277978e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0.00014223465629013184 -8.5467331796133239e-06 0.95497583132103159 ;
	setAttr ".pa" -type "double3" 0 2.369770209361979e-23 0.00017267555634194661 ;
	setAttr ".bps" -type "matrix" 2.2604080255862565e-16 -0.99815563484504466 -0.060706907573074315 0
		 -2.1797515622492138e-16 -0.060706907573074259 0.99815563484504466 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158292 51.001716701350475 -6.3644383161650273 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "knee001";
	setAttr ".radi" 2.65;
	setAttr -l on -k on ".MeshPosInfo" -type "string" "[u'mesh_m_high_body_001.vtx[7591]', u'mesh_m_high_body_001.vtx[8241]']";
createNode joint -n "jnt_lf_ankle_guide_001" -p "jnt_lf_knee_guide_001";
	rename -uid "3D93CB17-4F28-9A03-B844-999D3C8F7992";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "MeshPosInfo" -ln "MeshPosInfo" -dt "string";
	setAttr ".t" -type "double3" 40.815017700195341 2.6336443209657789e-13 -1.0066907611974627e-15 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -179.99982241746648 0.00033435019323553643 -65.465111632691517 ;
	setAttr ".bps" -type "matrix" -1.046394356673993e-16 -0.46908557853089733 0.88315271613370094 0
		 -2.9607127799878646e-16 0.88315271613370094 0.46908557853089738 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158407 10.26197679760029 -8.8421918232842138 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ankle001";
	setAttr ".radi" 2;
	setAttr -l on -k on ".MeshPosInfo" -type "string" "[u'mesh_m_high_body_001.vtx[7370]', u'mesh_m_high_body_001.vtx[7374]']";
createNode joint -n "jnt_lf_ball_guide_001" -p "jnt_lf_ankle_guide_001";
	rename -uid "19DF9955-4F43-0C28-0B89-9EA0720AA072";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.061090568001859 -1.0377299020092323e-10 1.9538681783615175e-10 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 6.3047201943606206 ;
	setAttr ".bps" -type "matrix" -1.3652595559142256e-16 -0.36924442657630246 0.92933231593566024 0
		 -2.8278662734025352e-16 0.92933231593566024 0.36924442657630252 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158372 5.5424643078574043 0.043287639113749776 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ball001";
	setAttr ".radi" 2;
createNode joint -n "jnt_lf_toe_guide_001" -p "jnt_lf_ball_guide_001";
	rename -uid "369A1FFB-437F-35F2-0EBC-5A845E2A156E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" 10.061090568001813 -9.0436103050706151e-11 -5.5959894496027118e-09 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" -1.3652595559142256e-16 -0.36924442657630246 0.92933231593566024 0
		 -2.8278662734025352e-16 0.92933231593566024 0.36924442657630252 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158336 1.827462690343332 9.3933842375133008 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "toe001";
	setAttr ".radi" 2;
createNode joint -n "jnt_md_spine_guide_001" -p "jnt_md_root_guide_001";
	rename -uid "101BCACC-4900-EE9E-3EFB-B8B78C5EFEB1";
	setAttr ".t" -type "double3" -7.1393695916255728 6.8735664927761935 1.7521513744862085 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -89.854742515053474 -2.4469571666007086 136.10613573140833 ;
createNode joint -n "jnt_md_spine_guide_002" -p "jnt_md_spine_guide_001";
	rename -uid "D74A3629-4D18-B304-4FA4-CA9DAA3F8762";
	setAttr ".t" -type "double3" 7.5939042533003018 0.096128340293784115 -2.1199828476560453e-14 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 179.9999991462264 0 5.076203622587796 ;
createNode joint -n "jnt_md_spine_guide_003" -p "jnt_md_spine_guide_002";
	rename -uid "693CEA55-469D-438B-A0DD-87BE15D29657";
	setAttr ".t" -type "double3" 7.371001863286291 0.034428018239661295 5.1313888210597529e-10 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 -8.9510359245449607 ;
createNode joint -n "jnt_md_spine_guide_004" -p "jnt_md_spine_guide_003";
	rename -uid "A49820F9-4D16-3E02-F58F-5080F6FFA21F";
	setAttr ".t" -type "double3" 7.2480399207961383 0.31207746794756258 1.06278256081412e-09 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 -6.8711318900975797 ;
createNode joint -n "jnt_md_spine_guide_005" -p "jnt_md_spine_guide_004";
	rename -uid "2E50F9CC-4579-E16F-3EF2-EC9D5E9FCC41";
	setAttr ".t" -type "double3" 8.3729195281644433 7.960094793755016e-16 1.4772078224317302e-13 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -151.76066612382994 -13.760067193355946 42.338536453712294 ;
createNode joint -n "jnt_lf_clavicle_guide_001" -p "jnt_md_spine_guide_005";
	rename -uid "26635DAA-419D-0F6C-6015-E3AACD1F9493";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.451632244396425 2.4947831929009586e-14 -3.2160557698030045e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 45.753668611538714 71.873032214644937 -15.426024998476656 ;
	setAttr ".pa" -type "double3" 1.5902773407317574e-14 -2.544443745170814e-14 3.8166656177562195e-14 ;
	setAttr ".bps" -type "matrix" 0.92261090157656322 0.22832081535868298 -0.3109504800865856 0
		 -0.21635938360745113 0.97358679420174721 0.072920307740496626 0 0.31938147951492574 -1.6663463119331173e-08 0.94762622934512386 0
		 2.485989280347185 138.77479306060459 -2.7511839165280403 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "clavicle001";
	setAttr ".radi" 1.4200000000000002;
createNode joint -n "jnt_lf_clavicle_guide_002" -p "jnt_lf_clavicle_guide_001";
	rename -uid "AB41C7E9-434C-212C-1958-AB800625BA5C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.889342927023989 2.419467605103191e-14 6.9946318861440253e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 171.53560843727297 3.5248409739074154 99.249315403930595 ;
	setAttr ".bps" -type "matrix" 0.88146309366010767 -0.05149627414788422 -0.46943684161347787 0
		 0.030338377170725024 0.99815842183999004 -0.052529494386938158 0 0.47127741022225755 0.032060858672008231 0.8814021238659544 0
		 12.532456418338548 141.26101727982933 -6.1371766187541841 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "clavicle002";
	setAttr ".radi" 1.4200000000000002;
createNode joint -n "jnt_lf_scapula_guide_001" -p "jnt_lf_clavicle_guide_002";
	rename -uid "4714FE13-4DBA-7379-635E-B997A3E1738A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.0025830309577937e-06 1.2350709436711019e-14 -1.0823350130569915e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 2.4308102526603581 -40.018268055705505 -71.068766037050523 ;
	setAttr ".pa" -type "double3" -1.8418712438916771e-14 -37.577104848464863 5.4140067272101386e-14 ;
	setAttr ".bps" -type "matrix" 0.71724149928596737 -0.66385859731888774 -0.21179328239539691 0
		 0.63668084864372698 0.74785811673458447 -0.1880046121894467 0 0.28319980344682505 -1.6853106146741403e-08 0.9590609320203175 0
		 12.532455655779996 141.26101912717718 -6.1371764916727951 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "scapula001";
	setAttr ".radi" 2.36;
createNode joint -n "jnt_lf_scapula_guide_002" -p "jnt_lf_scapula_guide_001";
	rename -uid "0F2003EB-4219-4285-A693-8084FB0E151A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 11.813794085361032 -1.9264044719902048e-15 5.2207274279029446e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" -0.77419630564219999 -0.219895055129468 -0.59352021453323545 0
		 -0.17451341093847944 0.9755235336626219 -0.13378678811081934 0 0.6084119901288817 7.0251917060003726e-16 -0.79362135194777461 0
		 2.1687257840853853 138.59831613823306 -13.412444985328223 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "scapula002";
	setAttr ".radi" 1.4200000000000002;
	setAttr ".liw" yes;
createNode joint -n "jnt_lf_upperArm_guide_001" -p "jnt_lf_scapula_guide_001";
	rename -uid "6A1B41F3-4B50-A2AD-669E-389B4A5DDADD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -1.3031669319233079 -5.2568261096759894 3.554099997820622 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 150.12344956457818 -18.211850347276712 -115.65552034029493 ;
	setAttr ".bps" -type "matrix" 0.54983281735906786 -0.83442054590103742 -0.03776540127159822 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 0.020779472281474809 -0.031534727918730382 0.99928663278700758 0
		 15.690888045747149 136.07662538343271 -8.3978190574883431 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "upperArm001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_lf_elbow_guide_001" -p "jnt_lf_upperArm_guide_001";
	rename -uid "9431D137-4A72-2780-BB58-E2AD04175743";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 21.418305597652861 3.2574135994334767 -2.6133960883329808 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 10.714576730178928 -7.0683485978588347 -0.40709421592918282 ;
	setAttr ".bps" -type "matrix" 0.54820073896376753 -0.83194372293254826 0.085706427254382517 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 -0.047157855261725834 0.071566251542364262 0.99632043456274133 0
		 28.281616792473059 116.96906682663963 -9.2626163347876815 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "elbow001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_lf_wrist_guide_001" -p "jnt_lf_elbow_guide_001";
	rename -uid "C1590D99-41DF-E7E8-DFEA-8C86D1A2AA00";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 21.180998921756057 -5.3207315418904283e-15 4.3330745303717081e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 70.491994596947322 -43.678619612404169 -19.95267833155081 ;
	setAttr ".bps" -type "matrix" 0.54820073896376753 -0.83194372293254826 0.085706427254382517 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 -0.047157855261725834 0.071566251542364262 0.99632043456274133 0
		 39.892954040853361 99.347822541375365 -7.4472845402966241 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "wrist001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_lf_thumb_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "3C95965D-492D-94F4-4F86-A8A8F628D01D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.8704133667026772 1.1802166488439343e-14 -3.2372434968754812e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -5.6261379557961604 5.093768661346818 -3.3442022549290185 ;
	setAttr ".pa" -type "double3" -1.6670453361112244e-14 1.8248375381076981e-14 -33.343907426187243 ;
	setAttr ".bps" -type "matrix" 0.14761029265934891 -0.7398892421337524 0.6563346028328565 0
		 0.16234666875755158 0.67272870414063801 0.72185846934740905 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 40.263689656157915 95.223834381573383 -3.2859108785801254 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_thumb_guide_002" -p "jnt_lf_thumb_guide_001";
	rename -uid "A58A07D2-4858-D3C2-57DB-49B568577452";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.0813853793719392 2.1404709078908874e-15 -9.8824254097496305e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -2.3696978997167337e-23 -1.6339162146267945e-06 -8.2690910123411747 ;
	setAttr ".pa" -type "double3" 0 0 -33.343907426187258 ;
	setAttr ".bps" -type "matrix" 0.12272658114714788 -0.82895043876213426 0.54569163119476027 0
		 0.18188849781001915 0.55932206292624076 0.80874928394920365 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 40.866144164281692 92.204061186335252 -0.60715640015697048 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_thumb_guide_003" -p "jnt_lf_thumb_guide_002";
	rename -uid "59CFAF91-4207-3CD9-67DE-87857FF12FB3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.764413153357836 4.8045811085139528e-15 -8.0969160896213023e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 -2.4036277419051863e-06 -12.347860487122603 ;
	setAttr ".bps" -type "matrix" 0.080991369003737435 -0.92938361031742311 0.36012012304264956 0
		 0.20392556853556457 0.36911530024282724 0.90673494342288063 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 41.328137740294729 89.083549151462449 1.4470523974550469 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_thumb_guide_004" -p "jnt_lf_thumb_guide_003";
	rename -uid "684DFC99-415D-DB5C-481D-6CB3A71DF94D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.980128942141802 -1.8358941647829386e-15 -6.9561532448807142e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 9.7214258780433281e-06 0 0 ;
	setAttr ".bps" -type "matrix" 0.080991369003737435 -0.92938361031742311 0.36012012304264956 0
		 0.20392556853556457 0.36911530024282724 0.90673494342288063 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 41.569502479119677 86.313866005228292 2.5202568416499509 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_index_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "54D91283-40BD-D7A0-E030-45AFFFCC4B5A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.547260234794825 -0.66069396927426449 -2.0495483468655569 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -60.046019016219418 30.82160653415853 -28.921655262826537 ;
	setAttr ".pa" -type "double3" 2.8627321640994996e-14 1.3330996770352938e-14 2.5879278912064479e-14 ;
	setAttr ".bps" -type "matrix" 0.53192540292164925 -0.82361451451803314 0.19675999898827443 0
		 0.77246137832848338 0.56715000791256709 0.28573464528410736 0 -0.34692763613972843 -1.630302981503462e-08 0.9378918995718537 0
		 42.180404258674578 95.683152224695434 -4.8680396416876297 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_index_guide_002" -p "jnt_lf_index_guide_001";
	rename -uid "467F985F-4BE5-8C0C-8205-63AABA33BEAD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 6.3330235352054052 -2.2411530551890726e-15 7.920072438501332e-15 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -0.47412540312626977 0.18178894700437428 -13.574390369495777 ;
	setAttr ".pa" -type "double3" 3.0811623476677861e-15 2.1757603069972596e-14 1.9083328088781104e-14 ;
	setAttr ".bps" -type "matrix" 0.33686306402437582 -0.93371741814131692 0.12122317911861004 0
		 0.93902726608675879 0.34258833004306921 0.029343306969870531 0 -0.068928003320391729 0.10394719417961561 0.99219146901213073 0
		 45.549100469979678 90.467181941506482 -3.621953930545927 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_index_guide_003" -p "jnt_lf_index_guide_002";
	rename -uid "AD6BB1F8-4467-12C0-5BFC-97939D2EDE71";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 9.2623778507485568 0.42037656980622273 2.235866559091896 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 26.009272124028545 -3.9107650763951733 -13.020896093125669 ;
	setAttr ".pa" -type "double3" 1.6548823576989858e-14 1.7607973134000652e-14 2.1759156075188151e-14 ;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244867 0.11367137359260854 0.056997699975427002 0 -0.068928003320391715 0.10394719417961559 0.99219146901213062 0
		 47.150726497838384 86.027793125929264 -3.0455945407056766 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_index_guide_004" -p "jnt_lf_index_guide_003";
	rename -uid "6AF79C97-4D7E-F59E-6CB4-91ACD1D7FC6E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.4090208981805143 -2.790409399032612e-15 6.0356071961177196e-15 ;
	setAttr ".r" -type "double3" 2.6786790555003344e-09 -4.1760364913203852e-10 4.5176121611329379e-10 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244889 0.11367137359260857 0.056997699975427016 0 -0.068928003320391715 0.10394719417961559 0.99219146901213062 0
		 47.408152121808804 83.647522053126153 -2.7783413642794272 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_index_guide_005" -p "jnt_lf_index_guide_004";
	rename -uid "FFDCA5F1-492A-0FAD-0753-378CF4E506B1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.7578831976663589 2.1735310920312384e-11 2.0094148567295633e-11 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244889 0.11367137359260857 0.056997699975427016 0 -0.068928003320391729 0.10394719417961562 0.99219146901213084 0
		 47.702856830902377 80.922552086066005 -2.4723859259270502 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_middle_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "29522FFD-443C-08C8-A2D0-999CD2B98541";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.4135186249496563 -1.8187627133562347 -2.8426402471638239 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -81.588420877938191 29.324954047307351 -41.229471247598397 ;
	setAttr ".pa" -type "double3" 9.1937908761054794e-16 4.0253895187272619e-15 1.2324649390671124e-14 ;
	setAttr ".bps" -type "matrix" 0.49341868461377569 -0.86957848008674743 0.019268332673944649 0
		 0.86891620194824082 0.49379476199127753 0.033931799566499707 0 -0.039020964440343892 -1.7463761298186498e-08 0.9992383921438095 0
		 42.826575347151334 95.655435821203795 -6.5524335414225989 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_middle_guide_002" -p "jnt_lf_middle_guide_001";
	rename -uid "F7749CC5-4E56-560C-3696-0AA0F49A128C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.9056921935997826 -2.9561945876967399e-15 8.1475981073184335e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -2.085656401569123 0.80707503442884476 -8.4447882544834414 ;
	setAttr ".pa" -type "double3" 3.8825130388958993e-16 2.0888890777519638e-15 2.7430876716646233e-14 ;
	setAttr ".bps" -type "matrix" 0.36097701873268212 -0.93257471118772306 -1.6279197771057463e-08 0
		 0.93257471118772262 0.36097701873268229 6.3900213592704702e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 45.740554366963906 90.519972722568511 -6.438640726695974 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_middle_guide_003" -p "jnt_lf_middle_guide_002";
	rename -uid "4ABC34E4-4B8C-B1C1-39F0-5593D9A2D4FC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.182952793058428 4.2304351430227614e-15 1.0224176351374669e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 -2.721327751411794e-06 -15.10891966452866 ;
	setAttr ".pa" -type "double3" 0 0 2.8624992133171654e-14 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 47.611481337340869 85.686481700937208 -6.4386408392617538 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_middle_guide_004" -p "jnt_lf_middle_guide_003";
	rename -uid "5DCC847E-41AB-B5E6-2652-398FFF60D4B0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.5014280120760728 -9.827101826185271e-15 -1.737291070528626e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 47.980597430385174 82.204563610885955 -6.4386409174161452 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_middle_guide_005" -p "jnt_lf_middle_guide_004";
	rename -uid "48D7A46C-4FBB-CCD1-B0BF-BA8779E99E8B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.9261303558643292 2.6286506837399598e-13 -1.2434378393381456e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 2.603962413439806e-05 0 0 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 48.289066375332759 79.294737624233477 -6.4386409827295008 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_ring_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "C4521E80-4F07-4D57-7827-8F97BDE53E37";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.2801928996909382 -2.778125392544792 -2.7461154100733922 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -107.68374432959013 28.401690182857525 -53.995004644815822 ;
	setAttr ".pa" -type "double3" -1.4908850069360234e-14 9.7404487119820235e-15 1.6300342742500524e-14 ;
	setAttr ".bps" -type "matrix" 0.46207019331395649 -0.86969079495619883 -0.17357723819458054 0
		 0.81414243449961543 0.49359692175747538 -0.30583357431548197 0 0.35165783483073615 -1.6471602332090995e-08 0.93612860612319659 0
		 42.599052599699732 95.768842246514154 -8.0185486266059982 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_ring_guide_002" -p "jnt_lf_ring_guide_001";
	rename -uid "0F099757-4CDE-5192-BAB0-2396B848062C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.8644210548804168 -9.9788248581444846e-15 1.8149693021728141e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -13.951335239755151 4.1572455445816408 -13.309328635349496 ;
	setAttr ".pa" -type "double3" 0 2.1024584608229046e-14 -4.386851482648477e-15 ;
	setAttr ".bps" -type "matrix" 0.23605433578495491 -0.95743636270990917 -0.16611430377286479 0
		 0.9459191306728808 0.26554477093100343 -0.18634101228194894 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 45.308826939532331 90.668608917388823 -9.0364787337378907 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_ring_guide_003" -p "jnt_lf_ring_guide_002";
	rename -uid "2F40317F-4FE9-8D44-63EA-428CF2DA652E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.5648045495068148 1.2144065691416148e-14 7.1900944504859218e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -58.807388386529865 5.6301127286322314 -13.3775625734323 ;
	setAttr ".pa" -type "double3" 0 0 2.8624992133171654e-14 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.386368938021796 86.298098671674708 -9.7947581537430075 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_ring_guide_004" -p "jnt_lf_ring_guide_003";
	rename -uid "66C4051E-4497-77A9-6144-7286F15B342C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.7139968321794892 5.4376229365176836e-15 -4.4767162518065954e-15 ;
	setAttr ".r" -type "double3" 2.4429840508321296e-11 -2.8497769945911689e-12 -6.6791648310794614e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".pa" -type "double3" 0 0 1.4411888400381561e-15 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.364105083604663 83.601945924514453 -10.104669440862629 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_ring_guide_005" -p "jnt_lf_ring_guide_004";
	rename -uid "21C0784A-4425-B7E1-411E-A8B997C1D6FC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.8253327832633488 -1.7802777762855092e-14 1.13686837721616e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.340927901884804 80.795189241928057 -10.427294179779274 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_pinky_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "31EB19CF-49E9-3CF5-0AFF-7FA683A8A932";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.3360422572314667 -3.8284153513171204 -2.1626864027715738 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -129.41153223557311 24.802994410635051 -64.391977907321703 ;
	setAttr ".pa" -type "double3" -1.4113711398994355e-14 3.9756933518293991e-15 2.5444437451708134e-14 ;
	setAttr ".bps" -type "matrix" 0.39159246846473761 -0.85819538706956655 -0.33189759904857802 0
		 0.6546808676339434 0.51332317073410705 -0.55488042310172525 0 0.64656654738376296 -1.3525583035522981e-08 0.76285758815406712 0
		 41.892825242764452 95.684641228577135 -9.3709805441886349 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_pinky_guide_002" -p "jnt_lf_pinky_guide_001";
	rename -uid "6D069B52-48C9-D0A0-A0CB-959320B3F23E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.3187799595668173 -1.0256250052127531e-14 6.1615054967188114e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -2.5561934311442376 0.69406634818416446 -15.704504165393036 ;
	setAttr ".pa" -type "double3" 2.2263882770244611e-14 -4.770832022195272e-15 -1.5604596405930376e-14 ;
	setAttr ".bps" -type "matrix" 0.19192124383852854 -0.96503286870437699 -0.17854354786346407 0
		 0.96282992731049721 0.22037829912298079 -0.15617918027356881 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 43.975619569596283 91.120088462734813 -11.136271004758916 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_pinky_guide_003" -p "jnt_lf_pinky_guide_002";
	rename -uid "76AAC691-4DDC-A419-21AB-24928A1D7A8C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.6531556962369791 -7.9243374846190024e-15 -3.7632511786878604e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -10.916544066386226 2.2795766576580934 -3.5436091599381228 ;
	setAttr ".pa" -type "double3" 0 0 -2.0673605429512861e-14 ;
	setAttr ".bps" -type "matrix" 0.12067361413015511 -0.97861443766478995 -0.16658829864907587 0
		 0.97432700445693887 0.14889195679473155 -0.16887295102473723 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.676737817701131 87.594672817743842 -11.788518462614915 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_pinky_guide_004" -p "jnt_lf_pinky_guide_003";
	rename -uid "0ABA7221-4600-E369-EF24-BE97FE9A41BE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.2220449461758971 -4.8363859844639568e-15 1.0434265571062605e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -60.665994933650367 7.3388923368818872 -7.7648432764780999 ;
	setAttr ".pa" -type "double3" 0 0 -1.9083328088781101e-14 ;
	setAttr ".bps" -type "matrix" -0.061789666546447547 -0.98926250914972291 -0.132445177710906 0
		 0.9798251220852342 -0.034852839122969104 -0.19679433359658383 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.944880037205451 85.420147341245936 -12.158685196851183 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_pinky_guide_005" -p "jnt_lf_pinky_guide_004";
	rename -uid "A3E2B5B4-4451-DEBD-15A8-D89B872B4A8D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.9444966201798328 2.4429220816064283e-15 -1.3352526832066122e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" -0.061789666546447547 -0.98926250914972291 -0.132445177710906 0
		 0.9798251220852342 -0.034852839122969104 -0.19679433359658383 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.824730225846523 83.49652953199157 -12.41622443326145 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_md_neck_guide_001" -p "jnt_md_spine_guide_005";
	rename -uid "06320759-4531-C4B8-3B6F-299BBCBC4271";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 15.519151262230723 8.7045205450175356 -0.36297985417873047 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -29.552494818864027 -10.44516888981053 9.6322734275928124 ;
	setAttr ".bps" -type "matrix" 0.002403734363234536 0.95087171677376403 0.30957556266285347 0
		 0.006759053579396308 0.30955385072775532 -0.95085785561502523 0 -0.99997426829681824 0.004378046858594619 -0.005682908035490348 0
		 0.0015410989396165363 147.27624511718503 -7.5608520508071067 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "neck001";
	setAttr ".radi" 1.1799999999999997;
createNode joint -n "jnt_md_head_guide_001" -p "jnt_md_neck_guide_001";
	rename -uid "0F7A249B-4E52-764A-D30C-FC9818DCACA3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 11.028817671533913 4.285556552086967e-15 2.5434043920492676e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0.02597925010536322 0.0010307300008735225 18.222029465942192 ;
	setAttr ".bps" -type "matrix" 0.9999999999999678 -8.0032429164938725e-09 -4.2524292581148926e-09 0
		 7.8826654464066234e-09 0.99999988777747473 2.8000953960297401e-08 0 4.282515178523523e-09 2.8001441453627554e-08 0.9999999930132828 0
		 -3.4142020127789964e-05 157.59659086693244 -3.7071972028650269 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "headLocal001";
	setAttr ".radi" 3.35;
createNode joint -n "jnt_md_head_guide_002" -p "jnt_md_head_guide_001";
	rename -uid "C20EDAD6-4486-833A-3797-CB802B946182";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 15.523703194114292 4.3647863651732579e-15 2.8680438872882658e-18 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1.708474944404428e-16 1.0000000000000002 -1.3877787807814457e-16 0
		 1.8011355269333396e-16 -4.0245584642661925e-16 -1.0000000000000002 0 -1 2.2204460492503131e-16 -2.2204460492503131e-16 0
		 4.1510363020447602e-15 184.62057677907538 1.5088123436061767 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "headLocal002";
	setAttr ".radi" 3.35;
createNode joint -n "jnt_rt_clavicle_guide_001" -p "jnt_md_spine_guide_005";
	rename -uid "B65C46B8-409D-74C5-D834-3CB1274F1931";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 45.753668611538743 71.873032214644965 -15.426024998476665 ;
	setAttr ".pa" -type "double3" 1.5902773407317574e-14 -2.544443745170814e-14 3.8166656177562195e-14 ;
	setAttr ".bps" -type "matrix" 0.92261090157656322 0.22832081535868298 -0.3109504800865856 0
		 -0.21635938360745113 0.97358679420174721 0.072920307740496626 0 0.31938147951492574 -1.6663463119331173e-08 0.94762622934512386 0
		 2.485989280347185 138.77479306060459 -2.7511839165280403 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "clavicle001";
	setAttr ".radi" 1.4200000000000002;
createNode joint -n "jnt_rt_clavicle_guide_002" -p "jnt_rt_clavicle_guide_001";
	rename -uid "1C55FD68-401F-19B9-0EA9-289A3EFEF0BF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 171.53560843727297 3.5248409739074442 99.249315403930666 ;
	setAttr ".bps" -type "matrix" 0.88146309366010767 -0.05149627414788422 -0.46943684161347787 0
		 0.030338377170725024 0.99815842183999004 -0.052529494386938158 0 0.47127741022225755 0.032060858672008231 0.8814021238659544 0
		 12.532456418338548 141.26101727982933 -6.1371766187541841 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "clavicle002";
	setAttr ".radi" 1.4200000000000002;
createNode joint -n "jnt_rt_scapula_guide_001" -p "jnt_rt_clavicle_guide_002";
	rename -uid "51604F27-4F4A-9FE8-D7B5-5F93753C6059";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 2.4308102526603705 -40.018268055705498 -71.068766037050509 ;
	setAttr ".pa" -type "double3" -1.8418712438916771e-14 -37.577104848464863 5.4140067272101386e-14 ;
	setAttr ".bps" -type "matrix" 0.71724149928596737 -0.66385859731888774 -0.21179328239539691 0
		 0.63668084864372698 0.74785811673458447 -0.1880046121894467 0 0.28319980344682505 -1.6853106146741403e-08 0.9590609320203175 0
		 12.532455655779996 141.26101912717718 -6.1371764916727951 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "scapula001";
	setAttr ".radi" 2.36;
createNode joint -n "jnt_rt_scapula_guide_002" -p "jnt_rt_scapula_guide_001";
	rename -uid "A301907F-40A6-B262-1FF3-11B8B0F893CE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 1.4787793334710984e-06 -8.9784563953995282e-23 8.2088742059322392e-23 ;
	setAttr ".bps" -type "matrix" -0.77419630564219999 -0.219895055129468 -0.59352021453323545 0
		 -0.17451341093847944 0.9755235336626219 -0.13378678811081934 0 0.6084119901288817 7.0251917060003726e-16 -0.79362135194777461 0
		 2.1687257840853853 138.59831613823306 -13.412444985328223 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "scapula002";
	setAttr ".radi" 1.4200000000000002;
	setAttr ".liw" yes;
createNode parentConstraint -n "jnt_rt_scapula_guide_002_parentConstraint1" -p "jnt_rt_scapula_guide_002";
	rename -uid "A287636B-476F-8A0D-6FBA-CC9B634F54BA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_scapula_guide_002W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -180.00000147877947 -180 179.99999999999991 ;
	setAttr ".rst" -type "double3" -11.813794085361021 -2.8421709430404007e-14 1.2434497875801753e-14 ;
	setAttr ".rsrr" -type "double3" -180.00000147877947 -180 179.99999999999991 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_upperArm_guide_001" -p "jnt_rt_scapula_guide_001";
	rename -uid "300668F1-4DA0-F926-4615-BC8C3049F71E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 150.12344956457818 -18.211850347276709 -115.65552034029493 ;
	setAttr ".bps" -type "matrix" 0.54983281735906786 -0.83442054590103742 -0.03776540127159822 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 0.020779472281474809 -0.031534727918730382 0.99928663278700758 0
		 15.690888045747149 136.07662538343271 -8.3978190574883431 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "upperArm001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_rt_elbow_guide_001" -p "jnt_rt_upperArm_guide_001";
	rename -uid "D8CD3E1D-42B5-C0F4-6B10-2D81C60EC1AC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 10.714576730178988 -7.0683485978588294 -0.40709421592917361 ;
	setAttr ".bps" -type "matrix" 0.54820073896376753 -0.83194372293254826 0.085706427254382517 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 -0.047157855261725834 0.071566251542364262 0.99632043456274133 0
		 28.281616792473059 116.96906682663963 -9.2626163347876815 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "elbow001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_rt_wrist_guide_001" -p "jnt_rt_elbow_guide_001";
	rename -uid "128745FE-4F0D-876D-53F4-56B9815BF454";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 70.491994596947265 -43.678619612404177 -19.952678331550768 ;
	setAttr ".bps" -type "matrix" 0.54820073896376753 -0.83194372293254826 0.085706427254382517 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 -0.047157855261725834 0.071566251542364262 0.99632043456274133 0
		 39.892954040853361 99.347822541375365 -7.4472845402966241 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "wrist001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_rt_thumb_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "E898F958-4D10-B643-742D-8EA6471A0E5A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -5.6261379557962838 5.0937686613467728 -3.3442022549289798 ;
	setAttr ".pa" -type "double3" -1.6670453361112244e-14 1.8248375381076981e-14 -33.343907426187243 ;
	setAttr ".bps" -type "matrix" 0.14761029265934891 -0.7398892421337524 0.6563346028328565 0
		 0.16234666875755158 0.67272870414063801 0.72185846934740905 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 40.263689656157915 95.223834381573383 -3.2859108785801254 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_thumb_guide_002" -p "jnt_rt_thumb_guide_001";
	rename -uid "A6D64CC4-4972-BC51-42CC-FAB45F3FA5D0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 1.1811081307885795e-07 -1.6339161603221049e-06 -8.2690910123411783 ;
	setAttr ".pa" -type "double3" 0 0 -33.343907426187258 ;
	setAttr ".bps" -type "matrix" 0.12272658114714788 -0.82895043876213426 0.54569163119476027 0
		 0.18188849781001915 0.55932206292624076 0.80874928394920365 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 40.866144164281692 92.204061186335252 -0.60715640015697048 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_thumb_guide_003" -p "jnt_rt_thumb_guide_002";
	rename -uid "4C1A12F6-4CFA-588F-5245-D19B07F213F5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 1.1137846664810862e-06 -2.403627715332214e-06 -12.347860487122626 ;
	setAttr ".bps" -type "matrix" 0.080991369003737435 -0.92938361031742311 0.36012012304264956 0
		 0.20392556853556457 0.36911530024282724 0.90673494342288063 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 41.328137740294729 89.083549151462449 1.4470523974550469 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_thumb_guide_004" -p "jnt_rt_thumb_guide_003";
	rename -uid "5AF3EF3E-4DBD-4888-DE4B-DC8EB05CD4CA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 9.7345173005335302e-06 1.6211227631473173e-21 2.7018726873048148e-22 ;
	setAttr ".bps" -type "matrix" 0.080991369003737435 -0.92938361031742311 0.36012012304264956 0
		 0.20392556853556457 0.36911530024282724 0.90673494342288063 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 41.569502479119677 86.313866005228292 2.5202568416499509 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbEnd001";
	setAttr ".radi" 0.5;
createNode parentConstraint -n "jnt_rt_thumb_guide_004_parentConstraint1" -p "jnt_rt_thumb_guide_004";
	rename -uid "74E4817D-483D-4528-6D7A-C58B424973E9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_thumb_guide_004W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.3091444754121219e-08 -1.082201966405587e-21 -1.272221872585402e-14 ;
	setAttr ".rst" -type "double3" -2.9801289421418176 7.1054273576010019e-15 -1.4210854715202004e-14 ;
	setAttr ".rsrr" -type "double3" -1.3091444754121219e-08 -1.082201966405587e-21 -1.272221872585402e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_003_parentConstraint1" -p "jnt_rt_thumb_guide_003";
	rename -uid "FFB65C8B-4CD6-EE93-377E-92A40343972B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_thumb_guide_003W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 1.4585759180467073e-06 4.487957977867723e-06 24.695720974245109 ;
	setAttr ".rst" -type "double3" -3.7644131533578218 2.1316282072803006e-14 7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" 1.4585759180467073e-06 4.487957977867723e-06 24.695720974245109 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_002_parentConstraint1" -p "jnt_rt_thumb_guide_002";
	rename -uid "F87634A1-4CFB-DD66-C733-47B41680CE42";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_thumb_guide_002W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 4.6510118624355423e-07 3.2002376217336439e-06 16.538182024682566 ;
	setAttr ".rst" -type "double3" -4.0813853793719232 0 0 ;
	setAttr ".rsrr" -type "double3" 4.6510118624355423e-07 3.2002376217336439e-06 16.538182024682566 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_001_parentConstraint1" -p "jnt_rt_thumb_guide_001";
	rename -uid "5B762B28-46FA-FEDB-6098-ECAAA3A7730B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_thumb_guide_001W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 36.428308274959477 7.769750427946776 -28.376216157857971 ;
	setAttr ".rst" -type "double3" 8.2684036078429841 23.197561722968775 3.6184982336363483 ;
	setAttr ".rsrr" -type "double3" 36.428308274959477 7.769750427946776 -28.376216157857971 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_index_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "2021F1AD-49E7-CC10-62FB-658BF27B91CD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -60.046019016219404 30.821606534158523 -28.921655262826508 ;
	setAttr ".pa" -type "double3" 2.8627321640994996e-14 1.3330996770352938e-14 2.5879278912064479e-14 ;
	setAttr ".bps" -type "matrix" 0.53192540292164925 -0.82361451451803314 0.19675999898827443 0
		 0.77246137832848338 0.56715000791256709 0.28573464528410736 0 -0.34692763613972843 -1.630302981503462e-08 0.9378918995718537 0
		 42.180404258674578 95.683152224695434 -4.8680396416876297 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_index_guide_002" -p "jnt_rt_index_guide_001";
	rename -uid "8438F912-4EA9-5E88-CA7F-DBBC07D1422B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -0.47412540312788271 0.18178894700439363 -13.574390369495768 ;
	setAttr ".pa" -type "double3" 3.0811623476677861e-15 2.1757603069972596e-14 1.9083328088781104e-14 ;
	setAttr ".bps" -type "matrix" 0.33686306402437582 -0.93371741814131692 0.12122317911861004 0
		 0.93902726608675879 0.34258833004306921 0.029343306969870531 0 -0.068928003320391729 0.10394719417961561 0.99219146901213073 0
		 45.549100469979678 90.467181941506482 -3.621953930545927 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_index_guide_003" -p "jnt_rt_index_guide_002";
	rename -uid "25EC9889-428B-68AB-A780-AAB0DBD1BD7E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 26.009272124030101 -3.9107650763948132 -13.020896093125776 ;
	setAttr ".pa" -type "double3" 1.6548823576989858e-14 1.7607973134000652e-14 2.1759156075188151e-14 ;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244867 0.11367137359260854 0.056997699975427002 0 -0.068928003320391715 0.10394719417961559 0.99219146901213062 0
		 47.150726497838384 86.027793125929264 -3.0455945407056766 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_index_guide_004" -p "jnt_rt_index_guide_003";
	rename -uid "F7072F29-4BAE-65EF-EE75-68AF271B4662";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 8.5377364625159377e-07 -3.6730317525059666e-22 1.0663640275063105e-22 ;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244889 0.11367137359260857 0.056997699975427016 0 -0.068928003320391715 0.10394719417961559 0.99219146901213062 0
		 47.408152121808804 83.647522053126153 -2.7783413642794272 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_index_guide_005" -p "jnt_rt_index_guide_004";
	rename -uid "4FCCF346-4455-CC81-2C6D-A194A1B83DDD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 8.5377364625159377e-07 -3.6730317525059666e-22 1.0663640275063105e-22 ;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244889 0.11367137359260857 0.056997699975427016 0 -0.068928003320391729 0.10394719417961562 0.99219146901213084 0
		 47.702856830902377 80.922552086066005 -2.4723859259270502 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexEnd001";
	setAttr ".radi" 0.5;
createNode parentConstraint -n "jnt_rt_index_guide_005_parentConstraint1" -p "jnt_rt_index_guide_005";
	rename -uid "33C30C01-4C68-EF9E-B67E-3FB8A9B0E57C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_index_guide_005W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 3.1805546814635105e-15 -3.4986101496098681e-14 2.0673605429512861e-14 ;
	setAttr ".rst" -type "double3" -2.7578831976663736 2.1763923996331869e-11 2.0129675704083638e-11 ;
	setAttr ".rsrr" -type "double3" 3.1805546814635105e-15 -3.4986101496098681e-14 2.0673605429512861e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_004_parentConstraint1" -p "jnt_rt_index_guide_004";
	rename -uid "538588A6-4CE6-9702-A8CD-0598662BA4D7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_index_guide_004W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 3.1805546814635105e-15 -3.4986101496098681e-14 2.0673605429512861e-14 ;
	setAttr ".rst" -type "double3" -2.4090208981804864 0 2.8421709430404007e-14 ;
	setAttr ".rsrr" -type "double3" 3.1805546814635105e-15 -3.4986101496098681e-14 2.0673605429512861e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_003_parentConstraint1" -p "jnt_rt_index_guide_003";
	rename -uid "E3E9364A-43D3-162F-569F-64A01F2FD47C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_index_guide_003W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 3.3118285930436544 17.948913921472101 20.746710195193295 ;
	setAttr ".rst" -type "double3" -9.2623778507485639 0.42037656980622273 2.2358665590919102 ;
	setAttr ".rsrr" -type "double3" 3.3118285930436517 17.948913921472098 20.746710195193288 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_002_parentConstraint1" -p "jnt_rt_index_guide_002";
	rename -uid "A3DBF9EE-41FF-581E-A2A4-D884A543A50A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_index_guide_002W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.13517139271932607 -0.55988519587811358 27.145834753298267 ;
	setAttr ".rst" -type "double3" -6.3330235352054203 -1.4210854715202004e-14 1.0658141036401503e-14 ;
	setAttr ".rsrr" -type "double3" -0.13517139271930634 -0.5598851958781077 27.145834753298288 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_001_parentConstraint1" -p "jnt_rt_index_guide_001";
	rename -uid "B5BDFA9C-4B32-AE0F-71BC-999CC7EF15CE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_index_guide_001W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 47.508233071520401 -75.137098869844564 -59.549996483993013 ;
	setAttr ".rst" -type "double3" 9.2053208722359443 23.330935013677184 1.2749332649059255 ;
	setAttr ".rsrr" -type "double3" 54.476375078126289 -24.380844434345224 -52.526016026933213 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_middle_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "F67159B0-4CAD-A140-74EE-BFB3553D27A0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -81.588420877938191 29.324954047307358 -41.22947124759839 ;
	setAttr ".pa" -type "double3" 9.1937908761054794e-16 4.0253895187272619e-15 1.2324649390671124e-14 ;
	setAttr ".bps" -type "matrix" 0.49341868461377569 -0.86957848008674743 0.019268332673944649 0
		 0.86891620194824082 0.49379476199127753 0.033931799566499707 0 -0.039020964440343892 -1.7463761298186498e-08 0.9992383921438095 0
		 42.826575347151334 95.655435821203795 -6.5524335414225989 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_middle_guide_002" -p "jnt_rt_middle_guide_001";
	rename -uid "C5491C97-4A5C-6A89-8900-C0921F227B54";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -2.0856564015689436 0.80707503442885009 -8.4447882544834378 ;
	setAttr ".pa" -type "double3" 3.8825130388958993e-16 2.0888890777519638e-15 2.7430876716646233e-14 ;
	setAttr ".bps" -type "matrix" 0.36097701873268212 -0.93257471118772306 -1.6279197771057463e-08 0
		 0.93257471118772262 0.36097701873268229 6.3900213592704702e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 45.740554366963906 90.519972722568511 -6.438640726695974 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_middle_guide_003" -p "jnt_rt_middle_guide_002";
	rename -uid "1224BD78-4FAE-3B46-34AC-51A054075F48";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 1.8396807284908625e-06 -2.7213277963326867e-06 -15.108919664528663 ;
	setAttr ".pa" -type "double3" 0 0 2.8624992133171654e-14 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 47.611481337340869 85.686481700937208 -6.4386408392617538 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_middle_guide_004" -p "jnt_rt_middle_guide_003";
	rename -uid "715CF564-4154-1CD2-6C61-BA84B6948141";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 1.9090959104164216e-06 -5.9650618519194657e-22 9.1128900133585702e-29 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 47.980597430385174 82.204563610885955 -6.4386409174161452 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_middle_guide_005" -p "jnt_rt_middle_guide_004";
	rename -uid "9B527EB8-4A22-037F-AD63-998D2C5CF5A3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 2.2296409518597789e-05 -6.4797537900630715e-21 -3.7551277963512667e-28 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 48.289066375332759 79.294737624233477 -6.4386409827295008 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleEnd001";
	setAttr ".radi" 0.5;
createNode parentConstraint -n "jnt_rt_middle_guide_005_parentConstraint1" -p "jnt_rt_middle_guide_005";
	rename -uid "3A61C414-48C4-A479-07FD-AF8AD13DBC3C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_middle_guide_005W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 3.7432146158002845e-06 -1.1507191675031641e-14 8.7706435085527205e-15 ;
	setAttr ".rst" -type "double3" -2.9261303558643306 2.4868995751603507e-13 -1.0658141036401503e-14 ;
	setAttr ".rsrr" -type "double3" 3.7432146158002845e-06 -1.1507191675031641e-14 8.7706435085527205e-15 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_004_parentConstraint1" -p "jnt_rt_middle_guide_004";
	rename -uid "484C64CC-40D5-2605-4B82-0D949F73563D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_middle_guide_004W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -2.1291830093351197e-06 -1.1507196500884322e-14 1.09445788131048e-14 ;
	setAttr ".rst" -type "double3" -3.5014280120760759 -1.4210854715202004e-14 0 ;
	setAttr ".rsrr" -type "double3" -2.1291830093351197e-06 -1.1507196500884322e-14 
		1.09445788131048e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_003_parentConstraint1" -p "jnt_rt_middle_guide_003";
	rename -uid "E9263523-4897-F33C-9E5F-34BCAE096782";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_middle_guide_003W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -2.2008710013857006e-07 5.9987675988297387e-06 30.217839329057231 ;
	setAttr ".rst" -type "double3" -5.1829527930584192 0 0 ;
	setAttr ".rsrr" -type "double3" -2.2008710013857006e-07 5.9987675988297387e-06 30.217839329057231 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_002_parentConstraint1" -p "jnt_rt_middle_guide_002";
	rename -uid "1386B575-4E83-0F2F-147C-6D9624413CEA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_middle_guide_002W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.32315892490452386 -2.1843600718445466 16.828873178827116 ;
	setAttr ".rst" -type "double3" -5.9056921935997977 1.4210854715202004e-14 1.2434497875801753e-14 ;
	setAttr ".rsrr" -type "double3" -0.32315892490452386 -2.1843600718445466 16.828873178827116 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_001_parentConstraint1" -p "jnt_rt_middle_guide_001";
	rename -uid "4E507716-4CF7-7FC6-FBE2-04BFC5A57976";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_middle_guide_001W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 59.901320668945296 -26.135868199984085 -61.409172088506736 ;
	setAttr ".rst" -type "double3" 9.5578943606964515 22.507214184382853 -0.29116505475796828 ;
	setAttr ".rsrr" -type "double3" 59.901320668945296 -26.135868199984085 -61.409172088506736 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_ring_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "2F9DC7FD-4A49-5D4A-0768-FEBAA7098319";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -107.68374432959016 28.401690182857543 -53.995004644815829 ;
	setAttr ".pa" -type "double3" -1.4908850069360234e-14 9.7404487119820235e-15 1.6300342742500524e-14 ;
	setAttr ".bps" -type "matrix" 0.46207019331395649 -0.86969079495619883 -0.17357723819458054 0
		 0.81414243449961543 0.49359692175747538 -0.30583357431548197 0 0.35165783483073615 -1.6471602332090995e-08 0.93612860612319659 0
		 42.599052599699732 95.768842246514154 -8.0185486266059982 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_ring_guide_002" -p "jnt_rt_ring_guide_001";
	rename -uid "C720597A-4CA7-D026-730E-0198E43C55E7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -13.951335239755261 4.1572455445816372 -13.309328635349505 ;
	setAttr ".pa" -type "double3" 0 2.1024584608229046e-14 -4.386851482648477e-15 ;
	setAttr ".bps" -type "matrix" 0.23605433578495491 -0.95743636270990917 -0.16611430377286479 0
		 0.9459191306728808 0.26554477093100343 -0.18634101228194894 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 45.308826939532331 90.668608917388823 -9.0364787337378907 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_ring_guide_003" -p "jnt_rt_ring_guide_002";
	rename -uid "D23B531B-424D-7916-EBD6-A1927F601524";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -58.807388386529766 5.6301127286322741 -13.377562573432279 ;
	setAttr ".pa" -type "double3" 0 0 2.8624992133171654e-14 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.386368938021796 86.298098671674708 -9.7947581537430075 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_ring_guide_004" -p "jnt_rt_ring_guide_003";
	rename -uid "83FCE86B-45B0-1A75-E738-E9BDD9E1DEE3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 1.2074182697257329e-06 -4.0215106824833942e-22 -7.3308792860928471e-23 ;
	setAttr ".pa" -type "double3" 0 0 1.4411888400381561e-15 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.364105083604663 83.601945924514453 -10.104669440862629 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_ring_guide_005" -p "jnt_rt_ring_guide_004";
	rename -uid "293B374B-4AAA-9488-83D5-52817CF0CD7D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 1.2074182697257329e-06 -4.0215106824833942e-22 -7.3308792860928471e-23 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.340927901884804 80.795189241928057 -10.427294179779274 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringEnd001";
	setAttr ".radi" 0.5;
createNode parentConstraint -n "jnt_rt_ring_guide_005_parentConstraint1" -p "jnt_rt_ring_guide_005";
	rename -uid "D648800A-4EA7-63EB-FD38-A08EB35DF793";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_ring_guide_005W0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -3.1805546814635286e-15 1.5902773407317581e-14 -8.2694421718051442e-14 ;
	setAttr ".rst" -type "double3" -2.8253327832633204 -1.0658141036401503e-14 1.2079226507921703e-13 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635286e-15 1.5902773407317581e-14 -8.2694421718051442e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_004_parentConstraint1" -p "jnt_rt_ring_guide_004";
	rename -uid "482628C4-4763-FA65-A0B1-05B149EBD79F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_ring_guide_004W0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -3.1805546814635286e-15 1.5902773407317581e-14 -8.2694421718051442e-14 ;
	setAttr ".rst" -type "double3" -2.7139968321795038 1.4210854715202004e-14 -2.8421709430404007e-14 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635286e-15 1.5902773407317581e-14 -8.2694421718051442e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_003_parentConstraint1" -p "jnt_rt_ring_guide_003";
	rename -uid "460FB4DB-4867-08CD-0DCC-D382808BF4A8";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_ring_guide_003W0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.2329765445147669 -28.617262934331762 4.8314385620055944 ;
	setAttr ".rst" -type "double3" -4.5648045495068175 1.4210854715202004e-14 7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" -1.2329765445147669 -28.617262934331762 4.8314385620055944 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_002_parentConstraint1" -p "jnt_rt_ring_guide_002";
	rename -uid "6EEB1598-4ED1-30C8-2229-31BE39DBB3C2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_ring_guide_002W0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -3.022362545487463 -13.924486251583314 24.381045871513663 ;
	setAttr ".rst" -type "double3" -5.8644210548804097 0 1.7763568394002505e-15 ;
	setAttr ".rsrr" -type "double3" -3.022362545487463 -13.924486251583314 24.381045871513663 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_001_parentConstraint1" -p "jnt_rt_ring_guide_001";
	rename -uid "D2782EBB-4DC2-B886-02EA-6A82E41E3790";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_ring_guide_001W0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 62.534982183597258 -16.505462883231299 -79.053825110211548 ;
	setAttr ".rst" -type "double3" 9.9199013417318582 21.274902220665304 -1.0424833386354493 ;
	setAttr ".rsrr" -type "double3" 62.534982183597258 -16.505462883231299 -79.053825110211548 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_pinky_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "942F8FC7-4282-9157-EA45-71AEB7FD30E6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -129.41153223557311 24.802994410635062 -64.391977907321689 ;
	setAttr ".pa" -type "double3" -1.4113711398994355e-14 3.9756933518293991e-15 2.5444437451708134e-14 ;
	setAttr ".bps" -type "matrix" 0.39159246846473761 -0.85819538706956655 -0.33189759904857802 0
		 0.6546808676339434 0.51332317073410705 -0.55488042310172525 0 0.64656654738376296 -1.3525583035522981e-08 0.76285758815406712 0
		 41.892825242764452 95.684641228577135 -9.3709805441886349 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_pinky_guide_002" -p "jnt_rt_pinky_guide_001";
	rename -uid "03FD57DB-46B5-C80A-5853-77B40CC85538";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -2.5561934311448296 0.6940663481841729 -15.704504165393029 ;
	setAttr ".pa" -type "double3" 2.2263882770244611e-14 -4.770832022195272e-15 -1.5604596405930376e-14 ;
	setAttr ".bps" -type "matrix" 0.19192124383852854 -0.96503286870437699 -0.17854354786346407 0
		 0.96282992731049721 0.22037829912298079 -0.15617918027356881 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 43.975619569596283 91.120088462734813 -11.136271004758916 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_pinky_guide_003" -p "jnt_rt_pinky_guide_002";
	rename -uid "7B267FE9-4BEA-ADB3-ACA1-1D86C2929599";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -10.916544066385482 2.2795766576581293 -3.543609159938097 ;
	setAttr ".pa" -type "double3" 0 0 -2.0673605429512861e-14 ;
	setAttr ".bps" -type "matrix" 0.12067361413015511 -0.97861443766478995 -0.16658829864907587 0
		 0.97432700445693887 0.14889195679473155 -0.16887295102473723 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.676737817701131 87.594672817743842 -11.788518462614915 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_pinky_guide_004" -p "jnt_rt_pinky_guide_003";
	rename -uid "5C7BD22A-434D-C628-44D2-13B0BBAEAC03";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -60.665994933650481 7.3388923368818793 -7.7648432764781106 ;
	setAttr ".pa" -type "double3" 0 0 -1.9083328088781101e-14 ;
	setAttr ".bps" -type "matrix" -0.061789666546447547 -0.98926250914972291 -0.132445177710906 0
		 0.9798251220852342 -0.034852839122969104 -0.19679433359658383 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.944880037205451 85.420147341245936 -12.158685196851183 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_pinky_guide_005" -p "jnt_rt_pinky_guide_004";
	rename -uid "C9C0689E-4226-FFCC-6690-E7A7CEB8D167";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 1.2074182697257329e-06 -2.8485700581059758e-22 -1.3405035934171396e-22 ;
	setAttr ".bps" -type "matrix" -0.061789666546447547 -0.98926250914972291 -0.132445177710906 0
		 0.9798251220852342 -0.034852839122969104 -0.19679433359658383 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.824730225846523 83.49652953199157 -12.41622443326145 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyEnd001";
	setAttr ".radi" 0.5;
createNode parentConstraint -n "jnt_rt_pinky_guide_005_parentConstraint1" -p "jnt_rt_pinky_guide_005";
	rename -uid "8E365437-435C-73A7-0287-7F905DDE14A3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_pinky_guide_005W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.2722218725854121e-14 5.0888874903416256e-14 -1.2086107789561363e-13 ;
	setAttr ".rst" -type "double3" -1.9444966201798195 6.2172489379008766e-15 -7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" -1.2722218725854121e-14 5.0888874903416256e-14 -1.2086107789561363e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_004_parentConstraint1" -p "jnt_rt_pinky_guide_004";
	rename -uid "02AC8B34-4D6C-6A02-EE10-CDBEF875E817";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_pinky_guide_004W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0.97234089611425389 -20.69310104474026 -5.3221439548917893 ;
	setAttr ".rst" -type "double3" -2.2220449461759131 7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" 0.97234089611425389 -20.69310104474026 -5.3221439548917893 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_003_parentConstraint1" -p "jnt_rt_pinky_guide_003";
	rename -uid "BF2EDA4E-4FB8-5EBD-B0BB-E3A1031E9ABF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_pinky_guide_003W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.3104241033562779 -5.8024484952616904 6.1194630313221658 ;
	setAttr ".rst" -type "double3" -3.6531556962369649 -2.8421709430404007e-14 -1.4210854715202004e-14 ;
	setAttr ".rsrr" -type "double3" -0.3104241033562779 -5.8024484952616904 6.1194630313221658 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_002_parentConstraint1" -p "jnt_rt_pinky_guide_002";
	rename -uid "969804E8-4C48-132F-2EF3-188C3D553A83";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_pinky_guide_002W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.73441779669424234 -2.617539853618764 31.34087062951432 ;
	setAttr ".rst" -type "double3" -5.3187799595668324 0 2.4868995751603507e-14 ;
	setAttr ".rsrr" -type "double3" -0.73441779669424234 -2.617539853618764 31.34087062951432 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_001_parentConstraint1" -p "jnt_rt_pinky_guide_001";
	rename -uid "6092C0F6-42FB-B458-CEF7-CD802A1B300D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_pinky_guide_001W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -121.43559296954071 -176.04710390547888 88.058081583957332 ;
	setAttr ".rst" -type "double3" 10.019509920808375 19.794039083494354 -1.4058582685059342 ;
	setAttr ".rsrr" -type "double3" -121.43559296954071 -176.04710390547888 88.058081583957332 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_wrist_guide_001_parentConstraint1" -p "jnt_rt_wrist_guide_001";
	rename -uid "EEF55E3A-4396-A612-5928-40B2D39A1B53";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_wrist_guide_001W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 128.08229345384436 132.93989349989835 83.619292671175714 ;
	setAttr ".rst" -type "double3" -21.180998921756078 -2.8421709430404007e-14 -3.5527136788005009e-15 ;
	setAttr ".rsrr" -type "double3" 128.08229345384436 132.93989349989835 83.619292671175714 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_elbow_guide_001_parentConstraint1" -p "jnt_rt_elbow_guide_001";
	rename -uid "4DF3FB9C-492C-BDD4-0A89-179D4B5CA09D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_elbow_guide_001W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.2294939296903796 14.039317072850015 -1.8636293617127444 ;
	setAttr ".rst" -type "double3" -193.23331671518315 -27.853947217503787 120.92126676838726 ;
	setAttr ".rsrr" -type "double3" 28.868649423723838 -135.23844082675157 -14.680639691420232 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_upperArm_guide_001_parentConstraint1" -p "jnt_rt_upperArm_guide_001";
	rename -uid "1C2A6D9A-40FA-92AE-04C8-649079B765FB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_upperArm_guide_001W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -66.100621461659514 -27.765273094278765 138.40121632138082 ;
	setAttr ".rst" -type "double3" 1.3031669319233163 -5.2568261096760125 3.5540999978206429 ;
	setAttr ".rsrr" -type "double3" -66.100621461659514 -27.765273094278765 138.40121632138082 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_scapula_guide_001_parentConstraint1" -p "jnt_rt_scapula_guide_001";
	rename -uid "0055DD95-40EB-B1CA-B61E-37A2DC7FC12B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_scapula_guide_001W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -332.03163080848248 7.0948458185681735 152.04242100109977 ;
	setAttr ".rst" -type "double3" -2.002583087801213e-06 2.8421709430404007e-14 1.3322676295501878e-15 ;
	setAttr ".rsrr" -type "double3" -332.03163080848248 7.0948458185681735 152.04242100109977 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_clavicle_guide_002_parentConstraint1" -p "jnt_rt_clavicle_guide_002";
	rename -uid "248E3164-426E-C659-5560-4C8947C0BAC8";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_clavicle_guide_002W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 162.3820635613888 177.14835768295836 18.249372188254814 ;
	setAttr ".rst" -type "double3" -10.889342927023975 0 7.9936057773011271e-15 ;
	setAttr ".rsrr" -type "double3" 162.3820635613888 177.14835768295836 18.249372188254814 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_clavicle_guide_001_parentConstraint1" -p "jnt_rt_clavicle_guide_001";
	rename -uid "4EEA0777-4238-6CC5-3ABB-B29335DB4114";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_clavicle_guide_001W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 9.8496776798784644 -36.108797175155324 -29.613819513924955 ;
	setAttr ".rst" -type "double3" 9.2690145740343581 2.2850031578620502 4.2544972014629856 ;
	setAttr ".rsrr" -type "double3" 9.8496776798784644 -36.108797175155324 -29.613819513924955 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_upperLeg_guide_001" -p "jnt_md_root_guide_001";
	rename -uid "3B6AFB8F-470C-26C2-CA1B-31B6F76AF710";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "angle" -ln "angle" -min 0 -max 180 -at "double";
	addAttr -ci true -k true -sn "direction" -ln "direction" -min 0 -max 360 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -90.145352434304158 2.4837255212599416 -43.893961513143786 ;
	setAttr ".pa" -type "double3" 0.00042207211725204554 0 0 ;
	setAttr ".bps" -type "matrix" 2.2204460492503131e-16 -0.99909356459532384 -0.042568171022599632 0
		 -2.2204460492503131e-16 -0.042568171022599577 0.99909356459532384 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158203 89.608867645263672 -4.719511492177844 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "upperLeg001";
	setAttr ".radi" 2.65;
	setAttr -k on ".angle" 0.044019770400893318;
	setAttr -k on ".direction" 179.994873046875;
createNode joint -n "jnt_rt_knee_guide_001" -p "jnt_rt_upperLeg_guide_001";
	rename -uid "1D29EAA9-479C-9790-BA19-B6A859A1FA55";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "MeshPosInfo" -ln "MeshPosInfo" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0.00014223775499790908 -8.5467331828053523e-06 0.95497583132059716 ;
	setAttr ".pa" -type "double3" 0 2.369770209361979e-23 0.00017267555634194661 ;
	setAttr ".bps" -type "matrix" 2.2604080255862565e-16 -0.99815563484504466 -0.060706907573074315 0
		 -2.1797515622492138e-16 -0.060706907573074259 0.99815563484504466 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158292 51.001716701350475 -6.3644383161650273 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "knee001";
	setAttr ".radi" 2.65;
	setAttr -l on -k on ".MeshPosInfo" -type "string" "[u'mesh_m_high_body_001.vtx[7591]', u'mesh_m_high_body_001.vtx[8241]']";
createNode joint -n "jnt_rt_ankle_guide_001" -p "jnt_rt_knee_guide_001";
	rename -uid "DA0AFBAC-456A-EEB1-8311-4F8DBAACD251";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "MeshPosInfo" -ln "MeshPosInfo" -dt "string";
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -179.9998224201272 0.00033434737431621694 -65.465111632691091 ;
	setAttr ".bps" -type "matrix" -1.046394356673993e-16 -0.46908557853089733 0.88315271613370094 0
		 -2.9607127799878646e-16 0.88315271613370094 0.46908557853089738 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158407 10.26197679760029 -8.8421918232842138 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ankle001";
	setAttr ".radi" 2;
	setAttr -l on -k on ".MeshPosInfo" -type "string" "[u'mesh_m_high_body_001.vtx[7370]', u'mesh_m_high_body_001.vtx[7374]']";
createNode joint -n "jnt_rt_ball_guide_001" -p "jnt_rt_ankle_guide_001";
	rename -uid "0E48719D-4CDD-3848-AD4C-30A4B4520D87";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 8.5376533620430268e-07 -1.5088698449317847e-10 6.3047201943606126 ;
	setAttr ".bps" -type "matrix" -1.3652595559142256e-16 -0.36924442657630246 0.92933231593566024 0
		 -2.8278662734025352e-16 0.92933231593566024 0.36924442657630252 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158372 5.5424643078574043 0.043287639113749776 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ball001";
	setAttr ".radi" 2;
createNode joint -n "jnt_rt_toe_guide_001" -p "jnt_rt_ball_guide_001";
	rename -uid "877FDEE5-4148-1F43-59D4-71A279F7A982";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 8.5377364625159387e-07 2.843469961455832e-22 2.2483912772683896e-18 ;
	setAttr ".bps" -type "matrix" -1.3652595559142256e-16 -0.36924442657630246 0.92933231593566024 0
		 -2.8278662734025352e-16 0.92933231593566024 0.36924442657630252 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158336 1.827462690343332 9.3933842375133008 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "toe001";
	setAttr ".radi" 2;
createNode parentConstraint -n "jnt_rt_toe_guide_001_parentConstraint1" -p "jnt_rt_toe_guide_001";
	rename -uid "F42EDCF8-45E4-E520-6D3B-8A96E395FFBE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_toe_guide_001W0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -7.5998259575001928e-05 -0.00094258941092948063 1.0432646860084476e-09 ;
	setAttr ".rst" -type "double3" -10.06109056664023 -3.1123814636657698e-10 -0.00016552350170595531 ;
	setAttr ".rsrr" -type "double3" -7.5998259575001928e-05 -0.00094258941092948063 
		1.0432646860084476e-09 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ball_guide_001_parentConstraint1" -p "jnt_rt_ball_guide_001";
	rename -uid "B1A5A511-43B5-C602-CF8F-3DAFC6CE45A1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_ball_guide_001W0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0.00010597907838434158 0.00087844294205954225 -12.609440387886702 ;
	setAttr ".rst" -type "double3" -10.061090568001866 -1.0378897741247783e-10 1.9540102869086695e-10 ;
	setAttr ".rsrr" -type "double3" 0.00011161374785292231 0.00082744326545326264 -12.609440388003792 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ankle_guide_001_parentConstraint1" -p "jnt_rt_ankle_guide_001";
	rename -uid "8DC2C3BF-4406-B897-D2B5-BCA76F3159F3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_ankle_guide_001W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 2.4248339073044807e-05 -4.559960973765454e-05 -130.93022326662344 ;
	setAttr ".rst" -type "double3" -21.036227888839743 75.921911072575469 195.7480425555064 ;
	setAttr ".rsrr" -type "double3" 130.93939836903635 38.169618270001109 40.20642626539788 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_knee_guide_001_parentConstraint1" -p "jnt_rt_knee_guide_001";
	rename -uid "23B2A96B-4B0F-B984-B212-A79F7FCB72AA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_knee_guide_001W0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -95.395222152887342 -91.064831444567474 -39.189230884601123 ;
	setAttr ".rst" -type "double3" 114.98753314355834 40.052475502266496 -154.75718673098169 ;
	setAttr ".rsrr" -type "double3" -95.395222152887342 -91.064831444567474 -39.189230884601123 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_upperLeg_guide_001_parentConstraint1" -p "jnt_rt_upperLeg_guide_001";
	rename -uid "E6858801-4C44-971C-9DC2-3B9271525326";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "mirror_jnt_rt_upperLeg_guide_001W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -180.00018153027577 7.8741482435834934e-06 179.99999999997831 ;
	setAttr ".rst" -type "double3" -5.4740998008547166 -5.5636970162257953 0.039537336507059706 ;
	setAttr ".rsrr" -type "double3" -180.00018153027577 7.8741482435834934e-06 179.99999999997831 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_lf_arm_pole_guide_001" -p "grp_md_body_guide_001";
	rename -uid "A0A75ED4-4391-C970-2714-808D5D4BCCF5";
	setAttr ".dla" yes;
createNode joint -n "jnt_lf_leg_pole_guide_001" -p "grp_md_body_guide_001";
	rename -uid "0C451E82-47FE-F29D-AEF4-3084021084B2";
	setAttr ".dla" yes;
createNode transform -n "crv_auto_pole_arm" -p "grp_md_body_guide_001";
	rename -uid "7220FA38-419E-1BE0-5F3A-AF8A7B2885A1";
createNode nurbsCurve -n "curveShape1" -p "crv_auto_pole_arm";
	rename -uid "A72A9B2A-44CC-858A-FCD2-D89E81AD21B5";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		28.281510774319116 116.96922716130848 -9.2624377230705264
		0 0 0
		;
createNode transform -n "crv_auto_pole_leg" -p "grp_md_body_guide_001";
	rename -uid "CD3CCC6A-4E96-761F-BB58-9288EB1B4ADD";
createNode nurbsCurve -n "curveShape2" -p "crv_auto_pole_leg";
	rename -uid "3EEB3472-4310-B276-E64E-36B5A7E3359A";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		7.8047325284222842 51.00299187624379 -6.3940993129163886
		0 0 0
		;
createNode joint -n "jnt_rt_arm_pole_guide_001" -p "grp_md_body_guide_001";
	rename -uid "CA65A608-45B2-C607-1609-E2A0EF058205";
createNode joint -n "jnt_rt_leg_pole_guide_001" -p "grp_md_body_guide_001";
	rename -uid "0252B51E-48E6-D225-42B6-F7B7257EF559";
createNode transform -n "crv_auto_pole_rt_arm" -p "grp_md_body_guide_001";
	rename -uid "46DCE030-42D1-67A3-21AF-9BA386A4756F";
createNode nurbsCurve -n "curveShape3" -p "crv_auto_pole_rt_arm";
	rename -uid "1948C487-4332-906B-7BE8-E189677FD123";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-28.28149999999998 116.96899999999998 -9.2624399999999998
		0 0 0
		;
createNode transform -n "crv_auto_pole_rt_leg" -p "grp_md_body_guide_001";
	rename -uid "4B1691A3-4618-1B71-695D-FDBA7C67B6EC";
createNode nurbsCurve -n "curveShape4" -p "crv_auto_pole_rt_leg";
	rename -uid "EF4FFF02-47CC-FD7F-FFC4-B6AEE7B55A03";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-7.8047300000000002 51.003000000000007 -6.3940999999999999
		0 0 0
		;
createNode transform -n "mirror_jnt_rt_ankle_guide_001" -p "grp_md_body_guide_001";
	rename -uid "7CE4FA4D-4EB6-120F-969F-3080C20AF420";
createNode locator -n "mirror_jnt_rt_ankle_guide_001Shape" -p "mirror_jnt_rt_ankle_guide_001";
	rename -uid "0A68877C-4790-8C5F-347E-6EB88FA45228";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ball_guide_001" -p "grp_md_body_guide_001";
	rename -uid "435D0127-4DB6-A8D2-2F87-EB8D1398B818";
createNode locator -n "mirror_jnt_rt_ball_guide_001Shape" -p "mirror_jnt_rt_ball_guide_001";
	rename -uid "BCFB1288-4462-45FC-8F31-8988DC2DC9D2";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_clavicle_guide_001" -p "grp_md_body_guide_001";
	rename -uid "77DACD29-418B-11D7-E9CA-E592FE0DA08B";
createNode locator -n "mirror_jnt_rt_clavicle_guide_001Shape" -p "mirror_jnt_rt_clavicle_guide_001";
	rename -uid "C77E810D-4CDD-5C0F-EC13-3796150BFE19";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_clavicle_guide_002" -p "grp_md_body_guide_001";
	rename -uid "E215DFC0-4ED0-5F24-D1B6-8C9F165D4E02";
createNode locator -n "mirror_jnt_rt_clavicle_guide_002Shape" -p "mirror_jnt_rt_clavicle_guide_002";
	rename -uid "12BC9473-4D8C-E8E1-1784-90AC4940C18F";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_elbow_guide_001" -p "grp_md_body_guide_001";
	rename -uid "BA9D4FF5-43F3-3E08-C365-F99D82C039F2";
createNode locator -n "mirror_jnt_rt_elbow_guide_001Shape" -p "mirror_jnt_rt_elbow_guide_001";
	rename -uid "72B02138-4A7A-68BF-9A5B-79A2A4C2D970";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_001" -p "grp_md_body_guide_001";
	rename -uid "A6BC3950-42FD-BD19-5D45-2A877769B6F8";
createNode locator -n "mirror_jnt_rt_index_guide_001Shape" -p "mirror_jnt_rt_index_guide_001";
	rename -uid "378BC7D9-4211-A724-868A-36AD6FD0F55B";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_002" -p "grp_md_body_guide_001";
	rename -uid "003D3B6C-46ED-ECFA-3748-E48BE87F76AA";
createNode locator -n "mirror_jnt_rt_index_guide_002Shape" -p "mirror_jnt_rt_index_guide_002";
	rename -uid "51860B25-49D6-721B-EF2B-0D94D6A9A30A";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_003" -p "grp_md_body_guide_001";
	rename -uid "310CB1DF-40B5-A84E-60B6-75831A24917E";
createNode locator -n "mirror_jnt_rt_index_guide_003Shape" -p "mirror_jnt_rt_index_guide_003";
	rename -uid "F30550E6-45E1-18E7-ACF3-62A910CD606C";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_004" -p "grp_md_body_guide_001";
	rename -uid "E1F31781-4768-2953-97EB-DD90607706FE";
createNode locator -n "mirror_jnt_rt_index_guide_004Shape" -p "mirror_jnt_rt_index_guide_004";
	rename -uid "2A5485FA-432F-1AE7-9087-A0A699A2B976";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_005" -p "grp_md_body_guide_001";
	rename -uid "0CA2C16F-4D05-8E9D-3EA8-74A461F6BEED";
createNode locator -n "mirror_jnt_rt_index_guide_005Shape" -p "mirror_jnt_rt_index_guide_005";
	rename -uid "9E189BA2-4429-780A-9FFC-16B59D6E7D9C";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_knee_guide_001" -p "grp_md_body_guide_001";
	rename -uid "D3949F07-4432-E880-5BC1-B28BAFDE916C";
createNode locator -n "mirror_jnt_rt_knee_guide_001Shape" -p "mirror_jnt_rt_knee_guide_001";
	rename -uid "0D79983F-410A-F9B4-096C-CB85B2C016A4";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_001" -p "grp_md_body_guide_001";
	rename -uid "43665989-4A97-47F6-F6F7-478DFCCB6385";
createNode locator -n "mirror_jnt_rt_middle_guide_001Shape" -p "mirror_jnt_rt_middle_guide_001";
	rename -uid "D759FBE7-44E8-F78C-5FE8-9A9524FBC469";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_002" -p "grp_md_body_guide_001";
	rename -uid "715DBCEC-4766-C469-31DC-F98901150C44";
createNode locator -n "mirror_jnt_rt_middle_guide_002Shape" -p "mirror_jnt_rt_middle_guide_002";
	rename -uid "5495BD2B-4092-44A5-4562-DCAB89A61FE0";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_003" -p "grp_md_body_guide_001";
	rename -uid "67077E3A-4847-0501-4FEB-5DA33E58F7E2";
createNode locator -n "mirror_jnt_rt_middle_guide_003Shape" -p "mirror_jnt_rt_middle_guide_003";
	rename -uid "44B92B97-424E-6788-6D0B-FB8514394A11";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_004" -p "grp_md_body_guide_001";
	rename -uid "D20E91A5-44D0-C0A5-0FD8-22AFF4185CF2";
createNode locator -n "mirror_jnt_rt_middle_guide_004Shape" -p "mirror_jnt_rt_middle_guide_004";
	rename -uid "C93F0937-471F-F9F8-E359-27BE08C8534E";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_005" -p "grp_md_body_guide_001";
	rename -uid "6BEDE61E-4BF5-5B1C-E155-80A22914022B";
createNode locator -n "mirror_jnt_rt_middle_guide_005Shape" -p "mirror_jnt_rt_middle_guide_005";
	rename -uid "3FF2231A-4AB7-D33A-CB17-9C93B3A4F95F";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_001" -p "grp_md_body_guide_001";
	rename -uid "68EC0F19-4B8E-D925-6E63-18ADCAEA7554";
createNode locator -n "mirror_jnt_rt_pinky_guide_001Shape" -p "mirror_jnt_rt_pinky_guide_001";
	rename -uid "200CD818-48F2-97B2-F288-4CA92CAE47A9";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_002" -p "grp_md_body_guide_001";
	rename -uid "11F70DDC-487B-FC9D-71AE-458118D53FAF";
createNode locator -n "mirror_jnt_rt_pinky_guide_002Shape" -p "mirror_jnt_rt_pinky_guide_002";
	rename -uid "FBA1BC2E-4C31-8F87-3083-D49671575F9A";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_003" -p "grp_md_body_guide_001";
	rename -uid "386FFEE0-4B73-B324-A492-2880FBC44F48";
createNode locator -n "mirror_jnt_rt_pinky_guide_003Shape" -p "mirror_jnt_rt_pinky_guide_003";
	rename -uid "C58E0326-4F15-72DF-9F95-7AA942A4B875";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_004" -p "grp_md_body_guide_001";
	rename -uid "567B8C38-4569-E934-9B5B-D5AB746E77D4";
createNode locator -n "mirror_jnt_rt_pinky_guide_004Shape" -p "mirror_jnt_rt_pinky_guide_004";
	rename -uid "C1102568-42CF-70B9-AA8A-3A8456079AE3";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_005" -p "grp_md_body_guide_001";
	rename -uid "92D125F6-40FA-5E02-DEFC-A2A2EB0B5DA9";
createNode locator -n "mirror_jnt_rt_pinky_guide_005Shape" -p "mirror_jnt_rt_pinky_guide_005";
	rename -uid "D13F1F89-4AA7-FFDF-0217-00AF49E3999C";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_001" -p "grp_md_body_guide_001";
	rename -uid "A553F4E8-4F7C-16BA-E4B3-2987FE883A52";
createNode locator -n "mirror_jnt_rt_ring_guide_001Shape" -p "mirror_jnt_rt_ring_guide_001";
	rename -uid "60F6B39B-4A70-B137-3AFB-5AB723D36FEB";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_002" -p "grp_md_body_guide_001";
	rename -uid "81FD0BAC-448A-960C-7DD2-C09963CBEAF7";
createNode locator -n "mirror_jnt_rt_ring_guide_002Shape" -p "mirror_jnt_rt_ring_guide_002";
	rename -uid "E78F759B-4359-5712-7D30-CB9B1A243041";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_003" -p "grp_md_body_guide_001";
	rename -uid "EC51F437-409A-3335-BC02-8983A1FF05A7";
createNode locator -n "mirror_jnt_rt_ring_guide_003Shape" -p "mirror_jnt_rt_ring_guide_003";
	rename -uid "B1379D05-45AA-1800-B27E-AE9B4783A6A4";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_004" -p "grp_md_body_guide_001";
	rename -uid "758FB8A6-4445-03EC-C39D-99989FB24289";
createNode locator -n "mirror_jnt_rt_ring_guide_004Shape" -p "mirror_jnt_rt_ring_guide_004";
	rename -uid "F53AE605-4688-5525-6053-EBAC9615C843";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_005" -p "grp_md_body_guide_001";
	rename -uid "6E172268-40C0-7121-D290-7888ED7C8EB7";
createNode locator -n "mirror_jnt_rt_ring_guide_005Shape" -p "mirror_jnt_rt_ring_guide_005";
	rename -uid "BEAE646D-4292-0118-5502-988A278F241D";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_scapula_guide_001" -p "grp_md_body_guide_001";
	rename -uid "2F6A096E-4AEE-CD9E-C4C7-4894E1F02FD8";
createNode locator -n "mirror_jnt_rt_scapula_guide_001Shape" -p "mirror_jnt_rt_scapula_guide_001";
	rename -uid "526E98FC-40CD-C98E-97A0-0886758AF010";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_scapula_guide_002" -p "grp_md_body_guide_001";
	rename -uid "0EAFBD6C-4B2C-8993-9128-BAA298CE593C";
createNode locator -n "mirror_jnt_rt_scapula_guide_002Shape" -p "mirror_jnt_rt_scapula_guide_002";
	rename -uid "0CD0A753-4049-3905-1466-E6895F9787B1";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_001" -p "grp_md_body_guide_001";
	rename -uid "0614BF14-4C4D-1592-C4A9-52B12DAB4EF8";
createNode locator -n "mirror_jnt_rt_thumb_guide_001Shape" -p "mirror_jnt_rt_thumb_guide_001";
	rename -uid "DBFA7B65-4532-8B11-8A18-938AA24EF14D";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_002" -p "grp_md_body_guide_001";
	rename -uid "4A79A5B1-47C9-E745-131D-28B3B0DD27E8";
createNode locator -n "mirror_jnt_rt_thumb_guide_002Shape" -p "mirror_jnt_rt_thumb_guide_002";
	rename -uid "D102F959-485E-8FE3-DFC7-37AE5BA312A6";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_003" -p "grp_md_body_guide_001";
	rename -uid "BF8D3A6D-4A53-CB57-6740-EE8DD86CD150";
createNode locator -n "mirror_jnt_rt_thumb_guide_003Shape" -p "mirror_jnt_rt_thumb_guide_003";
	rename -uid "7F50147F-4E15-4A83-E6DA-488A68D5D268";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_004" -p "grp_md_body_guide_001";
	rename -uid "F6543E29-4261-F653-9EF2-CA8B3652FA78";
createNode locator -n "mirror_jnt_rt_thumb_guide_004Shape" -p "mirror_jnt_rt_thumb_guide_004";
	rename -uid "DAB48C6F-4482-6628-9647-C0A1FA59BF2A";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_toe_guide_001" -p "grp_md_body_guide_001";
	rename -uid "897E9F4C-4B74-904B-5E5C-60B558B8513D";
createNode locator -n "mirror_jnt_rt_toe_guide_001Shape" -p "mirror_jnt_rt_toe_guide_001";
	rename -uid "1CD12443-4A64-7B11-5C8B-9F8FB9B2C8E9";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_upperArm_guide_001" -p "grp_md_body_guide_001";
	rename -uid "B7DEC407-4AC8-4E41-AC57-959F462E2A72";
createNode locator -n "mirror_jnt_rt_upperArm_guide_001Shape" -p "mirror_jnt_rt_upperArm_guide_001";
	rename -uid "12A7DE45-43C0-2289-D1B1-438C74DB4509";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_upperLeg_guide_001" -p "grp_md_body_guide_001";
	rename -uid "E21660C0-4134-1746-23A6-13832350806B";
createNode locator -n "mirror_jnt_rt_upperLeg_guide_001Shape" -p "mirror_jnt_rt_upperLeg_guide_001";
	rename -uid "6440FADD-4263-7BC3-5EFC-81BF86ABE1FC";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_wrist_guide_001" -p "grp_md_body_guide_001";
	rename -uid "24CA5771-423E-A4D9-14C1-1FAFDD2BA91B";
createNode locator -n "mirror_jnt_rt_wrist_guide_001Shape" -p "mirror_jnt_rt_wrist_guide_001";
	rename -uid "123C1D26-4FBE-3095-B63A-DBB4B930E5F0";
	setAttr -k off ".v";
createNode decomposeMatrix -n "decomposeMatrix3";
	rename -uid "9E08010B-419D-8C88-A036-719A6F4F5E51";
createNode multMatrix -n "multMatrix3";
	rename -uid "F5E25C0D-4213-57CC-FD5A-358666E8210B";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix4";
	rename -uid "46048B22-4680-150F-93D8-C5B4FA292433";
createNode multMatrix -n "multMatrix4";
	rename -uid "FEFC11A3-4795-0AE4-FB06-BD9F55AB9A1F";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix27";
	rename -uid "27201F3C-41AF-9C36-3DD6-33AD5DB07097";
createNode multMatrix -n "multMatrix27";
	rename -uid "78428121-4292-5FEE-0BCC-C7BC98D1B0D5";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix28";
	rename -uid "780729E1-4A88-2EFE-2185-55965DE1386B";
createNode multMatrix -n "multMatrix28";
	rename -uid "BBDCF224-42BD-91C8-B899-0FA4A44A58E3";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix34";
	rename -uid "214C3F0A-4F50-C284-EE37-A4B81500B4F9";
createNode multMatrix -n "multMatrix34";
	rename -uid "EF24CD0F-4852-9B84-C478-7FBDFC9F7DD5";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix5";
	rename -uid "06A3E1B4-4B0E-093D-8C65-388FA8F60B35";
createNode multMatrix -n "multMatrix5";
	rename -uid "41B63B36-4BC7-5FFD-B0E6-A8BD55A9D95D";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix36";
	rename -uid "1CD6B5C5-44BB-18BB-1F9E-4BA9EE87364B";
createNode multMatrix -n "multMatrix36";
	rename -uid "E0CE076D-4763-80DE-C8A1-ED9B8F18822C";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix29";
	rename -uid "592E5C4C-4BF1-D2E3-1EAE-3EBFFCCB6DDD";
createNode multMatrix -n "multMatrix29";
	rename -uid "A70DE402-460A-9838-2DE7-FAA47BF22156";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix30";
	rename -uid "727620FD-420F-7B41-EF71-16BED7089FF3";
createNode multMatrix -n "multMatrix30";
	rename -uid "95E9C806-4485-3FDE-2212-649EA4FBC9EB";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix31";
	rename -uid "9D8C25D4-4DE8-FA13-271B-0893D3388115";
createNode multMatrix -n "multMatrix31";
	rename -uid "6D450356-41D9-BACE-1698-B79FCEE8FB18";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix32";
	rename -uid "2F9742F9-4B3F-7208-DE05-4A96497D1020";
createNode multMatrix -n "multMatrix32";
	rename -uid "14CA1E34-42E2-E18A-77B1-2899D63B8455";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix6";
	rename -uid "98E61C9B-4379-5CB2-9C2B-F493B59A44F5";
createNode multMatrix -n "multMatrix6";
	rename -uid "50C5BE51-4C95-0F9E-792D-2AB44C113BFE";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix7";
	rename -uid "9AF5A8FE-4146-8B61-0A6D-988230CE9647";
createNode multMatrix -n "multMatrix7";
	rename -uid "BD7F655B-4A77-5D25-445B-FD90A7C1E3EB";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix8";
	rename -uid "E713D074-4602-CCD3-2241-00A08CDEE985";
createNode multMatrix -n "multMatrix8";
	rename -uid "59F6BB86-4939-B77B-7C41-389719459DF4";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix9";
	rename -uid "F4E568C9-40CF-DEB5-57B0-A1A9F4BBEE2C";
createNode multMatrix -n "multMatrix9";
	rename -uid "447D2A03-4D10-8567-B9AC-85B535BEA7B0";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix10";
	rename -uid "663C5AAE-4E40-BF2A-A477-FE97505AE799";
createNode multMatrix -n "multMatrix10";
	rename -uid "19FC87C5-491B-DE20-EFAB-6AB79F237CCC";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix12";
	rename -uid "94C38868-471C-45F2-BD6B-51B8905FFE04";
createNode multMatrix -n "multMatrix12";
	rename -uid "0FE7708F-40D1-1AB9-B513-A99FB6810D5D";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix13";
	rename -uid "CE2237A3-4B9F-9EDA-4BF9-28B70917A8E0";
createNode multMatrix -n "multMatrix13";
	rename -uid "288CEC47-4009-02AA-71CC-F392CBC6E3A1";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix14";
	rename -uid "C3F5B580-48A9-A28A-1626-26B273895511";
createNode multMatrix -n "multMatrix14";
	rename -uid "BF814BDE-4D10-DB03-5937-80BE6542D226";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix15";
	rename -uid "6EFCF711-4069-C669-478C-0AA020E74DA1";
createNode multMatrix -n "multMatrix15";
	rename -uid "110849A6-4F01-AD13-4E3F-01A7B08FB709";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix16";
	rename -uid "BF039357-4A9F-1FA6-617E-888C5C348F4D";
createNode multMatrix -n "multMatrix16";
	rename -uid "615C777F-4918-5686-D452-3F8F484F6B57";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix22";
	rename -uid "E1DE9A14-45C0-4C8C-054B-54A236C55504";
createNode multMatrix -n "multMatrix22";
	rename -uid "EF268A2A-4AC8-34D9-3B97-B7A57A3A8A02";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix23";
	rename -uid "E5350A9B-459D-40A3-789B-609AE14DB3BD";
createNode multMatrix -n "multMatrix23";
	rename -uid "23F907F6-4C6E-48BA-41FE-8ABE243C1733";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix24";
	rename -uid "3457428C-48A5-A7D9-28D0-A6B55CB8F702";
createNode multMatrix -n "multMatrix24";
	rename -uid "6C090411-4240-7614-40B0-2D9F4DC85F39";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix25";
	rename -uid "8B8E5066-42E2-5CE9-E9FC-A09866AEC019";
createNode multMatrix -n "multMatrix25";
	rename -uid "3D47AEB5-4882-E5D0-A07C-AB924A4DDCCA";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix26";
	rename -uid "197E1947-4F5C-A49E-825D-0A94D0C6A981";
createNode multMatrix -n "multMatrix26";
	rename -uid "31B9E326-4E25-CDA3-E003-D399F4FCB41B";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix17";
	rename -uid "6C9665C9-46A0-76FE-9162-61BA0DA8ACF5";
createNode multMatrix -n "multMatrix17";
	rename -uid "39A958E7-4FDD-7B1B-E869-AAB683D9C349";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix18";
	rename -uid "81A1473A-4A0F-4D85-55B9-6AA00BEDEBDD";
createNode multMatrix -n "multMatrix18";
	rename -uid "21648D11-47F2-9E22-05E1-F2A4BD9AC4E4";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix19";
	rename -uid "E681E94E-422B-5522-0388-789D04AAFAE5";
createNode multMatrix -n "multMatrix19";
	rename -uid "EF94A3A3-4B43-2374-D21F-81AC7F9A1012";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix20";
	rename -uid "06B86AD0-4B7B-DF65-9559-F7985AF2BFAC";
createNode multMatrix -n "multMatrix20";
	rename -uid "448DC815-433B-9137-6BDF-9B92F3B5DE3A";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix21";
	rename -uid "45B87642-4B34-E38F-03C3-5CB3634EBDF8";
createNode multMatrix -n "multMatrix21";
	rename -uid "EFD53717-483F-F8DA-7135-618D26878A7A";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix35";
	rename -uid "B089BD18-4D90-E91D-E8C3-8199E12B551F";
createNode multMatrix -n "multMatrix35";
	rename -uid "58D62060-4502-B9B9-084E-1C828B9EDCF9";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix11";
	rename -uid "5AE81C58-4F20-51C9-129F-359081E48234";
createNode multMatrix -n "multMatrix11";
	rename -uid "BF3C6975-4E11-7CDD-A09F-BAA644874998";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix1";
	rename -uid "E9760B13-4914-95BF-BAFC-79A60F4CE874";
createNode multMatrix -n "multMatrix1";
	rename -uid "17192DED-42AD-1800-06CF-01AF8BD091CB";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix2";
	rename -uid "2A4086B0-4E66-9040-5CF7-149B4720A6AD";
createNode multMatrix -n "multMatrix2";
	rename -uid "CE072BA3-49BD-2ED8-FA46-C0BFFE55F149";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix33";
	rename -uid "521EE2BE-4890-32BC-B14B-5DA7D4593F92";
createNode multMatrix -n "multMatrix33";
	rename -uid "756BC5FB-48E8-A1CB-2304-2E91A8A2A95A";
	setAttr -s 4 ".i";
	setAttr ".i[1]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[3]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode plusMinusAverage -n "autoPole_position";
	rename -uid "1F15723A-467F-C9D9-B575-9A8C8B9D83F3";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world";
	rename -uid "E9D6EE3C-4F72-3ED4-7AAB-49A2335DF0B9";
createNode multiplyDivide -n "autoPole_scaled";
	rename -uid "56B78457-4E27-C8D0-B024-FB8326E84B17";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction";
	rename -uid "F684CB2B-4803-A298-E2DC-B9BB59EFF151";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset";
	rename -uid "9B269839-4F40-6E1E-D07B-8EBE45299DD9";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid";
	rename -uid "8CC2D988-4FBD-2438-DBDE-BEA89E35FECB";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world";
	rename -uid "D3F0780E-42DC-CA2E-C1EE-8191E2A968F0";
createNode multiplyDivide -n "autoPole_projection";
	rename -uid "32F958C8-42AD-E27E-FEF5-D3AE06EA4090";
createNode plusMinusAverage -n "autoPole_axis";
	rename -uid "962A067A-4DE2-D750-5D0F-A7898CAEADBB";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world";
	rename -uid "92F61A21-44DC-69EB-816E-079E0CB418A7";
createNode multiplyDivide -n "autoPole_ratio";
	rename -uid "AEF70606-4CC2-5EF4-E5AA-8083EEE5C216";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid";
	rename -uid "D70A01A9-49E7-3177-7310-A082257554D5";
createNode vectorProduct -n "autoPole_dotAxis";
	rename -uid "C49D32EA-4A31-70DD-046A-CE9C289A90F0";
createNode distanceBetween -n "autoPole_length";
	rename -uid "71203C16-435D-0C85-9447-3D89083C8C8B";
createNode plusMinusAverage -n "autoPole_position1";
	rename -uid "CD4E31F4-4D84-944C-657B-C5B35C5EDD27";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world1";
	rename -uid "8C1369D2-4277-4D14-7224-86BF12D7B13B";
createNode multiplyDivide -n "autoPole_scaled1";
	rename -uid "77DECDD9-4640-0B07-2402-14BCC9BA1CE3";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction1";
	rename -uid "5E43F256-46D6-7461-B172-A2AB23271C2D";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset1";
	rename -uid "1359AE7C-4141-3E06-47CD-EDA976F52DFF";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid1";
	rename -uid "B783E0CD-48FC-7A73-50F6-B085467AA8E5";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world1";
	rename -uid "7BAE02D7-4208-16D7-EFA5-3C8EA1FB7137";
createNode multiplyDivide -n "autoPole_projection1";
	rename -uid "A789A22C-48CA-CF19-0365-45A9935080FE";
createNode plusMinusAverage -n "autoPole_axis1";
	rename -uid "A1AB6703-47EE-8141-687F-A594E958D444";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world1";
	rename -uid "99331474-4F7F-AAC9-29DB-6E98E3D77443";
createNode multiplyDivide -n "autoPole_ratio1";
	rename -uid "65CC9076-4132-DD53-59CF-FFA8CEC413BB";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid1";
	rename -uid "43BB38E8-4125-6E13-DD50-C6BE6921333E";
createNode vectorProduct -n "autoPole_dotAxis1";
	rename -uid "DBA7C94C-48A9-0529-02F8-ABB0060FABD0";
createNode distanceBetween -n "autoPole_length1";
	rename -uid "7DB45796-4ACD-1C19-8F27-EFB286B947F1";
createNode decomposeMatrix -n "autoPole_display_arm_cv0";
	rename -uid "E42CB0C1-49D9-EA51-890B-E8A1C73B3F8D";
createNode decomposeMatrix -n "autoPole_display_arm_cv1";
	rename -uid "40153654-40E6-9F72-42E3-0C973042C618";
createNode decomposeMatrix -n "autoPole_display_leg_cv0";
	rename -uid "7B0435A4-4A09-7B07-6216-CFBFD41B701A";
createNode decomposeMatrix -n "autoPole_display_leg_cv1";
	rename -uid "7C301B0E-421F-7142-19F8-D3B4247AD437";
createNode plusMinusAverage -n "autoPole_position2";
	rename -uid "D962CA6F-4ED6-5288-0C4D-E7B902EC57F9";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world2";
	rename -uid "4B839F91-4E4B-59A1-B229-A0AA9D8DC623";
createNode multiplyDivide -n "autoPole_scaled2";
	rename -uid "FB9BFCCD-49C3-330F-589F-878F60C16A63";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction2";
	rename -uid "7E6EB357-4EF1-8FC2-3C13-3B8D8350A62C";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset2";
	rename -uid "2599CBD3-42D5-9400-A2CE-589491927A38";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid2";
	rename -uid "A5BD7EE7-4661-08EC-B25F-6A8B7A996FC3";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world2";
	rename -uid "53C96619-4864-1F95-CF12-60B6F33C7186";
createNode multiplyDivide -n "autoPole_projection2";
	rename -uid "93473328-4DBC-7DC7-45B2-71B94E5C99DA";
createNode plusMinusAverage -n "autoPole_axis2";
	rename -uid "08B53CC4-4D84-8141-9B03-81A736D5BEA1";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world2";
	rename -uid "6AA61BB0-4DF9-4C6E-DF77-0896752B6DA1";
createNode multiplyDivide -n "autoPole_ratio2";
	rename -uid "4D0929FA-4F98-C315-1FC0-419A24184D63";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid2";
	rename -uid "9BF1D42C-4DA0-B97D-D5ED-688B3F535AD0";
createNode vectorProduct -n "autoPole_dotAxis2";
	rename -uid "56CF16CC-4CC9-AE4B-11C3-D6B59DE38DD2";
createNode distanceBetween -n "autoPole_length2";
	rename -uid "FC8AF8BE-40CE-6CD3-BDB2-1D85EDED60C9";
createNode plusMinusAverage -n "autoPole_position3";
	rename -uid "4633A62C-4A10-1F83-914D-068427A763C8";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world3";
	rename -uid "D9153C93-4139-1768-5565-6BAD5EE0FE90";
createNode multiplyDivide -n "autoPole_scaled3";
	rename -uid "A5C94979-4A50-7131-8957-6F87284987B8";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction3";
	rename -uid "0EB9E38B-4AD2-0F82-F5DB-D39A1CB3337D";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset3";
	rename -uid "D30F4B60-4DFF-55B6-9730-1285CE51421D";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid3";
	rename -uid "F80FA5CD-4B3C-58DD-F352-0C95714C5586";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world3";
	rename -uid "DA882587-447F-3D3C-81CE-9BA3C7E56D1B";
createNode multiplyDivide -n "autoPole_projection3";
	rename -uid "16F12A06-41C1-E30F-992E-E29D2E489573";
createNode plusMinusAverage -n "autoPole_axis3";
	rename -uid "AA7DFE3C-44E4-BC7F-B88E-7A9CD1C66424";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world3";
	rename -uid "8F247B27-417F-4680-23A9-448589322CDC";
createNode multiplyDivide -n "autoPole_ratio3";
	rename -uid "F38D8071-44CF-C867-669E-B0B542C2AC7A";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid3";
	rename -uid "0DB30800-4E75-1090-1C7D-138DD40B9E16";
createNode vectorProduct -n "autoPole_dotAxis3";
	rename -uid "48BB5112-4B56-EBAF-836B-41AF7428A4D2";
createNode distanceBetween -n "autoPole_length3";
	rename -uid "0B4492C7-4859-AEBD-5DC5-8189448E8675";
createNode decomposeMatrix -n "autoPole_display_rt_arm_cv0";
	rename -uid "9BCB7C77-40FB-FF9A-97C5-A0BF67B160CA";
createNode decomposeMatrix -n "autoPole_display_rt_arm_cv1";
	rename -uid "6BA65E31-41F9-6352-8D6F-1BA7046FD0C7";
createNode decomposeMatrix -n "autoPole_display_rt_leg_cv0";
	rename -uid "7A75F5FD-4822-259D-E346-5A8A84C988E1";
createNode decomposeMatrix -n "autoPole_display_rt_leg_cv1";
	rename -uid "97BF1A44-4204-8570-E9CE-9E88EA3876F0";
createNode decomposeMatrix -n "decomposeMatrix37";
	rename -uid "9A73A893-478D-639C-FE7C-21BF0F103D97";
createNode multMatrix -n "multMatrix37";
	rename -uid "A35A4075-4A8E-417D-F125-CF8DAFC28253";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix38";
	rename -uid "03EBD177-4F7C-ADC8-8249-7DAAC575E47D";
createNode multMatrix -n "multMatrix38";
	rename -uid "74358149-4A3B-9C48-84C7-6F9B6DAA1E4A";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix39";
	rename -uid "B75543B6-4AB9-FFC2-949F-78B223D62326";
createNode multMatrix -n "multMatrix39";
	rename -uid "EA18574B-4604-74B5-F241-F89E1E6CBF35";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix40";
	rename -uid "11D9CB3F-4683-669D-4EF7-E987558789FA";
createNode multMatrix -n "multMatrix40";
	rename -uid "C4D1B7D1-43F4-534F-C88C-009AA5C1F21C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix41";
	rename -uid "6956985E-43C7-A573-E6A1-BA91EA5445C1";
createNode multMatrix -n "multMatrix41";
	rename -uid "58F907A1-467D-E1EE-B082-47A932636D3A";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix42";
	rename -uid "1887783D-431D-A67A-D016-D48A07580539";
createNode multMatrix -n "multMatrix42";
	rename -uid "8F1EE1D8-4A2A-0E43-BC2C-D6B60D3B6132";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix43";
	rename -uid "CDCB3A12-4D61-50B0-80AF-62A114D18BA4";
createNode multMatrix -n "multMatrix43";
	rename -uid "68567155-41B5-EA2A-A788-32BE1CF2CECA";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix44";
	rename -uid "B9EECC48-470F-3069-6A28-0FB3C5D2A67F";
createNode multMatrix -n "multMatrix44";
	rename -uid "70347605-4384-6E51-A677-0E822F01D9FE";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix45";
	rename -uid "A87AF2A9-4D1C-5CE3-E2E6-B18F5D8723C9";
createNode multMatrix -n "multMatrix45";
	rename -uid "DF842061-4080-7BFB-836F-20B5C1E16120";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix46";
	rename -uid "6ADCEDDC-4C3F-4DFA-5DEE-72A971379FAF";
createNode multMatrix -n "multMatrix46";
	rename -uid "7DBD70B8-47C6-D0D8-6AFA-91917368FA69";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix47";
	rename -uid "464868D1-4BBA-2E5F-101F-D08FDDB4363B";
createNode multMatrix -n "multMatrix47";
	rename -uid "D930F68C-45EC-865D-7567-8E8844B04D2A";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix48";
	rename -uid "82D241A8-425A-E126-830A-52BA9DF9A076";
createNode multMatrix -n "multMatrix48";
	rename -uid "B915AAD2-436F-66D1-6CF3-EC94CCBBC665";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix49";
	rename -uid "935451B9-4D06-C523-6556-CFBDA8EBA43E";
createNode multMatrix -n "multMatrix49";
	rename -uid "3B56DA62-488C-6CF2-5B02-DCA0538B0D4E";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix50";
	rename -uid "8FDCC79A-41F1-9BE8-BECD-D095C753D6A0";
createNode multMatrix -n "multMatrix50";
	rename -uid "DCAA5243-473D-F457-BDC5-B0AEE9581AA7";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix51";
	rename -uid "82E922DE-4423-61A1-EC88-13959EE5CAA5";
createNode multMatrix -n "multMatrix51";
	rename -uid "97657C05-49D6-1CA7-0D78-4390A90703B7";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix52";
	rename -uid "767DD4FD-4595-32D3-D382-C4ABA45D5DF4";
createNode multMatrix -n "multMatrix52";
	rename -uid "BAA44668-48C1-20D6-5E10-F38A55E6745B";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix53";
	rename -uid "FCF5BBF6-4194-E9C9-4BC8-52A049CA453F";
createNode multMatrix -n "multMatrix53";
	rename -uid "476C026D-444A-938B-775E-CAAA62477647";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix54";
	rename -uid "1871261C-4F85-D1B5-9B58-7F8E4E6ABF42";
createNode multMatrix -n "multMatrix54";
	rename -uid "C34A4E6E-473E-E86E-22A5-189F61B625C5";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix55";
	rename -uid "25520C81-4030-6AD7-7FEA-34980D3CBEDF";
createNode multMatrix -n "multMatrix55";
	rename -uid "50BE93EB-4393-87C7-2B2C-7C962291A336";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix56";
	rename -uid "9B8C46FF-4F9A-A5F5-426C-74ABFECA625B";
createNode multMatrix -n "multMatrix56";
	rename -uid "A79197D3-499E-4BC7-7CE9-4ABB8CEDD564";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix57";
	rename -uid "981D1842-42A6-9883-DD40-BE9389A061F2";
createNode multMatrix -n "multMatrix57";
	rename -uid "28C02B24-499E-64DD-EE13-B585ABF43FDC";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix58";
	rename -uid "4001A4E0-404A-1803-EF96-02A6A37B7390";
createNode multMatrix -n "multMatrix58";
	rename -uid "E4D26ADB-4C60-86F4-F1CC-1B87CD770E08";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix59";
	rename -uid "41E86CB2-478A-D25D-DCEC-8595135A2C95";
createNode multMatrix -n "multMatrix59";
	rename -uid "FB825875-47B6-FC75-93CD-C9A9028A8D0A";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix60";
	rename -uid "6766AEA5-4765-7FD4-1891-03B83C6B0B47";
createNode multMatrix -n "multMatrix60";
	rename -uid "CFA1062C-45F6-9469-F895-478749164A58";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix61";
	rename -uid "41037EF7-47C6-02BE-2FA4-E299B63899A8";
createNode multMatrix -n "multMatrix61";
	rename -uid "81505D9A-4311-BC61-B4DA-5AB62744B917";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix62";
	rename -uid "477B9432-40CF-CB22-C303-289E78DB8ABB";
createNode multMatrix -n "multMatrix62";
	rename -uid "3CEFB6AE-4C13-05AD-1F87-FE8C6C2F722B";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix63";
	rename -uid "4B0A8989-4709-FEE6-D0AD-E69230E8DEFB";
createNode multMatrix -n "multMatrix63";
	rename -uid "B3E342B7-4964-11EB-4209-5B951C64810A";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix64";
	rename -uid "C867C3D8-4BA1-FC27-540D-BDA5626B4639";
createNode multMatrix -n "multMatrix64";
	rename -uid "E3AC26D0-404A-47D2-8EF8-7D958A7CE189";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix65";
	rename -uid "970DC6C8-45E7-3532-04F9-9D8898498291";
createNode multMatrix -n "multMatrix65";
	rename -uid "8B3BBD96-411C-8889-3AE1-C085759998A1";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix66";
	rename -uid "9F78124B-43C8-9923-3CEE-1687BD5630C0";
createNode multMatrix -n "multMatrix66";
	rename -uid "07ABE0BD-4353-D775-C34D-B4B116D21642";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix67";
	rename -uid "3C7B7FFA-4398-6F87-AA3A-52AACC387ED0";
createNode multMatrix -n "multMatrix67";
	rename -uid "AC5C55F6-4445-5259-A3B9-20BBDA72E099";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix68";
	rename -uid "04559584-4084-BC3F-0150-7083513923B0";
createNode multMatrix -n "multMatrix68";
	rename -uid "7F50E961-416F-0DCA-6BCC-28B25A1F72E3";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix69";
	rename -uid "FF59ECF1-4960-3B88-D4B7-9D9F7C66C08F";
createNode multMatrix -n "multMatrix69";
	rename -uid "C689046C-4C89-68FE-FA14-149E03F16E0C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix70";
	rename -uid "CAEAD81E-4AC8-16F7-3A37-7793E014B09D";
createNode multMatrix -n "multMatrix70";
	rename -uid "D7D04A5F-410F-7BD7-3000-D49B73F6B4F4";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix71";
	rename -uid "24B1B0A9-4CB7-1765-080F-758DB1758FE3";
createNode multMatrix -n "multMatrix71";
	rename -uid "688BA6BA-4A42-6048-DC74-8DA22063DB39";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix72";
	rename -uid "E6DED9DA-494D-7036-D794-BD9CC0A404DB";
createNode multMatrix -n "multMatrix72";
	rename -uid "6C86EA42-4CFA-D63F-7169-65A838189AB5";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
connectAttr "jnt_md_root_guide_001.s" "jnt_lf_upperLeg_guide_001.is";
connectAttr "jnt_lf_upperLeg_guide_001.s" "jnt_lf_knee_guide_001.is";
connectAttr "jnt_lf_knee_guide_001.s" "jnt_lf_ankle_guide_001.is";
connectAttr "jnt_lf_ball_guide_001.s" "jnt_lf_toe_guide_001.is";
connectAttr "jnt_md_root_guide_001.s" "jnt_md_spine_guide_001.is";
connectAttr "jnt_lf_clavicle_guide_001.s" "jnt_lf_clavicle_guide_002.is";
connectAttr "jnt_lf_clavicle_guide_002.s" "jnt_lf_scapula_guide_001.is";
connectAttr "jnt_lf_scapula_guide_001.s" "jnt_lf_scapula_guide_002.is";
connectAttr "jnt_lf_scapula_guide_001.s" "jnt_lf_upperArm_guide_001.is";
connectAttr "jnt_lf_upperArm_guide_001.s" "jnt_lf_elbow_guide_001.is";
connectAttr "jnt_lf_elbow_guide_001.s" "jnt_lf_wrist_guide_001.is";
connectAttr "jnt_lf_wrist_guide_001.s" "jnt_lf_thumb_guide_001.is";
connectAttr "jnt_lf_thumb_guide_001.s" "jnt_lf_thumb_guide_002.is";
connectAttr "jnt_lf_thumb_guide_002.s" "jnt_lf_thumb_guide_003.is";
connectAttr "jnt_lf_thumb_guide_003.s" "jnt_lf_thumb_guide_004.is";
connectAttr "jnt_lf_wrist_guide_001.s" "jnt_lf_index_guide_001.is";
connectAttr "jnt_lf_index_guide_001.s" "jnt_lf_index_guide_002.is";
connectAttr "jnt_lf_index_guide_002.s" "jnt_lf_index_guide_003.is";
connectAttr "jnt_lf_index_guide_003.s" "jnt_lf_index_guide_004.is";
connectAttr "jnt_lf_index_guide_004.s" "jnt_lf_index_guide_005.is";
connectAttr "jnt_lf_wrist_guide_001.s" "jnt_lf_middle_guide_001.is";
connectAttr "jnt_lf_middle_guide_001.s" "jnt_lf_middle_guide_002.is";
connectAttr "jnt_lf_middle_guide_002.s" "jnt_lf_middle_guide_003.is";
connectAttr "jnt_lf_middle_guide_003.s" "jnt_lf_middle_guide_004.is";
connectAttr "jnt_lf_middle_guide_004.s" "jnt_lf_middle_guide_005.is";
connectAttr "jnt_lf_wrist_guide_001.s" "jnt_lf_ring_guide_001.is";
connectAttr "jnt_lf_ring_guide_001.s" "jnt_lf_ring_guide_002.is";
connectAttr "jnt_lf_ring_guide_002.s" "jnt_lf_ring_guide_003.is";
connectAttr "jnt_lf_ring_guide_003.s" "jnt_lf_ring_guide_004.is";
connectAttr "jnt_lf_ring_guide_004.s" "jnt_lf_ring_guide_005.is";
connectAttr "jnt_lf_wrist_guide_001.s" "jnt_lf_pinky_guide_001.is";
connectAttr "jnt_lf_pinky_guide_001.s" "jnt_lf_pinky_guide_002.is";
connectAttr "jnt_lf_pinky_guide_002.s" "jnt_lf_pinky_guide_003.is";
connectAttr "jnt_lf_pinky_guide_003.s" "jnt_lf_pinky_guide_004.is";
connectAttr "jnt_lf_pinky_guide_004.s" "jnt_lf_pinky_guide_005.is";
connectAttr "jnt_md_neck_guide_001.s" "jnt_md_head_guide_001.is";
connectAttr "jnt_md_head_guide_001.s" "jnt_md_head_guide_002.is";
connectAttr "decomposeMatrix3.ot" "jnt_rt_clavicle_guide_001.t";
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.ctx" "jnt_rt_clavicle_guide_001.tx"
		;
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.cty" "jnt_rt_clavicle_guide_001.ty"
		;
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.ctz" "jnt_rt_clavicle_guide_001.tz"
		;
connectAttr "decomposeMatrix3.or" "jnt_rt_clavicle_guide_001.r";
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.crx" "jnt_rt_clavicle_guide_001.rx"
		;
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.cry" "jnt_rt_clavicle_guide_001.ry"
		;
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.crz" "jnt_rt_clavicle_guide_001.rz"
		;
connectAttr "jnt_rt_clavicle_guide_001.s" "jnt_rt_clavicle_guide_002.is";
connectAttr "decomposeMatrix4.ot" "jnt_rt_clavicle_guide_002.t";
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.ctx" "jnt_rt_clavicle_guide_002.tx"
		;
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.cty" "jnt_rt_clavicle_guide_002.ty"
		;
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.ctz" "jnt_rt_clavicle_guide_002.tz"
		;
connectAttr "decomposeMatrix4.or" "jnt_rt_clavicle_guide_002.r";
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.crx" "jnt_rt_clavicle_guide_002.rx"
		;
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.cry" "jnt_rt_clavicle_guide_002.ry"
		;
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.crz" "jnt_rt_clavicle_guide_002.rz"
		;
connectAttr "jnt_rt_clavicle_guide_002.s" "jnt_rt_scapula_guide_001.is";
connectAttr "decomposeMatrix27.ot" "jnt_rt_scapula_guide_001.t";
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.ctx" "jnt_rt_scapula_guide_001.tx"
		;
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.cty" "jnt_rt_scapula_guide_001.ty"
		;
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.ctz" "jnt_rt_scapula_guide_001.tz"
		;
connectAttr "decomposeMatrix27.or" "jnt_rt_scapula_guide_001.r";
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.crx" "jnt_rt_scapula_guide_001.rx"
		;
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.cry" "jnt_rt_scapula_guide_001.ry"
		;
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.crz" "jnt_rt_scapula_guide_001.rz"
		;
connectAttr "jnt_rt_scapula_guide_001.s" "jnt_rt_scapula_guide_002.is";
connectAttr "decomposeMatrix28.ot" "jnt_rt_scapula_guide_002.t";
connectAttr "jnt_rt_scapula_guide_002_parentConstraint1.ctx" "jnt_rt_scapula_guide_002.tx"
		;
connectAttr "jnt_rt_scapula_guide_002_parentConstraint1.cty" "jnt_rt_scapula_guide_002.ty"
		;
connectAttr "jnt_rt_scapula_guide_002_parentConstraint1.ctz" "jnt_rt_scapula_guide_002.tz"
		;
connectAttr "decomposeMatrix28.or" "jnt_rt_scapula_guide_002.r";
connectAttr "jnt_rt_scapula_guide_002_parentConstraint1.crx" "jnt_rt_scapula_guide_002.rx"
		;
connectAttr "jnt_rt_scapula_guide_002_parentConstraint1.cry" "jnt_rt_scapula_guide_002.ry"
		;
connectAttr "jnt_rt_scapula_guide_002_parentConstraint1.crz" "jnt_rt_scapula_guide_002.rz"
		;
connectAttr "jnt_rt_scapula_guide_002.ro" "jnt_rt_scapula_guide_002_parentConstraint1.cro"
		;
connectAttr "jnt_rt_scapula_guide_002.pim" "jnt_rt_scapula_guide_002_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_scapula_guide_002.rp" "jnt_rt_scapula_guide_002_parentConstraint1.crp"
		;
connectAttr "jnt_rt_scapula_guide_002.rpt" "jnt_rt_scapula_guide_002_parentConstraint1.crt"
		;
connectAttr "jnt_rt_scapula_guide_002.jo" "jnt_rt_scapula_guide_002_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_scapula_guide_002.t" "jnt_rt_scapula_guide_002_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_scapula_guide_002.rp" "jnt_rt_scapula_guide_002_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_scapula_guide_002.rpt" "jnt_rt_scapula_guide_002_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_scapula_guide_002.r" "jnt_rt_scapula_guide_002_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_scapula_guide_002.ro" "jnt_rt_scapula_guide_002_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_scapula_guide_002.s" "jnt_rt_scapula_guide_002_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_scapula_guide_002.pm" "jnt_rt_scapula_guide_002_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_scapula_guide_002_parentConstraint1.w0" "jnt_rt_scapula_guide_002_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_scapula_guide_001.s" "jnt_rt_upperArm_guide_001.is";
connectAttr "decomposeMatrix34.ot" "jnt_rt_upperArm_guide_001.t";
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.ctx" "jnt_rt_upperArm_guide_001.tx"
		;
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.cty" "jnt_rt_upperArm_guide_001.ty"
		;
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.ctz" "jnt_rt_upperArm_guide_001.tz"
		;
connectAttr "decomposeMatrix34.or" "jnt_rt_upperArm_guide_001.r";
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.crx" "jnt_rt_upperArm_guide_001.rx"
		;
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.cry" "jnt_rt_upperArm_guide_001.ry"
		;
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.crz" "jnt_rt_upperArm_guide_001.rz"
		;
connectAttr "jnt_rt_upperArm_guide_001.s" "jnt_rt_elbow_guide_001.is";
connectAttr "decomposeMatrix5.ot" "jnt_rt_elbow_guide_001.t";
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.ctx" "jnt_rt_elbow_guide_001.tx"
		;
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.cty" "jnt_rt_elbow_guide_001.ty"
		;
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.ctz" "jnt_rt_elbow_guide_001.tz"
		;
connectAttr "decomposeMatrix5.or" "jnt_rt_elbow_guide_001.r";
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.crx" "jnt_rt_elbow_guide_001.rx"
		;
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.cry" "jnt_rt_elbow_guide_001.ry"
		;
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.crz" "jnt_rt_elbow_guide_001.rz"
		;
connectAttr "jnt_rt_elbow_guide_001.s" "jnt_rt_wrist_guide_001.is";
connectAttr "decomposeMatrix36.ot" "jnt_rt_wrist_guide_001.t";
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.ctx" "jnt_rt_wrist_guide_001.tx"
		;
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.cty" "jnt_rt_wrist_guide_001.ty"
		;
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.ctz" "jnt_rt_wrist_guide_001.tz"
		;
connectAttr "decomposeMatrix36.or" "jnt_rt_wrist_guide_001.r";
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.crx" "jnt_rt_wrist_guide_001.rx"
		;
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.cry" "jnt_rt_wrist_guide_001.ry"
		;
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.crz" "jnt_rt_wrist_guide_001.rz"
		;
connectAttr "jnt_rt_wrist_guide_001.s" "jnt_rt_thumb_guide_001.is";
connectAttr "decomposeMatrix29.ot" "jnt_rt_thumb_guide_001.t";
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.ctx" "jnt_rt_thumb_guide_001.tx"
		;
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.cty" "jnt_rt_thumb_guide_001.ty"
		;
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.ctz" "jnt_rt_thumb_guide_001.tz"
		;
connectAttr "decomposeMatrix29.or" "jnt_rt_thumb_guide_001.r";
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.crx" "jnt_rt_thumb_guide_001.rx"
		;
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.cry" "jnt_rt_thumb_guide_001.ry"
		;
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.crz" "jnt_rt_thumb_guide_001.rz"
		;
connectAttr "jnt_rt_thumb_guide_001.s" "jnt_rt_thumb_guide_002.is";
connectAttr "decomposeMatrix30.ot" "jnt_rt_thumb_guide_002.t";
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.ctx" "jnt_rt_thumb_guide_002.tx"
		;
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.cty" "jnt_rt_thumb_guide_002.ty"
		;
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.ctz" "jnt_rt_thumb_guide_002.tz"
		;
connectAttr "decomposeMatrix30.or" "jnt_rt_thumb_guide_002.r";
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.crx" "jnt_rt_thumb_guide_002.rx"
		;
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.cry" "jnt_rt_thumb_guide_002.ry"
		;
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.crz" "jnt_rt_thumb_guide_002.rz"
		;
connectAttr "jnt_rt_thumb_guide_002.s" "jnt_rt_thumb_guide_003.is";
connectAttr "decomposeMatrix31.ot" "jnt_rt_thumb_guide_003.t";
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.ctx" "jnt_rt_thumb_guide_003.tx"
		;
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.cty" "jnt_rt_thumb_guide_003.ty"
		;
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.ctz" "jnt_rt_thumb_guide_003.tz"
		;
connectAttr "decomposeMatrix31.or" "jnt_rt_thumb_guide_003.r";
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.crx" "jnt_rt_thumb_guide_003.rx"
		;
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.cry" "jnt_rt_thumb_guide_003.ry"
		;
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.crz" "jnt_rt_thumb_guide_003.rz"
		;
connectAttr "jnt_rt_thumb_guide_003.s" "jnt_rt_thumb_guide_004.is";
connectAttr "decomposeMatrix32.ot" "jnt_rt_thumb_guide_004.t";
connectAttr "jnt_rt_thumb_guide_004_parentConstraint1.ctx" "jnt_rt_thumb_guide_004.tx"
		;
connectAttr "jnt_rt_thumb_guide_004_parentConstraint1.cty" "jnt_rt_thumb_guide_004.ty"
		;
connectAttr "jnt_rt_thumb_guide_004_parentConstraint1.ctz" "jnt_rt_thumb_guide_004.tz"
		;
connectAttr "decomposeMatrix32.or" "jnt_rt_thumb_guide_004.r";
connectAttr "jnt_rt_thumb_guide_004_parentConstraint1.crx" "jnt_rt_thumb_guide_004.rx"
		;
connectAttr "jnt_rt_thumb_guide_004_parentConstraint1.cry" "jnt_rt_thumb_guide_004.ry"
		;
connectAttr "jnt_rt_thumb_guide_004_parentConstraint1.crz" "jnt_rt_thumb_guide_004.rz"
		;
connectAttr "jnt_rt_thumb_guide_004.ro" "jnt_rt_thumb_guide_004_parentConstraint1.cro"
		;
connectAttr "jnt_rt_thumb_guide_004.pim" "jnt_rt_thumb_guide_004_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_thumb_guide_004.rp" "jnt_rt_thumb_guide_004_parentConstraint1.crp"
		;
connectAttr "jnt_rt_thumb_guide_004.rpt" "jnt_rt_thumb_guide_004_parentConstraint1.crt"
		;
connectAttr "jnt_rt_thumb_guide_004.jo" "jnt_rt_thumb_guide_004_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_thumb_guide_004.t" "jnt_rt_thumb_guide_004_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_thumb_guide_004.rp" "jnt_rt_thumb_guide_004_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_thumb_guide_004.rpt" "jnt_rt_thumb_guide_004_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_thumb_guide_004.r" "jnt_rt_thumb_guide_004_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_thumb_guide_004.ro" "jnt_rt_thumb_guide_004_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_thumb_guide_004.s" "jnt_rt_thumb_guide_004_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_thumb_guide_004.pm" "jnt_rt_thumb_guide_004_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_thumb_guide_004_parentConstraint1.w0" "jnt_rt_thumb_guide_004_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_thumb_guide_003.ro" "jnt_rt_thumb_guide_003_parentConstraint1.cro"
		;
connectAttr "jnt_rt_thumb_guide_003.pim" "jnt_rt_thumb_guide_003_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_thumb_guide_003.rp" "jnt_rt_thumb_guide_003_parentConstraint1.crp"
		;
connectAttr "jnt_rt_thumb_guide_003.rpt" "jnt_rt_thumb_guide_003_parentConstraint1.crt"
		;
connectAttr "jnt_rt_thumb_guide_003.jo" "jnt_rt_thumb_guide_003_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_thumb_guide_003.t" "jnt_rt_thumb_guide_003_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_thumb_guide_003.rp" "jnt_rt_thumb_guide_003_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_thumb_guide_003.rpt" "jnt_rt_thumb_guide_003_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_thumb_guide_003.r" "jnt_rt_thumb_guide_003_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_thumb_guide_003.ro" "jnt_rt_thumb_guide_003_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_thumb_guide_003.s" "jnt_rt_thumb_guide_003_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_thumb_guide_003.pm" "jnt_rt_thumb_guide_003_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.w0" "jnt_rt_thumb_guide_003_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_thumb_guide_002.ro" "jnt_rt_thumb_guide_002_parentConstraint1.cro"
		;
connectAttr "jnt_rt_thumb_guide_002.pim" "jnt_rt_thumb_guide_002_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_thumb_guide_002.rp" "jnt_rt_thumb_guide_002_parentConstraint1.crp"
		;
connectAttr "jnt_rt_thumb_guide_002.rpt" "jnt_rt_thumb_guide_002_parentConstraint1.crt"
		;
connectAttr "jnt_rt_thumb_guide_002.jo" "jnt_rt_thumb_guide_002_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_thumb_guide_002.t" "jnt_rt_thumb_guide_002_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_thumb_guide_002.rp" "jnt_rt_thumb_guide_002_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_thumb_guide_002.rpt" "jnt_rt_thumb_guide_002_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_thumb_guide_002.r" "jnt_rt_thumb_guide_002_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_thumb_guide_002.ro" "jnt_rt_thumb_guide_002_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_thumb_guide_002.s" "jnt_rt_thumb_guide_002_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_thumb_guide_002.pm" "jnt_rt_thumb_guide_002_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.w0" "jnt_rt_thumb_guide_002_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_thumb_guide_001.ro" "jnt_rt_thumb_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_thumb_guide_001.pim" "jnt_rt_thumb_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_thumb_guide_001.rp" "jnt_rt_thumb_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_thumb_guide_001.rpt" "jnt_rt_thumb_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_thumb_guide_001.jo" "jnt_rt_thumb_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_thumb_guide_001.t" "jnt_rt_thumb_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_thumb_guide_001.rp" "jnt_rt_thumb_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_thumb_guide_001.rpt" "jnt_rt_thumb_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_thumb_guide_001.r" "jnt_rt_thumb_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_thumb_guide_001.ro" "jnt_rt_thumb_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_thumb_guide_001.s" "jnt_rt_thumb_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_thumb_guide_001.pm" "jnt_rt_thumb_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.w0" "jnt_rt_thumb_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_wrist_guide_001.s" "jnt_rt_index_guide_001.is";
connectAttr "decomposeMatrix6.ot" "jnt_rt_index_guide_001.t";
connectAttr "jnt_rt_index_guide_001_parentConstraint1.ctx" "jnt_rt_index_guide_001.tx"
		;
connectAttr "jnt_rt_index_guide_001_parentConstraint1.cty" "jnt_rt_index_guide_001.ty"
		;
connectAttr "jnt_rt_index_guide_001_parentConstraint1.ctz" "jnt_rt_index_guide_001.tz"
		;
connectAttr "decomposeMatrix6.or" "jnt_rt_index_guide_001.r";
connectAttr "jnt_rt_index_guide_001_parentConstraint1.crx" "jnt_rt_index_guide_001.rx"
		;
connectAttr "jnt_rt_index_guide_001_parentConstraint1.cry" "jnt_rt_index_guide_001.ry"
		;
connectAttr "jnt_rt_index_guide_001_parentConstraint1.crz" "jnt_rt_index_guide_001.rz"
		;
connectAttr "jnt_rt_index_guide_001.s" "jnt_rt_index_guide_002.is";
connectAttr "decomposeMatrix7.ot" "jnt_rt_index_guide_002.t";
connectAttr "jnt_rt_index_guide_002_parentConstraint1.ctx" "jnt_rt_index_guide_002.tx"
		;
connectAttr "jnt_rt_index_guide_002_parentConstraint1.cty" "jnt_rt_index_guide_002.ty"
		;
connectAttr "jnt_rt_index_guide_002_parentConstraint1.ctz" "jnt_rt_index_guide_002.tz"
		;
connectAttr "decomposeMatrix7.or" "jnt_rt_index_guide_002.r";
connectAttr "jnt_rt_index_guide_002_parentConstraint1.crx" "jnt_rt_index_guide_002.rx"
		;
connectAttr "jnt_rt_index_guide_002_parentConstraint1.cry" "jnt_rt_index_guide_002.ry"
		;
connectAttr "jnt_rt_index_guide_002_parentConstraint1.crz" "jnt_rt_index_guide_002.rz"
		;
connectAttr "jnt_rt_index_guide_002.s" "jnt_rt_index_guide_003.is";
connectAttr "decomposeMatrix8.ot" "jnt_rt_index_guide_003.t";
connectAttr "jnt_rt_index_guide_003_parentConstraint1.ctx" "jnt_rt_index_guide_003.tx"
		;
connectAttr "jnt_rt_index_guide_003_parentConstraint1.cty" "jnt_rt_index_guide_003.ty"
		;
connectAttr "jnt_rt_index_guide_003_parentConstraint1.ctz" "jnt_rt_index_guide_003.tz"
		;
connectAttr "decomposeMatrix8.or" "jnt_rt_index_guide_003.r";
connectAttr "jnt_rt_index_guide_003_parentConstraint1.crx" "jnt_rt_index_guide_003.rx"
		;
connectAttr "jnt_rt_index_guide_003_parentConstraint1.cry" "jnt_rt_index_guide_003.ry"
		;
connectAttr "jnt_rt_index_guide_003_parentConstraint1.crz" "jnt_rt_index_guide_003.rz"
		;
connectAttr "jnt_rt_index_guide_003.s" "jnt_rt_index_guide_004.is";
connectAttr "decomposeMatrix9.ot" "jnt_rt_index_guide_004.t";
connectAttr "jnt_rt_index_guide_004_parentConstraint1.ctx" "jnt_rt_index_guide_004.tx"
		;
connectAttr "jnt_rt_index_guide_004_parentConstraint1.cty" "jnt_rt_index_guide_004.ty"
		;
connectAttr "jnt_rt_index_guide_004_parentConstraint1.ctz" "jnt_rt_index_guide_004.tz"
		;
connectAttr "decomposeMatrix9.or" "jnt_rt_index_guide_004.r";
connectAttr "jnt_rt_index_guide_004_parentConstraint1.crx" "jnt_rt_index_guide_004.rx"
		;
connectAttr "jnt_rt_index_guide_004_parentConstraint1.cry" "jnt_rt_index_guide_004.ry"
		;
connectAttr "jnt_rt_index_guide_004_parentConstraint1.crz" "jnt_rt_index_guide_004.rz"
		;
connectAttr "jnt_rt_index_guide_004.s" "jnt_rt_index_guide_005.is";
connectAttr "decomposeMatrix10.ot" "jnt_rt_index_guide_005.t";
connectAttr "jnt_rt_index_guide_005_parentConstraint1.ctx" "jnt_rt_index_guide_005.tx"
		;
connectAttr "jnt_rt_index_guide_005_parentConstraint1.cty" "jnt_rt_index_guide_005.ty"
		;
connectAttr "jnt_rt_index_guide_005_parentConstraint1.ctz" "jnt_rt_index_guide_005.tz"
		;
connectAttr "decomposeMatrix10.or" "jnt_rt_index_guide_005.r";
connectAttr "jnt_rt_index_guide_005_parentConstraint1.crx" "jnt_rt_index_guide_005.rx"
		;
connectAttr "jnt_rt_index_guide_005_parentConstraint1.cry" "jnt_rt_index_guide_005.ry"
		;
connectAttr "jnt_rt_index_guide_005_parentConstraint1.crz" "jnt_rt_index_guide_005.rz"
		;
connectAttr "jnt_rt_index_guide_005.ro" "jnt_rt_index_guide_005_parentConstraint1.cro"
		;
connectAttr "jnt_rt_index_guide_005.pim" "jnt_rt_index_guide_005_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_index_guide_005.rp" "jnt_rt_index_guide_005_parentConstraint1.crp"
		;
connectAttr "jnt_rt_index_guide_005.rpt" "jnt_rt_index_guide_005_parentConstraint1.crt"
		;
connectAttr "jnt_rt_index_guide_005.jo" "jnt_rt_index_guide_005_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_index_guide_005.t" "jnt_rt_index_guide_005_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_index_guide_005.rp" "jnt_rt_index_guide_005_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_index_guide_005.rpt" "jnt_rt_index_guide_005_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_index_guide_005.r" "jnt_rt_index_guide_005_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_index_guide_005.ro" "jnt_rt_index_guide_005_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_index_guide_005.s" "jnt_rt_index_guide_005_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_index_guide_005.pm" "jnt_rt_index_guide_005_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_index_guide_005_parentConstraint1.w0" "jnt_rt_index_guide_005_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_index_guide_004.ro" "jnt_rt_index_guide_004_parentConstraint1.cro"
		;
connectAttr "jnt_rt_index_guide_004.pim" "jnt_rt_index_guide_004_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_index_guide_004.rp" "jnt_rt_index_guide_004_parentConstraint1.crp"
		;
connectAttr "jnt_rt_index_guide_004.rpt" "jnt_rt_index_guide_004_parentConstraint1.crt"
		;
connectAttr "jnt_rt_index_guide_004.jo" "jnt_rt_index_guide_004_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_index_guide_004.t" "jnt_rt_index_guide_004_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_index_guide_004.rp" "jnt_rt_index_guide_004_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_index_guide_004.rpt" "jnt_rt_index_guide_004_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_index_guide_004.r" "jnt_rt_index_guide_004_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_index_guide_004.ro" "jnt_rt_index_guide_004_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_index_guide_004.s" "jnt_rt_index_guide_004_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_index_guide_004.pm" "jnt_rt_index_guide_004_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_index_guide_004_parentConstraint1.w0" "jnt_rt_index_guide_004_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_index_guide_003.ro" "jnt_rt_index_guide_003_parentConstraint1.cro"
		;
connectAttr "jnt_rt_index_guide_003.pim" "jnt_rt_index_guide_003_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_index_guide_003.rp" "jnt_rt_index_guide_003_parentConstraint1.crp"
		;
connectAttr "jnt_rt_index_guide_003.rpt" "jnt_rt_index_guide_003_parentConstraint1.crt"
		;
connectAttr "jnt_rt_index_guide_003.jo" "jnt_rt_index_guide_003_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_index_guide_003.t" "jnt_rt_index_guide_003_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_index_guide_003.rp" "jnt_rt_index_guide_003_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_index_guide_003.rpt" "jnt_rt_index_guide_003_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_index_guide_003.r" "jnt_rt_index_guide_003_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_index_guide_003.ro" "jnt_rt_index_guide_003_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_index_guide_003.s" "jnt_rt_index_guide_003_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_index_guide_003.pm" "jnt_rt_index_guide_003_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_index_guide_003_parentConstraint1.w0" "jnt_rt_index_guide_003_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_index_guide_002.ro" "jnt_rt_index_guide_002_parentConstraint1.cro"
		;
connectAttr "jnt_rt_index_guide_002.pim" "jnt_rt_index_guide_002_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_index_guide_002.rp" "jnt_rt_index_guide_002_parentConstraint1.crp"
		;
connectAttr "jnt_rt_index_guide_002.rpt" "jnt_rt_index_guide_002_parentConstraint1.crt"
		;
connectAttr "jnt_rt_index_guide_002.jo" "jnt_rt_index_guide_002_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_index_guide_002.t" "jnt_rt_index_guide_002_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_index_guide_002.rp" "jnt_rt_index_guide_002_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_index_guide_002.rpt" "jnt_rt_index_guide_002_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_index_guide_002.r" "jnt_rt_index_guide_002_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_index_guide_002.ro" "jnt_rt_index_guide_002_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_index_guide_002.s" "jnt_rt_index_guide_002_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_index_guide_002.pm" "jnt_rt_index_guide_002_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_index_guide_002_parentConstraint1.w0" "jnt_rt_index_guide_002_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_index_guide_001.ro" "jnt_rt_index_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_index_guide_001.pim" "jnt_rt_index_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_index_guide_001.rp" "jnt_rt_index_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_index_guide_001.rpt" "jnt_rt_index_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_index_guide_001.jo" "jnt_rt_index_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_index_guide_001.t" "jnt_rt_index_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_index_guide_001.rp" "jnt_rt_index_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_index_guide_001.rpt" "jnt_rt_index_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_index_guide_001.r" "jnt_rt_index_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_index_guide_001.ro" "jnt_rt_index_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_index_guide_001.s" "jnt_rt_index_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_index_guide_001.pm" "jnt_rt_index_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_index_guide_001_parentConstraint1.w0" "jnt_rt_index_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_wrist_guide_001.s" "jnt_rt_middle_guide_001.is";
connectAttr "decomposeMatrix12.ot" "jnt_rt_middle_guide_001.t";
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.ctx" "jnt_rt_middle_guide_001.tx"
		;
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.cty" "jnt_rt_middle_guide_001.ty"
		;
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.ctz" "jnt_rt_middle_guide_001.tz"
		;
connectAttr "decomposeMatrix12.or" "jnt_rt_middle_guide_001.r";
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.crx" "jnt_rt_middle_guide_001.rx"
		;
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.cry" "jnt_rt_middle_guide_001.ry"
		;
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.crz" "jnt_rt_middle_guide_001.rz"
		;
connectAttr "jnt_rt_middle_guide_001.s" "jnt_rt_middle_guide_002.is";
connectAttr "decomposeMatrix13.ot" "jnt_rt_middle_guide_002.t";
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.ctx" "jnt_rt_middle_guide_002.tx"
		;
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.cty" "jnt_rt_middle_guide_002.ty"
		;
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.ctz" "jnt_rt_middle_guide_002.tz"
		;
connectAttr "decomposeMatrix13.or" "jnt_rt_middle_guide_002.r";
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.crx" "jnt_rt_middle_guide_002.rx"
		;
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.cry" "jnt_rt_middle_guide_002.ry"
		;
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.crz" "jnt_rt_middle_guide_002.rz"
		;
connectAttr "jnt_rt_middle_guide_002.s" "jnt_rt_middle_guide_003.is";
connectAttr "decomposeMatrix14.ot" "jnt_rt_middle_guide_003.t";
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.ctx" "jnt_rt_middle_guide_003.tx"
		;
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.cty" "jnt_rt_middle_guide_003.ty"
		;
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.ctz" "jnt_rt_middle_guide_003.tz"
		;
connectAttr "decomposeMatrix14.or" "jnt_rt_middle_guide_003.r";
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.crx" "jnt_rt_middle_guide_003.rx"
		;
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.cry" "jnt_rt_middle_guide_003.ry"
		;
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.crz" "jnt_rt_middle_guide_003.rz"
		;
connectAttr "jnt_rt_middle_guide_003.s" "jnt_rt_middle_guide_004.is";
connectAttr "decomposeMatrix15.ot" "jnt_rt_middle_guide_004.t";
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.ctx" "jnt_rt_middle_guide_004.tx"
		;
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.cty" "jnt_rt_middle_guide_004.ty"
		;
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.ctz" "jnt_rt_middle_guide_004.tz"
		;
connectAttr "decomposeMatrix15.or" "jnt_rt_middle_guide_004.r";
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.crx" "jnt_rt_middle_guide_004.rx"
		;
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.cry" "jnt_rt_middle_guide_004.ry"
		;
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.crz" "jnt_rt_middle_guide_004.rz"
		;
connectAttr "jnt_rt_middle_guide_004.s" "jnt_rt_middle_guide_005.is";
connectAttr "decomposeMatrix16.ot" "jnt_rt_middle_guide_005.t";
connectAttr "jnt_rt_middle_guide_005_parentConstraint1.ctx" "jnt_rt_middle_guide_005.tx"
		;
connectAttr "jnt_rt_middle_guide_005_parentConstraint1.cty" "jnt_rt_middle_guide_005.ty"
		;
connectAttr "jnt_rt_middle_guide_005_parentConstraint1.ctz" "jnt_rt_middle_guide_005.tz"
		;
connectAttr "decomposeMatrix16.or" "jnt_rt_middle_guide_005.r";
connectAttr "jnt_rt_middle_guide_005_parentConstraint1.crx" "jnt_rt_middle_guide_005.rx"
		;
connectAttr "jnt_rt_middle_guide_005_parentConstraint1.cry" "jnt_rt_middle_guide_005.ry"
		;
connectAttr "jnt_rt_middle_guide_005_parentConstraint1.crz" "jnt_rt_middle_guide_005.rz"
		;
connectAttr "jnt_rt_middle_guide_005.ro" "jnt_rt_middle_guide_005_parentConstraint1.cro"
		;
connectAttr "jnt_rt_middle_guide_005.pim" "jnt_rt_middle_guide_005_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_middle_guide_005.rp" "jnt_rt_middle_guide_005_parentConstraint1.crp"
		;
connectAttr "jnt_rt_middle_guide_005.rpt" "jnt_rt_middle_guide_005_parentConstraint1.crt"
		;
connectAttr "jnt_rt_middle_guide_005.jo" "jnt_rt_middle_guide_005_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_middle_guide_005.t" "jnt_rt_middle_guide_005_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_middle_guide_005.rp" "jnt_rt_middle_guide_005_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_middle_guide_005.rpt" "jnt_rt_middle_guide_005_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_middle_guide_005.r" "jnt_rt_middle_guide_005_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_middle_guide_005.ro" "jnt_rt_middle_guide_005_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_middle_guide_005.s" "jnt_rt_middle_guide_005_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_middle_guide_005.pm" "jnt_rt_middle_guide_005_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_middle_guide_005_parentConstraint1.w0" "jnt_rt_middle_guide_005_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_middle_guide_004.ro" "jnt_rt_middle_guide_004_parentConstraint1.cro"
		;
connectAttr "jnt_rt_middle_guide_004.pim" "jnt_rt_middle_guide_004_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_middle_guide_004.rp" "jnt_rt_middle_guide_004_parentConstraint1.crp"
		;
connectAttr "jnt_rt_middle_guide_004.rpt" "jnt_rt_middle_guide_004_parentConstraint1.crt"
		;
connectAttr "jnt_rt_middle_guide_004.jo" "jnt_rt_middle_guide_004_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_middle_guide_004.t" "jnt_rt_middle_guide_004_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_middle_guide_004.rp" "jnt_rt_middle_guide_004_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_middle_guide_004.rpt" "jnt_rt_middle_guide_004_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_middle_guide_004.r" "jnt_rt_middle_guide_004_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_middle_guide_004.ro" "jnt_rt_middle_guide_004_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_middle_guide_004.s" "jnt_rt_middle_guide_004_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_middle_guide_004.pm" "jnt_rt_middle_guide_004_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.w0" "jnt_rt_middle_guide_004_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_middle_guide_003.ro" "jnt_rt_middle_guide_003_parentConstraint1.cro"
		;
connectAttr "jnt_rt_middle_guide_003.pim" "jnt_rt_middle_guide_003_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_middle_guide_003.rp" "jnt_rt_middle_guide_003_parentConstraint1.crp"
		;
connectAttr "jnt_rt_middle_guide_003.rpt" "jnt_rt_middle_guide_003_parentConstraint1.crt"
		;
connectAttr "jnt_rt_middle_guide_003.jo" "jnt_rt_middle_guide_003_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_middle_guide_003.t" "jnt_rt_middle_guide_003_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_middle_guide_003.rp" "jnt_rt_middle_guide_003_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_middle_guide_003.rpt" "jnt_rt_middle_guide_003_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_middle_guide_003.r" "jnt_rt_middle_guide_003_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_middle_guide_003.ro" "jnt_rt_middle_guide_003_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_middle_guide_003.s" "jnt_rt_middle_guide_003_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_middle_guide_003.pm" "jnt_rt_middle_guide_003_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.w0" "jnt_rt_middle_guide_003_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_middle_guide_002.ro" "jnt_rt_middle_guide_002_parentConstraint1.cro"
		;
connectAttr "jnt_rt_middle_guide_002.pim" "jnt_rt_middle_guide_002_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_middle_guide_002.rp" "jnt_rt_middle_guide_002_parentConstraint1.crp"
		;
connectAttr "jnt_rt_middle_guide_002.rpt" "jnt_rt_middle_guide_002_parentConstraint1.crt"
		;
connectAttr "jnt_rt_middle_guide_002.jo" "jnt_rt_middle_guide_002_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_middle_guide_002.t" "jnt_rt_middle_guide_002_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_middle_guide_002.rp" "jnt_rt_middle_guide_002_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_middle_guide_002.rpt" "jnt_rt_middle_guide_002_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_middle_guide_002.r" "jnt_rt_middle_guide_002_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_middle_guide_002.ro" "jnt_rt_middle_guide_002_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_middle_guide_002.s" "jnt_rt_middle_guide_002_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_middle_guide_002.pm" "jnt_rt_middle_guide_002_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.w0" "jnt_rt_middle_guide_002_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_middle_guide_001.ro" "jnt_rt_middle_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_middle_guide_001.pim" "jnt_rt_middle_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_middle_guide_001.rp" "jnt_rt_middle_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_middle_guide_001.rpt" "jnt_rt_middle_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_middle_guide_001.jo" "jnt_rt_middle_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_middle_guide_001.t" "jnt_rt_middle_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_middle_guide_001.rp" "jnt_rt_middle_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_middle_guide_001.rpt" "jnt_rt_middle_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_middle_guide_001.r" "jnt_rt_middle_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_middle_guide_001.ro" "jnt_rt_middle_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_middle_guide_001.s" "jnt_rt_middle_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_middle_guide_001.pm" "jnt_rt_middle_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.w0" "jnt_rt_middle_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_wrist_guide_001.s" "jnt_rt_ring_guide_001.is";
connectAttr "decomposeMatrix22.ot" "jnt_rt_ring_guide_001.t";
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.ctx" "jnt_rt_ring_guide_001.tx"
		;
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.cty" "jnt_rt_ring_guide_001.ty"
		;
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.ctz" "jnt_rt_ring_guide_001.tz"
		;
connectAttr "decomposeMatrix22.or" "jnt_rt_ring_guide_001.r";
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.crx" "jnt_rt_ring_guide_001.rx"
		;
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.cry" "jnt_rt_ring_guide_001.ry"
		;
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.crz" "jnt_rt_ring_guide_001.rz"
		;
connectAttr "jnt_rt_ring_guide_001.s" "jnt_rt_ring_guide_002.is";
connectAttr "decomposeMatrix23.ot" "jnt_rt_ring_guide_002.t";
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.ctx" "jnt_rt_ring_guide_002.tx"
		;
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.cty" "jnt_rt_ring_guide_002.ty"
		;
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.ctz" "jnt_rt_ring_guide_002.tz"
		;
connectAttr "decomposeMatrix23.or" "jnt_rt_ring_guide_002.r";
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.crx" "jnt_rt_ring_guide_002.rx"
		;
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.cry" "jnt_rt_ring_guide_002.ry"
		;
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.crz" "jnt_rt_ring_guide_002.rz"
		;
connectAttr "jnt_rt_ring_guide_002.s" "jnt_rt_ring_guide_003.is";
connectAttr "decomposeMatrix24.ot" "jnt_rt_ring_guide_003.t";
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.ctx" "jnt_rt_ring_guide_003.tx"
		;
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.cty" "jnt_rt_ring_guide_003.ty"
		;
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.ctz" "jnt_rt_ring_guide_003.tz"
		;
connectAttr "decomposeMatrix24.or" "jnt_rt_ring_guide_003.r";
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.crx" "jnt_rt_ring_guide_003.rx"
		;
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.cry" "jnt_rt_ring_guide_003.ry"
		;
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.crz" "jnt_rt_ring_guide_003.rz"
		;
connectAttr "jnt_rt_ring_guide_003.s" "jnt_rt_ring_guide_004.is";
connectAttr "decomposeMatrix25.ot" "jnt_rt_ring_guide_004.t";
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.ctx" "jnt_rt_ring_guide_004.tx"
		;
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.cty" "jnt_rt_ring_guide_004.ty"
		;
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.ctz" "jnt_rt_ring_guide_004.tz"
		;
connectAttr "decomposeMatrix25.or" "jnt_rt_ring_guide_004.r";
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.crx" "jnt_rt_ring_guide_004.rx"
		;
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.cry" "jnt_rt_ring_guide_004.ry"
		;
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.crz" "jnt_rt_ring_guide_004.rz"
		;
connectAttr "jnt_rt_ring_guide_004.s" "jnt_rt_ring_guide_005.is";
connectAttr "decomposeMatrix26.ot" "jnt_rt_ring_guide_005.t";
connectAttr "jnt_rt_ring_guide_005_parentConstraint1.ctx" "jnt_rt_ring_guide_005.tx"
		;
connectAttr "jnt_rt_ring_guide_005_parentConstraint1.cty" "jnt_rt_ring_guide_005.ty"
		;
connectAttr "jnt_rt_ring_guide_005_parentConstraint1.ctz" "jnt_rt_ring_guide_005.tz"
		;
connectAttr "decomposeMatrix26.or" "jnt_rt_ring_guide_005.r";
connectAttr "jnt_rt_ring_guide_005_parentConstraint1.crx" "jnt_rt_ring_guide_005.rx"
		;
connectAttr "jnt_rt_ring_guide_005_parentConstraint1.cry" "jnt_rt_ring_guide_005.ry"
		;
connectAttr "jnt_rt_ring_guide_005_parentConstraint1.crz" "jnt_rt_ring_guide_005.rz"
		;
connectAttr "jnt_rt_ring_guide_005.ro" "jnt_rt_ring_guide_005_parentConstraint1.cro"
		;
connectAttr "jnt_rt_ring_guide_005.pim" "jnt_rt_ring_guide_005_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_ring_guide_005.rp" "jnt_rt_ring_guide_005_parentConstraint1.crp"
		;
connectAttr "jnt_rt_ring_guide_005.rpt" "jnt_rt_ring_guide_005_parentConstraint1.crt"
		;
connectAttr "jnt_rt_ring_guide_005.jo" "jnt_rt_ring_guide_005_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_ring_guide_005.t" "jnt_rt_ring_guide_005_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_ring_guide_005.rp" "jnt_rt_ring_guide_005_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_ring_guide_005.rpt" "jnt_rt_ring_guide_005_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_ring_guide_005.r" "jnt_rt_ring_guide_005_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_ring_guide_005.ro" "jnt_rt_ring_guide_005_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_ring_guide_005.s" "jnt_rt_ring_guide_005_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_ring_guide_005.pm" "jnt_rt_ring_guide_005_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_ring_guide_005_parentConstraint1.w0" "jnt_rt_ring_guide_005_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_ring_guide_004.ro" "jnt_rt_ring_guide_004_parentConstraint1.cro"
		;
connectAttr "jnt_rt_ring_guide_004.pim" "jnt_rt_ring_guide_004_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_ring_guide_004.rp" "jnt_rt_ring_guide_004_parentConstraint1.crp"
		;
connectAttr "jnt_rt_ring_guide_004.rpt" "jnt_rt_ring_guide_004_parentConstraint1.crt"
		;
connectAttr "jnt_rt_ring_guide_004.jo" "jnt_rt_ring_guide_004_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_ring_guide_004.t" "jnt_rt_ring_guide_004_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_ring_guide_004.rp" "jnt_rt_ring_guide_004_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_ring_guide_004.rpt" "jnt_rt_ring_guide_004_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_ring_guide_004.r" "jnt_rt_ring_guide_004_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_ring_guide_004.ro" "jnt_rt_ring_guide_004_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_ring_guide_004.s" "jnt_rt_ring_guide_004_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_ring_guide_004.pm" "jnt_rt_ring_guide_004_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.w0" "jnt_rt_ring_guide_004_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_ring_guide_003.ro" "jnt_rt_ring_guide_003_parentConstraint1.cro"
		;
connectAttr "jnt_rt_ring_guide_003.pim" "jnt_rt_ring_guide_003_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_ring_guide_003.rp" "jnt_rt_ring_guide_003_parentConstraint1.crp"
		;
connectAttr "jnt_rt_ring_guide_003.rpt" "jnt_rt_ring_guide_003_parentConstraint1.crt"
		;
connectAttr "jnt_rt_ring_guide_003.jo" "jnt_rt_ring_guide_003_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_ring_guide_003.t" "jnt_rt_ring_guide_003_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_ring_guide_003.rp" "jnt_rt_ring_guide_003_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_ring_guide_003.rpt" "jnt_rt_ring_guide_003_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_ring_guide_003.r" "jnt_rt_ring_guide_003_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_ring_guide_003.ro" "jnt_rt_ring_guide_003_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_ring_guide_003.s" "jnt_rt_ring_guide_003_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_ring_guide_003.pm" "jnt_rt_ring_guide_003_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.w0" "jnt_rt_ring_guide_003_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_ring_guide_002.ro" "jnt_rt_ring_guide_002_parentConstraint1.cro"
		;
connectAttr "jnt_rt_ring_guide_002.pim" "jnt_rt_ring_guide_002_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_ring_guide_002.rp" "jnt_rt_ring_guide_002_parentConstraint1.crp"
		;
connectAttr "jnt_rt_ring_guide_002.rpt" "jnt_rt_ring_guide_002_parentConstraint1.crt"
		;
connectAttr "jnt_rt_ring_guide_002.jo" "jnt_rt_ring_guide_002_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_ring_guide_002.t" "jnt_rt_ring_guide_002_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_ring_guide_002.rp" "jnt_rt_ring_guide_002_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_ring_guide_002.rpt" "jnt_rt_ring_guide_002_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_ring_guide_002.r" "jnt_rt_ring_guide_002_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_ring_guide_002.ro" "jnt_rt_ring_guide_002_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_ring_guide_002.s" "jnt_rt_ring_guide_002_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_ring_guide_002.pm" "jnt_rt_ring_guide_002_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.w0" "jnt_rt_ring_guide_002_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_ring_guide_001.ro" "jnt_rt_ring_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_ring_guide_001.pim" "jnt_rt_ring_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_ring_guide_001.rp" "jnt_rt_ring_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_ring_guide_001.rpt" "jnt_rt_ring_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_ring_guide_001.jo" "jnt_rt_ring_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_ring_guide_001.t" "jnt_rt_ring_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_ring_guide_001.rp" "jnt_rt_ring_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_ring_guide_001.rpt" "jnt_rt_ring_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_ring_guide_001.r" "jnt_rt_ring_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_ring_guide_001.ro" "jnt_rt_ring_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_ring_guide_001.s" "jnt_rt_ring_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_ring_guide_001.pm" "jnt_rt_ring_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.w0" "jnt_rt_ring_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_wrist_guide_001.s" "jnt_rt_pinky_guide_001.is";
connectAttr "decomposeMatrix17.ot" "jnt_rt_pinky_guide_001.t";
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.ctx" "jnt_rt_pinky_guide_001.tx"
		;
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.cty" "jnt_rt_pinky_guide_001.ty"
		;
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.ctz" "jnt_rt_pinky_guide_001.tz"
		;
connectAttr "decomposeMatrix17.or" "jnt_rt_pinky_guide_001.r";
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.crx" "jnt_rt_pinky_guide_001.rx"
		;
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.cry" "jnt_rt_pinky_guide_001.ry"
		;
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.crz" "jnt_rt_pinky_guide_001.rz"
		;
connectAttr "jnt_rt_pinky_guide_001.s" "jnt_rt_pinky_guide_002.is";
connectAttr "decomposeMatrix18.ot" "jnt_rt_pinky_guide_002.t";
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.ctx" "jnt_rt_pinky_guide_002.tx"
		;
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.cty" "jnt_rt_pinky_guide_002.ty"
		;
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.ctz" "jnt_rt_pinky_guide_002.tz"
		;
connectAttr "decomposeMatrix18.or" "jnt_rt_pinky_guide_002.r";
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.crx" "jnt_rt_pinky_guide_002.rx"
		;
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.cry" "jnt_rt_pinky_guide_002.ry"
		;
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.crz" "jnt_rt_pinky_guide_002.rz"
		;
connectAttr "jnt_rt_pinky_guide_002.s" "jnt_rt_pinky_guide_003.is";
connectAttr "decomposeMatrix19.ot" "jnt_rt_pinky_guide_003.t";
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.ctx" "jnt_rt_pinky_guide_003.tx"
		;
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.cty" "jnt_rt_pinky_guide_003.ty"
		;
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.ctz" "jnt_rt_pinky_guide_003.tz"
		;
connectAttr "decomposeMatrix19.or" "jnt_rt_pinky_guide_003.r";
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.crx" "jnt_rt_pinky_guide_003.rx"
		;
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.cry" "jnt_rt_pinky_guide_003.ry"
		;
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.crz" "jnt_rt_pinky_guide_003.rz"
		;
connectAttr "jnt_rt_pinky_guide_003.s" "jnt_rt_pinky_guide_004.is";
connectAttr "decomposeMatrix20.ot" "jnt_rt_pinky_guide_004.t";
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.ctx" "jnt_rt_pinky_guide_004.tx"
		;
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.cty" "jnt_rt_pinky_guide_004.ty"
		;
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.ctz" "jnt_rt_pinky_guide_004.tz"
		;
connectAttr "decomposeMatrix20.or" "jnt_rt_pinky_guide_004.r";
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.crx" "jnt_rt_pinky_guide_004.rx"
		;
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.cry" "jnt_rt_pinky_guide_004.ry"
		;
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.crz" "jnt_rt_pinky_guide_004.rz"
		;
connectAttr "jnt_rt_pinky_guide_004.s" "jnt_rt_pinky_guide_005.is";
connectAttr "decomposeMatrix21.ot" "jnt_rt_pinky_guide_005.t";
connectAttr "jnt_rt_pinky_guide_005_parentConstraint1.ctx" "jnt_rt_pinky_guide_005.tx"
		;
connectAttr "jnt_rt_pinky_guide_005_parentConstraint1.cty" "jnt_rt_pinky_guide_005.ty"
		;
connectAttr "jnt_rt_pinky_guide_005_parentConstraint1.ctz" "jnt_rt_pinky_guide_005.tz"
		;
connectAttr "decomposeMatrix21.or" "jnt_rt_pinky_guide_005.r";
connectAttr "jnt_rt_pinky_guide_005_parentConstraint1.crx" "jnt_rt_pinky_guide_005.rx"
		;
connectAttr "jnt_rt_pinky_guide_005_parentConstraint1.cry" "jnt_rt_pinky_guide_005.ry"
		;
connectAttr "jnt_rt_pinky_guide_005_parentConstraint1.crz" "jnt_rt_pinky_guide_005.rz"
		;
connectAttr "jnt_rt_pinky_guide_005.ro" "jnt_rt_pinky_guide_005_parentConstraint1.cro"
		;
connectAttr "jnt_rt_pinky_guide_005.pim" "jnt_rt_pinky_guide_005_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_pinky_guide_005.rp" "jnt_rt_pinky_guide_005_parentConstraint1.crp"
		;
connectAttr "jnt_rt_pinky_guide_005.rpt" "jnt_rt_pinky_guide_005_parentConstraint1.crt"
		;
connectAttr "jnt_rt_pinky_guide_005.jo" "jnt_rt_pinky_guide_005_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_pinky_guide_005.t" "jnt_rt_pinky_guide_005_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_pinky_guide_005.rp" "jnt_rt_pinky_guide_005_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_pinky_guide_005.rpt" "jnt_rt_pinky_guide_005_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_pinky_guide_005.r" "jnt_rt_pinky_guide_005_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_pinky_guide_005.ro" "jnt_rt_pinky_guide_005_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_pinky_guide_005.s" "jnt_rt_pinky_guide_005_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_pinky_guide_005.pm" "jnt_rt_pinky_guide_005_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_pinky_guide_005_parentConstraint1.w0" "jnt_rt_pinky_guide_005_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_pinky_guide_004.ro" "jnt_rt_pinky_guide_004_parentConstraint1.cro"
		;
connectAttr "jnt_rt_pinky_guide_004.pim" "jnt_rt_pinky_guide_004_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_pinky_guide_004.rp" "jnt_rt_pinky_guide_004_parentConstraint1.crp"
		;
connectAttr "jnt_rt_pinky_guide_004.rpt" "jnt_rt_pinky_guide_004_parentConstraint1.crt"
		;
connectAttr "jnt_rt_pinky_guide_004.jo" "jnt_rt_pinky_guide_004_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_pinky_guide_004.t" "jnt_rt_pinky_guide_004_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_pinky_guide_004.rp" "jnt_rt_pinky_guide_004_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_pinky_guide_004.rpt" "jnt_rt_pinky_guide_004_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_pinky_guide_004.r" "jnt_rt_pinky_guide_004_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_pinky_guide_004.ro" "jnt_rt_pinky_guide_004_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_pinky_guide_004.s" "jnt_rt_pinky_guide_004_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_pinky_guide_004.pm" "jnt_rt_pinky_guide_004_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.w0" "jnt_rt_pinky_guide_004_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_pinky_guide_003.ro" "jnt_rt_pinky_guide_003_parentConstraint1.cro"
		;
connectAttr "jnt_rt_pinky_guide_003.pim" "jnt_rt_pinky_guide_003_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_pinky_guide_003.rp" "jnt_rt_pinky_guide_003_parentConstraint1.crp"
		;
connectAttr "jnt_rt_pinky_guide_003.rpt" "jnt_rt_pinky_guide_003_parentConstraint1.crt"
		;
connectAttr "jnt_rt_pinky_guide_003.jo" "jnt_rt_pinky_guide_003_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_pinky_guide_003.t" "jnt_rt_pinky_guide_003_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_pinky_guide_003.rp" "jnt_rt_pinky_guide_003_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_pinky_guide_003.rpt" "jnt_rt_pinky_guide_003_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_pinky_guide_003.r" "jnt_rt_pinky_guide_003_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_pinky_guide_003.ro" "jnt_rt_pinky_guide_003_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_pinky_guide_003.s" "jnt_rt_pinky_guide_003_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_pinky_guide_003.pm" "jnt_rt_pinky_guide_003_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.w0" "jnt_rt_pinky_guide_003_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_pinky_guide_002.ro" "jnt_rt_pinky_guide_002_parentConstraint1.cro"
		;
connectAttr "jnt_rt_pinky_guide_002.pim" "jnt_rt_pinky_guide_002_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_pinky_guide_002.rp" "jnt_rt_pinky_guide_002_parentConstraint1.crp"
		;
connectAttr "jnt_rt_pinky_guide_002.rpt" "jnt_rt_pinky_guide_002_parentConstraint1.crt"
		;
connectAttr "jnt_rt_pinky_guide_002.jo" "jnt_rt_pinky_guide_002_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_pinky_guide_002.t" "jnt_rt_pinky_guide_002_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_pinky_guide_002.rp" "jnt_rt_pinky_guide_002_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_pinky_guide_002.rpt" "jnt_rt_pinky_guide_002_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_pinky_guide_002.r" "jnt_rt_pinky_guide_002_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_pinky_guide_002.ro" "jnt_rt_pinky_guide_002_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_pinky_guide_002.s" "jnt_rt_pinky_guide_002_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_pinky_guide_002.pm" "jnt_rt_pinky_guide_002_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.w0" "jnt_rt_pinky_guide_002_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_pinky_guide_001.ro" "jnt_rt_pinky_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_pinky_guide_001.pim" "jnt_rt_pinky_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_pinky_guide_001.rp" "jnt_rt_pinky_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_pinky_guide_001.rpt" "jnt_rt_pinky_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_pinky_guide_001.jo" "jnt_rt_pinky_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_pinky_guide_001.t" "jnt_rt_pinky_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_pinky_guide_001.rp" "jnt_rt_pinky_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_pinky_guide_001.rpt" "jnt_rt_pinky_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_pinky_guide_001.r" "jnt_rt_pinky_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_pinky_guide_001.ro" "jnt_rt_pinky_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_pinky_guide_001.s" "jnt_rt_pinky_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_pinky_guide_001.pm" "jnt_rt_pinky_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.w0" "jnt_rt_pinky_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_wrist_guide_001.ro" "jnt_rt_wrist_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_wrist_guide_001.pim" "jnt_rt_wrist_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_wrist_guide_001.rp" "jnt_rt_wrist_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_wrist_guide_001.rpt" "jnt_rt_wrist_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_wrist_guide_001.jo" "jnt_rt_wrist_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_wrist_guide_001.t" "jnt_rt_wrist_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_wrist_guide_001.rp" "jnt_rt_wrist_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_wrist_guide_001.rpt" "jnt_rt_wrist_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_wrist_guide_001.r" "jnt_rt_wrist_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_wrist_guide_001.ro" "jnt_rt_wrist_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_wrist_guide_001.s" "jnt_rt_wrist_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_wrist_guide_001.pm" "jnt_rt_wrist_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.w0" "jnt_rt_wrist_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_elbow_guide_001.ro" "jnt_rt_elbow_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_elbow_guide_001.pim" "jnt_rt_elbow_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_elbow_guide_001.rp" "jnt_rt_elbow_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_elbow_guide_001.rpt" "jnt_rt_elbow_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_elbow_guide_001.jo" "jnt_rt_elbow_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_elbow_guide_001.t" "jnt_rt_elbow_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_elbow_guide_001.rp" "jnt_rt_elbow_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_elbow_guide_001.rpt" "jnt_rt_elbow_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_elbow_guide_001.r" "jnt_rt_elbow_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_elbow_guide_001.ro" "jnt_rt_elbow_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_elbow_guide_001.s" "jnt_rt_elbow_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_elbow_guide_001.pm" "jnt_rt_elbow_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.w0" "jnt_rt_elbow_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_upperArm_guide_001.ro" "jnt_rt_upperArm_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_upperArm_guide_001.pim" "jnt_rt_upperArm_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_upperArm_guide_001.rp" "jnt_rt_upperArm_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_upperArm_guide_001.rpt" "jnt_rt_upperArm_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_upperArm_guide_001.jo" "jnt_rt_upperArm_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_upperArm_guide_001.t" "jnt_rt_upperArm_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_upperArm_guide_001.rp" "jnt_rt_upperArm_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_upperArm_guide_001.rpt" "jnt_rt_upperArm_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_upperArm_guide_001.r" "jnt_rt_upperArm_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_upperArm_guide_001.ro" "jnt_rt_upperArm_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_upperArm_guide_001.s" "jnt_rt_upperArm_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_upperArm_guide_001.pm" "jnt_rt_upperArm_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.w0" "jnt_rt_upperArm_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_scapula_guide_001.ro" "jnt_rt_scapula_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_scapula_guide_001.pim" "jnt_rt_scapula_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_scapula_guide_001.rp" "jnt_rt_scapula_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_scapula_guide_001.rpt" "jnt_rt_scapula_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_scapula_guide_001.jo" "jnt_rt_scapula_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_scapula_guide_001.t" "jnt_rt_scapula_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_scapula_guide_001.rp" "jnt_rt_scapula_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_scapula_guide_001.rpt" "jnt_rt_scapula_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_scapula_guide_001.r" "jnt_rt_scapula_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_scapula_guide_001.ro" "jnt_rt_scapula_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_scapula_guide_001.s" "jnt_rt_scapula_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_scapula_guide_001.pm" "jnt_rt_scapula_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.w0" "jnt_rt_scapula_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_clavicle_guide_002.ro" "jnt_rt_clavicle_guide_002_parentConstraint1.cro"
		;
connectAttr "jnt_rt_clavicle_guide_002.pim" "jnt_rt_clavicle_guide_002_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_clavicle_guide_002.rp" "jnt_rt_clavicle_guide_002_parentConstraint1.crp"
		;
connectAttr "jnt_rt_clavicle_guide_002.rpt" "jnt_rt_clavicle_guide_002_parentConstraint1.crt"
		;
connectAttr "jnt_rt_clavicle_guide_002.jo" "jnt_rt_clavicle_guide_002_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_002.t" "jnt_rt_clavicle_guide_002_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_002.rp" "jnt_rt_clavicle_guide_002_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_002.rpt" "jnt_rt_clavicle_guide_002_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_002.r" "jnt_rt_clavicle_guide_002_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_002.ro" "jnt_rt_clavicle_guide_002_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_002.s" "jnt_rt_clavicle_guide_002_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_002.pm" "jnt_rt_clavicle_guide_002_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.w0" "jnt_rt_clavicle_guide_002_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_clavicle_guide_001.ro" "jnt_rt_clavicle_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_clavicle_guide_001.pim" "jnt_rt_clavicle_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_clavicle_guide_001.rp" "jnt_rt_clavicle_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_clavicle_guide_001.rpt" "jnt_rt_clavicle_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_clavicle_guide_001.jo" "jnt_rt_clavicle_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_001.t" "jnt_rt_clavicle_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_001.rp" "jnt_rt_clavicle_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_001.rpt" "jnt_rt_clavicle_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_001.r" "jnt_rt_clavicle_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_001.ro" "jnt_rt_clavicle_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_001.s" "jnt_rt_clavicle_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_clavicle_guide_001.pm" "jnt_rt_clavicle_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.w0" "jnt_rt_clavicle_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_md_root_guide_001.s" "jnt_rt_upperLeg_guide_001.is";
connectAttr "decomposeMatrix35.ot" "jnt_rt_upperLeg_guide_001.t";
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.ctx" "jnt_rt_upperLeg_guide_001.tx"
		;
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.cty" "jnt_rt_upperLeg_guide_001.ty"
		;
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.ctz" "jnt_rt_upperLeg_guide_001.tz"
		;
connectAttr "decomposeMatrix35.or" "jnt_rt_upperLeg_guide_001.r";
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.crx" "jnt_rt_upperLeg_guide_001.rx"
		;
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.cry" "jnt_rt_upperLeg_guide_001.ry"
		;
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.crz" "jnt_rt_upperLeg_guide_001.rz"
		;
connectAttr "jnt_rt_upperLeg_guide_001.s" "jnt_rt_knee_guide_001.is";
connectAttr "decomposeMatrix11.ot" "jnt_rt_knee_guide_001.t";
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.ctx" "jnt_rt_knee_guide_001.tx"
		;
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.cty" "jnt_rt_knee_guide_001.ty"
		;
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.ctz" "jnt_rt_knee_guide_001.tz"
		;
connectAttr "decomposeMatrix11.or" "jnt_rt_knee_guide_001.r";
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.crx" "jnt_rt_knee_guide_001.rx"
		;
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.cry" "jnt_rt_knee_guide_001.ry"
		;
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.crz" "jnt_rt_knee_guide_001.rz"
		;
connectAttr "jnt_rt_knee_guide_001.s" "jnt_rt_ankle_guide_001.is";
connectAttr "decomposeMatrix1.ot" "jnt_rt_ankle_guide_001.t";
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.ctx" "jnt_rt_ankle_guide_001.tx"
		;
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.cty" "jnt_rt_ankle_guide_001.ty"
		;
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.ctz" "jnt_rt_ankle_guide_001.tz"
		;
connectAttr "decomposeMatrix1.or" "jnt_rt_ankle_guide_001.r";
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.crx" "jnt_rt_ankle_guide_001.rx"
		;
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.cry" "jnt_rt_ankle_guide_001.ry"
		;
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.crz" "jnt_rt_ankle_guide_001.rz"
		;
connectAttr "decomposeMatrix2.ot" "jnt_rt_ball_guide_001.t";
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.ctx" "jnt_rt_ball_guide_001.tx"
		;
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.cty" "jnt_rt_ball_guide_001.ty"
		;
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.ctz" "jnt_rt_ball_guide_001.tz"
		;
connectAttr "decomposeMatrix2.or" "jnt_rt_ball_guide_001.r";
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.crx" "jnt_rt_ball_guide_001.rx"
		;
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.cry" "jnt_rt_ball_guide_001.ry"
		;
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.crz" "jnt_rt_ball_guide_001.rz"
		;
connectAttr "jnt_rt_ball_guide_001.s" "jnt_rt_toe_guide_001.is";
connectAttr "decomposeMatrix33.ot" "jnt_rt_toe_guide_001.t";
connectAttr "jnt_rt_toe_guide_001_parentConstraint1.ctx" "jnt_rt_toe_guide_001.tx"
		;
connectAttr "jnt_rt_toe_guide_001_parentConstraint1.cty" "jnt_rt_toe_guide_001.ty"
		;
connectAttr "jnt_rt_toe_guide_001_parentConstraint1.ctz" "jnt_rt_toe_guide_001.tz"
		;
connectAttr "decomposeMatrix33.or" "jnt_rt_toe_guide_001.r";
connectAttr "jnt_rt_toe_guide_001_parentConstraint1.crx" "jnt_rt_toe_guide_001.rx"
		;
connectAttr "jnt_rt_toe_guide_001_parentConstraint1.cry" "jnt_rt_toe_guide_001.ry"
		;
connectAttr "jnt_rt_toe_guide_001_parentConstraint1.crz" "jnt_rt_toe_guide_001.rz"
		;
connectAttr "jnt_rt_toe_guide_001.ro" "jnt_rt_toe_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_toe_guide_001.pim" "jnt_rt_toe_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_toe_guide_001.rp" "jnt_rt_toe_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_toe_guide_001.rpt" "jnt_rt_toe_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_toe_guide_001.jo" "jnt_rt_toe_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_toe_guide_001.t" "jnt_rt_toe_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_toe_guide_001.rp" "jnt_rt_toe_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_toe_guide_001.rpt" "jnt_rt_toe_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_toe_guide_001.r" "jnt_rt_toe_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_toe_guide_001.ro" "jnt_rt_toe_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_toe_guide_001.s" "jnt_rt_toe_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_toe_guide_001.pm" "jnt_rt_toe_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_toe_guide_001_parentConstraint1.w0" "jnt_rt_toe_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_ball_guide_001.ro" "jnt_rt_ball_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_ball_guide_001.pim" "jnt_rt_ball_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_ball_guide_001.rp" "jnt_rt_ball_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_ball_guide_001.rpt" "jnt_rt_ball_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_ball_guide_001.jo" "jnt_rt_ball_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_ball_guide_001.t" "jnt_rt_ball_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_ball_guide_001.rp" "jnt_rt_ball_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_ball_guide_001.rpt" "jnt_rt_ball_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_ball_guide_001.r" "jnt_rt_ball_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_ball_guide_001.ro" "jnt_rt_ball_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_ball_guide_001.s" "jnt_rt_ball_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_ball_guide_001.pm" "jnt_rt_ball_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.w0" "jnt_rt_ball_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_ankle_guide_001.ro" "jnt_rt_ankle_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_ankle_guide_001.pim" "jnt_rt_ankle_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_ankle_guide_001.rp" "jnt_rt_ankle_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_ankle_guide_001.rpt" "jnt_rt_ankle_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_ankle_guide_001.jo" "jnt_rt_ankle_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_ankle_guide_001.t" "jnt_rt_ankle_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_ankle_guide_001.rp" "jnt_rt_ankle_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_ankle_guide_001.rpt" "jnt_rt_ankle_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_ankle_guide_001.r" "jnt_rt_ankle_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_ankle_guide_001.ro" "jnt_rt_ankle_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_ankle_guide_001.s" "jnt_rt_ankle_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_ankle_guide_001.pm" "jnt_rt_ankle_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.w0" "jnt_rt_ankle_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_knee_guide_001.ro" "jnt_rt_knee_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_knee_guide_001.pim" "jnt_rt_knee_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_knee_guide_001.rp" "jnt_rt_knee_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_knee_guide_001.rpt" "jnt_rt_knee_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_knee_guide_001.jo" "jnt_rt_knee_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_knee_guide_001.t" "jnt_rt_knee_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_knee_guide_001.rp" "jnt_rt_knee_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_knee_guide_001.rpt" "jnt_rt_knee_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_knee_guide_001.r" "jnt_rt_knee_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_knee_guide_001.ro" "jnt_rt_knee_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_knee_guide_001.s" "jnt_rt_knee_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_knee_guide_001.pm" "jnt_rt_knee_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.w0" "jnt_rt_knee_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "jnt_rt_upperLeg_guide_001.ro" "jnt_rt_upperLeg_guide_001_parentConstraint1.cro"
		;
connectAttr "jnt_rt_upperLeg_guide_001.pim" "jnt_rt_upperLeg_guide_001_parentConstraint1.cpim"
		;
connectAttr "jnt_rt_upperLeg_guide_001.rp" "jnt_rt_upperLeg_guide_001_parentConstraint1.crp"
		;
connectAttr "jnt_rt_upperLeg_guide_001.rpt" "jnt_rt_upperLeg_guide_001_parentConstraint1.crt"
		;
connectAttr "jnt_rt_upperLeg_guide_001.jo" "jnt_rt_upperLeg_guide_001_parentConstraint1.cjo"
		;
connectAttr "mirror_jnt_rt_upperLeg_guide_001.t" "jnt_rt_upperLeg_guide_001_parentConstraint1.tg[0].tt"
		;
connectAttr "mirror_jnt_rt_upperLeg_guide_001.rp" "jnt_rt_upperLeg_guide_001_parentConstraint1.tg[0].trp"
		;
connectAttr "mirror_jnt_rt_upperLeg_guide_001.rpt" "jnt_rt_upperLeg_guide_001_parentConstraint1.tg[0].trt"
		;
connectAttr "mirror_jnt_rt_upperLeg_guide_001.r" "jnt_rt_upperLeg_guide_001_parentConstraint1.tg[0].tr"
		;
connectAttr "mirror_jnt_rt_upperLeg_guide_001.ro" "jnt_rt_upperLeg_guide_001_parentConstraint1.tg[0].tro"
		;
connectAttr "mirror_jnt_rt_upperLeg_guide_001.s" "jnt_rt_upperLeg_guide_001_parentConstraint1.tg[0].ts"
		;
connectAttr "mirror_jnt_rt_upperLeg_guide_001.pm" "jnt_rt_upperLeg_guide_001_parentConstraint1.tg[0].tpm"
		;
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.w0" "jnt_rt_upperLeg_guide_001_parentConstraint1.tg[0].tw"
		;
connectAttr "autoPole_position.o3" "jnt_lf_arm_pole_guide_001.t";
connectAttr "autoPole_position1.o3" "jnt_lf_leg_pole_guide_001.t";
connectAttr "autoPole_display_arm_cv0.ot" "curveShape1.cp[0]";
connectAttr "autoPole_display_arm_cv1.ot" "curveShape1.cp[1]";
connectAttr "autoPole_display_leg_cv0.ot" "curveShape2.cp[0]";
connectAttr "autoPole_display_leg_cv1.ot" "curveShape2.cp[1]";
connectAttr "autoPole_position2.o3" "jnt_rt_arm_pole_guide_001.t";
connectAttr "autoPole_position3.o3" "jnt_rt_leg_pole_guide_001.t";
connectAttr "autoPole_display_rt_arm_cv0.ot" "curveShape3.cp[0]";
connectAttr "autoPole_display_rt_arm_cv1.ot" "curveShape3.cp[1]";
connectAttr "autoPole_display_rt_leg_cv0.ot" "curveShape4.cp[0]";
connectAttr "autoPole_display_rt_leg_cv1.ot" "curveShape4.cp[1]";
connectAttr "decomposeMatrix37.ot" "mirror_jnt_rt_ankle_guide_001.t";
connectAttr "decomposeMatrix37.or" "mirror_jnt_rt_ankle_guide_001.r";
connectAttr "decomposeMatrix38.ot" "mirror_jnt_rt_ball_guide_001.t";
connectAttr "decomposeMatrix38.or" "mirror_jnt_rt_ball_guide_001.r";
connectAttr "decomposeMatrix39.ot" "mirror_jnt_rt_clavicle_guide_001.t";
connectAttr "decomposeMatrix39.or" "mirror_jnt_rt_clavicle_guide_001.r";
connectAttr "decomposeMatrix40.ot" "mirror_jnt_rt_clavicle_guide_002.t";
connectAttr "decomposeMatrix40.or" "mirror_jnt_rt_clavicle_guide_002.r";
connectAttr "decomposeMatrix41.ot" "mirror_jnt_rt_elbow_guide_001.t";
connectAttr "decomposeMatrix41.or" "mirror_jnt_rt_elbow_guide_001.r";
connectAttr "decomposeMatrix42.ot" "mirror_jnt_rt_index_guide_001.t";
connectAttr "decomposeMatrix42.or" "mirror_jnt_rt_index_guide_001.r";
connectAttr "decomposeMatrix43.ot" "mirror_jnt_rt_index_guide_002.t";
connectAttr "decomposeMatrix43.or" "mirror_jnt_rt_index_guide_002.r";
connectAttr "decomposeMatrix44.ot" "mirror_jnt_rt_index_guide_003.t";
connectAttr "decomposeMatrix44.or" "mirror_jnt_rt_index_guide_003.r";
connectAttr "decomposeMatrix45.ot" "mirror_jnt_rt_index_guide_004.t";
connectAttr "decomposeMatrix45.or" "mirror_jnt_rt_index_guide_004.r";
connectAttr "decomposeMatrix46.ot" "mirror_jnt_rt_index_guide_005.t";
connectAttr "decomposeMatrix46.or" "mirror_jnt_rt_index_guide_005.r";
connectAttr "decomposeMatrix47.ot" "mirror_jnt_rt_knee_guide_001.t";
connectAttr "decomposeMatrix47.or" "mirror_jnt_rt_knee_guide_001.r";
connectAttr "decomposeMatrix48.ot" "mirror_jnt_rt_middle_guide_001.t";
connectAttr "decomposeMatrix48.or" "mirror_jnt_rt_middle_guide_001.r";
connectAttr "decomposeMatrix49.ot" "mirror_jnt_rt_middle_guide_002.t";
connectAttr "decomposeMatrix49.or" "mirror_jnt_rt_middle_guide_002.r";
connectAttr "decomposeMatrix50.ot" "mirror_jnt_rt_middle_guide_003.t";
connectAttr "decomposeMatrix50.or" "mirror_jnt_rt_middle_guide_003.r";
connectAttr "decomposeMatrix51.ot" "mirror_jnt_rt_middle_guide_004.t";
connectAttr "decomposeMatrix51.or" "mirror_jnt_rt_middle_guide_004.r";
connectAttr "decomposeMatrix52.ot" "mirror_jnt_rt_middle_guide_005.t";
connectAttr "decomposeMatrix52.or" "mirror_jnt_rt_middle_guide_005.r";
connectAttr "decomposeMatrix53.ot" "mirror_jnt_rt_pinky_guide_001.t";
connectAttr "decomposeMatrix53.or" "mirror_jnt_rt_pinky_guide_001.r";
connectAttr "decomposeMatrix54.ot" "mirror_jnt_rt_pinky_guide_002.t";
connectAttr "decomposeMatrix54.or" "mirror_jnt_rt_pinky_guide_002.r";
connectAttr "decomposeMatrix55.ot" "mirror_jnt_rt_pinky_guide_003.t";
connectAttr "decomposeMatrix55.or" "mirror_jnt_rt_pinky_guide_003.r";
connectAttr "decomposeMatrix56.ot" "mirror_jnt_rt_pinky_guide_004.t";
connectAttr "decomposeMatrix56.or" "mirror_jnt_rt_pinky_guide_004.r";
connectAttr "decomposeMatrix57.ot" "mirror_jnt_rt_pinky_guide_005.t";
connectAttr "decomposeMatrix57.or" "mirror_jnt_rt_pinky_guide_005.r";
connectAttr "decomposeMatrix58.ot" "mirror_jnt_rt_ring_guide_001.t";
connectAttr "decomposeMatrix58.or" "mirror_jnt_rt_ring_guide_001.r";
connectAttr "decomposeMatrix59.ot" "mirror_jnt_rt_ring_guide_002.t";
connectAttr "decomposeMatrix59.or" "mirror_jnt_rt_ring_guide_002.r";
connectAttr "decomposeMatrix60.ot" "mirror_jnt_rt_ring_guide_003.t";
connectAttr "decomposeMatrix60.or" "mirror_jnt_rt_ring_guide_003.r";
connectAttr "decomposeMatrix61.ot" "mirror_jnt_rt_ring_guide_004.t";
connectAttr "decomposeMatrix61.or" "mirror_jnt_rt_ring_guide_004.r";
connectAttr "decomposeMatrix62.ot" "mirror_jnt_rt_ring_guide_005.t";
connectAttr "decomposeMatrix62.or" "mirror_jnt_rt_ring_guide_005.r";
connectAttr "decomposeMatrix63.ot" "mirror_jnt_rt_scapula_guide_001.t";
connectAttr "decomposeMatrix63.or" "mirror_jnt_rt_scapula_guide_001.r";
connectAttr "decomposeMatrix64.ot" "mirror_jnt_rt_scapula_guide_002.t";
connectAttr "decomposeMatrix64.or" "mirror_jnt_rt_scapula_guide_002.r";
connectAttr "decomposeMatrix65.ot" "mirror_jnt_rt_thumb_guide_001.t";
connectAttr "decomposeMatrix65.or" "mirror_jnt_rt_thumb_guide_001.r";
connectAttr "decomposeMatrix66.ot" "mirror_jnt_rt_thumb_guide_002.t";
connectAttr "decomposeMatrix66.or" "mirror_jnt_rt_thumb_guide_002.r";
connectAttr "decomposeMatrix67.ot" "mirror_jnt_rt_thumb_guide_003.t";
connectAttr "decomposeMatrix67.or" "mirror_jnt_rt_thumb_guide_003.r";
connectAttr "decomposeMatrix68.ot" "mirror_jnt_rt_thumb_guide_004.t";
connectAttr "decomposeMatrix68.or" "mirror_jnt_rt_thumb_guide_004.r";
connectAttr "decomposeMatrix69.ot" "mirror_jnt_rt_toe_guide_001.t";
connectAttr "decomposeMatrix69.or" "mirror_jnt_rt_toe_guide_001.r";
connectAttr "decomposeMatrix70.ot" "mirror_jnt_rt_upperArm_guide_001.t";
connectAttr "decomposeMatrix70.or" "mirror_jnt_rt_upperArm_guide_001.r";
connectAttr "decomposeMatrix71.ot" "mirror_jnt_rt_upperLeg_guide_001.t";
connectAttr "decomposeMatrix71.or" "mirror_jnt_rt_upperLeg_guide_001.r";
connectAttr "decomposeMatrix72.ot" "mirror_jnt_rt_wrist_guide_001.t";
connectAttr "decomposeMatrix72.or" "mirror_jnt_rt_wrist_guide_001.r";
connectAttr "multMatrix3.o" "decomposeMatrix3.imat";
connectAttr "jnt_md_spine_guide_005.wim" "multMatrix3.i[0]";
connectAttr "jnt_lf_clavicle_guide_001.wm" "multMatrix3.i[2]";
connectAttr "multMatrix4.o" "decomposeMatrix4.imat";
connectAttr "jnt_rt_clavicle_guide_001.wim" "multMatrix4.i[0]";
connectAttr "jnt_lf_clavicle_guide_002.wm" "multMatrix4.i[2]";
connectAttr "multMatrix27.o" "decomposeMatrix27.imat";
connectAttr "jnt_rt_clavicle_guide_002.wim" "multMatrix27.i[0]";
connectAttr "jnt_lf_scapula_guide_001.wm" "multMatrix27.i[2]";
connectAttr "multMatrix28.o" "decomposeMatrix28.imat";
connectAttr "jnt_rt_scapula_guide_001.wim" "multMatrix28.i[0]";
connectAttr "jnt_lf_scapula_guide_002.wm" "multMatrix28.i[2]";
connectAttr "multMatrix34.o" "decomposeMatrix34.imat";
connectAttr "jnt_rt_scapula_guide_001.wim" "multMatrix34.i[0]";
connectAttr "jnt_lf_upperArm_guide_001.wm" "multMatrix34.i[2]";
connectAttr "multMatrix5.o" "decomposeMatrix5.imat";
connectAttr "jnt_rt_upperArm_guide_001.wim" "multMatrix5.i[0]";
connectAttr "jnt_lf_elbow_guide_001.wm" "multMatrix5.i[2]";
connectAttr "multMatrix36.o" "decomposeMatrix36.imat";
connectAttr "jnt_rt_elbow_guide_001.wim" "multMatrix36.i[0]";
connectAttr "jnt_lf_wrist_guide_001.wm" "multMatrix36.i[2]";
connectAttr "multMatrix29.o" "decomposeMatrix29.imat";
connectAttr "jnt_rt_wrist_guide_001.wim" "multMatrix29.i[0]";
connectAttr "jnt_lf_thumb_guide_001.wm" "multMatrix29.i[2]";
connectAttr "multMatrix30.o" "decomposeMatrix30.imat";
connectAttr "jnt_rt_thumb_guide_001.wim" "multMatrix30.i[0]";
connectAttr "jnt_lf_thumb_guide_002.wm" "multMatrix30.i[2]";
connectAttr "multMatrix31.o" "decomposeMatrix31.imat";
connectAttr "jnt_rt_thumb_guide_002.wim" "multMatrix31.i[0]";
connectAttr "jnt_lf_thumb_guide_003.wm" "multMatrix31.i[2]";
connectAttr "multMatrix32.o" "decomposeMatrix32.imat";
connectAttr "jnt_rt_thumb_guide_003.wim" "multMatrix32.i[0]";
connectAttr "jnt_lf_thumb_guide_004.wm" "multMatrix32.i[2]";
connectAttr "multMatrix6.o" "decomposeMatrix6.imat";
connectAttr "jnt_rt_wrist_guide_001.wim" "multMatrix6.i[0]";
connectAttr "jnt_lf_index_guide_001.wm" "multMatrix6.i[2]";
connectAttr "multMatrix7.o" "decomposeMatrix7.imat";
connectAttr "jnt_rt_index_guide_001.wim" "multMatrix7.i[0]";
connectAttr "jnt_lf_index_guide_002.wm" "multMatrix7.i[2]";
connectAttr "multMatrix8.o" "decomposeMatrix8.imat";
connectAttr "jnt_rt_index_guide_002.wim" "multMatrix8.i[0]";
connectAttr "jnt_lf_index_guide_003.wm" "multMatrix8.i[2]";
connectAttr "multMatrix9.o" "decomposeMatrix9.imat";
connectAttr "jnt_rt_index_guide_003.wim" "multMatrix9.i[0]";
connectAttr "jnt_lf_index_guide_004.wm" "multMatrix9.i[2]";
connectAttr "multMatrix10.o" "decomposeMatrix10.imat";
connectAttr "jnt_rt_index_guide_004.wim" "multMatrix10.i[0]";
connectAttr "jnt_lf_index_guide_005.wm" "multMatrix10.i[2]";
connectAttr "multMatrix12.o" "decomposeMatrix12.imat";
connectAttr "jnt_rt_wrist_guide_001.wim" "multMatrix12.i[0]";
connectAttr "jnt_lf_middle_guide_001.wm" "multMatrix12.i[2]";
connectAttr "multMatrix13.o" "decomposeMatrix13.imat";
connectAttr "jnt_rt_middle_guide_001.wim" "multMatrix13.i[0]";
connectAttr "jnt_lf_middle_guide_002.wm" "multMatrix13.i[2]";
connectAttr "multMatrix14.o" "decomposeMatrix14.imat";
connectAttr "jnt_rt_middle_guide_002.wim" "multMatrix14.i[0]";
connectAttr "jnt_lf_middle_guide_003.wm" "multMatrix14.i[2]";
connectAttr "multMatrix15.o" "decomposeMatrix15.imat";
connectAttr "jnt_rt_middle_guide_003.wim" "multMatrix15.i[0]";
connectAttr "jnt_lf_middle_guide_004.wm" "multMatrix15.i[2]";
connectAttr "multMatrix16.o" "decomposeMatrix16.imat";
connectAttr "jnt_rt_middle_guide_004.wim" "multMatrix16.i[0]";
connectAttr "jnt_lf_middle_guide_005.wm" "multMatrix16.i[2]";
connectAttr "multMatrix22.o" "decomposeMatrix22.imat";
connectAttr "jnt_rt_wrist_guide_001.wim" "multMatrix22.i[0]";
connectAttr "jnt_lf_ring_guide_001.wm" "multMatrix22.i[2]";
connectAttr "multMatrix23.o" "decomposeMatrix23.imat";
connectAttr "jnt_rt_ring_guide_001.wim" "multMatrix23.i[0]";
connectAttr "jnt_lf_ring_guide_002.wm" "multMatrix23.i[2]";
connectAttr "multMatrix24.o" "decomposeMatrix24.imat";
connectAttr "jnt_rt_ring_guide_002.wim" "multMatrix24.i[0]";
connectAttr "jnt_lf_ring_guide_003.wm" "multMatrix24.i[2]";
connectAttr "multMatrix25.o" "decomposeMatrix25.imat";
connectAttr "jnt_rt_ring_guide_003.wim" "multMatrix25.i[0]";
connectAttr "jnt_lf_ring_guide_004.wm" "multMatrix25.i[2]";
connectAttr "multMatrix26.o" "decomposeMatrix26.imat";
connectAttr "jnt_rt_ring_guide_004.wim" "multMatrix26.i[0]";
connectAttr "jnt_lf_ring_guide_005.wm" "multMatrix26.i[2]";
connectAttr "multMatrix17.o" "decomposeMatrix17.imat";
connectAttr "jnt_rt_wrist_guide_001.wim" "multMatrix17.i[0]";
connectAttr "jnt_lf_pinky_guide_001.wm" "multMatrix17.i[2]";
connectAttr "multMatrix18.o" "decomposeMatrix18.imat";
connectAttr "jnt_rt_pinky_guide_001.wim" "multMatrix18.i[0]";
connectAttr "jnt_lf_pinky_guide_002.wm" "multMatrix18.i[2]";
connectAttr "multMatrix19.o" "decomposeMatrix19.imat";
connectAttr "jnt_rt_pinky_guide_002.wim" "multMatrix19.i[0]";
connectAttr "jnt_lf_pinky_guide_003.wm" "multMatrix19.i[2]";
connectAttr "multMatrix20.o" "decomposeMatrix20.imat";
connectAttr "jnt_rt_pinky_guide_003.wim" "multMatrix20.i[0]";
connectAttr "jnt_lf_pinky_guide_004.wm" "multMatrix20.i[2]";
connectAttr "multMatrix21.o" "decomposeMatrix21.imat";
connectAttr "jnt_rt_pinky_guide_004.wim" "multMatrix21.i[0]";
connectAttr "jnt_lf_pinky_guide_005.wm" "multMatrix21.i[2]";
connectAttr "multMatrix35.o" "decomposeMatrix35.imat";
connectAttr "jnt_md_root_guide_001.wim" "multMatrix35.i[0]";
connectAttr "jnt_lf_upperLeg_guide_001.wm" "multMatrix35.i[2]";
connectAttr "multMatrix11.o" "decomposeMatrix11.imat";
connectAttr "jnt_rt_upperLeg_guide_001.wim" "multMatrix11.i[0]";
connectAttr "jnt_lf_knee_guide_001.wm" "multMatrix11.i[2]";
connectAttr "multMatrix1.o" "decomposeMatrix1.imat";
connectAttr "jnt_rt_knee_guide_001.wim" "multMatrix1.i[0]";
connectAttr "jnt_lf_ankle_guide_001.wm" "multMatrix1.i[2]";
connectAttr "multMatrix2.o" "decomposeMatrix2.imat";
connectAttr "jnt_rt_ankle_guide_001.wim" "multMatrix2.i[0]";
connectAttr "jnt_lf_ball_guide_001.wm" "multMatrix2.i[2]";
connectAttr "multMatrix33.o" "decomposeMatrix33.imat";
connectAttr "jnt_rt_ball_guide_001.wim" "multMatrix33.i[0]";
connectAttr "jnt_lf_toe_guide_001.wm" "multMatrix33.i[2]";
connectAttr "autoPole_mid_world.ot" "autoPole_position.i3[0]";
connectAttr "autoPole_scaled.o" "autoPole_position.i3[1]";
connectAttr "jnt_lf_elbow_guide_001.wm" "autoPole_mid_world.imat";
connectAttr "autoPole_direction.o" "autoPole_scaled.i1";
connectAttr "autoPole_offset.o3" "autoPole_direction.i1";
connectAttr "autoPole_length.d" "autoPole_direction.i2x";
connectAttr "autoPole_length.d" "autoPole_direction.i2y";
connectAttr "autoPole_length.d" "autoPole_direction.i2z";
connectAttr "autoPole_toMid.o3" "autoPole_offset.i3[0]";
connectAttr "autoPole_projection.o" "autoPole_offset.i3[1]";
connectAttr "autoPole_mid_world.ot" "autoPole_toMid.i3[0]";
connectAttr "autoPole_start_world.ot" "autoPole_toMid.i3[1]";
connectAttr "jnt_lf_upperArm_guide_001.wm" "autoPole_start_world.imat";
connectAttr "autoPole_axis.o3" "autoPole_projection.i1";
connectAttr "autoPole_ratio.ox" "autoPole_projection.i2x";
connectAttr "autoPole_ratio.ox" "autoPole_projection.i2y";
connectAttr "autoPole_ratio.ox" "autoPole_projection.i2z";
connectAttr "autoPole_end_world.ot" "autoPole_axis.i3[0]";
connectAttr "autoPole_start_world.ot" "autoPole_axis.i3[1]";
connectAttr "jnt_lf_wrist_guide_001.wm" "autoPole_end_world.imat";
connectAttr "autoPole_dotMid.ox" "autoPole_ratio.i1x";
connectAttr "autoPole_dotAxis.ox" "autoPole_ratio.i2x";
connectAttr "autoPole_toMid.o3" "autoPole_dotMid.i1";
connectAttr "autoPole_axis.o3" "autoPole_dotMid.i2";
connectAttr "autoPole_axis.o3" "autoPole_dotAxis.i1";
connectAttr "autoPole_axis.o3" "autoPole_dotAxis.i2";
connectAttr "autoPole_offset.o3" "autoPole_length.p1";
connectAttr "autoPole_mid_world1.ot" "autoPole_position1.i3[0]";
connectAttr "autoPole_scaled1.o" "autoPole_position1.i3[1]";
connectAttr "jnt_lf_knee_guide_001.wm" "autoPole_mid_world1.imat";
connectAttr "autoPole_direction1.o" "autoPole_scaled1.i1";
connectAttr "autoPole_offset1.o3" "autoPole_direction1.i1";
connectAttr "autoPole_length1.d" "autoPole_direction1.i2x";
connectAttr "autoPole_length1.d" "autoPole_direction1.i2y";
connectAttr "autoPole_length1.d" "autoPole_direction1.i2z";
connectAttr "autoPole_toMid1.o3" "autoPole_offset1.i3[0]";
connectAttr "autoPole_projection1.o" "autoPole_offset1.i3[1]";
connectAttr "autoPole_mid_world1.ot" "autoPole_toMid1.i3[0]";
connectAttr "autoPole_start_world1.ot" "autoPole_toMid1.i3[1]";
connectAttr "jnt_lf_upperLeg_guide_001.wm" "autoPole_start_world1.imat";
connectAttr "autoPole_axis1.o3" "autoPole_projection1.i1";
connectAttr "autoPole_ratio1.ox" "autoPole_projection1.i2x";
connectAttr "autoPole_ratio1.ox" "autoPole_projection1.i2y";
connectAttr "autoPole_ratio1.ox" "autoPole_projection1.i2z";
connectAttr "autoPole_end_world1.ot" "autoPole_axis1.i3[0]";
connectAttr "autoPole_start_world1.ot" "autoPole_axis1.i3[1]";
connectAttr "jnt_lf_ankle_guide_001.wm" "autoPole_end_world1.imat";
connectAttr "autoPole_dotMid1.ox" "autoPole_ratio1.i1x";
connectAttr "autoPole_dotAxis1.ox" "autoPole_ratio1.i2x";
connectAttr "autoPole_toMid1.o3" "autoPole_dotMid1.i1";
connectAttr "autoPole_axis1.o3" "autoPole_dotMid1.i2";
connectAttr "autoPole_axis1.o3" "autoPole_dotAxis1.i1";
connectAttr "autoPole_axis1.o3" "autoPole_dotAxis1.i2";
connectAttr "autoPole_offset1.o3" "autoPole_length1.p1";
connectAttr "jnt_lf_elbow_guide_001.wm" "autoPole_display_arm_cv0.imat";
connectAttr "jnt_lf_arm_pole_guide_001.wm" "autoPole_display_arm_cv1.imat";
connectAttr "jnt_lf_knee_guide_001.wm" "autoPole_display_leg_cv0.imat";
connectAttr "jnt_lf_leg_pole_guide_001.wm" "autoPole_display_leg_cv1.imat";
connectAttr "autoPole_mid_world2.ot" "autoPole_position2.i3[0]";
connectAttr "autoPole_scaled2.o" "autoPole_position2.i3[1]";
connectAttr "jnt_rt_elbow_guide_001.wm" "autoPole_mid_world2.imat";
connectAttr "autoPole_direction2.o" "autoPole_scaled2.i1";
connectAttr "autoPole_offset2.o3" "autoPole_direction2.i1";
connectAttr "autoPole_length2.d" "autoPole_direction2.i2x";
connectAttr "autoPole_length2.d" "autoPole_direction2.i2y";
connectAttr "autoPole_length2.d" "autoPole_direction2.i2z";
connectAttr "autoPole_toMid2.o3" "autoPole_offset2.i3[0]";
connectAttr "autoPole_projection2.o" "autoPole_offset2.i3[1]";
connectAttr "autoPole_mid_world2.ot" "autoPole_toMid2.i3[0]";
connectAttr "autoPole_start_world2.ot" "autoPole_toMid2.i3[1]";
connectAttr "jnt_rt_upperArm_guide_001.wm" "autoPole_start_world2.imat";
connectAttr "autoPole_axis2.o3" "autoPole_projection2.i1";
connectAttr "autoPole_ratio2.ox" "autoPole_projection2.i2x";
connectAttr "autoPole_ratio2.ox" "autoPole_projection2.i2y";
connectAttr "autoPole_ratio2.ox" "autoPole_projection2.i2z";
connectAttr "autoPole_end_world2.ot" "autoPole_axis2.i3[0]";
connectAttr "autoPole_start_world2.ot" "autoPole_axis2.i3[1]";
connectAttr "jnt_rt_wrist_guide_001.wm" "autoPole_end_world2.imat";
connectAttr "autoPole_dotMid2.ox" "autoPole_ratio2.i1x";
connectAttr "autoPole_dotAxis2.ox" "autoPole_ratio2.i2x";
connectAttr "autoPole_toMid2.o3" "autoPole_dotMid2.i1";
connectAttr "autoPole_axis2.o3" "autoPole_dotMid2.i2";
connectAttr "autoPole_axis2.o3" "autoPole_dotAxis2.i1";
connectAttr "autoPole_axis2.o3" "autoPole_dotAxis2.i2";
connectAttr "autoPole_offset2.o3" "autoPole_length2.p1";
connectAttr "autoPole_mid_world3.ot" "autoPole_position3.i3[0]";
connectAttr "autoPole_scaled3.o" "autoPole_position3.i3[1]";
connectAttr "jnt_rt_knee_guide_001.wm" "autoPole_mid_world3.imat";
connectAttr "autoPole_direction3.o" "autoPole_scaled3.i1";
connectAttr "autoPole_offset3.o3" "autoPole_direction3.i1";
connectAttr "autoPole_length3.d" "autoPole_direction3.i2x";
connectAttr "autoPole_length3.d" "autoPole_direction3.i2y";
connectAttr "autoPole_length3.d" "autoPole_direction3.i2z";
connectAttr "autoPole_toMid3.o3" "autoPole_offset3.i3[0]";
connectAttr "autoPole_projection3.o" "autoPole_offset3.i3[1]";
connectAttr "autoPole_mid_world3.ot" "autoPole_toMid3.i3[0]";
connectAttr "autoPole_start_world3.ot" "autoPole_toMid3.i3[1]";
connectAttr "jnt_rt_upperLeg_guide_001.wm" "autoPole_start_world3.imat";
connectAttr "autoPole_axis3.o3" "autoPole_projection3.i1";
connectAttr "autoPole_ratio3.ox" "autoPole_projection3.i2x";
connectAttr "autoPole_ratio3.ox" "autoPole_projection3.i2y";
connectAttr "autoPole_ratio3.ox" "autoPole_projection3.i2z";
connectAttr "autoPole_end_world3.ot" "autoPole_axis3.i3[0]";
connectAttr "autoPole_start_world3.ot" "autoPole_axis3.i3[1]";
connectAttr "jnt_rt_ankle_guide_001.wm" "autoPole_end_world3.imat";
connectAttr "autoPole_dotMid3.ox" "autoPole_ratio3.i1x";
connectAttr "autoPole_dotAxis3.ox" "autoPole_ratio3.i2x";
connectAttr "autoPole_toMid3.o3" "autoPole_dotMid3.i1";
connectAttr "autoPole_axis3.o3" "autoPole_dotMid3.i2";
connectAttr "autoPole_axis3.o3" "autoPole_dotAxis3.i1";
connectAttr "autoPole_axis3.o3" "autoPole_dotAxis3.i2";
connectAttr "autoPole_offset3.o3" "autoPole_length3.p1";
connectAttr "jnt_rt_elbow_guide_001.wm" "autoPole_display_rt_arm_cv0.imat";
connectAttr "jnt_rt_arm_pole_guide_001.wm" "autoPole_display_rt_arm_cv1.imat";
connectAttr "jnt_rt_knee_guide_001.wm" "autoPole_display_rt_leg_cv0.imat";
connectAttr "jnt_rt_leg_pole_guide_001.wm" "autoPole_display_rt_leg_cv1.imat";
connectAttr "multMatrix37.o" "decomposeMatrix37.imat";
connectAttr "jnt_lf_ankle_guide_001.wm" "multMatrix37.i[1]";
connectAttr "multMatrix38.o" "decomposeMatrix38.imat";
connectAttr "jnt_lf_ball_guide_001.wm" "multMatrix38.i[1]";
connectAttr "multMatrix39.o" "decomposeMatrix39.imat";
connectAttr "jnt_lf_clavicle_guide_001.wm" "multMatrix39.i[1]";
connectAttr "multMatrix40.o" "decomposeMatrix40.imat";
connectAttr "jnt_lf_clavicle_guide_002.wm" "multMatrix40.i[1]";
connectAttr "multMatrix41.o" "decomposeMatrix41.imat";
connectAttr "jnt_lf_elbow_guide_001.wm" "multMatrix41.i[1]";
connectAttr "multMatrix42.o" "decomposeMatrix42.imat";
connectAttr "jnt_lf_index_guide_001.wm" "multMatrix42.i[1]";
connectAttr "multMatrix43.o" "decomposeMatrix43.imat";
connectAttr "jnt_lf_index_guide_002.wm" "multMatrix43.i[1]";
connectAttr "multMatrix44.o" "decomposeMatrix44.imat";
connectAttr "jnt_lf_index_guide_003.wm" "multMatrix44.i[1]";
connectAttr "multMatrix45.o" "decomposeMatrix45.imat";
connectAttr "jnt_lf_index_guide_004.wm" "multMatrix45.i[1]";
connectAttr "multMatrix46.o" "decomposeMatrix46.imat";
connectAttr "jnt_lf_index_guide_005.wm" "multMatrix46.i[1]";
connectAttr "multMatrix47.o" "decomposeMatrix47.imat";
connectAttr "jnt_lf_knee_guide_001.wm" "multMatrix47.i[1]";
connectAttr "multMatrix48.o" "decomposeMatrix48.imat";
connectAttr "jnt_lf_middle_guide_001.wm" "multMatrix48.i[1]";
connectAttr "multMatrix49.o" "decomposeMatrix49.imat";
connectAttr "jnt_lf_middle_guide_002.wm" "multMatrix49.i[1]";
connectAttr "multMatrix50.o" "decomposeMatrix50.imat";
connectAttr "jnt_lf_middle_guide_003.wm" "multMatrix50.i[1]";
connectAttr "multMatrix51.o" "decomposeMatrix51.imat";
connectAttr "jnt_lf_middle_guide_004.wm" "multMatrix51.i[1]";
connectAttr "multMatrix52.o" "decomposeMatrix52.imat";
connectAttr "jnt_lf_middle_guide_005.wm" "multMatrix52.i[1]";
connectAttr "multMatrix53.o" "decomposeMatrix53.imat";
connectAttr "jnt_lf_pinky_guide_001.wm" "multMatrix53.i[1]";
connectAttr "multMatrix54.o" "decomposeMatrix54.imat";
connectAttr "jnt_lf_pinky_guide_002.wm" "multMatrix54.i[1]";
connectAttr "multMatrix55.o" "decomposeMatrix55.imat";
connectAttr "jnt_lf_pinky_guide_003.wm" "multMatrix55.i[1]";
connectAttr "multMatrix56.o" "decomposeMatrix56.imat";
connectAttr "jnt_lf_pinky_guide_004.wm" "multMatrix56.i[1]";
connectAttr "multMatrix57.o" "decomposeMatrix57.imat";
connectAttr "jnt_lf_pinky_guide_005.wm" "multMatrix57.i[1]";
connectAttr "multMatrix58.o" "decomposeMatrix58.imat";
connectAttr "jnt_lf_ring_guide_001.wm" "multMatrix58.i[1]";
connectAttr "multMatrix59.o" "decomposeMatrix59.imat";
connectAttr "jnt_lf_ring_guide_002.wm" "multMatrix59.i[1]";
connectAttr "multMatrix60.o" "decomposeMatrix60.imat";
connectAttr "jnt_lf_ring_guide_003.wm" "multMatrix60.i[1]";
connectAttr "multMatrix61.o" "decomposeMatrix61.imat";
connectAttr "jnt_lf_ring_guide_004.wm" "multMatrix61.i[1]";
connectAttr "multMatrix62.o" "decomposeMatrix62.imat";
connectAttr "jnt_lf_ring_guide_005.wm" "multMatrix62.i[1]";
connectAttr "multMatrix63.o" "decomposeMatrix63.imat";
connectAttr "jnt_lf_scapula_guide_001.wm" "multMatrix63.i[1]";
connectAttr "multMatrix64.o" "decomposeMatrix64.imat";
connectAttr "jnt_lf_scapula_guide_002.wm" "multMatrix64.i[1]";
connectAttr "multMatrix65.o" "decomposeMatrix65.imat";
connectAttr "jnt_lf_thumb_guide_001.wm" "multMatrix65.i[1]";
connectAttr "multMatrix66.o" "decomposeMatrix66.imat";
connectAttr "jnt_lf_thumb_guide_002.wm" "multMatrix66.i[1]";
connectAttr "multMatrix67.o" "decomposeMatrix67.imat";
connectAttr "jnt_lf_thumb_guide_003.wm" "multMatrix67.i[1]";
connectAttr "multMatrix68.o" "decomposeMatrix68.imat";
connectAttr "jnt_lf_thumb_guide_004.wm" "multMatrix68.i[1]";
connectAttr "multMatrix69.o" "decomposeMatrix69.imat";
connectAttr "jnt_lf_toe_guide_001.wm" "multMatrix69.i[1]";
connectAttr "multMatrix70.o" "decomposeMatrix70.imat";
connectAttr "jnt_lf_upperArm_guide_001.wm" "multMatrix70.i[1]";
connectAttr "multMatrix71.o" "decomposeMatrix71.imat";
connectAttr "jnt_lf_upperLeg_guide_001.wm" "multMatrix71.i[1]";
connectAttr "multMatrix72.o" "decomposeMatrix72.imat";
connectAttr "jnt_lf_wrist_guide_001.wm" "multMatrix72.i[1]";
dataStructure -fmt "raw" -as "name=notes_fountainHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnel:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_barbacueHouseFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassesCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_det:string=value";
dataStructure -fmt "raw" -as "name=notes_vgtCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_vegetation_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=notes_groundRocks:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor1:string=value";
dataStructure -fmt "raw" -as "name=notes_base_right:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_det:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_ferns_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_midground_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_leavesDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_original:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_new_sand:string=value";
dataStructure -fmt "raw" -as "name=notes_slabsAndStairsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassLeftMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnelParkEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=notes_grassJuneBackYard_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchG_parShape:string=value";
dataStructure -fmt "raw" -as "name=Blur3dMetaData:string=Blur3dValue";
dataStructure -fmt "raw" -as "name=notes_pPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A:string=value";
dataStructure -fmt "raw" -as "name=notes_grassADecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_base_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=notes_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassBase:string=value";
dataStructure -fmt "raw" -as "name=notes_railes:string=value";
dataStructure -fmt "raw" -as "name=notes_grassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorGrassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees:string=value";
dataStructure -fmt "raw" -as "name=notes_frogEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_levelC:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=mapManager_Suelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small_grass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopes:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayArea_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_chocolateFountain_parShape:string=value";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=notes_decayFlowerBeds_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundRocks:string=value";
dataStructure -fmt "raw" -as "name=notes_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_suelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tunnel:string=value";
dataStructure -fmt "raw" -as "name=notes_degraded:string=value";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=mapManager_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrasStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_grasses:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesCDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=notes_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=notes_groundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_entrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=OffStruct:float=Offset";
dataStructure -fmt "raw" -as "name=mapManager_grass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_big_back:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_road_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_squareRocks_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=notes_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_frogLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_left:string=value";
dataStructure -fmt "raw" -as "name=notes_groundD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_riverside_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=mapManager_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=notes_floorSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_levelC:string=value";
dataStructure -fmt "raw" -as "name=notes_bushesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksCurbsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_fountainRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorA:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesFlowerBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersRightLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloB:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=keyValueStructure:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_parShape:string=value";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=notes_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesCarousel_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseForest:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquareFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vgTFicus39:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=notes_bushes_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_square_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floor1:string=value";
dataStructure -fmt "raw" -as "name=notes_grassC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=notes_grass:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=mapManager_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainTrail_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloC:string=value";
dataStructure -fmt "raw" -as "name=notes_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_rockTerraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayCircular_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_base:string=value";
dataStructure -fmt "raw" -as "name=mapManager_leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_big_back:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=notes_rightExterior_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquare_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_widlPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=mapManager_railes:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=notes_treesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBeauty_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_small:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=notes_right_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_groundA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=notes_path:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=notes_mainStreetMainstreetTrees04:string=value";
dataStructure -fmt "raw" -as "name=notes_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantNextHouse_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_treesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloProvi3:string=value";
dataStructure -fmt "raw" -as "name=notes_ridePiggy_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=notes_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_carouselStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_level1A:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchE_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_square_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloC:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_concretesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_square_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchF_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_trees:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_tilesFloorDet:string=value";
dataStructure -fmt "raw" -as "name=notes_background_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_base_left:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloor_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorA:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_holeRock_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBase:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=notes_circular:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_grassD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_railwayGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSide:string=value";
dataStructure -fmt "raw" -as "name=notes_leftSpecific_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=TifLocation:string=Path";
dataStructure -fmt "raw" -as "name=notes_terraceGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_treesRocksHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_cheat_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_new_sand:string=value";
dataStructure -fmt "raw" -as "name=notes_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=IdStruct:int32=ID";
dataStructure -fmt "raw" -as "name=mapManager_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloorGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_centerStreetGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocks:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_circular:string=value";
dataStructure -fmt "raw" -as "name=notes_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_original:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloB:string=value";
dataStructure -fmt "raw" -as "name=notes_Suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_geos:string=value";
dataStructure -fmt "raw" -as "name=OrgStruct:float[3]=Origin Point";
dataStructure -fmt "raw" -as "name=notes_vgFCarouselBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_vgGroundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_baseForest:string=value";
dataStructure -fmt "raw" -as "name=mapManager_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=notes_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_frogL_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=notes_center_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=notes_left_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rockCheated_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=mapManager_degraded:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tilesFloorDet:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_path:string=value";
dataStructure -fmt "raw" -as "name=notes_grassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchH_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_square_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_geos:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=notes_testMode_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=notes_rocks:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyFlowersBedA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=notes_small_grass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grasses:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_juneNbhHouseE_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiaryGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=notes_bridge_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_square_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_hotelBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSide:string=value";
dataStructure -fmt "raw" -as "name=notes_terraceBush_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=notes_curbsGardenGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_treesRocksAnimalHome_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaC_parShape:string=value";
dataStructure -fmt "raw" -as "name=RenderSettings:string=preset";
dataStructure -fmt "raw" -as "name=notes_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_wasteLand_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_heroesChoice_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaCorner_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchDegraded_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesTrees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchB_parShape:string=value";
// End of body_guide.ma
