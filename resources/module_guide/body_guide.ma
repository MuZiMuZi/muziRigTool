//Maya ASCII 2023 scene
//Name: body_guide.ma
//Last modified: Fri, Oct 23, 2026 05:53:10 PM
//Codeset: 936
requires maya "2023";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2023";
fileInfo "version" "2023";
fileInfo "cutIdentifier" "202211021031-847a9f9623";
fileInfo "osv" "Windows 11 Pro v2009 (Build: 26200)";
fileInfo "UUID" "9AEF0516-4CE5-5642-DA4A-26A34B8652CD";
createNode transform -n "crv_md_body_guide_001";
	rename -uid "A8720206-43D2-2042-FB86-C390C98F881D";
createNode nurbsCurve -n "crv_md_body_guide_Shape1" -p "crv_md_body_guide_001";
	rename -uid "7FB7A9D3-461A-61C0-BCEF-7583EE3FD844";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		45.52743041956284 2.7877510968360739e-15 -45.527430419562847
		3.9424754096660454e-15 3.9424754096660454e-15 -64.385509559343163
		-45.52743041956284 2.7877510968360735e-15 -45.527430419562833
		-64.385509559343191 2.0437862142607459e-31 -3.3377561851853274e-15
		-45.52743041956284 -2.7877510968360739e-15 45.52743041956284
		-6.4495405278256976e-15 -3.9424754096660485e-15 64.385509559343191
		45.52743041956284 -2.7877510968360735e-15 45.527430419562833
		64.385509559343191 -5.3763397961550678e-31 8.7802292055118023e-15
		45.52743041956284 2.7877510968360739e-15 -45.527430419562847
		3.9424754096660454e-15 3.9424754096660454e-15 -64.385509559343163
		-45.52743041956284 2.7877510968360735e-15 -45.527430419562833
		;
createNode joint -n "jnt_md_root_guide_001" -p "crv_md_body_guide_001";
	rename -uid "344767F5-4A85-882F-1B59-C797D00E5D5E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.5505488262748902e-17 89.520696060436919 -4.7392802238464409 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.1045917790821957 -0.10060738962014636 -46.112429265125165 ;
	setAttr ".pa" -type "double3" -2.5444437451708134e-14 9.541664044390544e-15 -2.2263882770244621e-14 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 6.4560376483287606e-27 97.722709655761719 -4.7392802238464355 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pelvisIkLocal001";
	setAttr ".radi" 3;
createNode joint -n "jnt_lf_upperLeg_guide_001" -p "jnt_md_root_guide_001";
	rename -uid "8B6F4FD6-4867-0437-4005-54AB1EF52A8B";
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
	rename -uid "790B4E5C-4A03-159C-480B-AEB4782DC110";
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
	rename -uid "E649E304-4817-5F83-4063-15B40F74C45F";
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
	rename -uid "356A1814-4F46-652D-17D5-D18CB9FD8A30";
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
	rename -uid "293528AA-4F50-8AEF-65E8-6A8B08814CAD";
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
	rename -uid "7A0FF759-4CB6-9520-43DC-E7825BC7A2BC";
	setAttr ".t" -type "double3" -7.1393695916255666 6.8735664927761633 1.7521513744862092 ;
	setAttr ".jo" -type "double3" -89.854742515053474 -2.4469571666007086 136.10613573140833 ;
createNode joint -n "jnt_md_spine_guide_002" -p "jnt_md_spine_guide_001";
	rename -uid "56A30E6B-4B35-EA4B-4A3A-D4ACC7DC13F8";
	setAttr ".t" -type "double3" 6.0082517207697412 0.2233358082493074 -9.4580220176431088e-09 ;
	setAttr ".jo" -type "double3" 179.9999991462264 0 5.076203622587796 ;
createNode joint -n "jnt_md_spine_guide_003" -p "jnt_md_spine_guide_002";
	rename -uid "E7383967-4955-7D61-C5A7-408296694C01";
	setAttr ".t" -type "double3" 6.0150186659302749 0.078954237818588471 1.0634604735015252e-08 ;
	setAttr ".jo" -type "double3" 0 0 -8.9510359245449607 ;
createNode joint -n "jnt_md_spine_guide_004" -p "jnt_md_spine_guide_003";
	rename -uid "6E35F5F8-4F72-49E6-FAC4-90BADE337191";
	setAttr ".t" -type "double3" 6.0569278054306439 0.3919132956114823 1.1843432825955784e-09 ;
	setAttr ".jo" -type "double3" 0 0 -6.8711318900975797 ;
createNode joint -n "jnt_md_spine_guide_005" -p "jnt_md_spine_guide_004";
	rename -uid "8E2D3683-461D-B763-7BF4-59A35A6303CD";
	setAttr ".t" -type "double3" 6.1345090276004557 0.61029855976362013 -6.7153603610254945e-09 ;
	setAttr ".jo" -type "double3" -71.548593583545653 -89.999999146249152 0 ;
createNode joint -n "jnt_md_spine_guide_006" -p "jnt_md_spine_guide_005";
	rename -uid "85C1C906-4E40-E6B6-EBD9-D2B58BC7EB85";
	setAttr ".t" -type "double3" 8.3128092306061768e-08 6.0123084481959097 -1.5165891885916911 ;
	setAttr ".jo" -type "double3" -55.74732838900217 -23.160905347045894 75.006624217064015 ;
createNode joint -n "jnt_lf_clavicle_guide_001" -p "jnt_md_spine_guide_006";
	rename -uid "B0679D9C-4675-CA4C-54A0-80AB20FBA3E8";
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
	rename -uid "BB812DD0-4C2B-EC29-7CC3-0EB6A58A2B41";
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
	rename -uid "514DA09A-4960-3463-BC9B-E08720784BCD";
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
	rename -uid "F0F14001-4C69-0EBB-7F8C-3696A89CF06A";
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
	rename -uid "B155D789-45AD-3639-14F3-38ABE91F705F";
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
	rename -uid "5557D467-496C-B89B-6F71-6EA8E2DFC420";
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
	rename -uid "9C8AD86C-47DC-6950-19F5-5B9206E52B5B";
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
	rename -uid "928A15A4-4D06-6C8F-6DAA-A6930967ED35";
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
	rename -uid "8CC1CAF1-49E0-40F4-DD4D-BA9360F4C104";
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
	rename -uid "A0F3A777-4D36-4FE7-1FEE-9B8940FC160E";
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
	rename -uid "23AA559C-4F3C-673F-7BCC-E68F6A208A6D";
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
	rename -uid "44C3BD3C-40E4-D88F-318E-5E81981B3504";
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
	rename -uid "79F9A4A9-4CDA-C4F4-CAC0-54A29ED6E210";
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
	rename -uid "B93FC73E-4AB7-9152-6BB1-EBA651FD4CF1";
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
	rename -uid "4120B87E-44B3-8F0F-5EAE-878DE9212547";
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
	rename -uid "EBE565CD-448B-E8DF-7B11-C299C734EFA9";
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
	rename -uid "6E51E3C8-4758-2B51-9880-A4A43C8806EE";
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
	rename -uid "21840920-458B-6BE7-34EB-11A23EF8B481";
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
	rename -uid "FAC7F623-4FC2-103B-9341-35929FA4B796";
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
	rename -uid "1DF150BA-4A45-3A24-F679-F6B903F7B0E8";
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
	rename -uid "3382FE8F-4DF5-93B1-02E6-BB93C6D4E657";
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
	rename -uid "AC10B7EC-46A4-9FB6-BEEA-0C8C6620A1A7";
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
	rename -uid "8173A10A-482D-595C-0FCB-6B973B78A5D0";
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
	rename -uid "3D18015B-4B65-8AD5-E327-1086FCC5BF5A";
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
	rename -uid "BE1EC55E-4D3F-050F-763F-448067A6E06D";
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
	rename -uid "2D962D30-4D57-D5F4-07BF-1781AA7377D8";
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
	rename -uid "95DBB271-4616-F1B1-6DD2-FCA2867507AC";
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
	rename -uid "12C860D5-4ACC-7570-E98B-48BD1E46625F";
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
	rename -uid "FEC7912F-4FAB-B1C4-A2F6-0DB61B4CDECA";
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
	rename -uid "5376E050-4174-43DC-0041-789D677C1257";
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
	rename -uid "4A5A47AF-4463-555A-B7E9-8EA04B7A3E9B";
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
	rename -uid "96BFC7C4-43FC-BB2B-E55F-C0997CA068B3";
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
	rename -uid "F3C47141-465A-1A9B-8DE0-688CECE6F4E4";
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
	rename -uid "2C84D949-4A9B-5571-61BA-38BA5208F99E";
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
	rename -uid "A3DC766D-4F62-E5D5-85B5-3AB5C39706E0";
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
	rename -uid "99C000F1-4402-D9B2-ED88-D1A8D612F2E4";
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
	rename -uid "E83E1BCA-4628-3654-458B-83872358D0F3";
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
	rename -uid "5A03BE27-42FE-BB01-1B17-729FADB36C45";
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
	rename -uid "4D86F42A-4DAB-F692-5D74-34B05F7F4CCF";
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
	setAttr ".lr" -type "double3" -180.00000147877941 -180 179.99999999999994 ;
	setAttr ".rst" -type "double3" -11.813794085361032 -5.6843418860808015e-14 5.3290705182007514e-15 ;
	setAttr ".rsrr" -type "double3" -180.00000147877947 -180 179.99999999999989 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_upperArm_guide_001" -p "jnt_rt_scapula_guide_001";
	rename -uid "52395095-4915-66C6-8166-DB9D85DFF330";
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
	rename -uid "216D29EB-457A-EA54-0353-58AD67B4CB89";
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
	rename -uid "E38A4624-4A21-2595-B02E-8FB34C6F39C8";
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
	rename -uid "70E80D16-493D-F83C-7A24-03BBE3B5B974";
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
	rename -uid "8C111B09-437A-EB5A-6144-0E8908DF069B";
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
	rename -uid "DFE3C53A-4DE8-0E60-EC7E-1990F7C90705";
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
	rename -uid "FBC15D87-46F1-161C-DD29-439414361599";
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
	rename -uid "5174F4DF-4F64-402F-A490-48972D90DE31";
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
	setAttr ".lr" -type "double3" -1.3091425670791617e-08 -3.1805554931149792e-15 -9.5416637738400264e-15 ;
	setAttr ".rst" -type "double3" -2.9801289421417891 -2.8421709430404007e-14 -1.4210854715202004e-14 ;
	setAttr ".rsrr" -type "double3" -1.3091454295783752e-08 -1.908332754768005e-14 6.3611109862299631e-15 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_003_parentConstraint1" -p "jnt_rt_thumb_guide_003";
	rename -uid "678AA0E1-44D7-0B41-0565-24B74EEF7731";
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
	setAttr ".lr" -type "double3" 1.4585759114640174e-06 4.4879579465887046e-06 24.695720974245262 ;
	setAttr ".rst" -type "double3" -3.7644131533578644 2.8421709430404007e-14 -7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" 1.4585759335151859e-06 4.4879579729953201e-06 24.695720974245123 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_002_parentConstraint1" -p "jnt_rt_thumb_guide_002";
	rename -uid "6E990BFE-4B96-0E22-CD28-939E308C9DD2";
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
	setAttr ".lr" -type "double3" 4.6510119125034496e-07 3.2002376468825468e-06 16.538182024682552 ;
	setAttr ".rst" -type "double3" -4.0813853793719375 -4.2632564145606011e-14 1.4210854715202004e-14 ;
	setAttr ".rsrr" -type "double3" 4.6510119984991975e-07 3.2002376335054952e-06 16.538182024682548 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_001_parentConstraint1" -p "jnt_rt_thumb_guide_001";
	rename -uid "A7942B57-4D3C-F9B3-3196-63B6902DB737";
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
	setAttr ".lr" -type "double3" -0.54083898427565491 -10.765680502058474 5.7350758014731396 ;
	setAttr ".rst" -type "double3" -26.886953474794517 26.515375117795916 3.9754412671804431 ;
	setAttr ".rsrr" -type "double3" 137.92773570508504 129.02631817106962 102.20808408974612 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_index_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "48E22AA6-414B-D138-4261-77A7F95092B5";
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
	rename -uid "B31034EA-4712-6FF9-BBAB-FB841D9E0FF1";
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
	rename -uid "862033BE-489D-5F72-1880-38B4686529C9";
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
	rename -uid "8A4FED06-41B3-5C32-907D-D0960990419A";
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
	rename -uid "0E56BD02-4CEE-46CF-2F7C-649F45B5D68A";
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
	rename -uid "FC6F10F0-494C-6637-B7F9-53B5B84954CB";
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
	setAttr ".lr" -type "double3" 2.3377076908756715e-13 -5.9635400277440999e-13 2.4947475782729339e-13 ;
	setAttr ".rst" -type "double3" -2.7578831976663665 2.1742607714259066e-11 2.0097701280974434e-11 ;
	setAttr ".rsrr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_004_parentConstraint1" -p "jnt_rt_index_guide_004";
	rename -uid "3F64ECEA-4613-B407-8D3E-EB9B398A12CF";
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
	setAttr ".lr" -type "double3" 2.3377076908756715e-13 -5.9635400277440999e-13 2.4947475782729339e-13 ;
	setAttr ".rst" -type "double3" -3.9915790935964068 0 7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_003_parentConstraint1" -p "jnt_rt_index_guide_003";
	rename -uid "998CFF24-4B09-F536-1E9E-E798420609E8";
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
	setAttr ".lr" -type "double3" 2.3377076908756715e-13 -5.9635400277440999e-13 2.4947475782729339e-13 ;
	setAttr ".rst" -type "double3" -4.6030102918318931 0 7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_002_parentConstraint1" -p "jnt_rt_index_guide_002";
	rename -uid "F8D439A2-4B0D-4E91-D3F0-B4B39CC24B73";
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
	setAttr ".lr" -type "double3" -0.1351713927193216 -0.55988519587810404 27.145834753298249 ;
	setAttr ".rst" -type "double3" -6.3330235352054061 -1.4210854715202004e-14 2.1316282072803006e-14 ;
	setAttr ".rsrr" -type "double3" -0.13517139271932938 -0.55988519587811525 27.145834753298256 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_001_parentConstraint1" -p "jnt_rt_index_guide_001";
	rename -uid "E4D29A5D-48AB-9798-CE7C-D1AE390FA574";
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
	setAttr ".lr" -type "double3" 47.508233071519832 -75.137098869844323 -59.549996483992587 ;
	setAttr ".rst" -type "double3" -28.934834148043542 26.385518187176363 2.4999003211692354 ;
	setAttr ".rsrr" -type "double3" -0.30799950080807958 12.605192021140542 -2.788122544855252 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_middle_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "A7CA5BF5-40D0-483C-0E2A-74B51E239283";
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
	rename -uid "8BC70E80-475C-880A-F250-4AA0F94A949D";
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
	rename -uid "875A1397-4DFF-0057-06BC-29A0DBBA89E3";
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
	rename -uid "DD8DEA3C-4841-32FB-66C2-5A8FFC79D628";
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
	rename -uid "1B82A1AF-43E5-88D9-E76E-9F9CFAD9B55F";
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
	rename -uid "B1D1FEA7-47F3-8E19-2D62-869B8B0AFF77";
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
	setAttr ".lr" -type "double3" 3.0272267341543788e-09 1.0532437527636652e-14 -1.6084653066341389e-14 ;
	setAttr ".rst" -type "double3" -2.9261303558643448 2.7000623958883807e-13 -1.2434497875801753e-14 ;
	setAttr ".rsrr" -type "double3" 3.0272238644373319e-09 1.7969370922357985e-14 -2.8806874229874907e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_004_parentConstraint1" -p "jnt_rt_middle_guide_004";
	rename -uid "55B7F23C-46D5-4552-FF77-649EE65EC780";
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
	setAttr ".lr" -type "double3" -4.4319030416628955e-15 1.0532447248267027e-14 -1.2722220159500505e-14 ;
	setAttr ".rst" -type "double3" -3.501428012076083 -1.4210854715202004e-14 -5.3290705182007514e-15 ;
	setAttr ".rsrr" -type "double3" -7.3016284307130417e-15 1.7969386566508883e-14 -1.9083330522958676e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_003_parentConstraint1" -p "jnt_rt_middle_guide_003";
	rename -uid "6898692E-473D-511B-CF67-08BA8F75FEAC";
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
	setAttr ".lr" -type "double3" -4.4319030416628955e-15 1.0532447248267027e-14 -1.2722220159500505e-14 ;
	setAttr ".rst" -type "double3" -5.1829527930584334 1.4210854715202004e-14 0 ;
	setAttr ".rsrr" -type "double3" -7.3016284307130417e-15 1.7969386566508883e-14 -1.9083330522958676e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_002_parentConstraint1" -p "jnt_rt_middle_guide_002";
	rename -uid "F1174DF4-4F90-393B-608B-6BB9D226200C";
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
	setAttr ".lr" -type "double3" -0.32315892490447617 -2.1843600718445364 16.828873178827074 ;
	setAttr ".rst" -type "double3" -5.9056921935997835 -1.4210854715202004e-14 1.7763568394002505e-14 ;
	setAttr ".rsrr" -type "double3" -0.32315892490453341 -2.1843600718445493 16.828873178827109 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_001_parentConstraint1" -p "jnt_rt_middle_guide_001";
	rename -uid "28FC6CF2-4D26-0F0C-9093-4BB043DF1EEB";
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
	setAttr ".lr" -type "double3" -90.530113085839687 -112.22912582963762 68.262449206712859 ;
	setAttr ".rst" -type "double3" -30.3852904227296 25.459431622868532 1.9576565689092575 ;
	setAttr ".rsrr" -type "double3" -0.50798744202058288 -7.3490571721279023 7.8975513865994529 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_ring_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "1333CF23-4F17-A23C-92C3-969016891C01";
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
	rename -uid "0B58A9DA-47A4-42BD-6ED8-D8B39D731C29";
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
	rename -uid "CD51EEC5-4E5A-96AA-7FDD-BD97CACB6843";
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
	rename -uid "E529E2E8-48B7-7E0C-4EBF-BF8561C03934";
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
	rename -uid "8B9B9335-47AC-1E1E-31A3-699004F5EEC7";
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
	rename -uid "4A756C23-46F1-CF78-A64F-6EA6D47D2EFF";
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
	setAttr ".lr" -type "double3" -6.3611093629270335e-15 4.4527765540489235e-14 -2.4717875269080888e-30 ;
	setAttr ".rst" -type "double3" -2.8253327832633488 -1.4210854715202004e-14 1.1013412404281553e-13 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_004_parentConstraint1" -p "jnt_rt_ring_guide_004";
	rename -uid "7FC4FF44-4482-5151-9692-4389A6458B4A";
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
	setAttr ".lr" -type "double3" -6.3611093629270335e-15 4.4527765540489235e-14 -2.4717875269080888e-30 ;
	setAttr ".rst" -type "double3" -2.7139968321795038 1.4210854715202004e-14 -3.5527136788005009e-15 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_003_parentConstraint1" -p "jnt_rt_ring_guide_003";
	rename -uid "F6FF0EDF-4E4A-37D9-9CAE-E699E8E2D0BB";
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
	setAttr ".lr" -type "double3" -6.3611093629270335e-15 4.4527765540489235e-14 -2.4717875269080888e-30 ;
	setAttr ".rst" -type "double3" -4.564804549506789 1.4210854715202004e-14 0 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_002_parentConstraint1" -p "jnt_rt_ring_guide_002";
	rename -uid "150F5366-471F-6C2F-50B4-9D9626D2A13A";
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
	setAttr ".lr" -type "double3" -3.022362545487435 -13.924486251583318 24.381045871513663 ;
	setAttr ".rst" -type "double3" -5.8644210548804239 -4.2632564145606011e-14 1.7763568394002505e-15 ;
	setAttr ".rsrr" -type "double3" -3.0223625454874576 -13.924486251583316 24.381045871513667 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_001_parentConstraint1" -p "jnt_rt_ring_guide_001";
	rename -uid "0DCC7F10-401C-E99C-205B-29AACFA5189B";
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
	setAttr ".lr" -type "double3" -94.82911100433769 -134.82557601297913 48.705405392380953 ;
	setAttr ".rst" -type "double3" -31.049928443481477 24.156771940431156 1.6829657480732436 ;
	setAttr ".rsrr" -type "double3" -0.34776484501474897 -31.684347521770238 1.2254880921545954 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_pinky_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "13A2F8ED-4AF3-8541-1C40-B7ABE29AB659";
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
	rename -uid "DC1C48E7-421A-E8A4-7DB0-2EB43B325A5B";
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
	rename -uid "76901A67-4ADA-B66F-2625-3BA85B69D9F5";
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
	rename -uid "937AE08E-4F9D-23ED-2194-2AA5D1F56421";
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
	rename -uid "4DAEA605-413C-DB34-334B-BD8595F31139";
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
	rename -uid "E23A3FEF-4AA3-3601-874A-46BE7733E24E";
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
	setAttr ".lr" -type "double3" -1.908332808878106e-14 7.9513867036587948e-14 6.2020816288538563e-14 ;
	setAttr ".rst" -type "double3" -1.9444966201798479 1.4210854715202004e-14 -7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_004_parentConstraint1" -p "jnt_rt_pinky_guide_004";
	rename -uid "E15D0F07-4AFD-B1B3-76E0-498D140E10CF";
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
	setAttr ".lr" -type "double3" -1.908332808878106e-14 7.9513867036587948e-14 6.2020816288538563e-14 ;
	setAttr ".rst" -type "double3" -2.2220449461758847 0 7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_003_parentConstraint1" -p "jnt_rt_pinky_guide_003";
	rename -uid "84B500DE-4DA8-8D2F-4129-5FBC996070DF";
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
	setAttr ".lr" -type "double3" -1.908332808878106e-14 7.9513867036587948e-14 6.2020816288538563e-14 ;
	setAttr ".rst" -type "double3" -3.6531556962369649 -2.8421709430404007e-14 -1.0658141036401503e-14 ;
	setAttr ".rsrr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_002_parentConstraint1" -p "jnt_rt_pinky_guide_002";
	rename -uid "D16D346F-4D00-74E6-A342-47BDD25DA269";
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
	setAttr ".lr" -type "double3" -0.73441779669427509 -2.6175398536187751 31.340870629514303 ;
	setAttr ".rst" -type "double3" -5.3187799595668181 -1.4210854715202004e-14 3.5527136788005009e-15 ;
	setAttr ".rsrr" -type "double3" -0.73441779669426821 -2.6175398536187768 31.340870629514367 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_001_parentConstraint1" -p "jnt_rt_pinky_guide_001";
	rename -uid "E1E2EDCE-44B4-741F-57CA-D2940079ED9E";
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
	setAttr ".lr" -type "double3" -111.31818736867706 -152.84660684303088 38.934561212339318 ;
	setAttr ".rst" -type "double3" -31.405355798267514 22.675263201098446 1.800107074966931 ;
	setAttr ".rsrr" -type "double3" 8.5335367814477294 -49.099647567295825 -18.552853930180156 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_wrist_guide_001_parentConstraint1" -p "jnt_rt_wrist_guide_001";
	rename -uid "46CF9BF5-49D4-D15E-81E1-9286481FBEA4";
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
	setAttr ".lr" -type "double3" 128.08229345384436 132.93989349989835 83.619292671175742 ;
	setAttr ".rst" -type "double3" -21.180998921756064 0 -3.5527136788005009e-15 ;
	setAttr ".rsrr" -type "double3" 128.08229345384436 132.93989349989832 83.619292671175742 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_elbow_guide_001_parentConstraint1" -p "jnt_rt_elbow_guide_001";
	rename -uid "35BE521A-4876-826B-FF1D-949C92B2536F";
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
	setAttr ".lr" -type "double3" -0.22949392969037821 14.039317072850009 -1.8636293617127369 ;
	setAttr ".rst" -type "double3" -27.395612197271689 18.519674796295 -0.19772206553258442 ;
	setAttr ".rsrr" -type "double3" -2.9674302657713705 13.645504964482884 -24.430394373669429 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_upperArm_guide_001_parentConstraint1" -p "jnt_rt_upperArm_guide_001";
	rename -uid "2D72F726-4633-EE7C-130D-C18FD1BE41D3";
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
	setAttr ".lr" -type "double3" -66.100621461659514 -27.765273094278712 138.40121632138076 ;
	setAttr ".rst" -type "double3" 1.3031669319233039 -5.2568261096760409 3.5540999978206376 ;
	setAttr ".rsrr" -type "double3" -66.1006214616595 -27.765273094278754 138.40121632138082 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_scapula_guide_001_parentConstraint1" -p "jnt_rt_scapula_guide_001";
	rename -uid "2E022215-4007-3609-133D-F387F743918D";
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
	setAttr ".lr" -type "double3" -332.03163080848253 7.0948458185681753 152.04242100109977 ;
	setAttr ".rst" -type "double3" -2.0025831020120677e-06 4.2632564145606011e-14 1.7763568394002505e-15 ;
	setAttr ".rsrr" -type "double3" -332.03163080848248 7.0948458185681735 152.04242100109977 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_clavicle_guide_002_parentConstraint1" -p "jnt_rt_clavicle_guide_002";
	rename -uid "54471B77-41CA-0FB3-4800-D492E4F6485B";
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
	setAttr ".lr" -type "double3" 162.38206356138878 177.14835768295836 18.249372188254814 ;
	setAttr ".rst" -type "double3" -10.889342927023975 0 7.9936057773011271e-15 ;
	setAttr ".rsrr" -type "double3" 162.3820635613888 177.14835768295836 18.24937218825476 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_clavicle_guide_001_parentConstraint1" -p "jnt_rt_clavicle_guide_001";
	rename -uid "88B4117D-407E-E4C0-FA40-60906DB482FD";
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
	setAttr ".lr" -type "double3" 9.8496776798784715 -36.108797175155338 -29.613819513924945 ;
	setAttr ".rst" -type "double3" 9.2690145740343581 2.2850031578620502 4.2544972014629856 ;
	setAttr ".rsrr" -type "double3" 9.8496776798784644 -36.108797175155324 -29.613819513924955 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_upperLeg_guide_001" -p "jnt_md_root_guide_001";
	rename -uid "8E88C495-42A2-DE90-1B92-5B8CD247469A";
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
	rename -uid "B956E382-465F-C40C-5BCB-949421517AA9";
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
	rename -uid "53EC46FC-4F59-57C3-5B6C-80A01F52D439";
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
	rename -uid "281C484F-4E34-F02C-1842-70AAE967E189";
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
	rename -uid "48E4331B-44C8-F35D-2753-778156C8B0A7";
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
	rename -uid "12E2A5EA-4FD1-D1A8-70A9-2A92C59FFB33";
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
	setAttr ".lr" -type "double3" 8.3689515247263669e-05 -0.00084837376014538612 1.8162821347448019e-09 ;
	setAttr ".rst" -type "double3" -10.061090566062497 -3.4347191757433393e-10 -0.0001975427998104351 ;
	setAttr ".rsrr" -type "double3" -7.0820342723103074e-05 -0.001124932530911191 1.4283611968242512e-09 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ball_guide_001_parentConstraint1" -p "jnt_rt_ball_guide_001";
	rename -uid "8BF84458-4D1E-5ED4-4FA1-18A3560983B0";
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
	setAttr ".lr" -type "double3" 0.00011204745293781697 0.00082351777886261683 -12.60944038784859 ;
	setAttr ".rst" -type "double3" -10.061090567994976 -4.8615778069915905e-10 1.1774994796098781e-05 ;
	setAttr ".rsrr" -type "double3" 0.00011656428575880431 0.00078263569815421755 -12.609440385605803 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ankle_guide_001_parentConstraint1" -p "jnt_rt_ankle_guide_001";
	rename -uid "0E11EA2A-4784-18CF-7F2F-6DA3B200CA99";
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
	setAttr ".lr" -type "double3" 6.8694732194402429e-05 -2.5311527341769385e-05 -130.93022326688649 ;
	setAttr ".rst" -type "double3" 40.814974859602536 8.5468902815067107 -2.4631307736555641e-05 ;
	setAttr ".rsrr" -type "double3" 0.00042636606410780225 -179.99930714016733 2.5997845205305877e-09 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_knee_guide_001_parentConstraint1" -p "jnt_rt_knee_guide_001";
	rename -uid "0B8F50E4-4F31-1C51-CD3F-E2832FCCD672";
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
	setAttr ".lr" -type "double3" -8.9381664302144465e-05 -8.3939041102622063e-05 -1.9099516624552779 ;
	setAttr ".rst" -type "double3" 38.784658353614773 -8.5456982078136843 4.2884333018022858e-06 ;
	setAttr ".rsrr" -type "double3" -179.99980772867923 -0.00010248205065004338 179.99999999975338 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_upperLeg_guide_001_parentConstraint1" -p "jnt_rt_upperLeg_guide_001";
	rename -uid "904357E7-4FFA-C1B2-C145-9DB54B13CFA6";
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
	setAttr ".lr" -type "double3" -180.00018153027574 7.8741482658473715e-06 179.99999999997829 ;
	setAttr ".rst" -type "double3" -5.4740998008547166 -5.5636970162257953 0.039537336507059706 ;
	setAttr ".rsrr" -type "double3" -180.00018153027577 7.8741482435834934e-06 179.99999999997831 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_lf_arm_pole_guide_001" -p "crv_md_body_guide_001";
	rename -uid "47EB7925-4701-2A67-25A4-01AEFC1ED123";
createNode joint -n "jnt_lf_leg_pole_guide_001" -p "crv_md_body_guide_001";
	rename -uid "CE941FC2-443D-67DD-EBDA-A89D3E68EAAD";
createNode joint -n "jnt_rt_arm_pole_guide_001" -p "crv_md_body_guide_001";
	rename -uid "721AE714-4249-66DA-D2A0-3DA88F6D0FF3";
createNode joint -n "jnt_rt_leg_pole_guide_001" -p "crv_md_body_guide_001";
	rename -uid "87B25399-4B54-FBE2-E235-E482F717913D";
createNode transform -n "crv_auto_pole_arm" -p "crv_md_body_guide_001";
	rename -uid "9036B2C4-44CA-E12D-C8CD-279A87CA6EEF";
createNode nurbsCurve -n "curveShape1" -p "crv_auto_pole_arm";
	rename -uid "D612E5D8-4F5A-7FC3-B395-50AEE31E1C66";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		30.000000000000021 119.99999999999991 -12.000000000000004
		39.269065856933594 128.28007507324219 -33.691581726074219
		;
createNode transform -n "crv_auto_pole_leg" -p "crv_md_body_guide_001";
	rename -uid "88843B44-4C2E-7405-126F-B696ADBA4E24";
createNode nurbsCurve -n "curveShape2" -p "crv_auto_pole_leg";
	rename -uid "63D42205-496D-17FE-6DE8-F78B7387DB8B";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		7.804724838978764 50.49034305318537 2.1373977479766344
		7.8046956062316895 49.193153381347656 27.103723526000977
		;
createNode transform -n "crv_auto_pole_rt_arm" -p "crv_md_body_guide_001";
	rename -uid "F63A5040-4319-1E44-8E60-C5A6AE450672";
createNode nurbsCurve -n "curveShape3" -p "crv_auto_pole_rt_arm";
	rename -uid "E91FA590-4087-7335-6C2A-C5B967206742";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-30.000000000000021 119.99999999999993 -12.000000000000005
		-39.269065856933594 128.28007507324219 -33.691581726074219
		;
createNode transform -n "crv_auto_pole_rt_leg" -p "crv_md_body_guide_001";
	rename -uid "664365A1-4D3D-DA44-251C-3D80B50D6E4F";
createNode nurbsCurve -n "curveShape4" -p "crv_auto_pole_rt_leg";
	rename -uid "273ACCDF-408B-4187-CFF1-F69F6F190CBE";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-7.804724838978764 50.490343053185342 2.1373977479766353
		-7.8046956062316895 49.193153381347656 27.103723526000977
		;
createNode transform -n "grp_md_mirror_001";
	rename -uid "D71ACBE7-4BE6-6575-8850-97B0B7C0D553";
createNode transform -n "mirror_jnt_rt_ankle_guide_001" -p "grp_md_mirror_001";
	rename -uid "E89EF03C-4377-EEF8-5556-92B590BE599C";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ankle_guide_001Shape" -p "mirror_jnt_rt_ankle_guide_001";
	rename -uid "583E551B-4F20-C216-4C06-13AF0C4112F0";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ball_guide_001" -p "grp_md_mirror_001";
	rename -uid "E9EE9D47-4237-CCD3-F8F9-828136BB198E";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ball_guide_001Shape" -p "mirror_jnt_rt_ball_guide_001";
	rename -uid "793BA624-496D-DF9E-5B1A-108D928B1D92";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_clavicle_guide_001" -p "grp_md_mirror_001";
	rename -uid "8F928818-4D3A-F767-BC07-66A2D84ABAB4";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_clavicle_guide_001Shape" -p "mirror_jnt_rt_clavicle_guide_001";
	rename -uid "3BFEB959-4D1D-02EB-7042-FFAE823F6BB2";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_clavicle_guide_002" -p "grp_md_mirror_001";
	rename -uid "FEC3CBDD-4CBB-2BBE-01D8-EC8E79095FFA";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_clavicle_guide_002Shape" -p "mirror_jnt_rt_clavicle_guide_002";
	rename -uid "6B79B0B1-45D1-93B0-DEC0-A7ABC5F65378";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_elbow_guide_001" -p "grp_md_mirror_001";
	rename -uid "8135EF81-4592-FE31-A6FD-83B032BF987A";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_elbow_guide_001Shape" -p "mirror_jnt_rt_elbow_guide_001";
	rename -uid "FDE967B2-43DD-66EF-A13D-48B765651471";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_001" -p "grp_md_mirror_001";
	rename -uid "0A3412A8-4856-1387-44C1-338B7758CA2F";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_001Shape" -p "mirror_jnt_rt_index_guide_001";
	rename -uid "DCAE058C-413B-01E7-C9F3-82B93466D4BC";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_002" -p "grp_md_mirror_001";
	rename -uid "40BED944-4A7A-F862-40BB-5D98C3514C88";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_002Shape" -p "mirror_jnt_rt_index_guide_002";
	rename -uid "F81E4B17-4753-6842-BA03-F49C727BD904";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_003" -p "grp_md_mirror_001";
	rename -uid "BD86AE7A-4B4E-F3BF-1684-87ACC3CBA06C";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_003Shape" -p "mirror_jnt_rt_index_guide_003";
	rename -uid "68437BCB-439C-2497-21C7-0BBAB997890D";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_004" -p "grp_md_mirror_001";
	rename -uid "94D3EB35-47C7-2ECC-DBCD-3EA97452C501";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_004Shape" -p "mirror_jnt_rt_index_guide_004";
	rename -uid "A848F7B4-43F1-F7CA-B368-928F0CE16A96";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_005" -p "grp_md_mirror_001";
	rename -uid "A76F872E-4F6A-177C-D6B9-2DA04C80EB4D";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_005Shape" -p "mirror_jnt_rt_index_guide_005";
	rename -uid "D9DCDAFC-4CA4-480D-89B6-62B3013F7822";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_knee_guide_001" -p "grp_md_mirror_001";
	rename -uid "0E3BAA6A-4DA3-6D66-3C4A-1C96B589DD83";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_knee_guide_001Shape" -p "mirror_jnt_rt_knee_guide_001";
	rename -uid "85733C74-40A1-D438-D0D2-8D9A05BACF2D";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_001" -p "grp_md_mirror_001";
	rename -uid "F08B4F8C-47B5-3152-9801-61A56808ED61";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_001Shape" -p "mirror_jnt_rt_middle_guide_001";
	rename -uid "AC9B5B6A-4684-BD1E-2AA2-ACB35CE3F543";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_002" -p "grp_md_mirror_001";
	rename -uid "733DD9D1-4349-40DD-0B29-1790E93D4F3D";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_002Shape" -p "mirror_jnt_rt_middle_guide_002";
	rename -uid "239178DD-4D57-70C7-7FEE-A7808D602B62";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_003" -p "grp_md_mirror_001";
	rename -uid "B71D6A66-4FEA-826E-3786-EDB762BAB2CE";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_003Shape" -p "mirror_jnt_rt_middle_guide_003";
	rename -uid "EA8B7836-42DA-70A6-03ED-39B380BBE60D";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_004" -p "grp_md_mirror_001";
	rename -uid "9B1A795C-42F9-3E4C-560C-2CBA6AD73A19";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_004Shape" -p "mirror_jnt_rt_middle_guide_004";
	rename -uid "E7DDCFDD-4902-FA80-ABD4-50A41F3B8B77";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_005" -p "grp_md_mirror_001";
	rename -uid "FABB37DE-4D99-E55C-4326-8A8FF8EB4957";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_005Shape" -p "mirror_jnt_rt_middle_guide_005";
	rename -uid "FD715637-4CFB-5447-05C8-D7B51B18FD16";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_001" -p "grp_md_mirror_001";
	rename -uid "4E131EB7-4931-E1FD-3ABE-CC9B4A93E52C";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_001Shape" -p "mirror_jnt_rt_pinky_guide_001";
	rename -uid "89FA584B-4127-8E96-00AE-A48AC9C95C48";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_002" -p "grp_md_mirror_001";
	rename -uid "7CD8870C-46D6-B77F-DA5E-D2A0E1A58405";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_002Shape" -p "mirror_jnt_rt_pinky_guide_002";
	rename -uid "9DB37E7D-4F29-6A44-538E-83910276E779";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_003" -p "grp_md_mirror_001";
	rename -uid "1A671CB5-4CE8-3A23-6574-D5894DFE1A82";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_003Shape" -p "mirror_jnt_rt_pinky_guide_003";
	rename -uid "C965DCB1-4FDC-F952-637E-1AAF4EB9B0F1";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_004" -p "grp_md_mirror_001";
	rename -uid "1D4A6F29-4194-1A1C-C233-D6BC011DDC3C";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_004Shape" -p "mirror_jnt_rt_pinky_guide_004";
	rename -uid "EC4BE241-41AA-D881-CF7A-D99BB835D295";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_005" -p "grp_md_mirror_001";
	rename -uid "D0C38BBE-4D8F-D08F-8E8C-FF835E19390B";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_005Shape" -p "mirror_jnt_rt_pinky_guide_005";
	rename -uid "41DCFCA2-4D4B-98BC-AF8E-CDAF09E99EBB";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_001" -p "grp_md_mirror_001";
	rename -uid "F90FC1C7-4315-7B3C-7B29-A6AB0ACF38A2";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_001Shape" -p "mirror_jnt_rt_ring_guide_001";
	rename -uid "0BEBE8D7-4D50-79B3-6DA7-C4BDF118D50A";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_002" -p "grp_md_mirror_001";
	rename -uid "CB17594E-4EE0-2F30-9B17-D6BCF569A161";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_002Shape" -p "mirror_jnt_rt_ring_guide_002";
	rename -uid "3BFF064B-4478-12BB-D34A-0DB0F85B74AC";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_003" -p "grp_md_mirror_001";
	rename -uid "443A9D0F-4A96-E60B-BEB1-EBB991D08216";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_003Shape" -p "mirror_jnt_rt_ring_guide_003";
	rename -uid "69C4CEDA-4FC9-FE2F-4131-FAA8F95A4888";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_004" -p "grp_md_mirror_001";
	rename -uid "A475E0A0-4917-1D91-C897-1087144D77FA";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_004Shape" -p "mirror_jnt_rt_ring_guide_004";
	rename -uid "B1F12DC9-4A9E-2937-9110-86A793ECE666";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_005" -p "grp_md_mirror_001";
	rename -uid "08B56266-4F52-DD6F-293E-9B9884A1F7E5";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_005Shape" -p "mirror_jnt_rt_ring_guide_005";
	rename -uid "4C7FE948-40E2-C987-AF9E-AF918C7B7CF0";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_scapula_guide_001" -p "grp_md_mirror_001";
	rename -uid "E3B35B33-4E5A-C85E-2538-9A9A9925F908";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_scapula_guide_001Shape" -p "mirror_jnt_rt_scapula_guide_001";
	rename -uid "411A0B15-4CD2-88D6-9288-51B466272B9B";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_scapula_guide_002" -p "grp_md_mirror_001";
	rename -uid "A34697A1-4DAB-ACDA-A254-5D9FE6FD69DF";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_scapula_guide_002Shape" -p "mirror_jnt_rt_scapula_guide_002";
	rename -uid "2414D707-46F4-E4CF-4ED0-29890AE287CC";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_001" -p "grp_md_mirror_001";
	rename -uid "B7307ADA-4C30-287C-C304-4D905012A894";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_001Shape" -p "mirror_jnt_rt_thumb_guide_001";
	rename -uid "D9206B1F-4DE8-9998-8A1A-218CD5AF9269";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_002" -p "grp_md_mirror_001";
	rename -uid "F1A0BD4A-4FFC-95EB-EA88-B998A5C36DAC";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_002Shape" -p "mirror_jnt_rt_thumb_guide_002";
	rename -uid "34CF53AF-42D6-5624-8829-E8ABD810669A";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_003" -p "grp_md_mirror_001";
	rename -uid "DC643383-4956-FF67-E7DA-05833EF442C4";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_003Shape" -p "mirror_jnt_rt_thumb_guide_003";
	rename -uid "FACB863F-4874-DD04-41D5-8B8D98675588";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_004" -p "grp_md_mirror_001";
	rename -uid "47F34D51-4D27-C184-7B25-E2A8346E403A";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_004Shape" -p "mirror_jnt_rt_thumb_guide_004";
	rename -uid "ADA73AE4-49D5-E356-D997-8AABB9B0B308";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_toe_guide_001" -p "grp_md_mirror_001";
	rename -uid "FEE2FA5E-42D4-0A0F-4EED-BC9FF35EAB8E";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_toe_guide_001Shape" -p "mirror_jnt_rt_toe_guide_001";
	rename -uid "885053CC-481D-A3F1-728A-949925115A78";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_upperArm_guide_001" -p "grp_md_mirror_001";
	rename -uid "ADD31DCD-49F0-18E4-17D9-FA9AE9ACFD52";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_upperArm_guide_001Shape" -p "mirror_jnt_rt_upperArm_guide_001";
	rename -uid "2196F4A4-43CA-280E-9887-06A731344B4A";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_upperLeg_guide_001" -p "grp_md_mirror_001";
	rename -uid "74EE2369-41A8-C2F0-FD2F-40BDCE7E755F";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_upperLeg_guide_001Shape" -p "mirror_jnt_rt_upperLeg_guide_001";
	rename -uid "9223CA16-491D-130F-ADC5-86BA06755EB2";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_wrist_guide_001" -p "grp_md_mirror_001";
	rename -uid "4BE12FB4-437C-DF90-DE76-569F449F6359";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_wrist_guide_001Shape" -p "mirror_jnt_rt_wrist_guide_001";
	rename -uid "DA1FECB0-4753-B0BA-BC3E-5AB503F473B7";
	setAttr -k off ".v";
createNode plusMinusAverage -n "autoPole_position";
	rename -uid "E74D80D0-44C3-2AA5-7233-DE8005A49295";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world";
	rename -uid "51638E6E-4070-BCAD-2A70-0AA960B4A5CF";
createNode multiplyDivide -n "autoPole_scaled";
	rename -uid "CC7D31CA-4EE6-93B1-E260-59814527354A";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction";
	rename -uid "4A463D0C-4D22-EE08-15E7-D8918556F9B4";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset";
	rename -uid "9E28538E-4831-C152-1EED-2486EAC40DC9";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid";
	rename -uid "0BCE808B-42D6-F872-0310-EC9059DEC52D";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world";
	rename -uid "70CE620F-40A7-BFEC-65FB-C482404EDE0A";
createNode multiplyDivide -n "autoPole_projection";
	rename -uid "490A2631-472E-CFE1-6AA4-EC914FEF5129";
createNode plusMinusAverage -n "autoPole_axis";
	rename -uid "98D6DAD7-4B3D-CACA-C199-078723910C90";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world";
	rename -uid "CCCD4126-474C-B808-FF40-888F9DA3A80B";
createNode multiplyDivide -n "autoPole_ratio";
	rename -uid "AEB7B94F-4BE2-467D-28B1-5F8DE82F892F";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid";
	rename -uid "85CF2D37-4182-CB78-366D-0C9A457769D4";
createNode vectorProduct -n "autoPole_dotAxis";
	rename -uid "70796F0E-47F8-4071-1A9F-C99816A68DF4";
createNode distanceBetween -n "autoPole_length";
	rename -uid "C7E6C3AF-49DD-23DC-2B4D-EABEDACD5591";
createNode plusMinusAverage -n "autoPole_position1";
	rename -uid "35337424-4256-35B0-74F5-9483861EC5EE";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world1";
	rename -uid "E148BCB4-4574-6157-4491-23A6EA64EA5B";
createNode multiplyDivide -n "autoPole_scaled1";
	rename -uid "EF294EEC-4784-8ECA-9CFA-EFA87477B8AA";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction1";
	rename -uid "40362E28-4FF7-C4EB-226F-9EBFBB98826C";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset1";
	rename -uid "77973A85-4D25-4784-DEE2-3F930B54E53B";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid1";
	rename -uid "B9D30F7D-480D-C9AB-D867-159D6B33DE06";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world1";
	rename -uid "79236F16-459B-12C4-9D42-CBAFBF9F3A90";
createNode multiplyDivide -n "autoPole_projection1";
	rename -uid "D0D61327-41F6-3250-C831-1290208095B3";
createNode plusMinusAverage -n "autoPole_axis1";
	rename -uid "8903CDC6-4F61-8BE7-EC3C-A3B341FCFA1D";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world1";
	rename -uid "38CE9368-4E1C-198C-A587-43AB5E6B6641";
createNode multiplyDivide -n "autoPole_ratio1";
	rename -uid "8DED9BAA-4110-494B-3E68-AF93EB2F70CC";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid1";
	rename -uid "7E69C8B6-4308-D382-5923-ED8DCC091D0F";
createNode vectorProduct -n "autoPole_dotAxis1";
	rename -uid "019B2EB2-44BC-B6B8-3D6B-5B901BC10FFD";
createNode distanceBetween -n "autoPole_length1";
	rename -uid "9ACB01D1-4537-B435-9F9D-E7891EF4BAB6";
createNode plusMinusAverage -n "autoPole_position2";
	rename -uid "AA9893E8-4862-C0E3-A4CB-F88C9B00007E";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world2";
	rename -uid "DC7788DF-4603-BF31-F365-1DAFA93B5E3D";
createNode multiplyDivide -n "autoPole_scaled2";
	rename -uid "322DC59B-400D-148D-4A21-79881A0489AC";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction2";
	rename -uid "6F87F372-4702-074F-423E-249DADA05C79";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset2";
	rename -uid "C09F6EF8-4CFD-48FD-2256-A5AB1FDF2148";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid2";
	rename -uid "04FE6DD6-48F6-1DE9-2D6D-008F61FAFACB";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world2";
	rename -uid "0F40E01F-4ABE-BE72-F527-60AA864E52FA";
createNode multiplyDivide -n "autoPole_projection2";
	rename -uid "42583584-4B3E-6EB4-1535-2A9ECEC87BE0";
createNode plusMinusAverage -n "autoPole_axis2";
	rename -uid "B3E9EEE2-48E4-BF5F-6FC0-238E74AAF0FE";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world2";
	rename -uid "B695B73F-4C50-5956-835E-E6A93E02312A";
createNode multiplyDivide -n "autoPole_ratio2";
	rename -uid "BD7C3952-49A4-EFAD-5B32-019EE9622BEA";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid2";
	rename -uid "DD88585C-488A-EEB5-7F4D-18824C1A16D0";
createNode vectorProduct -n "autoPole_dotAxis2";
	rename -uid "9D5DD0FD-4CC8-81FE-CAB2-E8981B86D8C5";
createNode distanceBetween -n "autoPole_length2";
	rename -uid "0EF0D3E3-4629-7559-7EF7-A8B0F819747F";
createNode plusMinusAverage -n "autoPole_position3";
	rename -uid "B79EA405-474B-F8F8-E5FB-548FC238CAE4";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world3";
	rename -uid "5BA925DE-44DD-3848-C1B6-BEB4BD20EC9F";
createNode multiplyDivide -n "autoPole_scaled3";
	rename -uid "7EE41F05-46E7-891E-60AE-889A24BEC105";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction3";
	rename -uid "78F3EF3F-442B-2160-87B9-C7A2371799A3";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset3";
	rename -uid "E4AB6402-424E-40A3-FA02-7FBCAE93CC5D";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid3";
	rename -uid "96054284-4ABF-694B-ED0A-88B51662607E";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world3";
	rename -uid "B736684F-4CD6-66D3-2B57-08957B697011";
createNode multiplyDivide -n "autoPole_projection3";
	rename -uid "23552EA1-452C-3EC9-4B1D-32AF59F0C004";
createNode plusMinusAverage -n "autoPole_axis3";
	rename -uid "364C4A04-449A-AAB3-B8DF-038CB7707C6C";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world3";
	rename -uid "B5C82CE4-4374-E0B7-EBC3-028691093C60";
createNode multiplyDivide -n "autoPole_ratio3";
	rename -uid "2AB1ABC7-4D22-D7A4-1F11-DEA34EC00B5B";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid3";
	rename -uid "89E61C9F-4990-49B7-04E4-BB8274BEE778";
createNode vectorProduct -n "autoPole_dotAxis3";
	rename -uid "88F76AAD-4ED3-DF50-4625-37B68B742704";
createNode distanceBetween -n "autoPole_length3";
	rename -uid "7A2A5352-4E94-6C09-1991-96B746927822";
createNode decomposeMatrix -n "autoPole_display_arm_cv0";
	rename -uid "870C3E95-4F07-6018-F32B-6EA287BE44CD";
createNode decomposeMatrix -n "autoPole_display_arm_cv1";
	rename -uid "CC404C6F-4B8A-7B5C-E0D0-B9B36E5A8DEC";
createNode decomposeMatrix -n "autoPole_display_leg_cv0";
	rename -uid "62961911-4DE3-CD37-796D-C18F241A8761";
createNode decomposeMatrix -n "autoPole_display_leg_cv1";
	rename -uid "F7BDA413-423F-59EC-B500-D88764F830FA";
createNode decomposeMatrix -n "autoPole_display_rt_arm_cv0";
	rename -uid "6A7A6F33-4E8C-C374-4A58-FF8EFD83B0D2";
createNode decomposeMatrix -n "autoPole_display_rt_arm_cv1";
	rename -uid "D5EDACFB-4470-E94E-29E1-6C8DA9309769";
createNode decomposeMatrix -n "autoPole_display_rt_leg_cv0";
	rename -uid "3D380829-4638-2C92-DA60-DF9CFF3B9F5F";
createNode decomposeMatrix -n "autoPole_display_rt_leg_cv1";
	rename -uid "EBFBBE17-4085-42C6-3AA6-EEB257E5C816";
createNode decomposeMatrix -n "decomposeMatrix73";
	rename -uid "1BA0009C-43B6-F3B7-F6B2-28988F132FCC";
createNode multMatrix -n "multMatrix73";
	rename -uid "BE50B0CE-4B8B-0420-3650-98A0C73FCA33";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix74";
	rename -uid "9E4B4EFD-4518-FC71-0E19-498B8FD994CB";
createNode multMatrix -n "multMatrix74";
	rename -uid "3E9F593F-4BD2-810C-75F1-01A583F0392B";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix75";
	rename -uid "F3796F9D-4B9E-0649-35FF-C3B558A510E2";
createNode multMatrix -n "multMatrix75";
	rename -uid "83E00F3A-4689-3385-1C3A-AF91AC0AD58B";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix76";
	rename -uid "DA449964-488F-339E-AE0C-41A101084094";
createNode multMatrix -n "multMatrix76";
	rename -uid "6A871DAB-40C6-422C-C8D6-BEB2189E7D6A";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix77";
	rename -uid "14676261-4C41-572B-3067-F2AA8E3E5A9F";
createNode multMatrix -n "multMatrix77";
	rename -uid "9E962582-4A4D-55A9-B81B-63BA0BDDF1A1";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix78";
	rename -uid "A2C0DB34-464B-D09B-BF6D-7587953F757D";
createNode multMatrix -n "multMatrix78";
	rename -uid "A586C18F-40AA-28C9-8863-00B885F0F100";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix79";
	rename -uid "1A2F1D8E-4077-0585-08DF-A38F1E7D3A19";
createNode multMatrix -n "multMatrix79";
	rename -uid "8E2B8647-40DB-5E7F-C086-B2A7462E7574";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix80";
	rename -uid "939EDD65-4E7A-F0D7-2E19-93BEAFAD294D";
createNode multMatrix -n "multMatrix80";
	rename -uid "3A71A93C-47D3-E4CA-ADF3-B8B4A361A102";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix81";
	rename -uid "B731949E-4FE8-4AF9-4CF4-498F91B92F04";
createNode multMatrix -n "multMatrix81";
	rename -uid "0914B4F7-4DAB-9348-CFF9-46897D7DED99";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix82";
	rename -uid "742F66A3-4DBA-7E16-8790-7FB7E00524C0";
createNode multMatrix -n "multMatrix82";
	rename -uid "3FEF4FB0-444E-6F1D-8DB4-7B9CD163765B";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix83";
	rename -uid "BAB9BBA7-4BD3-99AF-B5EB-E39624D768F1";
createNode multMatrix -n "multMatrix83";
	rename -uid "64A69CB3-462E-C620-3836-7694B5B06477";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix84";
	rename -uid "5C4FDC02-4FBD-5D78-7717-AE8E13CA5295";
createNode multMatrix -n "multMatrix84";
	rename -uid "0EA578E9-4AA6-9FDB-963A-DE89B00DF0C3";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix85";
	rename -uid "680832B5-4933-A2FB-0567-50BF47AF357F";
createNode multMatrix -n "multMatrix85";
	rename -uid "CC57DBA4-4B3B-53AA-3A0F-399F4FE5B656";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix86";
	rename -uid "8443087D-4593-B1CF-5FFE-1FBA47A78357";
createNode multMatrix -n "multMatrix86";
	rename -uid "AC1C4B84-4DE5-199E-1E60-8B8059CE7CC5";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix87";
	rename -uid "482615D4-444F-E87E-7836-E4BA01E14A57";
createNode multMatrix -n "multMatrix87";
	rename -uid "A5B27893-43B3-4227-E2FB-0284C7BA2CFE";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix88";
	rename -uid "99AF42F6-4573-CD60-D34F-32B8923D2F49";
createNode multMatrix -n "multMatrix88";
	rename -uid "C21269F5-4D28-997E-0234-C88779A2F382";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix89";
	rename -uid "A6915AD7-46C5-D84C-87E8-D5BD149E6BAA";
createNode multMatrix -n "multMatrix89";
	rename -uid "E3B82D0D-43C5-5E3C-4AE0-13B42859B3AC";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix90";
	rename -uid "820916FD-4273-7A6E-13CB-6C87D660579D";
createNode multMatrix -n "multMatrix90";
	rename -uid "F4926499-402A-0567-CF87-FEACBA273352";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix91";
	rename -uid "F562AB65-4BDF-A2A8-3C32-08A4BD5C90ED";
createNode multMatrix -n "multMatrix91";
	rename -uid "7E6C2C19-4393-9884-AC90-869086B8ABB8";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix92";
	rename -uid "FC1DDFFF-492B-B10B-560D-A3BEDA6705EF";
createNode multMatrix -n "multMatrix92";
	rename -uid "9D6A16C7-4C50-F35A-11D9-BD8EC8BCD84C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix93";
	rename -uid "DC2CA0E9-4BF3-0ADB-0DAE-D299E83AB7CE";
createNode multMatrix -n "multMatrix93";
	rename -uid "0A00FB19-4F8A-084A-1530-7A9BF23B6A7C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix94";
	rename -uid "93E3198D-4FA0-F6F8-59A4-AF98388E9444";
createNode multMatrix -n "multMatrix94";
	rename -uid "FF96FE8D-4B3C-C5D5-0147-07943EE340EB";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix95";
	rename -uid "7DFAEA5C-4C31-7984-EFA3-69A2E9A2CB6C";
createNode multMatrix -n "multMatrix95";
	rename -uid "0A7C622A-4B73-627B-2942-99905AF0A42C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix96";
	rename -uid "185DA20B-49C8-14E1-BEE4-0D937A4F547B";
createNode multMatrix -n "multMatrix96";
	rename -uid "BA90F2DE-435C-1D1F-8E33-CEBD50CEEDF0";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix97";
	rename -uid "A2C0F288-4B07-23E3-2E1D-029A76ED77E1";
createNode multMatrix -n "multMatrix97";
	rename -uid "3506248E-49D8-D365-80A4-AE87DBC064C7";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix98";
	rename -uid "8E2CAADC-480B-7EE4-76E8-ADA6F238771E";
createNode multMatrix -n "multMatrix98";
	rename -uid "BB713230-4827-4C2B-1D03-219A317E6B77";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix99";
	rename -uid "19668CC5-4287-AEFD-5B11-8D858CB25216";
createNode multMatrix -n "multMatrix99";
	rename -uid "E0D274E8-40DF-2D47-4A47-6BA55EEB441D";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix100";
	rename -uid "1338A9BE-4C3E-2F6B-91F7-DBB5479969A8";
createNode multMatrix -n "multMatrix100";
	rename -uid "BD2CABA3-4017-2B59-458E-A48B87562AA0";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix101";
	rename -uid "2D4DE3F7-4F7A-888F-841C-3A872C2F9CEC";
createNode multMatrix -n "multMatrix101";
	rename -uid "5BCF0C68-41B9-2363-EAA0-5BBCB1D23558";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix102";
	rename -uid "3E5DF2E7-4DB4-A685-4CDF-8EA910642170";
createNode multMatrix -n "multMatrix102";
	rename -uid "5F5B97B1-4839-EF96-51C7-3C854BE2D4EA";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix103";
	rename -uid "493172B4-4597-BEE2-4488-02AA20FF4BE3";
createNode multMatrix -n "multMatrix103";
	rename -uid "5E9F66C9-4EF0-679C-B7CB-788ECA35B9B9";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix104";
	rename -uid "32EC056C-45FE-6A1A-B114-97A892EDD47B";
createNode multMatrix -n "multMatrix104";
	rename -uid "7BEEA3E0-4FB2-BDAA-2EA4-10A734589A43";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix105";
	rename -uid "38E933A0-4461-2714-4454-7694E25AA34D";
createNode multMatrix -n "multMatrix105";
	rename -uid "B27AEF98-44EF-D63B-0F2A-7EB5ADE91113";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix106";
	rename -uid "45012AB2-40EA-82AE-F38B-92B5655C9AD1";
createNode multMatrix -n "multMatrix106";
	rename -uid "4968CAA2-4A10-9E80-8403-8DBB31ED278F";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix107";
	rename -uid "72BD2AD8-4144-417E-DE01-C6BB3EB84007";
createNode multMatrix -n "multMatrix107";
	rename -uid "2A3682DD-4564-7078-47F7-91AE34485A36";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix108";
	rename -uid "CAC2905A-437A-41A4-D390-F8B2FCB5B96B";
createNode multMatrix -n "multMatrix108";
	rename -uid "B35E01C8-4F17-6837-D010-52B1134CD343";
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
connectAttr "decomposeMatrix73.ot" "mirror_jnt_rt_ankle_guide_001.t";
connectAttr "decomposeMatrix73.or" "mirror_jnt_rt_ankle_guide_001.r";
connectAttr "decomposeMatrix74.ot" "mirror_jnt_rt_ball_guide_001.t";
connectAttr "decomposeMatrix74.or" "mirror_jnt_rt_ball_guide_001.r";
connectAttr "decomposeMatrix75.ot" "mirror_jnt_rt_clavicle_guide_001.t";
connectAttr "decomposeMatrix75.or" "mirror_jnt_rt_clavicle_guide_001.r";
connectAttr "decomposeMatrix76.ot" "mirror_jnt_rt_clavicle_guide_002.t";
connectAttr "decomposeMatrix76.or" "mirror_jnt_rt_clavicle_guide_002.r";
connectAttr "decomposeMatrix77.ot" "mirror_jnt_rt_elbow_guide_001.t";
connectAttr "decomposeMatrix77.or" "mirror_jnt_rt_elbow_guide_001.r";
connectAttr "decomposeMatrix78.ot" "mirror_jnt_rt_index_guide_001.t";
connectAttr "decomposeMatrix78.or" "mirror_jnt_rt_index_guide_001.r";
connectAttr "decomposeMatrix79.ot" "mirror_jnt_rt_index_guide_002.t";
connectAttr "decomposeMatrix79.or" "mirror_jnt_rt_index_guide_002.r";
connectAttr "decomposeMatrix80.ot" "mirror_jnt_rt_index_guide_003.t";
connectAttr "decomposeMatrix80.or" "mirror_jnt_rt_index_guide_003.r";
connectAttr "decomposeMatrix81.ot" "mirror_jnt_rt_index_guide_004.t";
connectAttr "decomposeMatrix81.or" "mirror_jnt_rt_index_guide_004.r";
connectAttr "decomposeMatrix82.ot" "mirror_jnt_rt_index_guide_005.t";
connectAttr "decomposeMatrix82.or" "mirror_jnt_rt_index_guide_005.r";
connectAttr "decomposeMatrix83.ot" "mirror_jnt_rt_knee_guide_001.t";
connectAttr "decomposeMatrix83.or" "mirror_jnt_rt_knee_guide_001.r";
connectAttr "decomposeMatrix84.ot" "mirror_jnt_rt_middle_guide_001.t";
connectAttr "decomposeMatrix84.or" "mirror_jnt_rt_middle_guide_001.r";
connectAttr "decomposeMatrix85.ot" "mirror_jnt_rt_middle_guide_002.t";
connectAttr "decomposeMatrix85.or" "mirror_jnt_rt_middle_guide_002.r";
connectAttr "decomposeMatrix86.ot" "mirror_jnt_rt_middle_guide_003.t";
connectAttr "decomposeMatrix86.or" "mirror_jnt_rt_middle_guide_003.r";
connectAttr "decomposeMatrix87.ot" "mirror_jnt_rt_middle_guide_004.t";
connectAttr "decomposeMatrix87.or" "mirror_jnt_rt_middle_guide_004.r";
connectAttr "decomposeMatrix88.ot" "mirror_jnt_rt_middle_guide_005.t";
connectAttr "decomposeMatrix88.or" "mirror_jnt_rt_middle_guide_005.r";
connectAttr "decomposeMatrix89.ot" "mirror_jnt_rt_pinky_guide_001.t";
connectAttr "decomposeMatrix89.or" "mirror_jnt_rt_pinky_guide_001.r";
connectAttr "decomposeMatrix90.ot" "mirror_jnt_rt_pinky_guide_002.t";
connectAttr "decomposeMatrix90.or" "mirror_jnt_rt_pinky_guide_002.r";
connectAttr "decomposeMatrix91.ot" "mirror_jnt_rt_pinky_guide_003.t";
connectAttr "decomposeMatrix91.or" "mirror_jnt_rt_pinky_guide_003.r";
connectAttr "decomposeMatrix92.ot" "mirror_jnt_rt_pinky_guide_004.t";
connectAttr "decomposeMatrix92.or" "mirror_jnt_rt_pinky_guide_004.r";
connectAttr "decomposeMatrix93.ot" "mirror_jnt_rt_pinky_guide_005.t";
connectAttr "decomposeMatrix93.or" "mirror_jnt_rt_pinky_guide_005.r";
connectAttr "decomposeMatrix94.ot" "mirror_jnt_rt_ring_guide_001.t";
connectAttr "decomposeMatrix94.or" "mirror_jnt_rt_ring_guide_001.r";
connectAttr "decomposeMatrix95.ot" "mirror_jnt_rt_ring_guide_002.t";
connectAttr "decomposeMatrix95.or" "mirror_jnt_rt_ring_guide_002.r";
connectAttr "decomposeMatrix96.ot" "mirror_jnt_rt_ring_guide_003.t";
connectAttr "decomposeMatrix96.or" "mirror_jnt_rt_ring_guide_003.r";
connectAttr "decomposeMatrix97.ot" "mirror_jnt_rt_ring_guide_004.t";
connectAttr "decomposeMatrix97.or" "mirror_jnt_rt_ring_guide_004.r";
connectAttr "decomposeMatrix98.ot" "mirror_jnt_rt_ring_guide_005.t";
connectAttr "decomposeMatrix98.or" "mirror_jnt_rt_ring_guide_005.r";
connectAttr "decomposeMatrix99.ot" "mirror_jnt_rt_scapula_guide_001.t";
connectAttr "decomposeMatrix99.or" "mirror_jnt_rt_scapula_guide_001.r";
connectAttr "decomposeMatrix100.ot" "mirror_jnt_rt_scapula_guide_002.t";
connectAttr "decomposeMatrix100.or" "mirror_jnt_rt_scapula_guide_002.r";
connectAttr "decomposeMatrix101.ot" "mirror_jnt_rt_thumb_guide_001.t";
connectAttr "decomposeMatrix101.or" "mirror_jnt_rt_thumb_guide_001.r";
connectAttr "decomposeMatrix102.ot" "mirror_jnt_rt_thumb_guide_002.t";
connectAttr "decomposeMatrix102.or" "mirror_jnt_rt_thumb_guide_002.r";
connectAttr "decomposeMatrix103.ot" "mirror_jnt_rt_thumb_guide_003.t";
connectAttr "decomposeMatrix103.or" "mirror_jnt_rt_thumb_guide_003.r";
connectAttr "decomposeMatrix104.ot" "mirror_jnt_rt_thumb_guide_004.t";
connectAttr "decomposeMatrix104.or" "mirror_jnt_rt_thumb_guide_004.r";
connectAttr "decomposeMatrix105.ot" "mirror_jnt_rt_toe_guide_001.t";
connectAttr "decomposeMatrix105.or" "mirror_jnt_rt_toe_guide_001.r";
connectAttr "decomposeMatrix106.ot" "mirror_jnt_rt_upperArm_guide_001.t";
connectAttr "decomposeMatrix106.or" "mirror_jnt_rt_upperArm_guide_001.r";
connectAttr "decomposeMatrix107.ot" "mirror_jnt_rt_upperLeg_guide_001.t";
connectAttr "decomposeMatrix107.or" "mirror_jnt_rt_upperLeg_guide_001.r";
connectAttr "decomposeMatrix108.ot" "mirror_jnt_rt_wrist_guide_001.t";
connectAttr "decomposeMatrix108.or" "mirror_jnt_rt_wrist_guide_001.r";
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
connectAttr "multMatrix73.o" "decomposeMatrix73.imat";
connectAttr "jnt_lf_ankle_guide_001.wm" "multMatrix73.i[1]";
connectAttr "multMatrix74.o" "decomposeMatrix74.imat";
connectAttr "jnt_lf_ball_guide_001.wm" "multMatrix74.i[1]";
connectAttr "multMatrix75.o" "decomposeMatrix75.imat";
connectAttr "jnt_lf_clavicle_guide_001.wm" "multMatrix75.i[1]";
connectAttr "multMatrix76.o" "decomposeMatrix76.imat";
connectAttr "jnt_lf_clavicle_guide_002.wm" "multMatrix76.i[1]";
connectAttr "multMatrix77.o" "decomposeMatrix77.imat";
connectAttr "jnt_lf_elbow_guide_001.wm" "multMatrix77.i[1]";
connectAttr "multMatrix78.o" "decomposeMatrix78.imat";
connectAttr "jnt_lf_index_guide_001.wm" "multMatrix78.i[1]";
connectAttr "multMatrix79.o" "decomposeMatrix79.imat";
connectAttr "jnt_lf_index_guide_002.wm" "multMatrix79.i[1]";
connectAttr "multMatrix80.o" "decomposeMatrix80.imat";
connectAttr "jnt_lf_index_guide_003.wm" "multMatrix80.i[1]";
connectAttr "multMatrix81.o" "decomposeMatrix81.imat";
connectAttr "jnt_lf_index_guide_004.wm" "multMatrix81.i[1]";
connectAttr "multMatrix82.o" "decomposeMatrix82.imat";
connectAttr "jnt_lf_index_guide_005.wm" "multMatrix82.i[1]";
connectAttr "multMatrix83.o" "decomposeMatrix83.imat";
connectAttr "jnt_lf_knee_guide_001.wm" "multMatrix83.i[1]";
connectAttr "multMatrix84.o" "decomposeMatrix84.imat";
connectAttr "jnt_lf_middle_guide_001.wm" "multMatrix84.i[1]";
connectAttr "multMatrix85.o" "decomposeMatrix85.imat";
connectAttr "jnt_lf_middle_guide_002.wm" "multMatrix85.i[1]";
connectAttr "multMatrix86.o" "decomposeMatrix86.imat";
connectAttr "jnt_lf_middle_guide_003.wm" "multMatrix86.i[1]";
connectAttr "multMatrix87.o" "decomposeMatrix87.imat";
connectAttr "jnt_lf_middle_guide_004.wm" "multMatrix87.i[1]";
connectAttr "multMatrix88.o" "decomposeMatrix88.imat";
connectAttr "jnt_lf_middle_guide_005.wm" "multMatrix88.i[1]";
connectAttr "multMatrix89.o" "decomposeMatrix89.imat";
connectAttr "jnt_lf_pinky_guide_001.wm" "multMatrix89.i[1]";
connectAttr "multMatrix90.o" "decomposeMatrix90.imat";
connectAttr "jnt_lf_pinky_guide_002.wm" "multMatrix90.i[1]";
connectAttr "multMatrix91.o" "decomposeMatrix91.imat";
connectAttr "jnt_lf_pinky_guide_003.wm" "multMatrix91.i[1]";
connectAttr "multMatrix92.o" "decomposeMatrix92.imat";
connectAttr "jnt_lf_pinky_guide_004.wm" "multMatrix92.i[1]";
connectAttr "multMatrix93.o" "decomposeMatrix93.imat";
connectAttr "jnt_lf_pinky_guide_005.wm" "multMatrix93.i[1]";
connectAttr "multMatrix94.o" "decomposeMatrix94.imat";
connectAttr "jnt_lf_ring_guide_001.wm" "multMatrix94.i[1]";
connectAttr "multMatrix95.o" "decomposeMatrix95.imat";
connectAttr "jnt_lf_ring_guide_002.wm" "multMatrix95.i[1]";
connectAttr "multMatrix96.o" "decomposeMatrix96.imat";
connectAttr "jnt_lf_ring_guide_003.wm" "multMatrix96.i[1]";
connectAttr "multMatrix97.o" "decomposeMatrix97.imat";
connectAttr "jnt_lf_ring_guide_004.wm" "multMatrix97.i[1]";
connectAttr "multMatrix98.o" "decomposeMatrix98.imat";
connectAttr "jnt_lf_ring_guide_005.wm" "multMatrix98.i[1]";
connectAttr "multMatrix99.o" "decomposeMatrix99.imat";
connectAttr "jnt_lf_scapula_guide_001.wm" "multMatrix99.i[1]";
connectAttr "multMatrix100.o" "decomposeMatrix100.imat";
connectAttr "jnt_lf_scapula_guide_002.wm" "multMatrix100.i[1]";
connectAttr "multMatrix101.o" "decomposeMatrix101.imat";
connectAttr "jnt_lf_thumb_guide_001.wm" "multMatrix101.i[1]";
connectAttr "multMatrix102.o" "decomposeMatrix102.imat";
connectAttr "jnt_lf_thumb_guide_002.wm" "multMatrix102.i[1]";
connectAttr "multMatrix103.o" "decomposeMatrix103.imat";
connectAttr "jnt_lf_thumb_guide_003.wm" "multMatrix103.i[1]";
connectAttr "multMatrix104.o" "decomposeMatrix104.imat";
connectAttr "jnt_lf_thumb_guide_004.wm" "multMatrix104.i[1]";
connectAttr "multMatrix105.o" "decomposeMatrix105.imat";
connectAttr "jnt_lf_toe_guide_001.wm" "multMatrix105.i[1]";
connectAttr "multMatrix106.o" "decomposeMatrix106.imat";
connectAttr "jnt_lf_upperArm_guide_001.wm" "multMatrix106.i[1]";
connectAttr "multMatrix107.o" "decomposeMatrix107.imat";
connectAttr "jnt_lf_upperLeg_guide_001.wm" "multMatrix107.i[1]";
connectAttr "multMatrix108.o" "decomposeMatrix108.imat";
connectAttr "jnt_lf_wrist_guide_001.wm" "multMatrix108.i[1]";
dataStructure -fmt "raw" -as "name=notes_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA:string=value";
dataStructure -fmt "raw" -as "name=TifLocation:string=Path";
dataStructure -fmt "raw" -as "name=notes_rockTerraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mainStreetMainstreetTrees04:string=value";
dataStructure -fmt "raw" -as "name=mapManager_square_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_baseForest:string=value";
dataStructure -fmt "raw" -as "name=mapManager_square_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloC:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_curbsGardenGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_path:string=value";
dataStructure -fmt "raw" -as "name=notes_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_trees:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSide:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=notes_treesRocksAnimalHome_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=IdStruct:int32=ID";
dataStructure -fmt "raw" -as "name=notes_Suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_holeRock_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_left_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=notes_testMode_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rocks:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_background_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_small_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_grassD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=notes_railwayGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_det:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=notes_base_left:string=value";
dataStructure -fmt "raw" -as "name=notes_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBase:string=value";
dataStructure -fmt "raw" -as "name=notes_level1A:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_wasteLand_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=mapManager_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_geos:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_hotelBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_fountainHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_treesRocksHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_original:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloB:string=value";
dataStructure -fmt "raw" -as "name=mapManager_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_heroesChoice_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloor_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=notes_railes:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundRocks:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=OrgStruct:float[3]=Origin Point";
dataStructure -fmt "raw" -as "name=notes_wildPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=notes_center_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rockCheated_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_right_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksCurbsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_vgTFicus39:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_bushes_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=notes_terraceGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchH_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBeauty_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grasses:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocks:string=value";
dataStructure -fmt "raw" -as "name=mapManager_degraded:string=value";
dataStructure -fmt "raw" -as "name=notes_square_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_cheat_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_circular:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_floor1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=notes_bridge_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vgFCarouselBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vgGroundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small:string=value";
dataStructure -fmt "raw" -as "name=notes_treesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=notes_suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrasStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaD_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=notes_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=notes_degraded:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquare_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassJuneBackYard_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=notes_mountainTrail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_left:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesFlowerBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=notes_road_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_entrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=mapManager_big_back:string=value";
dataStructure -fmt "raw" -as "name=notes_grasses:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_levelC:string=value";
dataStructure -fmt "raw" -as "name=notes_floorA:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_base:string=value";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_square_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=notes_ridePiggy_parShape:string=value";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=mapManager_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left:string=value";
dataStructure -fmt "raw" -as "name=notes_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayCircular_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=notes_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=keyValueStructure:string=value";
dataStructure -fmt "raw" -as "name=notes_chocolateFountain_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_original:string=value";
dataStructure -fmt "raw" -as "name=mapManager_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=notes_rightExterior_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vegetation_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_ferns_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloB:string=value";
dataStructure -fmt "raw" -as "name=notes_treesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloProvi3:string=value";
dataStructure -fmt "raw" -as "name=notes_midground_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayArea_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=notes_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=notes_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchG_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersRightLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesCDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_new_sand:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloC:string=value";
dataStructure -fmt "raw" -as "name=mapManager_railes:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_grassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=notes_floorGrassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantNextHouse_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_path:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_leavesDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_big_back:string=value";
dataStructure -fmt "raw" -as "name=notes_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_levelC:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassBase:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquareFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_decayFlowerBeds_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassADecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_terraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchDegraded_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=notes_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloorGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnelParkEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes:string=value";
dataStructure -fmt "raw" -as "name=Blur3dMetaData:string=Blur3dValue";
dataStructure -fmt "raw" -as "name=notes_square_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=notes_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=notes_base_right:string=value";
dataStructure -fmt "raw" -as "name=mapManager_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchE_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_circular:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_juneNbhHouseE_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_geos:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_leftSpecific_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_Suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_terraceBush_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesTrees_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_det:string=value";
dataStructure -fmt "raw" -as "name=notes_carouselStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=notes_concretesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSide:string=value";
dataStructure -fmt "raw" -as "name=notes_widlPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnel:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=notes_frogEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaCorner_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=notes_grassLeftMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyFlowersBedA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_barbacueHouseFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundRocks:string=value";
dataStructure -fmt "raw" -as "name=notes_slabsAndStairsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassesCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_riverside_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=notes_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=notes_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_frogL_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseForest:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=RenderSettings:string=preset";
dataStructure -fmt "raw" -as "name=notes_slideSundaeLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tilesFloorDet:string=value";
dataStructure -fmt "raw" -as "name=notes_fountainRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vgtCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=notes_base_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_centerStreetGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiaryGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=notes_squareRocks_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_tilesFloorDet:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tunnel:string=value";
dataStructure -fmt "raw" -as "name=notes_frogLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchF_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=notes_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=notes_small:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=mapManager_slopes:string=value";
dataStructure -fmt "raw" -as "name=notes_bushesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_new_sand:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesCarousel_parShape:string=value";
dataStructure -fmt "raw" -as "name=OffStruct:float=Offset";
dataStructure -fmt "raw" -as "name=notes_floorSquare:string=value";
// End of body_guide.ma
