//Maya ASCII 2023 scene
//Name: body_guide.ma
//Last modified: Fri, Oct 23, 2026 05:40:15 PM
//Codeset: 936
requires maya "2023";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2023";
fileInfo "version" "2023";
fileInfo "cutIdentifier" "202211021031-847a9f9623";
fileInfo "osv" "Windows 11 Pro v2009 (Build: 26200)";
fileInfo "UUID" "A10B32E5-42A9-D218-FFD2-FABC9DBACCBD";
createNode transform -n "grp_md_body_guide_001";
	rename -uid "650D1677-4B72-C0A3-BCCD-E6BFF6CCE205";
createNode joint -n "jnt_md_root_guide_001" -p "grp_md_body_guide_001";
	rename -uid "3CEFA847-4C0F-E262-5BF9-AAA13691E5FD";
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
	rename -uid "B742EB41-425A-289B-A14B-C9A01ACA7DC4";
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
	rename -uid "453772FD-4062-3946-92AD-3DAFE8E5EE37";
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
	rename -uid "1F1C7E42-4867-270C-2FF5-809944545802";
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
	rename -uid "B98B746D-47D8-FAF7-3AF5-AEBC73587B80";
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
	rename -uid "312802AF-4EE9-17BE-F18C-4683337D3884";
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
	rename -uid "4A7F92C5-421D-6178-26B5-6794057F83C6";
	setAttr ".t" -type "double3" -7.1393695916255728 6.8735664927761935 1.7521513744862085 ;
	setAttr ".jo" -type "double3" -89.854742515053474 -2.4469571666007086 136.10613573140833 ;
createNode joint -n "jnt_md_spine_guide_002" -p "jnt_md_spine_guide_001";
	rename -uid "45AF7164-40C6-AF69-C9DE-FEA128C51F6F";
	setAttr ".t" -type "double3" 7.5939042533003018 0.096128340293784115 -2.1199828476560453e-14 ;
	setAttr ".jo" -type "double3" 179.9999991462264 0 5.076203622587796 ;
createNode joint -n "jnt_md_spine_guide_003" -p "jnt_md_spine_guide_002";
	rename -uid "95CF4906-4A10-C726-D438-108A6974FF80";
	setAttr ".t" -type "double3" 7.371001863286291 0.034428018239661295 5.1313888210597529e-10 ;
	setAttr ".jo" -type "double3" 0 0 -8.9510359245449607 ;
createNode joint -n "jnt_md_spine_guide_004" -p "jnt_md_spine_guide_003";
	rename -uid "1FDB3C38-4A51-D090-06F7-AAB1C237E591";
	setAttr ".t" -type "double3" 7.2480399207961383 0.31207746794756258 1.06278256081412e-09 ;
	setAttr ".jo" -type "double3" 0 0 -6.8711318900975797 ;
createNode joint -n "jnt_md_spine_guide_005" -p "jnt_md_spine_guide_004";
	rename -uid "267C4F21-43BC-B770-AA32-A189EC1FDE0F";
	setAttr ".t" -type "double3" 4.1864597640822296 0 7.3860391159867559e-14 ;
	setAttr ".jo" -type "double3" -71.548593583545653 -89.999999146249152 0 ;
createNode joint -n "jnt_md_spine_guide_006" -p "jnt_md_spine_guide_005";
	rename -uid "C3EED49D-4D2E-D58A-31B2-4BA14775E43A";
	setAttr ".t" -type "double3" 6.2381519792254702e-08 3.9712440235723818 -1.3250155702933935 ;
	setAttr ".jo" -type "double3" -55.747328389002163 -23.160905347045894 75.006624217064015 ;
createNode joint -n "jnt_lf_clavicle_guide_001" -p "jnt_md_spine_guide_006";
	rename -uid "EC29D987-40BC-8147-8DCC-32A578945A00";
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
	rename -uid "2BFEA212-412D-D908-D2D6-498DCF5EF488";
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
	rename -uid "400970E7-48C5-2FF0-1EAE-E9A356D44800";
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
	rename -uid "C7533FA4-4D80-5606-0A3D-E2932394C59A";
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
	rename -uid "F5A13769-4339-A0BB-7486-48B8A95C9859";
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
	rename -uid "F7C36B2F-4727-364D-BD6F-E1AF939AB7AF";
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
	rename -uid "18321616-4024-F88B-FCAF-C7BF1AEF6211";
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
	rename -uid "0276EAAF-4BD3-E53F-1F83-A7BDFB443E24";
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
	rename -uid "37FD385B-436D-4E38-B226-4EB382056DDB";
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
	rename -uid "E42EA1FA-4BD6-21C5-5CE2-579B0F9489A9";
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
	rename -uid "C054641B-4AE3-8124-9D8F-0C9F350E655B";
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
	rename -uid "F62DD58C-45C1-319F-8A70-2EB4A319D55A";
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
	rename -uid "E34DD616-4075-0C29-1131-EFA7E0D5505F";
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
	rename -uid "35AD1DB2-4792-3490-75A6-99BE03335D20";
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
	rename -uid "743279FD-4EC4-F5B5-F1D5-0F962B06DEC0";
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
	rename -uid "2282F0B2-43A0-5319-3676-D69036C783A2";
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
	rename -uid "B2C22FE0-41B2-3A07-610C-F69AB60416BB";
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
	rename -uid "D443C4FD-428F-B35A-EE2C-BBA064D940B0";
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
	rename -uid "D1632173-466C-54D1-473E-A2A3355C39CF";
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
	rename -uid "B2E0AAB6-454C-3E41-9AEA-2981DEC8190C";
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
	rename -uid "BFF445EB-4F09-208C-A8D6-F8A86E391163";
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
	rename -uid "9C6C6534-41E5-BF2D-5493-E3A63AE35343";
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
	rename -uid "3463B3AC-4871-49CC-D248-9D82A8166039";
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
	rename -uid "01643089-4611-EC5F-FB01-AEAA1F1662E4";
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
	rename -uid "F6323078-4400-8367-BEB7-0E9730F15E13";
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
	rename -uid "8D371237-45A3-CC42-687F-21A24CE66651";
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
	rename -uid "79E50421-476D-3080-2B8B-DF9532C3BA92";
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
	rename -uid "736B91B4-4669-8B38-3F4C-15A20E56038D";
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
	rename -uid "D52BF230-4F72-6A3B-88A5-8987BB211350";
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
	rename -uid "616680C8-4E8B-73C5-EF02-D28A896D50C8";
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
	rename -uid "21846260-4A4B-CC65-17B4-A0895E0F0305";
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
	rename -uid "3E38CCD3-40BA-DE83-FC0C-4AA58D34B7A9";
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
	rename -uid "765F922C-454A-8CC4-B416-85A0D55C050E";
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
	rename -uid "7A23A1EB-44A0-C853-EA27-A1A5127E74F1";
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
	rename -uid "6D0A138C-41E0-8F9C-D86B-7A82E66DA28F";
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
	rename -uid "1F208469-4C7B-D098-0DD5-A1BB6A37E522";
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
	rename -uid "BBD54044-4A84-983F-645D-A99716CF5503";
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
	rename -uid "33C1C923-4D59-8657-6ED4-FB8455AC7403";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.4787793334710984e-06 -8.978456395399527e-23 8.2088742059322392e-23 ;
	setAttr ".bps" -type "matrix" -0.77419630564219999 -0.219895055129468 -0.59352021453323545 0
		 -0.17451341093847944 0.9755235336626219 -0.13378678811081934 0 0.6084119901288817 7.0251917060003726e-16 -0.79362135194777461 0
		 2.1687257840853853 138.59831613823306 -13.412444985328223 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "scapula002";
	setAttr ".radi" 1.4200000000000002;
	setAttr ".liw" yes;
createNode parentConstraint -n "jnt_rt_scapula_guide_002_parentConstraint1" -p "jnt_rt_scapula_guide_002";
	rename -uid "28C04700-43DA-8BEB-875A-DDAABFCA852E";
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
	rename -uid "0EBF6AF6-4810-A452-4919-F18858080467";
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
	rename -uid "313A8798-4013-2CBD-41AE-FC8A4484BE84";
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
	rename -uid "BC2AA63A-48D1-E56E-6209-CD9C946D8EC1";
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
	rename -uid "252BC079-404F-D795-7462-0E8796DD6526";
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
	rename -uid "4A356827-428D-318F-7ECE-3090856C9AB0";
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
	rename -uid "3EEFEE2A-4396-BC20-5507-28A51FC4CB32";
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
	rename -uid "FC28A3AF-4750-0EE2-0056-4B9B9041904B";
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
	rename -uid "DE4D0007-4D0E-2600-BC8F-4299C61B4803";
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
	rename -uid "B33B950F-44DF-D2DB-D5E3-90AC504E4A09";
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
	rename -uid "2CA4CE26-43CF-C8F0-56FA-3B86F1D80AE4";
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
	rename -uid "2F42EE1E-44F6-EAD5-51EB-6786E3196D86";
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
	rename -uid "D9B18F3F-457D-9457-6314-1486E259A96E";
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
	rename -uid "D07CEF0E-4132-6498-FA24-E782D8B56951";
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
	rename -uid "EB0ECE71-4107-89ED-D2F3-69A7160C1A85";
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
	rename -uid "601F3C16-4734-8006-7065-119EEC2D3FCE";
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
	rename -uid "E4EF644B-499B-11DE-35CD-3FA2A578FBC5";
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
	rename -uid "E5C3A05B-4369-E794-F88D-298FA64F7184";
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
	rename -uid "3DBC646B-4D42-C9F9-25CC-CB9456829859";
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
	rename -uid "D52E340A-458B-50AE-F602-F5A5580EB8EB";
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
	rename -uid "93BE89C3-4361-4746-8F25-95AA8B105EF6";
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
	rename -uid "E7DC7F05-49D6-51F0-A74D-D2B302014620";
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
	rename -uid "2A091A7E-40A3-064D-A64D-169821AC3F14";
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
	rename -uid "AF55BB0B-4C0C-95C5-830E-1983F1C42468";
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
	rename -uid "A72490DB-493D-0983-8862-B6838B8C6548";
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
	rename -uid "38131DFF-41A9-EC68-735B-96B8AAF54569";
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
	rename -uid "F6233259-4180-EB88-5178-57BE19336BD9";
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
	rename -uid "DDAEFC49-4ADC-7723-F06E-928AEC3FFEE3";
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
	rename -uid "5FB01181-47A5-37B8-E721-7D94746CA55B";
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
	rename -uid "A7D2A4AD-4012-E678-F9CA-95BDCC069AB2";
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
	rename -uid "E014DF02-49F7-5651-F085-449C6AA96A02";
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
	rename -uid "0A306778-46E5-81CF-0F5D-5CBD0C58832E";
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
	rename -uid "B8785BD1-4730-AE5B-254C-1EAC2CD787F6";
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
	rename -uid "C7D1660D-4444-0FC5-8C23-6FA2556362AA";
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
	rename -uid "FD588DD0-498C-D222-BA4D-5186BE27F132";
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
	rename -uid "6B324E45-4611-1036-DD23-54A459152BF6";
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
	rename -uid "DA79EA81-4ABA-FB07-3266-96B0EF89419B";
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
	rename -uid "E49D4436-4E87-192D-EA01-37B3DA427CBD";
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
	rename -uid "84EDB2CC-4AE8-1559-BB4F-0782E9C520CF";
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
	rename -uid "AE1EE03E-4948-B3A9-E9F0-FEB97E66C404";
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
	rename -uid "50E098E3-46A3-A464-6787-DEA9FF97D20F";
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
	rename -uid "49D01A1D-4594-D7CA-61D0-CDA07C7E798A";
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
	rename -uid "F3134BBA-4819-C797-339F-14A67FB489F3";
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
	rename -uid "2AA44863-4CE4-2B7A-B6B1-FBBD6E6D6CA2";
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
	rename -uid "A08059E3-4F88-2497-C308-5DB02A967FD7";
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
	rename -uid "4FEF273C-4D21-8B2F-7509-87B1479EBAB2";
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
	rename -uid "AF840BBB-411F-1046-B646-97ABA202B90A";
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
	rename -uid "85855DEF-479A-D959-EFF7-94906BFD4AD3";
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
	rename -uid "8C744DD6-4C4B-2110-E3DA-3991E278E3A6";
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
	rename -uid "5E581FEE-4B3C-D04D-471A-F787001F4454";
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
	rename -uid "E1816AF3-44B9-FB7C-432F-EDBDB04A9251";
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
	rename -uid "22D4F450-4FD9-CA25-84B1-04A62531C5E8";
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
	rename -uid "6EE3EEE0-4DF0-D621-DD19-99930360193D";
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
	rename -uid "94483A07-4C1B-6CB2-59E6-5FAB6177989C";
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
	rename -uid "D9847ED8-4870-B0B3-9A90-F08C80E1E93D";
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
	rename -uid "020FDE84-4B00-51B7-4B34-A68BB589B16C";
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
	rename -uid "CE437EEF-438B-EB15-5854-D6B81FF3864D";
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
	rename -uid "205E2344-459E-9217-428D-5D9FC9992D69";
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
	rename -uid "555CD328-4EFB-3F94-E917-E39CF9A7272A";
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
	rename -uid "5DEF5186-4721-CB6D-0D0F-4C97E06DAD8C";
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
	rename -uid "FC7BF3AA-4B18-5ADA-653D-8CB27C5FDC3D";
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
	rename -uid "079B6EEC-4165-0546-2D77-848EAB04F85B";
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
	rename -uid "069044AC-4733-8BEC-F655-369E779A2F62";
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
	rename -uid "D1560E3C-413C-56A0-6BA1-16BA7A02BBBE";
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
	rename -uid "E4A16330-497D-4C53-3F45-64BDFDA0A868";
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
	rename -uid "35A0EB60-4DAD-3A92-A6BB-B59CF5AC4655";
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
	rename -uid "6F27F847-4BB6-00A5-963C-6F9DCFB93C2C";
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
	rename -uid "729EDA23-4982-204B-0FEB-60870C1AE2CA";
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
	rename -uid "9B202234-4723-EC33-1F31-DF8739745A23";
createNode joint -n "jnt_lf_leg_pole_guide_001" -p "grp_md_body_guide_001";
	rename -uid "991EB096-45FC-C815-B651-3C9BD1951748";
createNode joint -n "jnt_rt_arm_pole_guide_001" -p "grp_md_body_guide_001";
	rename -uid "EA80305E-44D0-75AA-35D0-22866BE82C54";
createNode joint -n "jnt_rt_leg_pole_guide_001" -p "grp_md_body_guide_001";
	rename -uid "A2E94434-4CA6-26AE-CCC0-54AA33CC962E";
createNode transform -n "crv_auto_pole_arm" -p "grp_md_body_guide_001";
	rename -uid "CC24472C-4C30-13FA-BBD1-9DB695C3D13B";
createNode nurbsCurve -n "curveShape1" -p "crv_auto_pole_arm";
	rename -uid "AA8A0FEE-496A-3435-388D-6CB8E96E3612";
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
	rename -uid "10FCCCAB-4545-50D7-9A75-1B83CFA65E75";
createNode nurbsCurve -n "curveShape2" -p "crv_auto_pole_leg";
	rename -uid "807B1EA1-41A6-CF44-E046-D5B0588212E2";
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
	rename -uid "29B43603-4118-BB0D-0DD4-F08E74093988";
createNode nurbsCurve -n "curveShape3" -p "crv_auto_pole_rt_arm";
	rename -uid "1AD48B35-4EEC-E953-F98F-F389B4D460B6";
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
	rename -uid "A3194B50-45DA-B3F2-3019-369167CC782A";
createNode nurbsCurve -n "curveShape4" -p "crv_auto_pole_rt_leg";
	rename -uid "2A389361-4606-1468-7B82-2C85D9A8E4AD";
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
	rename -uid "B80CFB5A-418F-64CB-3114-5A8D04EC5040";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ankle_guide_001Shape" -p "mirror_jnt_rt_ankle_guide_001";
	rename -uid "7977F0A5-4F1E-0351-6A47-448B8199977F";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ball_guide_001" -p "grp_md_body_guide_001";
	rename -uid "8B4C08F2-4944-2134-A7ED-5BBCFA0BF787";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ball_guide_001Shape" -p "mirror_jnt_rt_ball_guide_001";
	rename -uid "9AA16A02-4014-889D-8F45-809CAAA75BB5";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_clavicle_guide_001" -p "grp_md_body_guide_001";
	rename -uid "78200F13-4BB2-AEA0-07EA-8582C25BA366";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_clavicle_guide_001Shape" -p "mirror_jnt_rt_clavicle_guide_001";
	rename -uid "ED540F35-4B4C-8E50-5961-D59C7FE7B246";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_clavicle_guide_002" -p "grp_md_body_guide_001";
	rename -uid "24B26CF1-4EE1-F582-925B-669128E935AB";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_clavicle_guide_002Shape" -p "mirror_jnt_rt_clavicle_guide_002";
	rename -uid "13A2FE0B-4FFD-284F-98AF-6DAE401EA3C9";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_elbow_guide_001" -p "grp_md_body_guide_001";
	rename -uid "BC44FDC0-4774-5215-951C-91AF46C11149";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_elbow_guide_001Shape" -p "mirror_jnt_rt_elbow_guide_001";
	rename -uid "56DAA4A3-4288-877E-41D5-C4831840E1CA";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_001" -p "grp_md_body_guide_001";
	rename -uid "1E53092B-40D1-DBCD-29A6-BEBF3A7D9160";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_001Shape" -p "mirror_jnt_rt_index_guide_001";
	rename -uid "DE72E2B2-41C2-F8F0-3E02-B9AA5C421C2C";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_002" -p "grp_md_body_guide_001";
	rename -uid "3A6529DC-4CE4-959E-9755-8BA2C7F8BE2D";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_002Shape" -p "mirror_jnt_rt_index_guide_002";
	rename -uid "0938B476-498B-794D-1D12-4B838239166C";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_003" -p "grp_md_body_guide_001";
	rename -uid "AEF83298-416F-B4EA-6409-1A9F5E85CE7C";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_003Shape" -p "mirror_jnt_rt_index_guide_003";
	rename -uid "D812CFCD-47EF-9711-1CDB-1D9911CA5BC3";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_004" -p "grp_md_body_guide_001";
	rename -uid "D13A27A5-4009-CE17-4EC7-008603296E2C";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_004Shape" -p "mirror_jnt_rt_index_guide_004";
	rename -uid "B8DDC8FD-45C5-6520-0D3D-AD84CFC1314E";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_005" -p "grp_md_body_guide_001";
	rename -uid "624E9434-4469-4F71-8F43-6D948B089D50";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_005Shape" -p "mirror_jnt_rt_index_guide_005";
	rename -uid "3E13BE63-4A78-0B19-D5DB-DC8995546A4F";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_knee_guide_001" -p "grp_md_body_guide_001";
	rename -uid "DE02CBD8-4E0B-73B6-3441-63BDF00A10E4";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_knee_guide_001Shape" -p "mirror_jnt_rt_knee_guide_001";
	rename -uid "2D06A58A-42EF-E48E-4026-FD95B0CEFA20";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_001" -p "grp_md_body_guide_001";
	rename -uid "8FE2B002-4606-1AA2-B40B-1EBE7C694A5C";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_001Shape" -p "mirror_jnt_rt_middle_guide_001";
	rename -uid "CEF5EE6B-4061-0E0C-03BA-BB9E4762B6F4";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_002" -p "grp_md_body_guide_001";
	rename -uid "50210F77-4070-F44C-11DB-C489134D6480";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_002Shape" -p "mirror_jnt_rt_middle_guide_002";
	rename -uid "44D32ADB-48AD-7181-D50E-3BAA33D505E5";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_003" -p "grp_md_body_guide_001";
	rename -uid "BCA2BA49-4CAC-A45F-0831-E182F8CF5E53";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_003Shape" -p "mirror_jnt_rt_middle_guide_003";
	rename -uid "4D6705BB-462A-B05A-4671-97A0FE8F16E8";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_004" -p "grp_md_body_guide_001";
	rename -uid "25C3087A-4396-31E3-7495-27BC7F33DA97";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_004Shape" -p "mirror_jnt_rt_middle_guide_004";
	rename -uid "88CE63F2-494D-248B-6080-7CAF12B1F992";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_005" -p "grp_md_body_guide_001";
	rename -uid "598A0651-4B13-BDC2-A652-8D86C99FE4C2";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_005Shape" -p "mirror_jnt_rt_middle_guide_005";
	rename -uid "9126C039-4936-CEB7-6715-2783BBB9BA32";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_001" -p "grp_md_body_guide_001";
	rename -uid "D68C1C38-4745-3DC6-060E-21B90864646F";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_001Shape" -p "mirror_jnt_rt_pinky_guide_001";
	rename -uid "1660E987-4784-18E3-DD2E-4F9A66D244A5";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_002" -p "grp_md_body_guide_001";
	rename -uid "29043933-4E55-3408-93E7-7499173BA4A9";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_002Shape" -p "mirror_jnt_rt_pinky_guide_002";
	rename -uid "7035FC64-48E9-9E12-EFCC-E0A9682F173B";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_003" -p "grp_md_body_guide_001";
	rename -uid "F4B87084-4CBC-748A-D9C7-08BECD964393";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_003Shape" -p "mirror_jnt_rt_pinky_guide_003";
	rename -uid "5A9633CE-405B-6C94-5C65-AD98E1909540";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_004" -p "grp_md_body_guide_001";
	rename -uid "118C4DAB-48FF-0B75-54A0-88BF27960D0B";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_004Shape" -p "mirror_jnt_rt_pinky_guide_004";
	rename -uid "D10EA4EB-4774-E10A-3ADB-72AB46476160";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_005" -p "grp_md_body_guide_001";
	rename -uid "FB936A0A-4524-1638-BDD6-BB9FA72D4163";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_005Shape" -p "mirror_jnt_rt_pinky_guide_005";
	rename -uid "6FFEF865-4487-B48A-D165-968E8FDB0807";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_001" -p "grp_md_body_guide_001";
	rename -uid "6DE86AB7-43F3-EDC6-998C-7CABD6505284";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_001Shape" -p "mirror_jnt_rt_ring_guide_001";
	rename -uid "1BA19FB7-4BC5-BCB4-4D69-FB8881D385ED";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_002" -p "grp_md_body_guide_001";
	rename -uid "42572882-4F19-6E8B-F126-8F98FE842F9C";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_002Shape" -p "mirror_jnt_rt_ring_guide_002";
	rename -uid "E9EE2806-4127-6C6B-BC81-C5A876BD610F";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_003" -p "grp_md_body_guide_001";
	rename -uid "8831D80E-48F2-BC1C-D6B6-1B9452B21F79";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_003Shape" -p "mirror_jnt_rt_ring_guide_003";
	rename -uid "8AB181A9-45B1-1653-B12E-B39120D759C7";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_004" -p "grp_md_body_guide_001";
	rename -uid "6E75E72F-4ADF-DFBC-2A40-B4B3984336C5";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_004Shape" -p "mirror_jnt_rt_ring_guide_004";
	rename -uid "3CA2A47E-492B-274D-C905-618519A5647E";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_005" -p "grp_md_body_guide_001";
	rename -uid "62A531F5-4B63-3D3E-ED39-FAB67F3DF841";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_005Shape" -p "mirror_jnt_rt_ring_guide_005";
	rename -uid "321999BC-4715-CE30-7863-3E9BFE580728";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_scapula_guide_001" -p "grp_md_body_guide_001";
	rename -uid "E5483849-48E1-E383-6696-619637CFACDD";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_scapula_guide_001Shape" -p "mirror_jnt_rt_scapula_guide_001";
	rename -uid "3C494DC5-44AC-3509-F6ED-95AC5A5F2A57";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_scapula_guide_002" -p "grp_md_body_guide_001";
	rename -uid "B58AF6EF-498E-FCD6-8283-0C862F4DD67F";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_scapula_guide_002Shape" -p "mirror_jnt_rt_scapula_guide_002";
	rename -uid "1438159D-4CDB-EF4D-239C-76A512C722D1";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_001" -p "grp_md_body_guide_001";
	rename -uid "542D0085-4E09-1324-8BCC-649FA01739F5";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_001Shape" -p "mirror_jnt_rt_thumb_guide_001";
	rename -uid "E8CC6E77-4ADE-04F3-0582-B48ECD80A445";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_002" -p "grp_md_body_guide_001";
	rename -uid "62D1E805-41B9-1366-8B36-72A6C890179D";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_002Shape" -p "mirror_jnt_rt_thumb_guide_002";
	rename -uid "6E31B360-43C6-DE4D-0985-EDAE666A2325";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_003" -p "grp_md_body_guide_001";
	rename -uid "86A91416-403D-C60C-0815-4E8A856E6F4A";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_003Shape" -p "mirror_jnt_rt_thumb_guide_003";
	rename -uid "08A2AF52-4AC4-D7AE-6ABC-7E957FA12854";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_004" -p "grp_md_body_guide_001";
	rename -uid "4CA2F9AC-4454-5B19-D417-9C97BB02ACBC";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_004Shape" -p "mirror_jnt_rt_thumb_guide_004";
	rename -uid "8AB1EDA7-4416-77DC-962C-04AF13DAF478";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_toe_guide_001" -p "grp_md_body_guide_001";
	rename -uid "642B9E43-4EF5-DA39-C675-589B81BF973E";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_toe_guide_001Shape" -p "mirror_jnt_rt_toe_guide_001";
	rename -uid "4DCF6632-4A3F-6776-8E89-B6ACAE620D3D";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_upperArm_guide_001" -p "grp_md_body_guide_001";
	rename -uid "1D3D3272-4FEA-3788-670C-80AE77A11EA5";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_upperArm_guide_001Shape" -p "mirror_jnt_rt_upperArm_guide_001";
	rename -uid "7F3EF992-4E42-BBBF-CA67-D09E7CBA7E5E";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_upperLeg_guide_001" -p "grp_md_body_guide_001";
	rename -uid "83BBD27D-4113-C406-2044-958C3A770C59";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_upperLeg_guide_001Shape" -p "mirror_jnt_rt_upperLeg_guide_001";
	rename -uid "81F629D2-4093-083A-4F04-57BD6EB6D58F";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_wrist_guide_001" -p "grp_md_body_guide_001";
	rename -uid "6C79C029-4658-2C74-4B42-1284C0AA21F2";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_wrist_guide_001Shape" -p "mirror_jnt_rt_wrist_guide_001";
	rename -uid "22153E3B-4AA0-E4B7-6F67-6A9CF46078B0";
	setAttr -k off ".v";
createNode plusMinusAverage -n "autoPole_position";
	rename -uid "BF5060AC-42FC-7F21-6F2B-1DB2F2FF6BB4";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world";
	rename -uid "29C7B9F9-4D72-58B5-1093-ACBC7B920DEA";
createNode multiplyDivide -n "autoPole_scaled";
	rename -uid "EF9EFC7E-4F15-A5EC-325A-0D9B29E5943F";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction";
	rename -uid "89106E70-436B-F9F3-4E5C-19896F7AD472";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset";
	rename -uid "BA1F71CA-4086-2151-E693-E28B7DB80013";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid";
	rename -uid "3CB92859-4728-0CD9-F858-B3881769CD65";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world";
	rename -uid "86D8D68E-4A89-D1BB-0D9D-3E92B11EF513";
createNode multiplyDivide -n "autoPole_projection";
	rename -uid "D1FF9A1C-4AA0-C28A-765F-18BCC0627745";
createNode plusMinusAverage -n "autoPole_axis";
	rename -uid "C025F012-4019-D40D-C08E-B7B2940B4424";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world";
	rename -uid "20520070-4DC1-C2F0-1E7D-C99BB8073B74";
createNode multiplyDivide -n "autoPole_ratio";
	rename -uid "DF17E15F-42A0-EC9C-F805-F48E8E9A7CE1";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid";
	rename -uid "FD103415-4FEB-046A-A35E-638ED91C0F7D";
createNode vectorProduct -n "autoPole_dotAxis";
	rename -uid "250D868C-45D2-628F-E95C-F0A67EC00F1A";
createNode distanceBetween -n "autoPole_length";
	rename -uid "24DCB644-4A1E-CF33-CF80-5FB77D913B66";
createNode plusMinusAverage -n "autoPole_position1";
	rename -uid "5E7D1BF9-4D51-DF49-D8F2-319318D421CD";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world1";
	rename -uid "5AE32E27-47B3-0837-0367-A880BFB3B5F5";
createNode multiplyDivide -n "autoPole_scaled1";
	rename -uid "74F81FB2-40AC-0E6E-EE71-27AA03640232";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction1";
	rename -uid "E4B3D02D-4747-4971-72DD-29B06CBDAA1E";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset1";
	rename -uid "4EBAB6CF-4746-90F8-568C-9882A4CABB2F";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid1";
	rename -uid "E575C3A2-47A6-94B1-49E7-8AA417D703DD";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world1";
	rename -uid "70024774-4D25-3A93-DB64-83B9219A814D";
createNode multiplyDivide -n "autoPole_projection1";
	rename -uid "78A3A867-4F02-87E5-5962-77871CDA1CFE";
createNode plusMinusAverage -n "autoPole_axis1";
	rename -uid "616E6A09-4D52-F5E9-2091-6284AA037B2B";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world1";
	rename -uid "8824EF26-407A-3428-F1D9-1480E694ABF1";
createNode multiplyDivide -n "autoPole_ratio1";
	rename -uid "0058AB32-4EB6-F67E-1F88-2DB07B0D37AC";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid1";
	rename -uid "A77FE331-43B7-732D-CE90-168831C723E6";
createNode vectorProduct -n "autoPole_dotAxis1";
	rename -uid "A12C65B6-4C4A-5DE4-4FF9-62B078E52010";
createNode distanceBetween -n "autoPole_length1";
	rename -uid "38421AA1-410F-EDDD-AFB7-7FB9895D44DE";
createNode plusMinusAverage -n "autoPole_position2";
	rename -uid "D2E24ACD-4DA3-C445-F167-D7927C696D89";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world2";
	rename -uid "0E1F0290-4802-4E21-E8AB-60BE2C1C0A61";
createNode multiplyDivide -n "autoPole_scaled2";
	rename -uid "3BE86F72-4CE5-C717-02BA-C2984C475E75";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction2";
	rename -uid "FB85FBCD-48F6-F1E5-4D15-85A1BA18C8FD";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset2";
	rename -uid "9ED259C4-45A7-7C5C-21A9-B2A3650B2BDC";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid2";
	rename -uid "835EBB7F-44EA-50C9-EF5D-51A06174135F";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world2";
	rename -uid "88065868-413C-61A3-DB6E-E1B8B1412822";
createNode multiplyDivide -n "autoPole_projection2";
	rename -uid "EDACCF7F-4687-0D55-3204-68B5E678C22C";
createNode plusMinusAverage -n "autoPole_axis2";
	rename -uid "F37362D4-455D-2827-23AB-83B5194EAD0F";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world2";
	rename -uid "C87236AE-4BD5-D03D-DCC4-03BD2E2D24AB";
createNode multiplyDivide -n "autoPole_ratio2";
	rename -uid "52D26B2E-41F1-C2BD-8B82-CA8D77F21FD9";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid2";
	rename -uid "CD81C965-4650-ABBC-990D-76A1E6189F0B";
createNode vectorProduct -n "autoPole_dotAxis2";
	rename -uid "1337B024-4A98-E7D2-2084-E99C4ED57AE8";
createNode distanceBetween -n "autoPole_length2";
	rename -uid "59D1CA9D-49F2-FFF1-30C1-46A07AC148EF";
createNode plusMinusAverage -n "autoPole_position3";
	rename -uid "60F7CCBD-4D85-7109-F9AA-3983BA6D1E34";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world3";
	rename -uid "161F7ACD-4D4F-9623-E622-7FA8850DDC39";
createNode multiplyDivide -n "autoPole_scaled3";
	rename -uid "BBADD5DF-41CD-2790-02B5-7882BD146C35";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction3";
	rename -uid "BA1294F4-4BA6-C5BA-6975-148DF8F37AB7";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset3";
	rename -uid "587CFCB6-4B71-BB73-4BCC-77A22528BB05";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid3";
	rename -uid "C24AC7EA-4D72-55F4-3275-46960C24B6EF";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world3";
	rename -uid "77DE383F-4467-E348-CDAF-F687E773F5E3";
createNode multiplyDivide -n "autoPole_projection3";
	rename -uid "89953FEE-4F34-8C2F-E78B-80AA439AC39E";
createNode plusMinusAverage -n "autoPole_axis3";
	rename -uid "11D2128D-4F67-9C61-56F3-D6BD3921F9F4";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world3";
	rename -uid "68EBEBA8-4887-DA9C-5A0A-FAB25D7E7176";
createNode multiplyDivide -n "autoPole_ratio3";
	rename -uid "834DA625-4603-A4F9-243D-678A10D6A012";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid3";
	rename -uid "1152DD3E-43D2-15D6-36A3-A59ACD8ED2C3";
createNode vectorProduct -n "autoPole_dotAxis3";
	rename -uid "492E3246-4091-F978-007C-109369BFB5F6";
createNode distanceBetween -n "autoPole_length3";
	rename -uid "DF76EE3A-48BF-43D5-8930-AAA88FF3E137";
createNode decomposeMatrix -n "autoPole_display_arm_cv0";
	rename -uid "9DA578E1-47F2-25F1-B24B-B19DC9237343";
createNode decomposeMatrix -n "autoPole_display_arm_cv1";
	rename -uid "96810597-4117-4D80-196A-29A4610D6581";
createNode decomposeMatrix -n "autoPole_display_leg_cv0";
	rename -uid "17F4247F-4F4C-E141-C3F4-3CBBF3B3692C";
createNode decomposeMatrix -n "autoPole_display_leg_cv1";
	rename -uid "1DA2C027-4DB0-48F3-7726-24AA0FD04091";
createNode decomposeMatrix -n "autoPole_display_rt_arm_cv0";
	rename -uid "EDB6FF0A-4159-A887-7A8D-798413591E2E";
createNode decomposeMatrix -n "autoPole_display_rt_arm_cv1";
	rename -uid "2BECB6A0-4693-FF88-B9AF-9B978F8B1787";
createNode decomposeMatrix -n "autoPole_display_rt_leg_cv0";
	rename -uid "1EFCE06F-406B-348F-2FEA-DEB563864258";
createNode decomposeMatrix -n "autoPole_display_rt_leg_cv1";
	rename -uid "8AB43A88-4B68-9412-417E-1FB3804D7E32";
createNode decomposeMatrix -n "decomposeMatrix1";
	rename -uid "6890DE1F-4623-2A1F-A3A5-7BA1DECE8AA9";
createNode multMatrix -n "multMatrix1";
	rename -uid "D9651A05-4363-F343-F099-36B3DAE8A283";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix2";
	rename -uid "77422C96-4CE4-E45C-66E2-51AE9D14BCA9";
createNode multMatrix -n "multMatrix2";
	rename -uid "1AC9DCCC-4FF9-0F0E-13ED-77A25ECAB0F5";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix3";
	rename -uid "98745C5F-46C1-DB3F-D972-5B980FF10C25";
createNode multMatrix -n "multMatrix3";
	rename -uid "1374C33D-4087-23DF-758C-0DB1D05C30C2";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix4";
	rename -uid "DC9FAF14-4599-858F-3682-54B368EDE8FA";
createNode multMatrix -n "multMatrix4";
	rename -uid "90507225-4A56-5490-6272-DCA98E246E71";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix5";
	rename -uid "0FDCE519-4919-8ADD-B966-B1A392F48DA6";
createNode multMatrix -n "multMatrix5";
	rename -uid "0DE24D7C-4B62-FD8F-A04E-0EAC4752E3A0";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix6";
	rename -uid "210B2B73-448B-C7D8-EEDC-6A98744751C4";
createNode multMatrix -n "multMatrix6";
	rename -uid "7D9DBCC7-4038-A0E3-F126-92AEEF29A8CB";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix7";
	rename -uid "69EEC346-46D4-6213-4EB5-D8A6C58FE8BD";
createNode multMatrix -n "multMatrix7";
	rename -uid "5097CC75-4F0A-5F08-ED93-25A5D9CF2FC0";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix8";
	rename -uid "63F303C0-4355-CB61-1D54-668F27EA7D3B";
createNode multMatrix -n "multMatrix8";
	rename -uid "D532EA53-4E48-757F-BCD8-89B3341FDD27";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix9";
	rename -uid "B70CD3CE-4B6F-BE87-7AEB-3AA16905AF7B";
createNode multMatrix -n "multMatrix9";
	rename -uid "02B9484E-4A71-0A43-7B2A-6E962E9D0510";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix10";
	rename -uid "49FDB91A-46B9-0E3B-A7E2-DEBF3BA4D198";
createNode multMatrix -n "multMatrix10";
	rename -uid "D4B11D96-426F-89D7-9FB6-A89A648A4FF1";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix11";
	rename -uid "CC38EC17-419F-842D-4924-918A89BF88BA";
createNode multMatrix -n "multMatrix11";
	rename -uid "59A6537F-4210-8905-FDB2-63B5C0039E56";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix12";
	rename -uid "D0C8C40A-49E1-5B8B-9A90-05A90BB478E9";
createNode multMatrix -n "multMatrix12";
	rename -uid "04FCB982-46E8-3B6C-6951-99A3CFBCFEEC";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix13";
	rename -uid "0ADDCE22-4CF6-3EEB-11BE-69BF4586B97D";
createNode multMatrix -n "multMatrix13";
	rename -uid "0C95AF2E-449E-316A-3E91-2681A1FA7B42";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix14";
	rename -uid "D3248D5F-4B9E-D556-3DD9-3EB8608A3F6A";
createNode multMatrix -n "multMatrix14";
	rename -uid "89D1F703-4B55-3EE8-CB3F-B390021CC2AF";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix15";
	rename -uid "A634E8CD-4674-4F27-89FC-688A23BBBBA6";
createNode multMatrix -n "multMatrix15";
	rename -uid "8AC3F155-43CE-7CE6-E4E9-74A8D9B54CE9";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix16";
	rename -uid "41A87A10-4421-A0E6-F9A0-09B5F373242E";
createNode multMatrix -n "multMatrix16";
	rename -uid "C42E1598-4B17-8EFD-8AB0-8499E95A2C9C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix17";
	rename -uid "292164D5-4CF3-1BAB-1494-81A42E0B5330";
createNode multMatrix -n "multMatrix17";
	rename -uid "FD8B0DA3-4A0C-F847-A872-FD988BD581F9";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix18";
	rename -uid "6ADB1242-4647-9135-9A72-7FADE88CA634";
createNode multMatrix -n "multMatrix18";
	rename -uid "3BAB70B2-4C8C-2B46-AC4A-18899D912FE8";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix19";
	rename -uid "544A05BF-4803-4246-25D5-EE815C5F9F7F";
createNode multMatrix -n "multMatrix19";
	rename -uid "C4CF656F-491C-9E34-20EF-87821F0006EE";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix20";
	rename -uid "4CA391F9-4413-CF1D-4483-578E8C9FC241";
createNode multMatrix -n "multMatrix20";
	rename -uid "43BEB92F-43CD-9B3D-7343-F3AEADF50357";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix21";
	rename -uid "D616C9DA-4314-89E1-2B04-72BA1A9808E9";
createNode multMatrix -n "multMatrix21";
	rename -uid "0069ECFA-4433-CB42-90D6-768E7712ED33";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix22";
	rename -uid "76C9A250-482A-3C12-15DE-B2872DD10E68";
createNode multMatrix -n "multMatrix22";
	rename -uid "66788193-49F7-C7DD-90C5-90B5D050B9F5";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix23";
	rename -uid "FFCE0BB2-47D3-0746-F4AC-6FA5EC455909";
createNode multMatrix -n "multMatrix23";
	rename -uid "A857EA92-435D-1BB6-9D61-55B311AF640A";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix24";
	rename -uid "C2FD0E71-4535-7C90-0506-FC9823BA1F83";
createNode multMatrix -n "multMatrix24";
	rename -uid "1EC7BAA9-4DDF-4E34-07E3-6A99F8AF409C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix25";
	rename -uid "CB76D3CF-4E3C-0B05-F97E-88A3C709ECB8";
createNode multMatrix -n "multMatrix25";
	rename -uid "AE73B84C-4237-B3A1-35A9-96BA92B8F746";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix26";
	rename -uid "A7D073D9-4FCE-ECEB-9047-448A7632C57F";
createNode multMatrix -n "multMatrix26";
	rename -uid "A876F695-4722-27DD-E723-56A7B85C4B59";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix27";
	rename -uid "DE3E0C3F-43FB-2240-3FCD-C5913418CD29";
createNode multMatrix -n "multMatrix27";
	rename -uid "A13A89D5-4211-318C-2E35-778BDF48F547";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix28";
	rename -uid "6DBA4833-4D06-E019-F626-9ABBC28CB57F";
createNode multMatrix -n "multMatrix28";
	rename -uid "94B2BEED-4722-FA17-14D9-9D90002A7A0A";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix29";
	rename -uid "ECC6A7D5-47A0-8E97-2D4C-B0A81DF7B94D";
createNode multMatrix -n "multMatrix29";
	rename -uid "5F337448-4D76-2E73-550B-6486B2F4ECCA";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix30";
	rename -uid "3C4764BC-40D2-2B74-B1E8-70AD06084072";
createNode multMatrix -n "multMatrix30";
	rename -uid "34E89BE2-4BC0-0689-9747-7096677CEBFC";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix31";
	rename -uid "72AD65AA-40D4-9093-BFC8-9CAF9B65B458";
createNode multMatrix -n "multMatrix31";
	rename -uid "F381352A-46C9-E95A-056D-4AB46C247C73";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix32";
	rename -uid "B2FAAB22-46BD-325F-3DFA-77AB9D1D0B60";
createNode multMatrix -n "multMatrix32";
	rename -uid "54AAC5CC-449F-2496-74EB-3683F060883D";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix33";
	rename -uid "83DADAF3-46DD-BEE2-33DB-AA80E52E35AC";
createNode multMatrix -n "multMatrix33";
	rename -uid "B89D9253-4132-A8B4-26DB-9FA75C52A992";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix34";
	rename -uid "01921E97-4058-3770-E430-61B38C27132D";
createNode multMatrix -n "multMatrix34";
	rename -uid "F8DEBF35-4E1D-69CC-28DD-918F9BAE9705";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix35";
	rename -uid "FFACCC23-4532-EE7F-2F85-C3AD1636BFF1";
createNode multMatrix -n "multMatrix35";
	rename -uid "621EE758-4B24-E090-4F39-2CBE225B36A2";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix36";
	rename -uid "613360D6-402C-C721-B8C3-6A8EF474A81D";
createNode multMatrix -n "multMatrix36";
	rename -uid "B7AC3C10-4F74-431E-930C-EC80825F5FF9";
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
dataStructure -fmt "raw" -as "name=notes_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=notes_suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_bushesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floor1:string=value";
dataStructure -fmt "raw" -as "name=OffStruct:float=Offset";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopes:string=value";
dataStructure -fmt "raw" -as "name=notes_squareRocks_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_frogLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=notes_floorSquare:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesCarousel_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_road_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesFlowerBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_square_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_riverside_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_fountainRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesCDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseForest:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=notes_bushes_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_small:string=value";
dataStructure -fmt "raw" -as "name=notes_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_vgTFicus39:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tunnel:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrasStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksCurbsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayCircular_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=notes_rightExterior_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquare_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_treesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=notes_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_right_parShape:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=notes_ridePiggy_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_groundD_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersRightLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBeauty_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_grassC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainTrail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=keyValueStructure:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_left:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquareFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=mapManager_leaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left:string=value";
dataStructure -fmt "raw" -as "name=notes_big_back:string=value";
dataStructure -fmt "raw" -as "name=notes_treesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_railes:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloC:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=notes_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=notes_path:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloProvi3:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_levelC:string=value";
dataStructure -fmt "raw" -as "name=notes_grassJuneBackYard_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_new_sand:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left:string=value";
dataStructure -fmt "raw" -as "name=notes_chocolateFountain_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundRocks:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=notes_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=Blur3dMetaData:string=Blur3dValue";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_ferns_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=notes_groundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchG_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_original:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloB:string=value";
dataStructure -fmt "raw" -as "name=mapManager_levelC:string=value";
dataStructure -fmt "raw" -as "name=mapManager_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=notes_decayFlowerBeds_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grasses:string=value";
dataStructure -fmt "raw" -as "name=mapManager_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=notes_midground_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_base:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassBase:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_big_back:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnelParkEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_leavesDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=notes_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_vegetation_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor1:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayArea_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_degraded:string=value";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small_grass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_floorA:string=value";
dataStructure -fmt "raw" -as "name=notes_grassADecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_entrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorGrassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_frogEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_Suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_base_left:string=value";
dataStructure -fmt "raw" -as "name=notes_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloor_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=notes_geos:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=notes_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_level1A:string=value";
dataStructure -fmt "raw" -as "name=notes_leftSpecific_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_trees:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=notes_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloC:string=value";
dataStructure -fmt "raw" -as "name=notes_terraceBush_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_circular:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_treesRocksAnimalHome_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchF_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchE_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_small_grass:string=value";
dataStructure -fmt "raw" -as "name=IdStruct:int32=ID";
dataStructure -fmt "raw" -as "name=notes_groundA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantNextHouse_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=notes_concretesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rockTerraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_square_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchDegraded_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesTrees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_curbsGardenGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSide:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_carouselStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=notes_widlPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_Suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=TifLocation:string=Path";
dataStructure -fmt "raw" -as "name=notes_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_mainStreetMainstreetTrees04:string=value";
dataStructure -fmt "raw" -as "name=notes_railwayGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=notes_wasteLand_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_heroesChoice_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseForest:string=value";
dataStructure -fmt "raw" -as "name=mapManager_square_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_rockCheated_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terraceGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_holeRock_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBase:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_vgGroundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_hotelBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=notes_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_treesRocksHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSide:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=mapManager_path:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=notes_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_grassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_left_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_background_parShape:string=value";
dataStructure -fmt "raw" -as "name=RenderSettings:string=preset";
dataStructure -fmt "raw" -as "name=notes_grassD_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaCorner_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_testMode_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=notes_grassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocks:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_new_sand:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=notes_rocks:string=value";
dataStructure -fmt "raw" -as "name=mapManager_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloorGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bridge_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=notes_square_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=notes_original:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloB:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=mapManager_degraded:string=value";
dataStructure -fmt "raw" -as "name=OrgStruct:float[3]=Origin Point";
dataStructure -fmt "raw" -as "name=mapManager_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grasses:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_center_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=notes_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_geos:string=value";
dataStructure -fmt "raw" -as "name=notes_cheat_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=mapManager_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=notes_juneNbhHouseE_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=mapManager_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_railes:string=value";
dataStructure -fmt "raw" -as "name=notes_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=notes_vgFCarouselBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_circular:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchH_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_det:string=value";
dataStructure -fmt "raw" -as "name=notes_square_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_fountainHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnel:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_tilesFloorDet:string=value";
dataStructure -fmt "raw" -as "name=notes_centerStreetGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiaryGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_det:string=value";
dataStructure -fmt "raw" -as "name=mapManager_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyFlowersBedA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tilesFloorDet:string=value";
dataStructure -fmt "raw" -as "name=notes_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_frogL_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassLeftMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_barbacueHouseFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_base_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassesCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slabsAndStairsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=notes_vgtCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=notes_groundRocks:string=value";
// End of body_guide.ma
