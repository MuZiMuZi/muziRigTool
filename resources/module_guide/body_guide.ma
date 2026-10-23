//Maya ASCII 2023 scene
//Name: body_guide.ma
//Last modified: Fri, Oct 23, 2026 05:41:07 PM
//Codeset: 936
requires maya "2023";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2023";
fileInfo "version" "2023";
fileInfo "cutIdentifier" "202211021031-847a9f9623";
fileInfo "osv" "Windows 11 Pro v2009 (Build: 26200)";
fileInfo "UUID" "1533A7E0-4B76-A672-1D99-C9A24719D0C3";
createNode transform -n "grp_md_body_guide_001";
	rename -uid "24DC1213-4433-517D-0D8C-B29BF3A0D368";
createNode joint -n "jnt_md_root_guide_001" -p "grp_md_body_guide_001";
	rename -uid "5FC0FED0-4ED3-90D9-D3B5-56B764914821";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.5505488262748902e-17 89.520696060436919 -4.7392802238464409 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.10459177908219575 -0.10060738962014636 -46.112429265125151 ;
	setAttr ".pa" -type "double3" -2.5444437451708134e-14 9.541664044390544e-15 -2.2263882770244621e-14 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 6.4560376483287606e-27 97.722709655761719 -4.7392802238464355 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pelvisIkLocal001";
	setAttr ".radi" 3;
createNode joint -n "jnt_lf_upperLeg_guide_001" -p "jnt_md_root_guide_001";
	rename -uid "22312F55-4349-5A95-4CBA-DDAE27CAEC37";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "angle" -ln "angle" -min 0 -max 180 -at "double";
	addAttr -ci true -k true -sn "direction" -ln "direction" -min 0 -max 360 -at "double";
	setAttr ".t" -type "double3" 5.347078632157678 5.6860185033622752 1.3192471773196703e-12 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "B1CC4F77-4CC0-C1C5-C876-C19CA37EE45A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "MeshPosInfo" -ln "MeshPosInfo" -dt "string";
	setAttr ".t" -type "double3" 38.784625964610804 -8.5456982964325015 -2.1217327432346482e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "853C32F4-4B8A-EFAF-08E5-188E25EDA884";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "MeshPosInfo" -ln "MeshPosInfo" -dt "string";
	setAttr ".t" -type "double3" 40.815017700195327 8.5468854511964256 -1.1503073149867977e-15 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "C4CE37FE-4009-0F7F-9915-D4BD54F9C626";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.061090568001859 -1.0377299020092323e-10 1.9538681783615175e-10 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 6.3047201943606206 ;
	setAttr ".bps" -type "matrix" -1.3652595559142256e-16 -0.36924442657630246 0.92933231593566024 0
		 -2.8278662734025352e-16 0.92933231593566024 0.36924442657630252 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158372 5.5424643078574043 0.043287639113749776 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ball001";
	setAttr ".radi" 2;
createNode joint -n "jnt_lf_toe_guide_001" -p "jnt_lf_ball_guide_001";
	rename -uid "3AF17D5D-47FA-B5BD-FA16-B1B6C00D4A06";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" 10.061090568001813 -9.0436103050706151e-11 -5.5959894496027118e-09 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -1.3652595559142256e-16 -0.36924442657630246 0.92933231593566024 0
		 -2.8278662734025352e-16 0.92933231593566024 0.36924442657630252 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158336 1.827462690343332 9.3933842375133008 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "toe001";
	setAttr ".radi" 2;
createNode joint -n "jnt_md_spine_guide_001" -p "jnt_md_root_guide_001";
	rename -uid "23810BBA-4F2B-E62C-438C-FF86FB6C35B4";
	setAttr ".t" -type "double3" -7.1393695916255666 6.8735664927761633 1.7521513744862092 ;
	setAttr ".jo" -type "double3" -89.854742515053474 -2.4469571666007086 136.10613573140833 ;
createNode joint -n "jnt_md_spine_guide_002" -p "jnt_md_spine_guide_001";
	rename -uid "E7C59A4B-4C24-822C-D84B-D2AB872E2587";
	setAttr ".t" -type "double3" 5.9737392723382925 1.0309547334168254 -9.4583433596472525e-09 ;
	setAttr ".jo" -type "double3" 179.9999991462264 0 5.076203622587796 ;
createNode joint -n "jnt_md_spine_guide_003" -p "jnt_md_spine_guide_002";
	rename -uid "D325D3AF-4F78-C1C0-E90B-E6B50467C568";
	setAttr ".t" -type "double3" 6.041529168751623 -0.49835114061720409 2.0323144102852387e-09 ;
	setAttr ".jo" -type "double3" 0 0 -8.9510359245449607 ;
createNode joint -n "jnt_md_spine_guide_004" -p "jnt_md_spine_guide_003";
	rename -uid "D6441157-4B89-4D36-E575-1C8F58D42DF3";
	setAttr ".t" -type "double3" 6.0454920367591427 0.44772155377314604 2.032314410285252e-09 ;
	setAttr ".jo" -type "double3" 0 0 -6.8711318900975797 ;
createNode joint -n "jnt_md_spine_guide_005" -p "jnt_md_spine_guide_004";
	rename -uid "D1850E67-4DCB-541C-1421-4290B12C86BC";
	setAttr ".t" -type "double3" 5.9485078804258222 1.1677681930687029 2.0323144102852652e-09 ;
	setAttr ".jo" -type "double3" -71.548593583545653 -89.999999146249152 0 ;
createNode joint -n "jnt_md_spine_guide_006" -p "jnt_md_spine_guide_005";
	rename -uid "172A23BE-41EC-4FFD-4BCA-21A77223FE57";
	setAttr ".t" -type "double3" 9.0669622265265688e-08 6.0123084481958813 -0.77496817998117162 ;
	setAttr ".jo" -type "double3" -55.74732838900217 -23.160905347045894 75.006624217064015 ;
createNode joint -n "jnt_lf_clavicle_guide_001" -p "jnt_md_spine_guide_006";
	rename -uid "AF132AD1-4792-BCE7-9516-DB9878DA9C76";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.451632244396425 2.4947831929009586e-14 -3.2160557698030045e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "CCA41A60-4E44-E56C-D88F-18AD285777EC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.889342927023989 2.419467605103191e-14 6.9946318861440253e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 171.53560843727297 3.5248409739074154 99.249315403930595 ;
	setAttr ".bps" -type "matrix" 0.88146309366010767 -0.05149627414788422 -0.46943684161347787 0
		 0.030338377170725024 0.99815842183999004 -0.052529494386938158 0 0.47127741022225755 0.032060858672008231 0.8814021238659544 0
		 12.532456418338548 141.26101727982933 -6.1371766187541841 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "clavicle002";
	setAttr ".radi" 1.4200000000000002;
createNode joint -n "jnt_lf_scapula_guide_001" -p "jnt_lf_clavicle_guide_002";
	rename -uid "942B3094-42AA-5D83-DEB6-BF87783BC0E2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.0025830309577937e-06 1.2350709436711019e-14 -1.0823350130569915e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "03903C3D-40A2-59F3-F3F8-978063353980";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 11.813794085361032 -1.9264044719902048e-15 5.2207274279029446e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -0.77419630564219999 -0.219895055129468 -0.59352021453323545 0
		 -0.17451341093847944 0.9755235336626219 -0.13378678811081934 0 0.6084119901288817 7.0251917060003726e-16 -0.79362135194777461 0
		 2.1687257840853853 138.59831613823306 -13.412444985328223 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "scapula002";
	setAttr ".radi" 1.4200000000000002;
	setAttr ".liw" yes;
createNode joint -n "jnt_lf_upperArm_guide_001" -p "jnt_lf_scapula_guide_001";
	rename -uid "1B39A4B4-46FF-16C8-F2AD-8B9ECB77CDF9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -1.3031669319233079 -5.2568261096759894 3.554099997820622 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 150.12344956457818 -18.211850347276712 -115.65552034029493 ;
	setAttr ".bps" -type "matrix" 0.54983281735906786 -0.83442054590103742 -0.03776540127159822 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 0.020779472281474809 -0.031534727918730382 0.99928663278700758 0
		 15.690888045747149 136.07662538343271 -8.3978190574883431 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "upperArm001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_lf_elbow_guide_001" -p "jnt_lf_upperArm_guide_001";
	rename -uid "BFFF955F-4751-D2BD-4AA0-F6BD35E5B8D3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 21.418305597652861 3.2574135994334767 -2.6133960883329808 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 10.714576730178928 -7.0683485978588347 -0.40709421592918282 ;
	setAttr ".bps" -type "matrix" 0.54820073896376753 -0.83194372293254826 0.085706427254382517 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 -0.047157855261725834 0.071566251542364262 0.99632043456274133 0
		 28.281616792473059 116.96906682663963 -9.2626163347876815 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "elbow001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_lf_wrist_guide_001" -p "jnt_lf_elbow_guide_001";
	rename -uid "2AEFE0D9-481B-4D98-D38A-1A8C020D6C11";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 21.180998921756057 -5.3207315418904283e-15 4.3330745303717081e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 70.491994596947322 -43.678619612404169 -19.95267833155081 ;
	setAttr ".bps" -type "matrix" 0.54820073896376753 -0.83194372293254826 0.085706427254382517 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 -0.047157855261725834 0.071566251542364262 0.99632043456274133 0
		 39.892954040853361 99.347822541375365 -7.4472845402966241 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "wrist001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_lf_thumb_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "6083BE9A-40DF-235A-8799-92AD3E9D6D06";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.8704133667026923 4.2632564145606011e-14 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "D81AED76-4481-1BFC-2BE4-E5BFFCD95082";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.0813853793719232 -2.8421709430404007e-14 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "08B6B850-46A0-0231-F80C-1C82B0F45D5C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.764413153357836 1.4210854715202004e-14 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -2.4036277419051863e-06 -12.347860487122603 ;
	setAttr ".bps" -type "matrix" 0.080991369003737435 -0.92938361031742311 0.36012012304264956 0
		 0.20392556853556457 0.36911530024282724 0.90673494342288063 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 41.328137740294729 89.083549151462449 1.4470523974550469 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_thumb_guide_004" -p "jnt_lf_thumb_guide_003";
	rename -uid "DC1F2201-4765-4B80-2696-90BC743A72B8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.9801289421418176 -1.4210854715202004e-14 -1.4210854715202004e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 9.7214258780433281e-06 0 0 ;
	setAttr ".bps" -type "matrix" 0.080991369003737435 -0.92938361031742311 0.36012012304264956 0
		 0.20392556853556457 0.36911530024282724 0.90673494342288063 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 41.569502479119677 86.313866005228292 2.5202568416499509 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_index_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "FF15C3A4-452C-A482-2254-348A2423A287";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.547260234794825 -0.66069396927426449 -2.0495483468655569 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "D7C2BFF6-410B-86C3-22BD-4C8DB726CAB2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 6.3330235352054052 -2.2411530551890726e-15 7.920072438501332e-15 ;
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
	rename -uid "D4E9A15B-4FAF-8609-9502-F2B56C64103C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.6030102918318994 -3.1086244689504383e-15 2.55351295663786e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 1.6548823576989858e-14 1.7607973134000652e-14 2.1759156075188151e-14 ;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244867 0.11367137359260854 0.056997699975427002 0 -0.068928003320391715 0.10394719417961559 0.99219146901213062 0
		 47.150726497838384 86.027793125929264 -3.0455945407056766 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_index_guide_004" -p "jnt_lf_index_guide_003";
	rename -uid "79252898-4C5B-5A7A-08C6-2B8E502B10C9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.9915790935963971 1.1537456899142779e-14 6.6960647056589025e-15 ;
	setAttr ".r" -type "double3" 2.6786790555003344e-09 -4.1760364913203852e-10 4.5176121611329379e-10 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244889 0.11367137359260857 0.056997699975427016 0 -0.068928003320391715 0.10394719417961559 0.99219146901213062 0
		 47.408152121808804 83.647522053126153 -2.7783413642794272 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_index_guide_005" -p "jnt_lf_index_guide_004";
	rename -uid "F690B124-42A0-BA3E-575A-03A27AEA656A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.7578831976663594 2.1735444876924742e-11 2.0094110293977818e-11 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244889 0.11367137359260857 0.056997699975427016 0 -0.068928003320391729 0.10394719417961562 0.99219146901213084 0
		 47.702856830902377 80.922552086066005 -2.4723859259270502 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_middle_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "5E60E1E2-4423-C6E3-C9E9-B591EDA7C248";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.4135186249496563 -1.8187627133562347 -2.8426402471638239 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "3019349E-4A2B-2A18-1D75-ABA32245313C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.9056921935997826 -2.9561945876967399e-15 8.1475981073184335e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "72A3AFF5-42B7-37CF-E9C3-859E5F798FFC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.182952793058428 4.2304351430227614e-15 1.0224176351374669e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 0 2.8624992133171654e-14 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 47.611481337340869 85.686481700937208 -6.4386408392617538 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_middle_guide_004" -p "jnt_lf_middle_guide_003";
	rename -uid "08AFC56C-46A9-C8AA-9414-2A92870F0FA0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.5014280120760728 -9.827101826185271e-15 -1.737291070528626e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 47.980597430385174 82.204563610885955 -6.4386409174161452 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_middle_guide_005" -p "jnt_lf_middle_guide_004";
	rename -uid "CD72F8E8-4B0F-96DB-2D9E-8CB77CB4C3A3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.9261303558643292 2.6286506837399598e-13 -1.2434378393381456e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.603962413439806e-05 0 0 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 48.289066375332759 79.294737624233477 -6.4386409827295008 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_ring_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "8210E3B7-485B-E76A-EE87-9E9B1F2436F7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.2801928996909382 -2.778125392544792 -2.7461154100733922 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "4259A434-4932-0FB0-F62B-46826E0CACA5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.8644210548804168 -9.9788248581444846e-15 1.8149693021728141e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "613FA056-4446-BEC4-F044-E2A7FACA2629";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.5648045495068148 1.2144065691416148e-14 7.1900944504859218e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 0 2.8624992133171654e-14 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.386368938021796 86.298098671674708 -9.7947581537430075 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_ring_guide_004" -p "jnt_lf_ring_guide_003";
	rename -uid "54A43057-4B73-2B42-486C-6EA3E9A40267";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.7139968321794892 5.4376229365176836e-15 -4.4767162518065954e-15 ;
	setAttr ".r" -type "double3" 2.4429840508321296e-11 -2.8497769945911689e-12 -6.6791648310794614e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 0 1.4411888400381561e-15 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.364105083604663 83.601945924514453 -10.104669440862629 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_ring_guide_005" -p "jnt_lf_ring_guide_004";
	rename -uid "664BCF0C-47CA-926D-6A52-DBA8A20B208B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.8253327832633488 -1.7802777762855092e-14 1.13686837721616e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.340927901884804 80.795189241928057 -10.427294179779274 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_pinky_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "4B32EDC1-47E6-7D7C-BF0D-DC84F884A384";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.3360422572314667 -3.8284153513171204 -2.1626864027715738 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "32FBE2D5-4286-973F-FDC3-3C935762EA84";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.3187799595668173 -1.0256250052127531e-14 6.1615054967188114e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "2394FCF5-443E-F6CE-3BEE-E5A34583F57B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.6531556962369791 -7.9243374846190024e-15 -3.7632511786878604e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 0 -2.0673605429512861e-14 ;
	setAttr ".bps" -type "matrix" 0.12067361413015511 -0.97861443766478995 -0.16658829864907587 0
		 0.97432700445693887 0.14889195679473155 -0.16887295102473723 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.676737817701131 87.594672817743842 -11.788518462614915 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_pinky_guide_004" -p "jnt_lf_pinky_guide_003";
	rename -uid "63E0F6F1-458F-3ACA-BF15-269C5AF566B6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.2220449461758971 -4.8363859844639568e-15 1.0434265571062605e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 0 -1.9083328088781101e-14 ;
	setAttr ".bps" -type "matrix" -0.061789666546447547 -0.98926250914972291 -0.132445177710906 0
		 0.9798251220852342 -0.034852839122969104 -0.19679433359658383 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.944880037205451 85.420147341245936 -12.158685196851183 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_pinky_guide_005" -p "jnt_lf_pinky_guide_004";
	rename -uid "32C2C0E0-428F-578F-54B5-B48D8D4C1648";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.9444966201798328 2.4429220816064283e-15 -1.3352526832066122e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -0.061789666546447547 -0.98926250914972291 -0.132445177710906 0
		 0.9798251220852342 -0.034852839122969104 -0.19679433359658383 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.824730225846523 83.49652953199157 -12.41622443326145 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_md_neck_guide_001" -p "jnt_md_spine_guide_006";
	rename -uid "943C263E-4EC9-8431-7CCA-D7B353395AD6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 15.519151262230723 8.7045205450175356 -0.36297985417873047 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -29.552494818864027 -10.44516888981053 9.6322734275928124 ;
	setAttr ".bps" -type "matrix" 0.002403734363234536 0.95087171677376403 0.30957556266285347 0
		 0.006759053579396308 0.30955385072775532 -0.95085785561502523 0 -0.99997426829681824 0.004378046858594619 -0.005682908035490348 0
		 0.0015410989396165363 147.27624511718503 -7.5608520508071067 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "neck001";
	setAttr ".radi" 1.1799999999999997;
createNode joint -n "jnt_md_head_guide_001" -p "jnt_md_neck_guide_001";
	rename -uid "E954A4E7-4684-4308-620D-CC86130C25BD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 11.028817671533913 4.285556552086967e-15 2.5434043920492676e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.02597925010536322 0.0010307300008735225 18.222029465942192 ;
	setAttr ".bps" -type "matrix" 0.9999999999999678 -8.0032429164938725e-09 -4.2524292581148926e-09 0
		 7.8826654464066234e-09 0.99999988777747473 2.8000953960297401e-08 0 4.282515178523523e-09 2.8001441453627554e-08 0.9999999930132828 0
		 -3.4142020127789964e-05 157.59659086693244 -3.7071972028650269 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "headLocal001";
	setAttr ".radi" 3.35;
createNode joint -n "jnt_md_head_guide_002" -p "jnt_md_head_guide_001";
	rename -uid "F0F4D014-4E7A-3CC9-C5DF-0696EDC62B38";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 15.523703194114292 4.3647863651732579e-15 2.8680438872882658e-18 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.708474944404428e-16 1.0000000000000002 -1.3877787807814457e-16 0
		 1.8011355269333396e-16 -4.0245584642661925e-16 -1.0000000000000002 0 -1 2.2204460492503131e-16 -2.2204460492503131e-16 0
		 4.1510363020447602e-15 184.62057677907538 1.5088123436061767 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "headLocal002";
	setAttr ".radi" 3.35;
createNode joint -n "jnt_rt_clavicle_guide_001" -p "jnt_md_spine_guide_006";
	rename -uid "0D900775-4EA5-3DCF-AB5B-58AF8073F6B4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "88B98104-4F35-3CDC-1CF5-AF9D27208CCA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 171.53560843727297 3.5248409739074442 99.249315403930666 ;
	setAttr ".bps" -type "matrix" 0.88146309366010767 -0.05149627414788422 -0.46943684161347787 0
		 0.030338377170725024 0.99815842183999004 -0.052529494386938158 0 0.47127741022225755 0.032060858672008231 0.8814021238659544 0
		 12.532456418338548 141.26101727982933 -6.1371766187541841 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "clavicle002";
	setAttr ".radi" 1.4200000000000002;
createNode joint -n "jnt_rt_scapula_guide_001" -p "jnt_rt_clavicle_guide_002";
	rename -uid "B9B26CE2-4CCB-E7F2-4D11-1CA4FF7444C0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "A28561BA-4798-6830-DD83-91B4BCE72EAD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "E9088F56-4556-7BDF-0076-F0B98C94C0CC";
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
	setAttr ".lr" -type "double3" -180.00000147877947 -180 179.99999999999989 ;
	setAttr ".rst" -type "double3" -11.813794085361032 -5.6843418860808015e-14 5.3290705182007514e-15 ;
	setAttr ".rsrr" -type "double3" -180.00000147877947 -180 179.99999999999989 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_upperArm_guide_001" -p "jnt_rt_scapula_guide_001";
	rename -uid "8A450972-43A4-F227-5AE9-FBB384BBEC64";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 150.12344956457818 -18.211850347276709 -115.65552034029493 ;
	setAttr ".bps" -type "matrix" 0.54983281735906786 -0.83442054590103742 -0.03776540127159822 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 0.020779472281474809 -0.031534727918730382 0.99928663278700758 0
		 15.690888045747149 136.07662538343271 -8.3978190574883431 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "upperArm001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_rt_elbow_guide_001" -p "jnt_rt_upperArm_guide_001";
	rename -uid "4A8245D3-42A5-E4FF-44CE-9E9C5B599369";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 10.714576730178988 -7.0683485978588294 -0.40709421592917361 ;
	setAttr ".bps" -type "matrix" 0.54820073896376753 -0.83194372293254826 0.085706427254382517 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 -0.047157855261725834 0.071566251542364262 0.99632043456274133 0
		 28.281616792473059 116.96906682663963 -9.2626163347876815 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "elbow001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_rt_wrist_guide_001" -p "jnt_rt_elbow_guide_001";
	rename -uid "0D632C79-4A49-2847-31E4-FCA01449E034";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 70.491994596947265 -43.678619612404177 -19.952678331550768 ;
	setAttr ".bps" -type "matrix" 0.54820073896376753 -0.83194372293254826 0.085706427254382517 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 -0.047157855261725834 0.071566251542364262 0.99632043456274133 0
		 39.892954040853361 99.347822541375365 -7.4472845402966241 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "wrist001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_rt_thumb_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "15FCBF47-4361-0531-C0BF-BA9F4ADD2FEC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "579CC7B2-4F3E-E076-8B0E-AD8530FC4E66";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "8332819B-444A-15DF-2808-C6BA8D467F95";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.1137846664810862e-06 -2.403627715332214e-06 -12.347860487122626 ;
	setAttr ".bps" -type "matrix" 0.080991369003737435 -0.92938361031742311 0.36012012304264956 0
		 0.20392556853556457 0.36911530024282724 0.90673494342288063 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 41.328137740294729 89.083549151462449 1.4470523974550469 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_thumb_guide_004" -p "jnt_rt_thumb_guide_003";
	rename -uid "AE09891A-4434-BAFC-6341-B992AF186F38";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 9.7345173005335302e-06 1.6211227631473173e-21 2.7018726873048148e-22 ;
	setAttr ".bps" -type "matrix" 0.080991369003737435 -0.92938361031742311 0.36012012304264956 0
		 0.20392556853556457 0.36911530024282724 0.90673494342288063 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 41.569502479119677 86.313866005228292 2.5202568416499509 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbEnd001";
	setAttr ".radi" 0.5;
createNode parentConstraint -n "jnt_rt_thumb_guide_004_parentConstraint1" -p "jnt_rt_thumb_guide_004";
	rename -uid "20A24769-42AE-8BDF-F276-EF9A5FE31D6D";
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
	setAttr ".lr" -type "double3" -1.3091454295783752e-08 -1.908332754768005e-14 6.3611109862299631e-15 ;
	setAttr ".rst" -type "double3" -2.9801289421417891 -2.8421709430404007e-14 -1.4210854715202004e-14 ;
	setAttr ".rsrr" -type "double3" -1.3091454295783752e-08 -1.908332754768005e-14 6.3611109862299631e-15 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_003_parentConstraint1" -p "jnt_rt_thumb_guide_003";
	rename -uid "4DCB586A-4224-1C85-9704-1DA76C018715";
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
	setAttr ".lr" -type "double3" 1.4585759335151859e-06 4.4879579729953201e-06 24.695720974245123 ;
	setAttr ".rst" -type "double3" -3.7644131533578644 2.8421709430404007e-14 -7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" 1.4585759335151859e-06 4.4879579729953201e-06 24.695720974245123 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_002_parentConstraint1" -p "jnt_rt_thumb_guide_002";
	rename -uid "1E47D8A5-436C-439A-FDF6-26A2A5C5EB9C";
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
	setAttr ".lr" -type "double3" 4.6510119984991975e-07 3.2002376335054952e-06 16.538182024682548 ;
	setAttr ".rst" -type "double3" -4.0813853793719375 -4.2632564145606011e-14 1.4210854715202004e-14 ;
	setAttr ".rsrr" -type "double3" 4.6510119984991975e-07 3.2002376335054952e-06 16.538182024682548 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_001_parentConstraint1" -p "jnt_rt_thumb_guide_001";
	rename -uid "C1496ECD-4A78-AA77-EE64-4CA78F97DEF4";
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
	setAttr ".lr" -type "double3" 137.92773570508504 129.02631817106962 102.20808408974612 ;
	setAttr ".rst" -type "double3" -26.886953474794517 26.515375117795916 3.9754412671804431 ;
	setAttr ".rsrr" -type "double3" 137.92773570508504 129.02631817106962 102.20808408974612 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_index_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "93B0730B-41B1-9F1D-9815-6A94E196DA2B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "F9EBEDC2-49EF-D28B-B63A-7FA03648CA01";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
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
	rename -uid "C0DE80EF-49CC-49CA-B4E5-72AC4599335F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 1.6548823576989858e-14 1.7607973134000652e-14 2.1759156075188151e-14 ;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244867 0.11367137359260854 0.056997699975427002 0 -0.068928003320391715 0.10394719417961559 0.99219146901213062 0
		 47.150726497838384 86.027793125929264 -3.0455945407056766 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_index_guide_004" -p "jnt_rt_index_guide_003";
	rename -uid "D29BC37A-41A0-AA16-A001-15B615F60A44";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244889 0.11367137359260857 0.056997699975427016 0 -0.068928003320391715 0.10394719417961559 0.99219146901213062 0
		 47.408152121808804 83.647522053126153 -2.7783413642794272 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_index_guide_005" -p "jnt_rt_index_guide_004";
	rename -uid "4CD39F1D-424D-478B-E8A2-91A03C2B18D2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244889 0.11367137359260857 0.056997699975427016 0 -0.068928003320391729 0.10394719417961562 0.99219146901213084 0
		 47.702856830902377 80.922552086066005 -2.4723859259270502 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexEnd001";
	setAttr ".radi" 0.5;
createNode parentConstraint -n "jnt_rt_index_guide_005_parentConstraint1" -p "jnt_rt_index_guide_005";
	rename -uid "4F43CAE5-413E-04FC-0259-3BBC43C0DB7B";
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
	setAttr ".lr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr ".rst" -type "double3" -2.7578831976663665 2.1742607714259066e-11 2.0097701280974434e-11 ;
	setAttr ".rsrr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_004_parentConstraint1" -p "jnt_rt_index_guide_004";
	rename -uid "BE79FA0A-4387-FFF1-2601-B69B50C9EA59";
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
	setAttr ".lr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr ".rst" -type "double3" -3.9915790935964068 0 7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_003_parentConstraint1" -p "jnt_rt_index_guide_003";
	rename -uid "3FB8962E-4955-95EB-4E20-018381536C07";
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
	setAttr ".lr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr ".rst" -type "double3" -4.6030102918318931 0 7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_002_parentConstraint1" -p "jnt_rt_index_guide_002";
	rename -uid "6ED69D80-4B17-AF03-642A-4983A2C46508";
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
	setAttr ".lr" -type "double3" -0.13517139271932938 -0.55988519587811525 27.145834753298256 ;
	setAttr ".rst" -type "double3" -6.3330235352054061 -1.4210854715202004e-14 2.1316282072803006e-14 ;
	setAttr ".rsrr" -type "double3" -0.13517139271932938 -0.55988519587811525 27.145834753298256 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_001_parentConstraint1" -p "jnt_rt_index_guide_001";
	rename -uid "399E0660-43FF-0BEB-32CA-8093EBA54B8F";
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
	setAttr ".lr" -type "double3" -0.30799950080807958 12.605192021140542 -2.788122544855252 ;
	setAttr ".rst" -type "double3" -28.934834148043542 26.385518187176363 2.4999003211692354 ;
	setAttr ".rsrr" -type "double3" -0.30799950080807958 12.605192021140542 -2.788122544855252 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_middle_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "87344359-44FF-26BC-DB9E-1AB4499CB344";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "BAB0C0EE-4BA9-B76B-2D57-DCA343735C2E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "0E64851E-455B-C72B-1BC0-DDA0A0E24F54";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 0 2.8624992133171654e-14 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 47.611481337340869 85.686481700937208 -6.4386408392617538 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_middle_guide_004" -p "jnt_rt_middle_guide_003";
	rename -uid "3647676A-4861-6F9D-E41C-85B5519BFBE0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 47.980597430385174 82.204563610885955 -6.4386409174161452 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_middle_guide_005" -p "jnt_rt_middle_guide_004";
	rename -uid "3A489AE4-49E2-42C0-F255-A2947D79285E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.6036596903232025e-05 -1.2790654305222817e-20 -9.0332606711205498e-22 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 48.289066375332759 79.294737624233477 -6.4386409827295008 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleEnd001";
	setAttr ".radi" 0.5;
createNode parentConstraint -n "jnt_rt_middle_guide_005_parentConstraint1" -p "jnt_rt_middle_guide_005";
	rename -uid "D5298EF6-4D4A-5F94-9B66-B8B384473029";
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
	setAttr ".lr" -type "double3" 3.0272238644373319e-09 1.7969370922357985e-14 -2.8806874229874907e-14 ;
	setAttr ".rst" -type "double3" -2.9261303558643448 2.7000623958883807e-13 -1.2434497875801753e-14 ;
	setAttr ".rsrr" -type "double3" 3.0272238644373319e-09 1.7969370922357985e-14 -2.8806874229874907e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_004_parentConstraint1" -p "jnt_rt_middle_guide_004";
	rename -uid "521DCBE0-4C75-65EF-86AD-CCACDB22EFF7";
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
	setAttr ".lr" -type "double3" -7.3016284307130417e-15 1.7969386566508883e-14 -1.9083330522958676e-14 ;
	setAttr ".rst" -type "double3" -3.501428012076083 -1.4210854715202004e-14 -5.3290705182007514e-15 ;
	setAttr ".rsrr" -type "double3" -7.3016284307130417e-15 1.7969386566508883e-14 -1.9083330522958676e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_003_parentConstraint1" -p "jnt_rt_middle_guide_003";
	rename -uid "0384A0AE-4312-E1BF-EF92-F49791CAC8A7";
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
	setAttr ".lr" -type "double3" -7.3016284307130417e-15 1.7969386566508883e-14 -1.9083330522958676e-14 ;
	setAttr ".rst" -type "double3" -5.1829527930584334 1.4210854715202004e-14 0 ;
	setAttr ".rsrr" -type "double3" -7.3016284307130417e-15 1.7969386566508883e-14 -1.9083330522958676e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_002_parentConstraint1" -p "jnt_rt_middle_guide_002";
	rename -uid "9F380694-467E-63F6-1AD4-F7937ED1CEC6";
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
	setAttr ".lr" -type "double3" -0.32315892490453341 -2.1843600718445493 16.828873178827109 ;
	setAttr ".rst" -type "double3" -5.9056921935997835 -1.4210854715202004e-14 1.7763568394002505e-14 ;
	setAttr ".rsrr" -type "double3" -0.32315892490453341 -2.1843600718445493 16.828873178827109 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_001_parentConstraint1" -p "jnt_rt_middle_guide_001";
	rename -uid "5DBDC63F-4C20-9B6E-4FF0-ACB63590AEDD";
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
	setAttr ".lr" -type "double3" -0.50798744202058288 -7.3490571721279023 7.8975513865994529 ;
	setAttr ".rst" -type "double3" -30.3852904227296 25.459431622868532 1.9576565689092575 ;
	setAttr ".rsrr" -type "double3" -0.50798744202058288 -7.3490571721279023 7.8975513865994529 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_ring_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "DA2346F4-4872-8D44-E533-26860657E043";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "DAA6A9F6-40C1-D7FE-768D-9F81B21C792D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "863F8487-4FDA-F6BF-8F8F-0FAF84368E1F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 0 2.8624992133171654e-14 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.386368938021796 86.298098671674708 -9.7947581537430075 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_ring_guide_004" -p "jnt_rt_ring_guide_003";
	rename -uid "DC4C12F6-433A-E617-7616-8B927C98E6ED";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 0 1.4411888400381561e-15 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.364105083604663 83.601945924514453 -10.104669440862629 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_ring_guide_005" -p "jnt_rt_ring_guide_004";
	rename -uid "562EBA38-4C25-87E2-8F48-1DB33F8449AA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.340927901884804 80.795189241928057 -10.427294179779274 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringEnd001";
	setAttr ".radi" 0.5;
createNode parentConstraint -n "jnt_rt_ring_guide_005_parentConstraint1" -p "jnt_rt_ring_guide_005";
	rename -uid "06DDD6BB-403A-0013-147E-AF85B9BF4B63";
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
	setAttr ".lr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr ".rst" -type "double3" -2.8253327832633488 -1.4210854715202004e-14 1.1013412404281553e-13 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_004_parentConstraint1" -p "jnt_rt_ring_guide_004";
	rename -uid "FB90D6E2-460E-3B3C-F41D-E09D57DDAA00";
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
	setAttr ".lr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr ".rst" -type "double3" -2.7139968321795038 1.4210854715202004e-14 -3.5527136788005009e-15 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_003_parentConstraint1" -p "jnt_rt_ring_guide_003";
	rename -uid "D9A208A8-4FE5-5DAC-8FD2-6599ED7ABAF0";
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
	setAttr ".lr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr ".rst" -type "double3" -4.564804549506789 1.4210854715202004e-14 0 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_002_parentConstraint1" -p "jnt_rt_ring_guide_002";
	rename -uid "B29C9F6B-4189-E9F5-8F28-D89E3DD570D9";
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
	setAttr ".lr" -type "double3" -3.0223625454874576 -13.924486251583316 24.381045871513667 ;
	setAttr ".rst" -type "double3" -5.8644210548804239 -4.2632564145606011e-14 1.7763568394002505e-15 ;
	setAttr ".rsrr" -type "double3" -3.0223625454874576 -13.924486251583316 24.381045871513667 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_001_parentConstraint1" -p "jnt_rt_ring_guide_001";
	rename -uid "A8DE6284-41E1-4882-DE43-989BEC8E0A40";
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
	setAttr ".lr" -type "double3" -0.34776484501474897 -31.684347521770238 1.2254880921545954 ;
	setAttr ".rst" -type "double3" -31.049928443481477 24.156771940431156 1.6829657480732436 ;
	setAttr ".rsrr" -type "double3" -0.34776484501474897 -31.684347521770238 1.2254880921545954 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_pinky_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "69CCFD02-4BA0-C37F-F312-29953764A49D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "C0F4F309-4884-5974-1AF5-999BF3673CA9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "57AC358A-4B78-1B6D-48DA-788A7E186FC2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 0 -2.0673605429512861e-14 ;
	setAttr ".bps" -type "matrix" 0.12067361413015511 -0.97861443766478995 -0.16658829864907587 0
		 0.97432700445693887 0.14889195679473155 -0.16887295102473723 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.676737817701131 87.594672817743842 -11.788518462614915 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyMid001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_pinky_guide_004" -p "jnt_rt_pinky_guide_003";
	rename -uid "6C616B8C-44B9-5955-F3E9-8097A1724540";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 0 0 -1.9083328088781101e-14 ;
	setAttr ".bps" -type "matrix" -0.061789666546447547 -0.98926250914972291 -0.132445177710906 0
		 0.9798251220852342 -0.034852839122969104 -0.19679433359658383 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.944880037205451 85.420147341245936 -12.158685196851183 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_rt_pinky_guide_005" -p "jnt_rt_pinky_guide_004";
	rename -uid "7ED67FBE-41F4-0D09-F287-EEA915B27500";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -0.061789666546447547 -0.98926250914972291 -0.132445177710906 0
		 0.9798251220852342 -0.034852839122969104 -0.19679433359658383 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.824730225846523 83.49652953199157 -12.41622443326145 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyEnd001";
	setAttr ".radi" 0.5;
createNode parentConstraint -n "jnt_rt_pinky_guide_005_parentConstraint1" -p "jnt_rt_pinky_guide_005";
	rename -uid "876FF436-4E1D-1938-D2CC-96827590EC96";
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
	setAttr ".lr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr ".rst" -type "double3" -1.9444966201798479 1.4210854715202004e-14 -7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_004_parentConstraint1" -p "jnt_rt_pinky_guide_004";
	rename -uid "8631E01B-4DB7-FBFB-6D8A-EF8C43E8D733";
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
	setAttr ".lr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr ".rst" -type "double3" -2.2220449461758847 0 7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_003_parentConstraint1" -p "jnt_rt_pinky_guide_003";
	rename -uid "7BD48EB0-49CA-B71F-BFB5-509567E47D89";
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
	setAttr ".lr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr ".rst" -type "double3" -3.6531556962369649 -2.8421709430404007e-14 -1.0658141036401503e-14 ;
	setAttr ".rsrr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_002_parentConstraint1" -p "jnt_rt_pinky_guide_002";
	rename -uid "B3703656-4B54-E0E0-BBBC-4C8C22E1EEBE";
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
	setAttr ".lr" -type "double3" -0.73441779669426821 -2.6175398536187768 31.340870629514367 ;
	setAttr ".rst" -type "double3" -5.3187799595668181 -1.4210854715202004e-14 3.5527136788005009e-15 ;
	setAttr ".rsrr" -type "double3" -0.73441779669426821 -2.6175398536187768 31.340870629514367 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_001_parentConstraint1" -p "jnt_rt_pinky_guide_001";
	rename -uid "5029953A-4692-AB8C-03CF-F1ADD3792A26";
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
	setAttr ".lr" -type "double3" 8.5335367814477294 -49.099647567295825 -18.552853930180156 ;
	setAttr ".rst" -type "double3" -31.405355798267514 22.675263201098446 1.800107074966931 ;
	setAttr ".rsrr" -type "double3" 8.5335367814477294 -49.099647567295825 -18.552853930180156 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_wrist_guide_001_parentConstraint1" -p "jnt_rt_wrist_guide_001";
	rename -uid "29EC0A97-480D-D8B7-E6B9-EBA7FCB0A5A5";
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
	setAttr ".lr" -type "double3" 128.08229345384436 132.93989349989832 83.619292671175742 ;
	setAttr ".rst" -type "double3" -21.180998921756064 0 -3.5527136788005009e-15 ;
	setAttr ".rsrr" -type "double3" 128.08229345384436 132.93989349989832 83.619292671175742 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_elbow_guide_001_parentConstraint1" -p "jnt_rt_elbow_guide_001";
	rename -uid "61C2DEF1-4C5A-B3B3-CC6C-F993C583F9BA";
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
	setAttr ".lr" -type "double3" -0.22949392969038429 14.039317072850011 -1.8636293617127437 ;
	setAttr ".rst" -type "double3" -27.395612197271689 18.519674796295 -0.19772206553258442 ;
	setAttr ".rsrr" -type "double3" -2.9674302657713705 13.645504964482884 -24.430394373669429 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_upperArm_guide_001_parentConstraint1" -p "jnt_rt_upperArm_guide_001";
	rename -uid "4657BB8C-4D47-BBEA-3B4B-6FA44F0F2473";
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
	setAttr ".lr" -type "double3" -66.1006214616595 -27.765273094278754 138.40121632138082 ;
	setAttr ".rst" -type "double3" 1.3031669319233039 -5.2568261096760409 3.5540999978206376 ;
	setAttr ".rsrr" -type "double3" -66.1006214616595 -27.765273094278754 138.40121632138082 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_scapula_guide_001_parentConstraint1" -p "jnt_rt_scapula_guide_001";
	rename -uid "BB792981-4E9C-A8FB-47FD-BD9F9B33FB1D";
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
	setAttr ".rst" -type "double3" -2.0025831020120677e-06 4.2632564145606011e-14 1.7763568394002505e-15 ;
	setAttr ".rsrr" -type "double3" -332.03163080848248 7.0948458185681735 152.04242100109977 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_clavicle_guide_002_parentConstraint1" -p "jnt_rt_clavicle_guide_002";
	rename -uid "1A015511-4EE6-7020-58D6-8481D0C37F64";
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
	setAttr ".lr" -type "double3" 162.3820635613888 177.14835768295836 18.24937218825476 ;
	setAttr ".rst" -type "double3" -10.889342927023975 0 7.9936057773011271e-15 ;
	setAttr ".rsrr" -type "double3" 162.3820635613888 177.14835768295836 18.24937218825476 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_clavicle_guide_001_parentConstraint1" -p "jnt_rt_clavicle_guide_001";
	rename -uid "E0F7D80B-4510-805E-2FBF-4588B1ED133A";
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
	rename -uid "92736CDD-4569-B00F-898E-2796A93E67E7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "angle" -ln "angle" -min 0 -max 180 -at "double";
	addAttr -ci true -k true -sn "direction" -ln "direction" -min 0 -max 360 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "11DDA4A5-4674-3A5D-67A2-549724CA7929";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "MeshPosInfo" -ln "MeshPosInfo" -dt "string";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "1C89676E-4900-CFF1-4C7A-9A89DC94CD80";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "MeshPosInfo" -ln "MeshPosInfo" -dt "string";
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
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
	rename -uid "9F465470-491B-9235-9A31-3C85D23F1DF4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 8.5376533620430268e-07 -1.5088698449317847e-10 6.3047201943606126 ;
	setAttr ".bps" -type "matrix" -1.3652595559142256e-16 -0.36924442657630246 0.92933231593566024 0
		 -2.8278662734025352e-16 0.92933231593566024 0.36924442657630252 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158372 5.5424643078574043 0.043287639113749776 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ball001";
	setAttr ".radi" 2;
createNode joint -n "jnt_rt_toe_guide_001" -p "jnt_rt_ball_guide_001";
	rename -uid "9EE37EAF-490E-CF2A-453B-83988F2F86B2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 8.5377364625159387e-07 2.843469961455832e-22 2.2483912772683896e-18 ;
	setAttr ".bps" -type "matrix" -1.3652595559142256e-16 -0.36924442657630246 0.92933231593566024 0
		 -2.8278662734025352e-16 0.92933231593566024 0.36924442657630252 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158336 1.827462690343332 9.3933842375133008 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "toe001";
	setAttr ".radi" 2;
createNode parentConstraint -n "jnt_rt_toe_guide_001_parentConstraint1" -p "jnt_rt_toe_guide_001";
	rename -uid "610D25B3-46A9-B1E7-76D7-6B86F3CEA4B3";
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
	setAttr ".lr" -type "double3" -7.0820342723103074e-05 -0.001124932530911191 1.4283611968242512e-09 ;
	setAttr ".rst" -type "double3" -10.061090566062497 -3.4347191757433393e-10 -0.0001975427998104351 ;
	setAttr ".rsrr" -type "double3" -7.0820342723103074e-05 -0.001124932530911191 1.4283611968242512e-09 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ball_guide_001_parentConstraint1" -p "jnt_rt_ball_guide_001";
	rename -uid "3DE695C2-4027-7834-1730-398D6235B126";
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
	setAttr ".lr" -type "double3" 9.6032303529454234e-05 0.00096847170135639098 -12.609440387790922 ;
	setAttr ".rst" -type "double3" -10.061090567994976 -4.8615778069915905e-10 1.1774994796098781e-05 ;
	setAttr ".rsrr" -type "double3" 0.00011656428575880431 0.00078263569815421755 -12.609440385605803 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ankle_guide_001_parentConstraint1" -p "jnt_rt_ankle_guide_001";
	rename -uid "F11B3203-4088-FA7B-953E-BB812BDA920A";
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
	setAttr ".lr" -type "double3" 0.0001339926920975955 4.494499626130815e-06 -130.93022326754502 ;
	setAttr ".rst" -type "double3" 40.814974859602536 8.5468902815067107 -2.4631307736555641e-05 ;
	setAttr ".rsrr" -type "double3" 0.00042636606410780225 -179.99930714016733 2.5997845205305877e-09 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_knee_guide_001_parentConstraint1" -p "jnt_rt_knee_guide_001";
	rename -uid "897DC332-4154-326E-DB29-19868DB143E7";
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
	setAttr ".lr" -type "double3" -179.99980772867923 -0.00010248205065004338 179.99999999975338 ;
	setAttr ".rst" -type "double3" 38.784658353614773 -8.5456982078136843 4.2884333018022858e-06 ;
	setAttr ".rsrr" -type "double3" -179.99980772867923 -0.00010248205065004338 179.99999999975338 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_upperLeg_guide_001_parentConstraint1" -p "jnt_rt_upperLeg_guide_001";
	rename -uid "5FD2B35F-4AAE-9A3A-94DD-1AADC9A8F1CD";
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
	rename -uid "3288F439-4B25-2FF3-D2E8-42893B6C1E0A";
createNode joint -n "jnt_lf_leg_pole_guide_001" -p "grp_md_body_guide_001";
	rename -uid "354E69C6-425F-55A6-9713-D18F3C36525C";
createNode joint -n "jnt_rt_arm_pole_guide_001" -p "grp_md_body_guide_001";
	rename -uid "ADC4E589-4DFE-D486-5A25-559E1267494C";
createNode joint -n "jnt_rt_leg_pole_guide_001" -p "grp_md_body_guide_001";
	rename -uid "F55D3212-411F-7ACD-8B27-188891B4F3C2";
createNode transform -n "crv_auto_pole_arm" -p "grp_md_body_guide_001";
	rename -uid "77E4610E-4CE6-CB84-D03D-72BE32AE4478";
createNode nurbsCurve -n "curveShape1" -p "crv_auto_pole_arm";
	rename -uid "67123A19-4547-0836-1895-7AB704B3EE56";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		30.000000000000014 119.99999999999996 -12
		0 0 0
		;
createNode transform -n "crv_auto_pole_leg" -p "grp_md_body_guide_001";
	rename -uid "AAA738EF-4A59-841F-4874-C9B6EFA8612B";
createNode nurbsCurve -n "curveShape2" -p "crv_auto_pole_leg";
	rename -uid "1EB87A4A-4218-D9EE-555D-9889584A534D";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		7.8047248389787702 50.490343053185377 2.1373977479766344
		0 0 0
		;
createNode transform -n "crv_auto_pole_rt_arm" -p "grp_md_body_guide_001";
	rename -uid "CFF83BC6-44FC-DD16-A82A-EBBF5AABCD70";
createNode nurbsCurve -n "curveShape3" -p "crv_auto_pole_rt_arm";
	rename -uid "9915ACD4-4BBF-F8C8-D4F0-238D911B3322";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-29.999999999999986 119.99999999999997 -12.000000000000002
		0 0 0
		;
createNode transform -n "crv_auto_pole_rt_leg" -p "grp_md_body_guide_001";
	rename -uid "20A667C2-4263-5D91-A300-F8B8E1C41DE9";
createNode nurbsCurve -n "curveShape4" -p "crv_auto_pole_rt_leg";
	rename -uid "5B4626A8-49E0-E3B6-6D7B-B3835E379282";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-7.8047199999999997 50.490300000000019 2.1373999999999995
		0 0 0
		;
createNode transform -n "mirror_jnt_rt_ankle_guide_001" -p "grp_md_body_guide_001";
	rename -uid "01972C38-4C62-0ED3-AE87-D3870C19FB0F";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ankle_guide_001Shape" -p "mirror_jnt_rt_ankle_guide_001";
	rename -uid "BABC67F3-4F6A-3A6F-9A15-A192F1F9EA2A";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ball_guide_001" -p "grp_md_body_guide_001";
	rename -uid "66F57667-4BB1-51D0-5C64-BA9C4C6856AA";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ball_guide_001Shape" -p "mirror_jnt_rt_ball_guide_001";
	rename -uid "77568187-47BC-1217-8D6D-68BC1EB487BF";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_clavicle_guide_001" -p "grp_md_body_guide_001";
	rename -uid "98985A8D-435B-1274-73FA-B1AF4DD6DB81";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_clavicle_guide_001Shape" -p "mirror_jnt_rt_clavicle_guide_001";
	rename -uid "209CAB42-4B17-D616-1E63-3A8E264E60CE";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_clavicle_guide_002" -p "grp_md_body_guide_001";
	rename -uid "FA87CFB5-44EA-30EE-24F7-42895F91ED62";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_clavicle_guide_002Shape" -p "mirror_jnt_rt_clavicle_guide_002";
	rename -uid "40643D92-4B56-F1C8-C062-03B639E06D9E";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_elbow_guide_001" -p "grp_md_body_guide_001";
	rename -uid "F8BA0FEB-42C0-58DD-D4B3-AFB895AA54D8";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_elbow_guide_001Shape" -p "mirror_jnt_rt_elbow_guide_001";
	rename -uid "6D0FA44B-4D6A-DE27-D069-30BD2BCB084C";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_001" -p "grp_md_body_guide_001";
	rename -uid "C9293DD1-40FA-F152-7843-FDA098B72537";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_001Shape" -p "mirror_jnt_rt_index_guide_001";
	rename -uid "3AA440D6-4694-5972-8F90-1A983B158D69";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_002" -p "grp_md_body_guide_001";
	rename -uid "0405A38A-404A-7039-1CD1-99B51779BA6E";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_002Shape" -p "mirror_jnt_rt_index_guide_002";
	rename -uid "4E8165E8-41CB-CF87-06E7-068C3B29969B";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_003" -p "grp_md_body_guide_001";
	rename -uid "05AC78EC-429A-CDC8-153D-428228CC53F9";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_003Shape" -p "mirror_jnt_rt_index_guide_003";
	rename -uid "2C9BDBB8-4F5D-CF8A-EF5A-09BA80D4E0C5";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_004" -p "grp_md_body_guide_001";
	rename -uid "AE2DABD4-47FF-8045-32D9-AD80765E23CA";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_004Shape" -p "mirror_jnt_rt_index_guide_004";
	rename -uid "1816C70A-4871-8A52-38A6-FCB95947B0A4";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_005" -p "grp_md_body_guide_001";
	rename -uid "C11F8CD0-49AD-4E21-3651-C8881C27BA18";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_005Shape" -p "mirror_jnt_rt_index_guide_005";
	rename -uid "B9FA6535-43D0-5C9B-637A-01A9CB870046";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_knee_guide_001" -p "grp_md_body_guide_001";
	rename -uid "5C944640-4898-6370-3FCB-468392B9DBF3";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_knee_guide_001Shape" -p "mirror_jnt_rt_knee_guide_001";
	rename -uid "B761862A-4F0E-3671-CE89-CBAF4E4DABE2";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_001" -p "grp_md_body_guide_001";
	rename -uid "9328D468-4999-7B63-45E1-F7A10EF91D21";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_001Shape" -p "mirror_jnt_rt_middle_guide_001";
	rename -uid "28893F3A-4190-8001-5581-CDBF2839B713";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_002" -p "grp_md_body_guide_001";
	rename -uid "7A68AFD0-4B7A-9D69-04C4-3483A890862E";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_002Shape" -p "mirror_jnt_rt_middle_guide_002";
	rename -uid "C1D37E47-4B2D-15B8-A09E-31B7202042AE";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_003" -p "grp_md_body_guide_001";
	rename -uid "25B6F5B6-4CD9-93A7-020C-6CBB84017C6E";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_003Shape" -p "mirror_jnt_rt_middle_guide_003";
	rename -uid "0656BA39-473B-DACF-867C-39BDC17B90C0";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_004" -p "grp_md_body_guide_001";
	rename -uid "6789026A-49CC-0407-8CB3-2F98DC7CB74F";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_004Shape" -p "mirror_jnt_rt_middle_guide_004";
	rename -uid "F0F97716-4585-25A6-8412-039ED17F6CC0";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_005" -p "grp_md_body_guide_001";
	rename -uid "ACAA5729-4295-54B6-1F80-2A80759B7BA3";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_005Shape" -p "mirror_jnt_rt_middle_guide_005";
	rename -uid "E2FF9EE2-49E4-0FD0-3B18-B5BD1BBEB828";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_001" -p "grp_md_body_guide_001";
	rename -uid "35A76BEC-4921-D3B7-378F-A0B7C9FC4187";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_001Shape" -p "mirror_jnt_rt_pinky_guide_001";
	rename -uid "AE8D2ACC-4212-E482-3BE1-7381D2784848";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_002" -p "grp_md_body_guide_001";
	rename -uid "8AC04670-4A68-DA67-9219-838A584ECC54";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_002Shape" -p "mirror_jnt_rt_pinky_guide_002";
	rename -uid "7976886C-4E67-0B96-184A-62BCEC1E65DB";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_003" -p "grp_md_body_guide_001";
	rename -uid "3C0C1D94-4766-6385-B137-9EAB1A1ED67A";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_003Shape" -p "mirror_jnt_rt_pinky_guide_003";
	rename -uid "6FDB14AD-40E5-AD98-A11D-458B84E410A1";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_004" -p "grp_md_body_guide_001";
	rename -uid "BC3AA87A-484C-BE3D-6420-3795EF064BD8";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_004Shape" -p "mirror_jnt_rt_pinky_guide_004";
	rename -uid "1AC9A823-4103-6CCA-67E9-BD8DB42BF10F";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_005" -p "grp_md_body_guide_001";
	rename -uid "6256F310-486D-AE70-3FA3-A0ABBDE31A8B";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_005Shape" -p "mirror_jnt_rt_pinky_guide_005";
	rename -uid "010C1C6E-4A9E-C20B-D110-BEA0E7618FC6";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_001" -p "grp_md_body_guide_001";
	rename -uid "9410FC8B-4405-FD8D-E5C6-D2B637DA9DEE";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_001Shape" -p "mirror_jnt_rt_ring_guide_001";
	rename -uid "7D23917F-443C-01E5-4F59-40B62AB0AE2D";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_002" -p "grp_md_body_guide_001";
	rename -uid "D858271B-4D4F-8452-76F3-E694C50DC8B4";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_002Shape" -p "mirror_jnt_rt_ring_guide_002";
	rename -uid "9CF41B12-411A-FFF6-389F-C5A90DC9D42B";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_003" -p "grp_md_body_guide_001";
	rename -uid "4BECA233-4780-CF09-7B8A-B292346C9ECB";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_003Shape" -p "mirror_jnt_rt_ring_guide_003";
	rename -uid "282AA1E1-420E-135A-05D8-4FA7E7B6A3ED";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_004" -p "grp_md_body_guide_001";
	rename -uid "B46A0EB8-44B1-73C4-0470-73B5281F550B";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_004Shape" -p "mirror_jnt_rt_ring_guide_004";
	rename -uid "6AE7A02B-4336-A541-FC19-4C8DB2CD63B0";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_005" -p "grp_md_body_guide_001";
	rename -uid "CB21F825-4F0A-9E80-77F3-B7A29BAB5617";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_005Shape" -p "mirror_jnt_rt_ring_guide_005";
	rename -uid "BAA34761-464E-04B0-4B5C-3B95E6B11643";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_scapula_guide_001" -p "grp_md_body_guide_001";
	rename -uid "2B6EF275-45BF-0E56-50A6-359A8E386BC1";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_scapula_guide_001Shape" -p "mirror_jnt_rt_scapula_guide_001";
	rename -uid "3A8B2A8F-440A-EA6A-DFFB-739588BC714F";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_scapula_guide_002" -p "grp_md_body_guide_001";
	rename -uid "F9AEFA95-436D-38D7-2622-02AB8FDF8BFC";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_scapula_guide_002Shape" -p "mirror_jnt_rt_scapula_guide_002";
	rename -uid "CBB87BD6-4D87-3A37-4E96-79815A505BE5";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_001" -p "grp_md_body_guide_001";
	rename -uid "4E5F9A89-4203-B1BC-7E96-0F8AB0E3D8BD";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_001Shape" -p "mirror_jnt_rt_thumb_guide_001";
	rename -uid "5F523288-4F88-868C-961A-0C821BD364FB";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_002" -p "grp_md_body_guide_001";
	rename -uid "C3E6C1B6-4CDA-0427-CB5B-CE938738A46D";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_002Shape" -p "mirror_jnt_rt_thumb_guide_002";
	rename -uid "2B63A7FF-4DBC-2BD3-0B81-F5956EF7A0EE";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_003" -p "grp_md_body_guide_001";
	rename -uid "B5252EE7-4BF2-6EBE-2EAE-4E8993D19AC2";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_003Shape" -p "mirror_jnt_rt_thumb_guide_003";
	rename -uid "2CFB50EB-46E3-E310-F7DF-5A870E540FFC";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_004" -p "grp_md_body_guide_001";
	rename -uid "5D2BAAC7-4E08-A10E-CDB4-F69EADBFE7ED";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_004Shape" -p "mirror_jnt_rt_thumb_guide_004";
	rename -uid "BFBB19C6-42B2-E182-BEEB-8DB7DA0C5C10";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_toe_guide_001" -p "grp_md_body_guide_001";
	rename -uid "871BD3FB-4E68-6A6E-4848-A6B5A7102E5B";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_toe_guide_001Shape" -p "mirror_jnt_rt_toe_guide_001";
	rename -uid "9E46B29B-4AD8-6093-DDD3-CBA1163A0BFD";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_upperArm_guide_001" -p "grp_md_body_guide_001";
	rename -uid "B9F8C0D4-470E-F4CF-8F95-AC81AB948E7F";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_upperArm_guide_001Shape" -p "mirror_jnt_rt_upperArm_guide_001";
	rename -uid "615A1600-4FFB-CD0E-AECD-DE9853F846E3";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_upperLeg_guide_001" -p "grp_md_body_guide_001";
	rename -uid "07539866-48F0-13AA-0C20-B28E473B68A0";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_upperLeg_guide_001Shape" -p "mirror_jnt_rt_upperLeg_guide_001";
	rename -uid "FA1EBE80-47D9-6AF3-90EC-D4B041F7BBE7";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_wrist_guide_001" -p "grp_md_body_guide_001";
	rename -uid "3FA5544D-4A20-432E-297F-0D84ED882D8B";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_wrist_guide_001Shape" -p "mirror_jnt_rt_wrist_guide_001";
	rename -uid "2D33A9B7-4FC4-4D47-F06E-368C73D01C6F";
	setAttr -k off ".v";
createNode plusMinusAverage -n "autoPole_position";
	rename -uid "549B0446-4B8B-0949-E35E-288CA1D43A4D";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world";
	rename -uid "7A86BB21-4E43-135B-F088-B9A8A7892731";
createNode multiplyDivide -n "autoPole_scaled";
	rename -uid "9274AA31-456A-1FB3-1F83-FB8ABE1CA759";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction";
	rename -uid "61213E8A-4774-DF4D-076B-7D8EC8BB7107";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset";
	rename -uid "9BE652DE-45F9-6950-654E-E79D4AAF9686";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid";
	rename -uid "5CBEC183-483E-31A1-BDBD-CE96115E95D7";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world";
	rename -uid "5261858A-42A8-8A9B-20BF-6EB82AC2D0A7";
createNode multiplyDivide -n "autoPole_projection";
	rename -uid "5DBCA26A-47AB-4EF2-599E-868F4F1C76C1";
createNode plusMinusAverage -n "autoPole_axis";
	rename -uid "1EB198A5-493C-6250-E329-5F99DA889110";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world";
	rename -uid "0AD69FC3-4707-5DDA-9BC5-74A495EBF30A";
createNode multiplyDivide -n "autoPole_ratio";
	rename -uid "69873BD0-4387-197E-8A94-56A058FCCB73";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid";
	rename -uid "897E0A0A-4D9B-B288-9815-2BBB0272BF8E";
createNode vectorProduct -n "autoPole_dotAxis";
	rename -uid "7354F34C-4C97-6368-58EB-3B8532EE66A9";
createNode distanceBetween -n "autoPole_length";
	rename -uid "5A673854-4F3D-5F6F-AC42-7488A5718FC5";
createNode plusMinusAverage -n "autoPole_position1";
	rename -uid "EFFCC2E4-47AA-84EF-D437-2585D4E9EE35";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world1";
	rename -uid "D66183AE-4FF6-9866-E715-78A651DD33DC";
createNode multiplyDivide -n "autoPole_scaled1";
	rename -uid "C58779FE-4F89-B50F-8187-438E7EB4FF83";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction1";
	rename -uid "04989555-48FB-EEEA-E0E9-ABBCAC885BE2";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset1";
	rename -uid "5060F34F-4A59-100B-4151-899FE6672600";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid1";
	rename -uid "DC1E2407-46C7-04D3-42B8-9B927E2ADCFC";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world1";
	rename -uid "607C5355-4613-546D-825C-998C9CBFCDC8";
createNode multiplyDivide -n "autoPole_projection1";
	rename -uid "F7305080-487E-AC72-6BAD-0AA3ED0C1FE4";
createNode plusMinusAverage -n "autoPole_axis1";
	rename -uid "E3DD5DCE-452C-EEA2-15F2-33A1F68C019D";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world1";
	rename -uid "819F2F24-4F06-7358-2C87-98985C52BB0A";
createNode multiplyDivide -n "autoPole_ratio1";
	rename -uid "EBA1F154-438A-0DC9-4994-B7B41A81970C";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid1";
	rename -uid "4563A401-4511-0A22-F3B9-1B9710AE5049";
createNode vectorProduct -n "autoPole_dotAxis1";
	rename -uid "3DCDC4DA-4E2D-DC5B-73D1-2B99DE3EB56D";
createNode distanceBetween -n "autoPole_length1";
	rename -uid "56F237D9-453E-1F1A-8B8A-1891A5C67B61";
createNode plusMinusAverage -n "autoPole_position2";
	rename -uid "D261F3C6-4752-3DA8-8182-889A30480F16";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world2";
	rename -uid "1507722D-4690-1C3F-CD08-E38F70B11FFA";
createNode multiplyDivide -n "autoPole_scaled2";
	rename -uid "3F723763-4E95-FC91-ACF6-46AEB2A3C681";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction2";
	rename -uid "24DF77C0-4CFB-5D6B-7E1C-0195BFE38D2C";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset2";
	rename -uid "C266C966-40F1-B30F-A3A0-68AF34B75D31";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid2";
	rename -uid "E90B49CD-4EA9-206F-0ED7-1CB06EDB4A67";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world2";
	rename -uid "17D6D2FE-43C3-948F-F3EC-13BDDF810D5E";
createNode multiplyDivide -n "autoPole_projection2";
	rename -uid "A6EB3D3D-4E06-1916-9F14-DD8A7B9C5A41";
createNode plusMinusAverage -n "autoPole_axis2";
	rename -uid "38BAC542-4C83-D23D-1B7F-C295DED97446";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world2";
	rename -uid "9CB73477-4CC4-BCDB-5EBF-1F8E79D415EC";
createNode multiplyDivide -n "autoPole_ratio2";
	rename -uid "4E7A8551-4B63-BD2B-7FC2-DE99CD739DCF";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid2";
	rename -uid "3E184720-4DF9-C005-25E1-8D8FCF09365D";
createNode vectorProduct -n "autoPole_dotAxis2";
	rename -uid "16892FD2-49FC-1774-3509-B69ED8E4CF93";
createNode distanceBetween -n "autoPole_length2";
	rename -uid "907AC511-4A8B-59DC-07C4-A180377CBA4F";
createNode plusMinusAverage -n "autoPole_position3";
	rename -uid "F9F4568F-4300-0704-83D7-F2895457F615";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world3";
	rename -uid "71633813-45E1-7CC6-BD5B-62A2B0444F73";
createNode multiplyDivide -n "autoPole_scaled3";
	rename -uid "B94CA6A6-4576-D593-5EE6-3992DD389E4B";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction3";
	rename -uid "8809CF09-4FE0-25D7-E3B3-2EB01F6596DA";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset3";
	rename -uid "86D5FCBE-4023-252A-4202-AFAC7C2E9DF1";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid3";
	rename -uid "89F8DB77-414C-9B68-412E-04A295A7F1B7";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world3";
	rename -uid "71FD55C1-4A8F-354B-8B31-E094F290B02D";
createNode multiplyDivide -n "autoPole_projection3";
	rename -uid "8DC1FBAA-44F2-81B5-190C-599CCA6ED947";
createNode plusMinusAverage -n "autoPole_axis3";
	rename -uid "AC612C7B-43A1-0F6A-2A0B-898077F3236A";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world3";
	rename -uid "A0B97991-43CF-BFC4-A163-A98C26233348";
createNode multiplyDivide -n "autoPole_ratio3";
	rename -uid "6667694C-487C-5A7A-33D9-F0972C822538";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid3";
	rename -uid "11764332-443F-30D8-FDD2-6DAF92E9B5DB";
createNode vectorProduct -n "autoPole_dotAxis3";
	rename -uid "406AB67C-44B2-D823-AC78-47B02DA83E20";
createNode distanceBetween -n "autoPole_length3";
	rename -uid "DD84B3EF-47BE-23DF-04B9-8CA209C4C349";
createNode decomposeMatrix -n "autoPole_display_arm_cv0";
	rename -uid "F8FC5BF1-4184-BCD8-C373-7580C8403DF9";
createNode decomposeMatrix -n "autoPole_display_arm_cv1";
	rename -uid "29B8125D-4219-6DE1-9E2E-CA80B1A7D44A";
createNode decomposeMatrix -n "autoPole_display_leg_cv0";
	rename -uid "CC67D04D-4C3C-D000-5AC8-BE94B076147A";
createNode decomposeMatrix -n "autoPole_display_leg_cv1";
	rename -uid "C79C6C25-480C-67D7-717E-09A1FDAF1293";
createNode decomposeMatrix -n "autoPole_display_rt_arm_cv0";
	rename -uid "02181C73-4234-6CF2-B4CF-EC9A6B78F82B";
createNode decomposeMatrix -n "autoPole_display_rt_arm_cv1";
	rename -uid "CF1F5A3D-4058-4A19-15C6-4890BE4C7981";
createNode decomposeMatrix -n "autoPole_display_rt_leg_cv0";
	rename -uid "99894BFC-4890-8E58-94BB-DDA0AD1A9DAB";
createNode decomposeMatrix -n "autoPole_display_rt_leg_cv1";
	rename -uid "BBAA8F75-4A51-794D-E86E-139DFC014B24";
createNode decomposeMatrix -n "decomposeMatrix1";
	rename -uid "CB932D0C-46A4-C23B-7B9A-7A99C6952BAD";
createNode multMatrix -n "multMatrix1";
	rename -uid "BA10D466-4B0D-62B4-F6A2-2E90FBA69995";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix2";
	rename -uid "AB58EF70-44B5-9B7F-C55A-C5A5DB1E6124";
createNode multMatrix -n "multMatrix2";
	rename -uid "DB442BB1-4E85-2B7C-EA3D-91BA95C121F6";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix3";
	rename -uid "46C13403-420C-3865-1733-26BFEB07FB39";
createNode multMatrix -n "multMatrix3";
	rename -uid "219CBC6F-4D2E-0AF0-80CC-27B37AB551CB";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix4";
	rename -uid "836C27CE-4F36-5596-4214-17A9AD7E3E5B";
createNode multMatrix -n "multMatrix4";
	rename -uid "DC796C46-454E-AB4E-F82A-AFA847A0CB59";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix5";
	rename -uid "366175FF-4404-5BE3-9716-50AD695F2E6A";
createNode multMatrix -n "multMatrix5";
	rename -uid "22CFA602-4A0A-CBBF-D388-2B8EA566885D";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix6";
	rename -uid "CAC38371-482B-8F04-A60A-518B7E71BA75";
createNode multMatrix -n "multMatrix6";
	rename -uid "2F9472C5-4DC1-0644-E8AB-859F0F983841";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix7";
	rename -uid "EFDCFE81-4CEF-EFCD-DD2D-8DB788ED03CD";
createNode multMatrix -n "multMatrix7";
	rename -uid "38CAF178-4937-234F-A3A8-74BEA053FF4F";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix8";
	rename -uid "06907A73-4239-FA7A-2A11-CABAAB2FA4E6";
createNode multMatrix -n "multMatrix8";
	rename -uid "4214C29A-43AF-AB17-8787-798BD50C2A36";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix9";
	rename -uid "92F3F48B-481D-92AC-A709-B6BCFAE14DC7";
createNode multMatrix -n "multMatrix9";
	rename -uid "050D3BD5-40BD-9A54-28B6-02ACF7995F7E";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix10";
	rename -uid "28606CEF-4E36-8985-C9EB-9DA95023890F";
createNode multMatrix -n "multMatrix10";
	rename -uid "796698E8-4A66-6DE5-C244-659F59D36F2F";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix11";
	rename -uid "0E7E31C6-4634-E355-6F6A-62934C1186DA";
createNode multMatrix -n "multMatrix11";
	rename -uid "B1A1C931-41F8-1C35-7A5E-D0BC2894961A";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix12";
	rename -uid "3B093D05-4FE1-12B9-C35E-318CF07C875B";
createNode multMatrix -n "multMatrix12";
	rename -uid "B24F6596-4417-0408-09D6-B6A1B7FA7611";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix13";
	rename -uid "A6216A8B-4167-C94B-2BA5-9B88989FA52F";
createNode multMatrix -n "multMatrix13";
	rename -uid "C2A9E7E4-4018-07B2-29DB-438D2DE76B47";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix14";
	rename -uid "496DF1FB-4D07-6C84-8719-94A69B99E462";
createNode multMatrix -n "multMatrix14";
	rename -uid "E7E6AC6C-4EB0-C122-000F-5F98FEC7AE16";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix15";
	rename -uid "B2A684D0-490C-710D-C335-67AAD9F1A465";
createNode multMatrix -n "multMatrix15";
	rename -uid "E1F000F4-4A15-28F8-D3D6-3786BB9223B7";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix16";
	rename -uid "341CC17A-48D5-F485-2FA5-7E869011CCB6";
createNode multMatrix -n "multMatrix16";
	rename -uid "2F79AB82-4426-1DEF-036E-F288F126F8FB";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix17";
	rename -uid "B5373984-44FA-A50D-94C3-4AB6A09FB028";
createNode multMatrix -n "multMatrix17";
	rename -uid "190449C1-4183-52BD-1BC9-72BB7515AD09";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix18";
	rename -uid "D8C243F1-4237-39A4-21A2-6D91AA143EA3";
createNode multMatrix -n "multMatrix18";
	rename -uid "4FE57E87-4797-B5AA-4ED3-47805C4708CE";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix19";
	rename -uid "47A67913-4BF5-2BEC-0BEE-C386DF96600A";
createNode multMatrix -n "multMatrix19";
	rename -uid "ADA7D69F-42E3-8D1A-C9B9-63864C0526B4";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix20";
	rename -uid "87C7E3C9-4A22-A772-CD4A-C8A910359019";
createNode multMatrix -n "multMatrix20";
	rename -uid "4314B91F-452A-BEDD-76C0-B89CA3ED2845";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix21";
	rename -uid "C79103FE-4FDA-24F6-36F2-6198A4EB0066";
createNode multMatrix -n "multMatrix21";
	rename -uid "C1EBDFA7-487E-09C1-82FC-37946B985ED2";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix22";
	rename -uid "B86749B6-4E28-376A-8124-0693F53D2B4E";
createNode multMatrix -n "multMatrix22";
	rename -uid "025E80E5-46D8-D243-E174-2FACC43B6917";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix23";
	rename -uid "97B00495-4431-E94E-2F73-779AD811E9E5";
createNode multMatrix -n "multMatrix23";
	rename -uid "6A74E6E0-4237-570F-472A-16A5D8D44F4C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix24";
	rename -uid "4820A237-4F6F-41C1-1B1F-77805EECB416";
createNode multMatrix -n "multMatrix24";
	rename -uid "BB9DFDB6-4578-70CA-323B-478D093ADCAD";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix25";
	rename -uid "FBE3594D-47D1-C7FB-A611-58A641F501F8";
createNode multMatrix -n "multMatrix25";
	rename -uid "603599A0-4CD8-A9CF-9BC4-D495D99E39C5";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix26";
	rename -uid "50A8A28D-4E07-4FDD-C0ED-2796E37CEA1E";
createNode multMatrix -n "multMatrix26";
	rename -uid "1CC550D4-4DC7-456D-85FE-6CA4AE21392B";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix27";
	rename -uid "8618F2B7-4A62-114F-A11E-9788028C8DA3";
createNode multMatrix -n "multMatrix27";
	rename -uid "EC9EC2BA-41F3-6574-A2D5-1484C9A241ED";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix28";
	rename -uid "3FEA411F-4DDC-4E81-7CDC-3DA8EECBCD76";
createNode multMatrix -n "multMatrix28";
	rename -uid "43DCADF1-426D-B042-FE38-258A78276119";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix29";
	rename -uid "069DAE4D-4974-4828-FBDF-DEA37643CAB3";
createNode multMatrix -n "multMatrix29";
	rename -uid "C9EE5619-4A9A-7483-1889-CDA9039E0851";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix30";
	rename -uid "3AB1B8A9-4BB3-3196-EA41-08814D678DE1";
createNode multMatrix -n "multMatrix30";
	rename -uid "684336A9-46D5-EF64-7DC9-BDA8B6FE6C99";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix31";
	rename -uid "02C228ED-4D6D-1EB7-AEEF-DBB2C38F02F8";
createNode multMatrix -n "multMatrix31";
	rename -uid "5C0A7101-4146-275C-EBF7-188062244860";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix32";
	rename -uid "9A52A4D5-4426-681E-B14A-6386C3B63953";
createNode multMatrix -n "multMatrix32";
	rename -uid "63C97DD7-44E7-2DD6-9BF3-F7B9009DB671";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix33";
	rename -uid "C811B953-457F-22B6-29BF-D3818B663492";
createNode multMatrix -n "multMatrix33";
	rename -uid "D45E431A-4436-2ECB-0986-CCA666E635B7";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix34";
	rename -uid "4A9B3FC0-4DAD-9124-6208-4983DD66C5F3";
createNode multMatrix -n "multMatrix34";
	rename -uid "14BB6B05-462D-8936-A3F9-AD8066D38034";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix35";
	rename -uid "695FBA5F-4F39-C259-E304-4CB7711748E3";
createNode multMatrix -n "multMatrix35";
	rename -uid "A3E25FF1-4A90-9C14-55D5-509B2EC32A2D";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix36";
	rename -uid "2A01165C-4938-7C3D-B3B5-478288EF3BD3";
createNode multMatrix -n "multMatrix36";
	rename -uid "245B7FF7-47FA-8544-9545-A888679AD58C";
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
connectAttr "jnt_md_spine_guide_004.s" "jnt_md_spine_guide_005.is";
connectAttr "jnt_md_spine_guide_005.s" "jnt_md_spine_guide_006.is";
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
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.ctx" "jnt_rt_clavicle_guide_001.tx"
		;
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.cty" "jnt_rt_clavicle_guide_001.ty"
		;
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.ctz" "jnt_rt_clavicle_guide_001.tz"
		;
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.crx" "jnt_rt_clavicle_guide_001.rx"
		;
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.cry" "jnt_rt_clavicle_guide_001.ry"
		;
connectAttr "jnt_rt_clavicle_guide_001_parentConstraint1.crz" "jnt_rt_clavicle_guide_001.rz"
		;
connectAttr "jnt_rt_clavicle_guide_001.s" "jnt_rt_clavicle_guide_002.is";
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.ctx" "jnt_rt_clavicle_guide_002.tx"
		;
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.cty" "jnt_rt_clavicle_guide_002.ty"
		;
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.ctz" "jnt_rt_clavicle_guide_002.tz"
		;
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.crx" "jnt_rt_clavicle_guide_002.rx"
		;
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.cry" "jnt_rt_clavicle_guide_002.ry"
		;
connectAttr "jnt_rt_clavicle_guide_002_parentConstraint1.crz" "jnt_rt_clavicle_guide_002.rz"
		;
connectAttr "jnt_rt_clavicle_guide_002.s" "jnt_rt_scapula_guide_001.is";
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.ctx" "jnt_rt_scapula_guide_001.tx"
		;
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.cty" "jnt_rt_scapula_guide_001.ty"
		;
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.ctz" "jnt_rt_scapula_guide_001.tz"
		;
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.crx" "jnt_rt_scapula_guide_001.rx"
		;
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.cry" "jnt_rt_scapula_guide_001.ry"
		;
connectAttr "jnt_rt_scapula_guide_001_parentConstraint1.crz" "jnt_rt_scapula_guide_001.rz"
		;
connectAttr "jnt_rt_scapula_guide_001.s" "jnt_rt_scapula_guide_002.is";
connectAttr "jnt_rt_scapula_guide_002_parentConstraint1.ctx" "jnt_rt_scapula_guide_002.tx"
		;
connectAttr "jnt_rt_scapula_guide_002_parentConstraint1.cty" "jnt_rt_scapula_guide_002.ty"
		;
connectAttr "jnt_rt_scapula_guide_002_parentConstraint1.ctz" "jnt_rt_scapula_guide_002.tz"
		;
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
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.ctx" "jnt_rt_upperArm_guide_001.tx"
		;
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.cty" "jnt_rt_upperArm_guide_001.ty"
		;
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.ctz" "jnt_rt_upperArm_guide_001.tz"
		;
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.crx" "jnt_rt_upperArm_guide_001.rx"
		;
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.cry" "jnt_rt_upperArm_guide_001.ry"
		;
connectAttr "jnt_rt_upperArm_guide_001_parentConstraint1.crz" "jnt_rt_upperArm_guide_001.rz"
		;
connectAttr "jnt_rt_upperArm_guide_001.s" "jnt_rt_elbow_guide_001.is";
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.ctx" "jnt_rt_elbow_guide_001.tx"
		;
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.cty" "jnt_rt_elbow_guide_001.ty"
		;
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.ctz" "jnt_rt_elbow_guide_001.tz"
		;
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.crx" "jnt_rt_elbow_guide_001.rx"
		;
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.cry" "jnt_rt_elbow_guide_001.ry"
		;
connectAttr "jnt_rt_elbow_guide_001_parentConstraint1.crz" "jnt_rt_elbow_guide_001.rz"
		;
connectAttr "jnt_rt_elbow_guide_001.s" "jnt_rt_wrist_guide_001.is";
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.ctx" "jnt_rt_wrist_guide_001.tx"
		;
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.cty" "jnt_rt_wrist_guide_001.ty"
		;
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.ctz" "jnt_rt_wrist_guide_001.tz"
		;
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.crx" "jnt_rt_wrist_guide_001.rx"
		;
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.cry" "jnt_rt_wrist_guide_001.ry"
		;
connectAttr "jnt_rt_wrist_guide_001_parentConstraint1.crz" "jnt_rt_wrist_guide_001.rz"
		;
connectAttr "jnt_rt_wrist_guide_001.s" "jnt_rt_thumb_guide_001.is";
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.ctx" "jnt_rt_thumb_guide_001.tx"
		;
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.cty" "jnt_rt_thumb_guide_001.ty"
		;
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.ctz" "jnt_rt_thumb_guide_001.tz"
		;
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.crx" "jnt_rt_thumb_guide_001.rx"
		;
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.cry" "jnt_rt_thumb_guide_001.ry"
		;
connectAttr "jnt_rt_thumb_guide_001_parentConstraint1.crz" "jnt_rt_thumb_guide_001.rz"
		;
connectAttr "jnt_rt_thumb_guide_001.s" "jnt_rt_thumb_guide_002.is";
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.ctx" "jnt_rt_thumb_guide_002.tx"
		;
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.cty" "jnt_rt_thumb_guide_002.ty"
		;
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.ctz" "jnt_rt_thumb_guide_002.tz"
		;
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.crx" "jnt_rt_thumb_guide_002.rx"
		;
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.cry" "jnt_rt_thumb_guide_002.ry"
		;
connectAttr "jnt_rt_thumb_guide_002_parentConstraint1.crz" "jnt_rt_thumb_guide_002.rz"
		;
connectAttr "jnt_rt_thumb_guide_002.s" "jnt_rt_thumb_guide_003.is";
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.ctx" "jnt_rt_thumb_guide_003.tx"
		;
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.cty" "jnt_rt_thumb_guide_003.ty"
		;
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.ctz" "jnt_rt_thumb_guide_003.tz"
		;
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.crx" "jnt_rt_thumb_guide_003.rx"
		;
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.cry" "jnt_rt_thumb_guide_003.ry"
		;
connectAttr "jnt_rt_thumb_guide_003_parentConstraint1.crz" "jnt_rt_thumb_guide_003.rz"
		;
connectAttr "jnt_rt_thumb_guide_003.s" "jnt_rt_thumb_guide_004.is";
connectAttr "jnt_rt_thumb_guide_004_parentConstraint1.ctx" "jnt_rt_thumb_guide_004.tx"
		;
connectAttr "jnt_rt_thumb_guide_004_parentConstraint1.cty" "jnt_rt_thumb_guide_004.ty"
		;
connectAttr "jnt_rt_thumb_guide_004_parentConstraint1.ctz" "jnt_rt_thumb_guide_004.tz"
		;
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
connectAttr "jnt_rt_index_guide_001_parentConstraint1.ctx" "jnt_rt_index_guide_001.tx"
		;
connectAttr "jnt_rt_index_guide_001_parentConstraint1.cty" "jnt_rt_index_guide_001.ty"
		;
connectAttr "jnt_rt_index_guide_001_parentConstraint1.ctz" "jnt_rt_index_guide_001.tz"
		;
connectAttr "jnt_rt_index_guide_001_parentConstraint1.crx" "jnt_rt_index_guide_001.rx"
		;
connectAttr "jnt_rt_index_guide_001_parentConstraint1.cry" "jnt_rt_index_guide_001.ry"
		;
connectAttr "jnt_rt_index_guide_001_parentConstraint1.crz" "jnt_rt_index_guide_001.rz"
		;
connectAttr "jnt_rt_index_guide_001.s" "jnt_rt_index_guide_002.is";
connectAttr "jnt_rt_index_guide_002_parentConstraint1.ctx" "jnt_rt_index_guide_002.tx"
		;
connectAttr "jnt_rt_index_guide_002_parentConstraint1.cty" "jnt_rt_index_guide_002.ty"
		;
connectAttr "jnt_rt_index_guide_002_parentConstraint1.ctz" "jnt_rt_index_guide_002.tz"
		;
connectAttr "jnt_rt_index_guide_002_parentConstraint1.crx" "jnt_rt_index_guide_002.rx"
		;
connectAttr "jnt_rt_index_guide_002_parentConstraint1.cry" "jnt_rt_index_guide_002.ry"
		;
connectAttr "jnt_rt_index_guide_002_parentConstraint1.crz" "jnt_rt_index_guide_002.rz"
		;
connectAttr "jnt_rt_index_guide_002.s" "jnt_rt_index_guide_003.is";
connectAttr "jnt_rt_index_guide_003_parentConstraint1.ctx" "jnt_rt_index_guide_003.tx"
		;
connectAttr "jnt_rt_index_guide_003_parentConstraint1.cty" "jnt_rt_index_guide_003.ty"
		;
connectAttr "jnt_rt_index_guide_003_parentConstraint1.ctz" "jnt_rt_index_guide_003.tz"
		;
connectAttr "jnt_rt_index_guide_003_parentConstraint1.crx" "jnt_rt_index_guide_003.rx"
		;
connectAttr "jnt_rt_index_guide_003_parentConstraint1.cry" "jnt_rt_index_guide_003.ry"
		;
connectAttr "jnt_rt_index_guide_003_parentConstraint1.crz" "jnt_rt_index_guide_003.rz"
		;
connectAttr "jnt_rt_index_guide_003.s" "jnt_rt_index_guide_004.is";
connectAttr "jnt_rt_index_guide_004_parentConstraint1.ctx" "jnt_rt_index_guide_004.tx"
		;
connectAttr "jnt_rt_index_guide_004_parentConstraint1.cty" "jnt_rt_index_guide_004.ty"
		;
connectAttr "jnt_rt_index_guide_004_parentConstraint1.ctz" "jnt_rt_index_guide_004.tz"
		;
connectAttr "jnt_rt_index_guide_004_parentConstraint1.crx" "jnt_rt_index_guide_004.rx"
		;
connectAttr "jnt_rt_index_guide_004_parentConstraint1.cry" "jnt_rt_index_guide_004.ry"
		;
connectAttr "jnt_rt_index_guide_004_parentConstraint1.crz" "jnt_rt_index_guide_004.rz"
		;
connectAttr "jnt_rt_index_guide_004.s" "jnt_rt_index_guide_005.is";
connectAttr "jnt_rt_index_guide_005_parentConstraint1.ctx" "jnt_rt_index_guide_005.tx"
		;
connectAttr "jnt_rt_index_guide_005_parentConstraint1.cty" "jnt_rt_index_guide_005.ty"
		;
connectAttr "jnt_rt_index_guide_005_parentConstraint1.ctz" "jnt_rt_index_guide_005.tz"
		;
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
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.ctx" "jnt_rt_middle_guide_001.tx"
		;
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.cty" "jnt_rt_middle_guide_001.ty"
		;
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.ctz" "jnt_rt_middle_guide_001.tz"
		;
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.crx" "jnt_rt_middle_guide_001.rx"
		;
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.cry" "jnt_rt_middle_guide_001.ry"
		;
connectAttr "jnt_rt_middle_guide_001_parentConstraint1.crz" "jnt_rt_middle_guide_001.rz"
		;
connectAttr "jnt_rt_middle_guide_001.s" "jnt_rt_middle_guide_002.is";
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.ctx" "jnt_rt_middle_guide_002.tx"
		;
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.cty" "jnt_rt_middle_guide_002.ty"
		;
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.ctz" "jnt_rt_middle_guide_002.tz"
		;
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.crx" "jnt_rt_middle_guide_002.rx"
		;
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.cry" "jnt_rt_middle_guide_002.ry"
		;
connectAttr "jnt_rt_middle_guide_002_parentConstraint1.crz" "jnt_rt_middle_guide_002.rz"
		;
connectAttr "jnt_rt_middle_guide_002.s" "jnt_rt_middle_guide_003.is";
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.ctx" "jnt_rt_middle_guide_003.tx"
		;
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.cty" "jnt_rt_middle_guide_003.ty"
		;
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.ctz" "jnt_rt_middle_guide_003.tz"
		;
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.crx" "jnt_rt_middle_guide_003.rx"
		;
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.cry" "jnt_rt_middle_guide_003.ry"
		;
connectAttr "jnt_rt_middle_guide_003_parentConstraint1.crz" "jnt_rt_middle_guide_003.rz"
		;
connectAttr "jnt_rt_middle_guide_003.s" "jnt_rt_middle_guide_004.is";
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.ctx" "jnt_rt_middle_guide_004.tx"
		;
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.cty" "jnt_rt_middle_guide_004.ty"
		;
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.ctz" "jnt_rt_middle_guide_004.tz"
		;
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.crx" "jnt_rt_middle_guide_004.rx"
		;
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.cry" "jnt_rt_middle_guide_004.ry"
		;
connectAttr "jnt_rt_middle_guide_004_parentConstraint1.crz" "jnt_rt_middle_guide_004.rz"
		;
connectAttr "jnt_rt_middle_guide_004.s" "jnt_rt_middle_guide_005.is";
connectAttr "jnt_rt_middle_guide_005_parentConstraint1.ctx" "jnt_rt_middle_guide_005.tx"
		;
connectAttr "jnt_rt_middle_guide_005_parentConstraint1.cty" "jnt_rt_middle_guide_005.ty"
		;
connectAttr "jnt_rt_middle_guide_005_parentConstraint1.ctz" "jnt_rt_middle_guide_005.tz"
		;
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
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.ctx" "jnt_rt_ring_guide_001.tx"
		;
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.cty" "jnt_rt_ring_guide_001.ty"
		;
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.ctz" "jnt_rt_ring_guide_001.tz"
		;
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.crx" "jnt_rt_ring_guide_001.rx"
		;
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.cry" "jnt_rt_ring_guide_001.ry"
		;
connectAttr "jnt_rt_ring_guide_001_parentConstraint1.crz" "jnt_rt_ring_guide_001.rz"
		;
connectAttr "jnt_rt_ring_guide_001.s" "jnt_rt_ring_guide_002.is";
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.ctx" "jnt_rt_ring_guide_002.tx"
		;
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.cty" "jnt_rt_ring_guide_002.ty"
		;
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.ctz" "jnt_rt_ring_guide_002.tz"
		;
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.crx" "jnt_rt_ring_guide_002.rx"
		;
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.cry" "jnt_rt_ring_guide_002.ry"
		;
connectAttr "jnt_rt_ring_guide_002_parentConstraint1.crz" "jnt_rt_ring_guide_002.rz"
		;
connectAttr "jnt_rt_ring_guide_002.s" "jnt_rt_ring_guide_003.is";
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.ctx" "jnt_rt_ring_guide_003.tx"
		;
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.cty" "jnt_rt_ring_guide_003.ty"
		;
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.ctz" "jnt_rt_ring_guide_003.tz"
		;
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.crx" "jnt_rt_ring_guide_003.rx"
		;
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.cry" "jnt_rt_ring_guide_003.ry"
		;
connectAttr "jnt_rt_ring_guide_003_parentConstraint1.crz" "jnt_rt_ring_guide_003.rz"
		;
connectAttr "jnt_rt_ring_guide_003.s" "jnt_rt_ring_guide_004.is";
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.ctx" "jnt_rt_ring_guide_004.tx"
		;
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.cty" "jnt_rt_ring_guide_004.ty"
		;
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.ctz" "jnt_rt_ring_guide_004.tz"
		;
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.crx" "jnt_rt_ring_guide_004.rx"
		;
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.cry" "jnt_rt_ring_guide_004.ry"
		;
connectAttr "jnt_rt_ring_guide_004_parentConstraint1.crz" "jnt_rt_ring_guide_004.rz"
		;
connectAttr "jnt_rt_ring_guide_004.s" "jnt_rt_ring_guide_005.is";
connectAttr "jnt_rt_ring_guide_005_parentConstraint1.ctx" "jnt_rt_ring_guide_005.tx"
		;
connectAttr "jnt_rt_ring_guide_005_parentConstraint1.cty" "jnt_rt_ring_guide_005.ty"
		;
connectAttr "jnt_rt_ring_guide_005_parentConstraint1.ctz" "jnt_rt_ring_guide_005.tz"
		;
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
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.ctx" "jnt_rt_pinky_guide_001.tx"
		;
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.cty" "jnt_rt_pinky_guide_001.ty"
		;
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.ctz" "jnt_rt_pinky_guide_001.tz"
		;
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.crx" "jnt_rt_pinky_guide_001.rx"
		;
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.cry" "jnt_rt_pinky_guide_001.ry"
		;
connectAttr "jnt_rt_pinky_guide_001_parentConstraint1.crz" "jnt_rt_pinky_guide_001.rz"
		;
connectAttr "jnt_rt_pinky_guide_001.s" "jnt_rt_pinky_guide_002.is";
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.ctx" "jnt_rt_pinky_guide_002.tx"
		;
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.cty" "jnt_rt_pinky_guide_002.ty"
		;
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.ctz" "jnt_rt_pinky_guide_002.tz"
		;
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.crx" "jnt_rt_pinky_guide_002.rx"
		;
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.cry" "jnt_rt_pinky_guide_002.ry"
		;
connectAttr "jnt_rt_pinky_guide_002_parentConstraint1.crz" "jnt_rt_pinky_guide_002.rz"
		;
connectAttr "jnt_rt_pinky_guide_002.s" "jnt_rt_pinky_guide_003.is";
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.ctx" "jnt_rt_pinky_guide_003.tx"
		;
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.cty" "jnt_rt_pinky_guide_003.ty"
		;
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.ctz" "jnt_rt_pinky_guide_003.tz"
		;
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.crx" "jnt_rt_pinky_guide_003.rx"
		;
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.cry" "jnt_rt_pinky_guide_003.ry"
		;
connectAttr "jnt_rt_pinky_guide_003_parentConstraint1.crz" "jnt_rt_pinky_guide_003.rz"
		;
connectAttr "jnt_rt_pinky_guide_003.s" "jnt_rt_pinky_guide_004.is";
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.ctx" "jnt_rt_pinky_guide_004.tx"
		;
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.cty" "jnt_rt_pinky_guide_004.ty"
		;
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.ctz" "jnt_rt_pinky_guide_004.tz"
		;
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.crx" "jnt_rt_pinky_guide_004.rx"
		;
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.cry" "jnt_rt_pinky_guide_004.ry"
		;
connectAttr "jnt_rt_pinky_guide_004_parentConstraint1.crz" "jnt_rt_pinky_guide_004.rz"
		;
connectAttr "jnt_rt_pinky_guide_004.s" "jnt_rt_pinky_guide_005.is";
connectAttr "jnt_rt_pinky_guide_005_parentConstraint1.ctx" "jnt_rt_pinky_guide_005.tx"
		;
connectAttr "jnt_rt_pinky_guide_005_parentConstraint1.cty" "jnt_rt_pinky_guide_005.ty"
		;
connectAttr "jnt_rt_pinky_guide_005_parentConstraint1.ctz" "jnt_rt_pinky_guide_005.tz"
		;
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
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.ctx" "jnt_rt_upperLeg_guide_001.tx"
		;
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.cty" "jnt_rt_upperLeg_guide_001.ty"
		;
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.ctz" "jnt_rt_upperLeg_guide_001.tz"
		;
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.crx" "jnt_rt_upperLeg_guide_001.rx"
		;
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.cry" "jnt_rt_upperLeg_guide_001.ry"
		;
connectAttr "jnt_rt_upperLeg_guide_001_parentConstraint1.crz" "jnt_rt_upperLeg_guide_001.rz"
		;
connectAttr "jnt_rt_upperLeg_guide_001.s" "jnt_rt_knee_guide_001.is";
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.ctx" "jnt_rt_knee_guide_001.tx"
		;
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.cty" "jnt_rt_knee_guide_001.ty"
		;
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.ctz" "jnt_rt_knee_guide_001.tz"
		;
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.crx" "jnt_rt_knee_guide_001.rx"
		;
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.cry" "jnt_rt_knee_guide_001.ry"
		;
connectAttr "jnt_rt_knee_guide_001_parentConstraint1.crz" "jnt_rt_knee_guide_001.rz"
		;
connectAttr "jnt_rt_knee_guide_001.s" "jnt_rt_ankle_guide_001.is";
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.ctx" "jnt_rt_ankle_guide_001.tx"
		;
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.cty" "jnt_rt_ankle_guide_001.ty"
		;
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.ctz" "jnt_rt_ankle_guide_001.tz"
		;
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.crx" "jnt_rt_ankle_guide_001.rx"
		;
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.cry" "jnt_rt_ankle_guide_001.ry"
		;
connectAttr "jnt_rt_ankle_guide_001_parentConstraint1.crz" "jnt_rt_ankle_guide_001.rz"
		;
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.ctx" "jnt_rt_ball_guide_001.tx"
		;
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.cty" "jnt_rt_ball_guide_001.ty"
		;
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.ctz" "jnt_rt_ball_guide_001.tz"
		;
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.crx" "jnt_rt_ball_guide_001.rx"
		;
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.cry" "jnt_rt_ball_guide_001.ry"
		;
connectAttr "jnt_rt_ball_guide_001_parentConstraint1.crz" "jnt_rt_ball_guide_001.rz"
		;
connectAttr "jnt_rt_ball_guide_001.s" "jnt_rt_toe_guide_001.is";
connectAttr "jnt_rt_toe_guide_001_parentConstraint1.ctx" "jnt_rt_toe_guide_001.tx"
		;
connectAttr "jnt_rt_toe_guide_001_parentConstraint1.cty" "jnt_rt_toe_guide_001.ty"
		;
connectAttr "jnt_rt_toe_guide_001_parentConstraint1.ctz" "jnt_rt_toe_guide_001.tz"
		;
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
connectAttr "autoPole_position2.o3" "jnt_rt_arm_pole_guide_001.t";
connectAttr "autoPole_position3.o3" "jnt_rt_leg_pole_guide_001.t";
connectAttr "autoPole_display_arm_cv0.ot" "curveShape1.cp[0]";
connectAttr "autoPole_display_arm_cv1.ot" "curveShape1.cp[1]";
connectAttr "autoPole_display_leg_cv0.ot" "curveShape2.cp[0]";
connectAttr "autoPole_display_leg_cv1.ot" "curveShape2.cp[1]";
connectAttr "autoPole_display_rt_arm_cv0.ot" "curveShape3.cp[0]";
connectAttr "autoPole_display_rt_arm_cv1.ot" "curveShape3.cp[1]";
connectAttr "autoPole_display_rt_leg_cv0.ot" "curveShape4.cp[0]";
connectAttr "autoPole_display_rt_leg_cv1.ot" "curveShape4.cp[1]";
connectAttr "decomposeMatrix1.ot" "mirror_jnt_rt_ankle_guide_001.t";
connectAttr "decomposeMatrix1.or" "mirror_jnt_rt_ankle_guide_001.r";
connectAttr "decomposeMatrix2.ot" "mirror_jnt_rt_ball_guide_001.t";
connectAttr "decomposeMatrix2.or" "mirror_jnt_rt_ball_guide_001.r";
connectAttr "decomposeMatrix3.ot" "mirror_jnt_rt_clavicle_guide_001.t";
connectAttr "decomposeMatrix3.or" "mirror_jnt_rt_clavicle_guide_001.r";
connectAttr "decomposeMatrix4.ot" "mirror_jnt_rt_clavicle_guide_002.t";
connectAttr "decomposeMatrix4.or" "mirror_jnt_rt_clavicle_guide_002.r";
connectAttr "decomposeMatrix5.ot" "mirror_jnt_rt_elbow_guide_001.t";
connectAttr "decomposeMatrix5.or" "mirror_jnt_rt_elbow_guide_001.r";
connectAttr "decomposeMatrix6.ot" "mirror_jnt_rt_index_guide_001.t";
connectAttr "decomposeMatrix6.or" "mirror_jnt_rt_index_guide_001.r";
connectAttr "decomposeMatrix7.ot" "mirror_jnt_rt_index_guide_002.t";
connectAttr "decomposeMatrix7.or" "mirror_jnt_rt_index_guide_002.r";
connectAttr "decomposeMatrix8.ot" "mirror_jnt_rt_index_guide_003.t";
connectAttr "decomposeMatrix8.or" "mirror_jnt_rt_index_guide_003.r";
connectAttr "decomposeMatrix9.ot" "mirror_jnt_rt_index_guide_004.t";
connectAttr "decomposeMatrix9.or" "mirror_jnt_rt_index_guide_004.r";
connectAttr "decomposeMatrix10.ot" "mirror_jnt_rt_index_guide_005.t";
connectAttr "decomposeMatrix10.or" "mirror_jnt_rt_index_guide_005.r";
connectAttr "decomposeMatrix11.ot" "mirror_jnt_rt_knee_guide_001.t";
connectAttr "decomposeMatrix11.or" "mirror_jnt_rt_knee_guide_001.r";
connectAttr "decomposeMatrix12.ot" "mirror_jnt_rt_middle_guide_001.t";
connectAttr "decomposeMatrix12.or" "mirror_jnt_rt_middle_guide_001.r";
connectAttr "decomposeMatrix13.ot" "mirror_jnt_rt_middle_guide_002.t";
connectAttr "decomposeMatrix13.or" "mirror_jnt_rt_middle_guide_002.r";
connectAttr "decomposeMatrix14.ot" "mirror_jnt_rt_middle_guide_003.t";
connectAttr "decomposeMatrix14.or" "mirror_jnt_rt_middle_guide_003.r";
connectAttr "decomposeMatrix15.ot" "mirror_jnt_rt_middle_guide_004.t";
connectAttr "decomposeMatrix15.or" "mirror_jnt_rt_middle_guide_004.r";
connectAttr "decomposeMatrix16.ot" "mirror_jnt_rt_middle_guide_005.t";
connectAttr "decomposeMatrix16.or" "mirror_jnt_rt_middle_guide_005.r";
connectAttr "decomposeMatrix17.ot" "mirror_jnt_rt_pinky_guide_001.t";
connectAttr "decomposeMatrix17.or" "mirror_jnt_rt_pinky_guide_001.r";
connectAttr "decomposeMatrix18.ot" "mirror_jnt_rt_pinky_guide_002.t";
connectAttr "decomposeMatrix18.or" "mirror_jnt_rt_pinky_guide_002.r";
connectAttr "decomposeMatrix19.ot" "mirror_jnt_rt_pinky_guide_003.t";
connectAttr "decomposeMatrix19.or" "mirror_jnt_rt_pinky_guide_003.r";
connectAttr "decomposeMatrix20.ot" "mirror_jnt_rt_pinky_guide_004.t";
connectAttr "decomposeMatrix20.or" "mirror_jnt_rt_pinky_guide_004.r";
connectAttr "decomposeMatrix21.ot" "mirror_jnt_rt_pinky_guide_005.t";
connectAttr "decomposeMatrix21.or" "mirror_jnt_rt_pinky_guide_005.r";
connectAttr "decomposeMatrix22.ot" "mirror_jnt_rt_ring_guide_001.t";
connectAttr "decomposeMatrix22.or" "mirror_jnt_rt_ring_guide_001.r";
connectAttr "decomposeMatrix23.ot" "mirror_jnt_rt_ring_guide_002.t";
connectAttr "decomposeMatrix23.or" "mirror_jnt_rt_ring_guide_002.r";
connectAttr "decomposeMatrix24.ot" "mirror_jnt_rt_ring_guide_003.t";
connectAttr "decomposeMatrix24.or" "mirror_jnt_rt_ring_guide_003.r";
connectAttr "decomposeMatrix25.ot" "mirror_jnt_rt_ring_guide_004.t";
connectAttr "decomposeMatrix25.or" "mirror_jnt_rt_ring_guide_004.r";
connectAttr "decomposeMatrix26.ot" "mirror_jnt_rt_ring_guide_005.t";
connectAttr "decomposeMatrix26.or" "mirror_jnt_rt_ring_guide_005.r";
connectAttr "decomposeMatrix27.ot" "mirror_jnt_rt_scapula_guide_001.t";
connectAttr "decomposeMatrix27.or" "mirror_jnt_rt_scapula_guide_001.r";
connectAttr "decomposeMatrix28.ot" "mirror_jnt_rt_scapula_guide_002.t";
connectAttr "decomposeMatrix28.or" "mirror_jnt_rt_scapula_guide_002.r";
connectAttr "decomposeMatrix29.ot" "mirror_jnt_rt_thumb_guide_001.t";
connectAttr "decomposeMatrix29.or" "mirror_jnt_rt_thumb_guide_001.r";
connectAttr "decomposeMatrix30.ot" "mirror_jnt_rt_thumb_guide_002.t";
connectAttr "decomposeMatrix30.or" "mirror_jnt_rt_thumb_guide_002.r";
connectAttr "decomposeMatrix31.ot" "mirror_jnt_rt_thumb_guide_003.t";
connectAttr "decomposeMatrix31.or" "mirror_jnt_rt_thumb_guide_003.r";
connectAttr "decomposeMatrix32.ot" "mirror_jnt_rt_thumb_guide_004.t";
connectAttr "decomposeMatrix32.or" "mirror_jnt_rt_thumb_guide_004.r";
connectAttr "decomposeMatrix33.ot" "mirror_jnt_rt_toe_guide_001.t";
connectAttr "decomposeMatrix33.or" "mirror_jnt_rt_toe_guide_001.r";
connectAttr "decomposeMatrix34.ot" "mirror_jnt_rt_upperArm_guide_001.t";
connectAttr "decomposeMatrix34.or" "mirror_jnt_rt_upperArm_guide_001.r";
connectAttr "decomposeMatrix35.ot" "mirror_jnt_rt_upperLeg_guide_001.t";
connectAttr "decomposeMatrix35.or" "mirror_jnt_rt_upperLeg_guide_001.r";
connectAttr "decomposeMatrix36.ot" "mirror_jnt_rt_wrist_guide_001.t";
connectAttr "decomposeMatrix36.or" "mirror_jnt_rt_wrist_guide_001.r";
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
connectAttr "jnt_lf_elbow_guide_001.wm" "autoPole_display_arm_cv0.imat";
connectAttr "jnt_lf_arm_pole_guide_001.wm" "autoPole_display_arm_cv1.imat";
connectAttr "jnt_lf_knee_guide_001.wm" "autoPole_display_leg_cv0.imat";
connectAttr "jnt_lf_leg_pole_guide_001.wm" "autoPole_display_leg_cv1.imat";
connectAttr "jnt_rt_elbow_guide_001.wm" "autoPole_display_rt_arm_cv0.imat";
connectAttr "jnt_rt_arm_pole_guide_001.wm" "autoPole_display_rt_arm_cv1.imat";
connectAttr "jnt_rt_knee_guide_001.wm" "autoPole_display_rt_leg_cv0.imat";
connectAttr "jnt_rt_leg_pole_guide_001.wm" "autoPole_display_rt_leg_cv1.imat";
connectAttr "multMatrix1.o" "decomposeMatrix1.imat";
connectAttr "jnt_lf_ankle_guide_001.wm" "multMatrix1.i[1]";
connectAttr "multMatrix2.o" "decomposeMatrix2.imat";
connectAttr "jnt_lf_ball_guide_001.wm" "multMatrix2.i[1]";
connectAttr "multMatrix3.o" "decomposeMatrix3.imat";
connectAttr "jnt_lf_clavicle_guide_001.wm" "multMatrix3.i[1]";
connectAttr "multMatrix4.o" "decomposeMatrix4.imat";
connectAttr "jnt_lf_clavicle_guide_002.wm" "multMatrix4.i[1]";
connectAttr "multMatrix5.o" "decomposeMatrix5.imat";
connectAttr "jnt_lf_elbow_guide_001.wm" "multMatrix5.i[1]";
connectAttr "multMatrix6.o" "decomposeMatrix6.imat";
connectAttr "jnt_lf_index_guide_001.wm" "multMatrix6.i[1]";
connectAttr "multMatrix7.o" "decomposeMatrix7.imat";
connectAttr "jnt_lf_index_guide_002.wm" "multMatrix7.i[1]";
connectAttr "multMatrix8.o" "decomposeMatrix8.imat";
connectAttr "jnt_lf_index_guide_003.wm" "multMatrix8.i[1]";
connectAttr "multMatrix9.o" "decomposeMatrix9.imat";
connectAttr "jnt_lf_index_guide_004.wm" "multMatrix9.i[1]";
connectAttr "multMatrix10.o" "decomposeMatrix10.imat";
connectAttr "jnt_lf_index_guide_005.wm" "multMatrix10.i[1]";
connectAttr "multMatrix11.o" "decomposeMatrix11.imat";
connectAttr "jnt_lf_knee_guide_001.wm" "multMatrix11.i[1]";
connectAttr "multMatrix12.o" "decomposeMatrix12.imat";
connectAttr "jnt_lf_middle_guide_001.wm" "multMatrix12.i[1]";
connectAttr "multMatrix13.o" "decomposeMatrix13.imat";
connectAttr "jnt_lf_middle_guide_002.wm" "multMatrix13.i[1]";
connectAttr "multMatrix14.o" "decomposeMatrix14.imat";
connectAttr "jnt_lf_middle_guide_003.wm" "multMatrix14.i[1]";
connectAttr "multMatrix15.o" "decomposeMatrix15.imat";
connectAttr "jnt_lf_middle_guide_004.wm" "multMatrix15.i[1]";
connectAttr "multMatrix16.o" "decomposeMatrix16.imat";
connectAttr "jnt_lf_middle_guide_005.wm" "multMatrix16.i[1]";
connectAttr "multMatrix17.o" "decomposeMatrix17.imat";
connectAttr "jnt_lf_pinky_guide_001.wm" "multMatrix17.i[1]";
connectAttr "multMatrix18.o" "decomposeMatrix18.imat";
connectAttr "jnt_lf_pinky_guide_002.wm" "multMatrix18.i[1]";
connectAttr "multMatrix19.o" "decomposeMatrix19.imat";
connectAttr "jnt_lf_pinky_guide_003.wm" "multMatrix19.i[1]";
connectAttr "multMatrix20.o" "decomposeMatrix20.imat";
connectAttr "jnt_lf_pinky_guide_004.wm" "multMatrix20.i[1]";
connectAttr "multMatrix21.o" "decomposeMatrix21.imat";
connectAttr "jnt_lf_pinky_guide_005.wm" "multMatrix21.i[1]";
connectAttr "multMatrix22.o" "decomposeMatrix22.imat";
connectAttr "jnt_lf_ring_guide_001.wm" "multMatrix22.i[1]";
connectAttr "multMatrix23.o" "decomposeMatrix23.imat";
connectAttr "jnt_lf_ring_guide_002.wm" "multMatrix23.i[1]";
connectAttr "multMatrix24.o" "decomposeMatrix24.imat";
connectAttr "jnt_lf_ring_guide_003.wm" "multMatrix24.i[1]";
connectAttr "multMatrix25.o" "decomposeMatrix25.imat";
connectAttr "jnt_lf_ring_guide_004.wm" "multMatrix25.i[1]";
connectAttr "multMatrix26.o" "decomposeMatrix26.imat";
connectAttr "jnt_lf_ring_guide_005.wm" "multMatrix26.i[1]";
connectAttr "multMatrix27.o" "decomposeMatrix27.imat";
connectAttr "jnt_lf_scapula_guide_001.wm" "multMatrix27.i[1]";
connectAttr "multMatrix28.o" "decomposeMatrix28.imat";
connectAttr "jnt_lf_scapula_guide_002.wm" "multMatrix28.i[1]";
connectAttr "multMatrix29.o" "decomposeMatrix29.imat";
connectAttr "jnt_lf_thumb_guide_001.wm" "multMatrix29.i[1]";
connectAttr "multMatrix30.o" "decomposeMatrix30.imat";
connectAttr "jnt_lf_thumb_guide_002.wm" "multMatrix30.i[1]";
connectAttr "multMatrix31.o" "decomposeMatrix31.imat";
connectAttr "jnt_lf_thumb_guide_003.wm" "multMatrix31.i[1]";
connectAttr "multMatrix32.o" "decomposeMatrix32.imat";
connectAttr "jnt_lf_thumb_guide_004.wm" "multMatrix32.i[1]";
connectAttr "multMatrix33.o" "decomposeMatrix33.imat";
connectAttr "jnt_lf_toe_guide_001.wm" "multMatrix33.i[1]";
connectAttr "multMatrix34.o" "decomposeMatrix34.imat";
connectAttr "jnt_lf_upperArm_guide_001.wm" "multMatrix34.i[1]";
connectAttr "multMatrix35.o" "decomposeMatrix35.imat";
connectAttr "jnt_lf_upperLeg_guide_001.wm" "multMatrix35.i[1]";
connectAttr "multMatrix36.o" "decomposeMatrix36.imat";
connectAttr "jnt_lf_wrist_guide_001.wm" "multMatrix36.i[1]";
dataStructure -fmt "raw" -as "name=notes_floorSquare:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopes:string=value";
dataStructure -fmt "raw" -as "name=notes_floor1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_squareRocks_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bushesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=OffStruct:float=Offset";
dataStructure -fmt "raw" -as "name=notes_suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_frogLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=notes_riverside_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_fountainRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=notes_small:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaD_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tunnel:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksCurbsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesCarousel_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesFlowerBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bushes_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=notes_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseForest:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquare_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayCircular_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrasStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_square_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesCDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=notes_vgTFicus39:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=notes_road_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=notes_rightExterior_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_treesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_left:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor:string=value";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=notes_grassJuneBackYard_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=keyValueStructure:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=notes_trees_left:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundRocks:string=value";
dataStructure -fmt "raw" -as "name=notes_chocolateFountain_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=mapManager_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_leaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainTrail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_ridePiggy_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_right_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBeauty_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_treesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_railes:string=value";
dataStructure -fmt "raw" -as "name=notes_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloC:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersRightLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_path:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=notes_groundD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquareFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloProvi3:string=value";
dataStructure -fmt "raw" -as "name=notes_levelC:string=value";
dataStructure -fmt "raw" -as "name=notes_mountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=notes_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_big_back:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=notes_new_sand:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=notes_grassC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayArea_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grasses:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_degraded:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_floorGrassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees:string=value";
dataStructure -fmt "raw" -as "name=notes_vegetation_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_original:string=value";
dataStructure -fmt "raw" -as "name=notes_entrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchG_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_midground_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_base:string=value";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor1:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_levelC:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=notes_groundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_big_back:string=value";
dataStructure -fmt "raw" -as "name=notes_leavesDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_grassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorA:string=value";
dataStructure -fmt "raw" -as "name=notes_ferns_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=notes_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_decayFlowerBeds_parShape:string=value";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=Blur3dMetaData:string=Blur3dValue";
dataStructure -fmt "raw" -as "name=notes_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassBase:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_grassADecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloB:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_frogEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnelParkEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=notes_curbsGardenGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchDegraded_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchE_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantNextHouse_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSide:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_carouselStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesTrees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_Suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_widlPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=notes_terraceBush_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=mapManager_Suelo:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=notes_leftSpecific_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_geos:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_circular:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchF_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_concretesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloor_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=IdStruct:int32=ID";
dataStructure -fmt "raw" -as "name=notes_base_left:string=value";
dataStructure -fmt "raw" -as "name=notes_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_small_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloC:string=value";
dataStructure -fmt "raw" -as "name=notes_treesRocksAnimalHome_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=notes_groundA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=notes_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=notes_rockTerraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_level1A:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_square_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_trees:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mainStreetMainstreetTrees04:string=value";
dataStructure -fmt "raw" -as "name=notes_wasteLand_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBase:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_holeRock_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_treesRocksHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_terraceGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=RenderSettings:string=preset";
dataStructure -fmt "raw" -as "name=notes_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_left_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseForest:string=value";
dataStructure -fmt "raw" -as "name=notes_testMode_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=TifLocation:string=Path";
dataStructure -fmt "raw" -as "name=mapManager_square_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_path:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_heroesChoice_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSide:string=value";
dataStructure -fmt "raw" -as "name=notes_grassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rocks:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_hotelBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_railwayGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_background_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rockCheated_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=notes_vgGroundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bridge_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_geos:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocks:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_fountainHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=OrgStruct:float[3]=Origin Point";
dataStructure -fmt "raw" -as "name=notes_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_vgFCarouselBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchH_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_original:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_railes:string=value";
dataStructure -fmt "raw" -as "name=notes_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_degraded:string=value";
dataStructure -fmt "raw" -as "name=notes_center_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_circular:string=value";
dataStructure -fmt "raw" -as "name=notes_det:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=notes_cheat_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grasses:string=value";
dataStructure -fmt "raw" -as "name=mapManager_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloB:string=value";
dataStructure -fmt "raw" -as "name=notes_square_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloorGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_juneNbhHouseE_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnel:string=value";
dataStructure -fmt "raw" -as "name=notes_grassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=mapManager_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_tilesFloorDet:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_det:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaCorner_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_new_sand:string=value";
dataStructure -fmt "raw" -as "name=notes_square_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=mapManager_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_centerStreetGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyFlowersBedA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiaryGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundRocks:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_barbacueHouseFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_slabsAndStairsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_frogL_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_base_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassesCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassLeftMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vgtCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tilesFloorDet:string=value";
// End of body_guide.ma
