//Maya ASCII 2023 scene
//Name: body_guide.ma
//Last modified: Sat, Oct 24, 2026 10:34:00 AM
//Codeset: 936
requires maya "2023";
requires "stereoCamera" "10.0";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" "mtoa" "5.2.1.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2023";
fileInfo "version" "2023";
fileInfo "cutIdentifier" "202211021031-847a9f9623";
fileInfo "osv" "Windows 11 Pro v2009 (Build: 26200)";
fileInfo "UUID" "5413F7EA-4334-60FB-8B56-459A9EFEC802";
createNode transform -n "grp_md_body_guide_001";
	rename -uid "E6A35A82-49F7-F262-86CA-C2BB038455AA";
createNode transform -n "crv_md_body_guide_001" -p "grp_md_body_guide_001";
	rename -uid "63CD65DA-42B3-88BC-5FB2-B09B463450BA";
createNode nurbsCurve -n "crv_md_body_guide_Shape1" -p "crv_md_body_guide_001";
	rename -uid "58A7D18D-4984-29AF-54D4-60975F0ED8A2";
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
	rename -uid "FC58ED3A-4152-52C4-CF93-5EA9A5086094";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.5505488262748902e-17 89.520696060436919 -4.7392802238464409 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90 -10.026249650570916 90.00000000000027 ;
	setAttr ".pa" -type "double3" -2.5444437451708134e-14 9.541664044390544e-15 -2.2263882770244621e-14 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 6.4560376483287606e-27 97.722709655761719 -4.7392802238464355 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pelvisIkLocal001";
	setAttr ".radi" 3;
createNode joint -n "jnt_md_spine_guide_001" -p "jnt_md_root_guide_001";
	rename -uid "EBB9C43A-477E-B689-5DBB-90AAE5E5BAA9";
	setAttr ".t" -type "double3" 10.064121866092288 -2.1631551587160961e-15 6.7567479389302119e-16 ;
	setAttr ".jo" -type "double3" 0 0 -9.7080753510123223 ;
createNode joint -n "jnt_md_spine_guide_002" -p "jnt_md_spine_guide_001";
	rename -uid "525F7087-4D95-E080-BA13-FA816554B91D";
	setAttr ".t" -type "double3" 6.0124011528988097 -9.0176748386614056e-16 9.4580220176431071e-09 ;
	setAttr ".jo" -type "double3" 0 0 -2.1953811835945114 ;
createNode joint -n "jnt_md_spine_guide_003" -p "jnt_md_spine_guide_002";
	rename -uid "932D1AED-4C54-7BA2-C868-3FB5B1A0FAE6";
	setAttr ".t" -type "double3" 6.0155368275124994 -2.1691938147359088e-15 9.4580949707994258e-09 ;
	setAttr ".jo" -type "double3" 0 0 -6.0009071873890658 ;
createNode joint -n "jnt_md_spine_guide_004" -p "jnt_md_spine_guide_003";
	rename -uid "8EB469A3-417D-C42B-5FB3-0686E4E3E084";
	setAttr ".t" -type "double3" 6.0695939297020454 -4.5496044369760157e-15 1.3644948818650877e-08 ;
	setAttr ".jo" -type "double3" 0 0 -4.8918517860350264 ;
createNode joint -n "jnt_md_spine_guide_005" -p "jnt_md_spine_guide_004";
	rename -uid "E50B772D-42E6-48A5-2A8E-55A8460725B0";
	setAttr ".t" -type "double3" 6.1647924005404295 1.3624399377753891e-15 1.2549285378937563e-08 ;
	setAttr ".jo" -type "double3" 0 0 -1.3874055406023973 ;
createNode joint -n "jnt_md_spine_guide_006" -p "jnt_md_spine_guide_005";
	rename -uid "B374AA50-4863-8C89-5E6E-6DB789958AD7";
	setAttr ".t" -type "double3" 6.2006367127256476 -1.5776657971144458e-14 -1.1156912479461246e-20 ;
createNode joint -n "jnt_lf_clavicle_guide_001" -p "jnt_md_spine_guide_006";
	rename -uid "CC764FD0-41E9-B0C6-82FF-64B33D53DFA4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.9947710779578642 6.2562056881582144 2.4859892158757662 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 51.484747085274464 -67.308656337635867 -39.554004439140385 ;
	setAttr ".pa" -type "double3" 1.5902773407317574e-14 -2.544443745170814e-14 3.8166656177562195e-14 ;
	setAttr ".bps" -type "matrix" 0.92261090157656322 0.22832081535868298 -0.3109504800865856 0
		 -0.21635938360745113 0.97358679420174721 0.072920307740496626 0 0.31938147951492574 -1.6663463119331173e-08 0.94762622934512386 0
		 2.485989280347185 138.77479306060459 -2.7511839165280403 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "clavicle001";
	setAttr ".radi" 1.4200000000000002;
createNode joint -n "jnt_lf_clavicle_guide_002" -p "jnt_lf_clavicle_guide_001";
	rename -uid "BD764F95-4036-55F8-D25E-58B7817EFB85";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.889342927023989 -2.3688088418235815e-16 -9.1186601479376475e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 157.06757295966304 80.731499723885179 174.91236483879078 ;
	setAttr ".bps" -type "matrix" 0.88146309366010767 -0.05149627414788422 -0.46943684161347787 0
		 0.030338377170725024 0.99815842183999004 -0.052529494386938158 0 0.47127741022225755 0.032060858672008231 0.8814021238659544 0
		 12.532456418338548 141.26101727982933 -6.1371766187541841 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "clavicle002";
	setAttr ".radi" 1.4200000000000002;
createNode joint -n "jnt_lf_scapula_guide_001" -p "jnt_lf_clavicle_guide_002";
	rename -uid "BECB9B63-45AE-F14A-1D54-AFA0FC9A326B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.0025830309577937e-06 -1.9811140916929456e-15 4.4764756626381581e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -55.798153797689935 54.460005299938075 -64.69423161776156 ;
	setAttr ".pa" -type "double3" -1.8418712438916771e-14 -37.577104848464863 5.4140067272101386e-14 ;
	setAttr ".bps" -type "matrix" 0.71724149928596737 -0.66385859731888774 -0.21179328239539691 0
		 0.63668084864372698 0.74785811673458447 -0.1880046121894467 0 0.28319980344682505 -1.6853106146741403e-08 0.9590609320203175 0
		 12.532455655779996 141.26101912717718 -6.1371764916727951 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "scapula001";
	setAttr ".radi" 2.36;
createNode joint -n "jnt_lf_scapula_guide_002" -p "jnt_lf_scapula_guide_001";
	rename -uid "7DD8F5D0-448B-81D4-B231-1EBDCAD86050";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 11.81379408536103 -1.2261273660905416e-15 -3.0794753476663506e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 91.710164687415187 0 0 ;
	setAttr ".bps" -type "matrix" -0.77419630564219999 -0.219895055129468 -0.59352021453323545 0
		 -0.17451341093847944 0.9755235336626219 -0.13378678811081934 0 0.6084119901288817 7.0251917060003726e-16 -0.79362135194777461 0
		 2.1687257840853853 138.59831613823306 -13.412444985328223 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "scapula002";
	setAttr ".radi" 1.4200000000000002;
	setAttr ".liw" yes;
createNode joint -n "jnt_lf_upperArm_guide_001" -p "jnt_lf_scapula_guide_001";
	rename -uid "4C45559D-4210-C01C-B1E1-FF81AF22414D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -1.3031669319233194 -3.3956344628323389 -5.3605516634675805 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 11.80115272524848 129.29590335398552 45.683381615257531 ;
	setAttr ".bps" -type "matrix" 0.54983281735906786 -0.83442054590103742 -0.03776540127159822 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 0.020779472281474809 -0.031534727918730382 0.99928663278700758 0
		 15.690888045747149 136.07662538343271 -8.3978190574883431 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "upperArm001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_lf_elbow_guide_001" -p "jnt_lf_upperArm_guide_001";
	rename -uid "E0A548DE-4D71-7867-55D9-A1A923C95A9B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 21.82164973476424 -5.3290705182007514e-15 1.9761969838327786e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.71525502448783551 -8.2577246287622827 14.469268460421775 ;
	setAttr ".bps" -type "matrix" 0.54820073896376753 -0.83194372293254826 0.085706427254382517 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 -0.047157855261725834 0.071566251542364262 0.99632043456274133 0
		 28.281616792473059 116.96906682663963 -9.2626163347876815 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "elbow001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_lf_wrist_guide_001" -p "jnt_lf_elbow_guide_001";
	rename -uid "3B623D6E-40D8-BEAC-96B1-12AECB30584E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 21.180998921756053 -4.0318921480301817e-15 -1.3079795249356949e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -20.847827208219659 -19.499671314697636 43.84822109053632 ;
	setAttr ".bps" -type "matrix" 0.54820073896376753 -0.83194372293254826 0.085706427254382517 0
		 0.835016219295585 0.55022532976345884 9.6915638014838379e-09 0 -0.047157855261725834 0.071566251542364262 0.99632043456274133 0
		 39.892954040853361 99.347822541375365 -7.4472845402966241 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "wrist001";
	setAttr ".radi" 0.63999999999999968;
createNode joint -n "jnt_lf_thumb_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "67D10F2C-4436-1DB8-68FA-56BDB2D08C53";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.8704133667026941 -7.8906803521866473e-15 -8.531583994132293e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.0424114112661078 4.6328556402675503 -3.9587257689330801 ;
	setAttr ".pa" -type "double3" -1.6670453361112244e-14 1.8248375381076981e-14 -33.343907426187243 ;
	setAttr ".bps" -type "matrix" 0.14761029265934891 -0.7398892421337524 0.6563346028328565 0
		 0.16234666875755158 0.67272870414063801 0.72185846934740905 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 40.263689656157915 95.223834381573383 -3.2859108785801254 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_thumb_guide_002" -p "jnt_lf_thumb_guide_001";
	rename -uid "A18E6390-43BE-4524-470E-E284DE4E36C1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.0813853793719241 -1.2693208469074102e-14 6.2744398008356264e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.5621699853779436 -2.3972336450104015 -7.9162968398284104 ;
	setAttr ".pa" -type "double3" 0 0 -33.343907426187258 ;
	setAttr ".bps" -type "matrix" 0.12272658114714788 -0.82895043876213426 0.54569163119476027 0
		 0.18188849781001915 0.55932206292624076 0.80874928394920365 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 40.866144164281692 92.204061186335252 -0.60715640015697048 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_thumb_guide_003" -p "jnt_lf_thumb_guide_002";
	rename -uid "A4FE0CFF-45E0-4B2B-9E4E-D19C908C3E63";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.7644131533578351 1.9148188084788219e-14 1.0605515338952902e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.2404804149189488 -3.2099008936777773 -11.929608085780416 ;
	setAttr ".bps" -type "matrix" 0.080991369003737435 -0.92938361031742311 0.36012012304264956 0
		 0.20392556853556457 0.36911530024282724 0.90673494342288063 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 41.328137740294729 89.083549151462449 1.4470523974550469 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbTip001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_thumb_guide_004" -p "jnt_lf_thumb_guide_003";
	rename -uid "17F27551-4C6E-5890-4887-15B1849A167B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.9801289421418176 8.7731603250774834e-16 6.3461833172602738e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -13.603434095208137 0 0 ;
	setAttr ".bps" -type "matrix" 0.080991369003737435 -0.92938361031742311 0.36012012304264956 0
		 0.20392556853556457 0.36911530024282724 0.90673494342288063 0 -0.9756304426596919 -3.5587757601929226e-09 0.21942023460850796 0
		 41.569502479119677 86.313866005228292 2.5202568416499509 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "thumbEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_index_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "2EECE8D1-4A1E-661C-0A45-C7AE1FF19642";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.547260234794817 -0.91329693322067773 -1.9501419586646773 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.9025758069429637 27.132233571011863 -32.370204872005374 ;
	setAttr ".pa" -type "double3" 2.8627321640994996e-14 1.3330996770352938e-14 2.5879278912064479e-14 ;
	setAttr ".bps" -type "matrix" 0.53192540292164925 -0.82361451451803314 0.19675999898827443 0
		 0.77246137832848338 0.56715000791256709 0.28573464528410736 0 -0.34692763613972843 -1.630302981503462e-08 0.9378918995718537 0
		 42.180404258674578 95.683152224695434 -4.8680396416876297 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_index_guide_002" -p "jnt_lf_index_guide_001";
	rename -uid "0EA2F899-491B-C934-26DD-3AAB4E4A5B05";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 6.3330235352054043 -8.8967728284057633e-15 1.4330527289757872e-14 ;
	setAttr ".jo" -type "double3" -1.6053745316427284 -12.920189256263935 -4.2030670251209354 ;
	setAttr ".pa" -type "double3" 3.0811623476677861e-15 2.1757603069972596e-14 1.9083328088781104e-14 ;
	setAttr ".bps" -type "matrix" 0.33686306402437582 -0.93371741814131692 0.12122317911861004 0
		 0.93902726608675879 0.34258833004306921 0.029343306969870531 0 -0.068928003320391729 0.10394719417961561 0.99219146901213073 0
		 45.549100469979678 90.467181941506482 -3.621953930545927 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_index_guide_003" -p "jnt_lf_index_guide_002";
	rename -uid "92D5D8EE-47B3-C49E-A2F4-179A2ABC7E0E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.6030102918318976 4.7221146259220657e-16 6.740917214200564e-15 ;
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
	rename -uid "A04C04CC-4C9E-C0E9-97BE-EFA9F1A1BE94";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.9915790935963966 1.0132893875427726e-14 -8.4346945058790448e-15 ;
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
	rename -uid "D692C301-4E10-B5CF-DA6C-62A780AA79E7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.7578831976663589 2.5970599165152046e-11 -1.4203082141247738e-11 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -71.427292915852988 0 0 ;
	setAttr ".bps" -type "matrix" 0.10685901616233956 -0.98806568589732713 0.11093850105829749 0
		 0.99188209028244889 0.11367137359260857 0.056997699975427016 0 -0.068928003320391729 0.10394719417961562 0.99219146901213084 0
		 47.702856830902377 80.922552086066005 -2.4723859259270502 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "indexEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_middle_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "F5BE29F9-4D18-7BB6-0FFE-5E9A1F8AF8F2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.4135186249496385 -2.1619426134333701 -2.5912362915240976 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.50158914250942488 24.429809557984008 -43.930590607921616 ;
	setAttr ".pa" -type "double3" 9.1937908761054794e-16 4.0253895187272619e-15 1.2324649390671124e-14 ;
	setAttr ".bps" -type "matrix" 0.49341868461377569 -0.86957848008674743 0.019268332673944649 0
		 0.86891620194824082 0.49379476199127753 0.033931799566499707 0 -0.039020964440343892 -1.7463761298186498e-08 0.9992383921438095 0
		 42.826575347151334 95.655435821203795 -6.5524335414225989 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_middle_guide_002" -p "jnt_lf_middle_guide_001";
	rename -uid "212E0256-42EA-B00E-13AB-7F9968D4A2E1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.9056921935997835 -8.6973334856860879e-15 5.8759674140891153e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.2559135825405658e-17 -8.411355917354074 -1.1040636682555725 ;
	setAttr ".pa" -type "double3" 3.8825130388958993e-16 2.0888890777519638e-15 2.7430876716646233e-14 ;
	setAttr ".bps" -type "matrix" 0.36097701873268212 -0.93257471118772306 -1.6279197771057463e-08 0
		 0.93257471118772262 0.36097701873268229 6.3900213592704702e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 45.740554366963906 90.519972722568511 -6.438640726695974 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_middle_guide_003" -p "jnt_lf_middle_guide_002";
	rename -uid "60261E47-4868-EBBE-6DBB-A980B876408C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.182952793058428 4.2901316682392482e-16 -7.5317067415844516e-15 ;
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
	rename -uid "2CE866E4-4C79-7E5F-B978-0A8D27D302D0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.5014280120760728 -1.7372932371285933e-15 9.5405565915339388e-15 ;
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
	rename -uid "7E3CD720-49AD-4B97-DF0A-6DAAF903588E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.9261303558643292 -1.2434320439014787e-14 -2.6310453558128207e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.999961328265343 0 0 ;
	setAttr ".bps" -type "matrix" 0.10541872041306843 -0.99442792267035207 -1.7382049274529783e-08 0
		 0.99442792267035152 0.10541872041306843 1.9258805931193547e-09 0 -8.2755753638696916e-11 -1.7488218932028909e-08 1 0
		 48.289066375332759 79.294737624233477 -6.4386409827295008 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "middleEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_ring_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "E2295874-432D-1FE7-42A0-B3A4AEDC35AD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.2801928996909115 -3.1015388671083461 -2.3747815053097208 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -4.1823356136076031 22.479048206546711 -55.970589066308662 ;
	setAttr ".pa" -type "double3" -1.4908850069360234e-14 9.7404487119820235e-15 1.6300342742500524e-14 ;
	setAttr ".bps" -type "matrix" 0.46207019331395649 -0.86969079495619883 -0.17357723819458054 0
		 0.81414243449961543 0.49359692175747538 -0.30583357431548197 0 0.35165783483073615 -1.6471602332090995e-08 0.93612860612319659 0
		 42.599052599699732 95.768842246514154 -8.0185486266059982 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_ring_guide_002" -p "jnt_lf_ring_guide_001";
	rename -uid "BAC6BB60-480B-1814-0E00-C3BF7416E71C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.8644210548804194 -1.4708313120378624e-14 8.0048440971730848e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.3949100825190972 -13.93159272370206 0.14125038787225763 ;
	setAttr ".pa" -type "double3" 0 2.1024584608229046e-14 -4.386851482648477e-15 ;
	setAttr ".bps" -type "matrix" 0.23605433578495491 -0.95743636270990917 -0.16611430377286479 0
		 0.9459191306728808 0.26554477093100343 -0.18634101228194894 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 45.308826939532331 90.668608917388823 -9.0364787337378907 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_ring_guide_003" -p "jnt_lf_ring_guide_002";
	rename -uid "6BE36936-4A2C-DC07-B18F-28AB900E7E4D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.564804549506813 -3.6125307601582979e-16 -4.6593237212513285e-15 ;
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
	rename -uid "96D25289-4F27-85B3-B94B-EB8A1C54FF36";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.7139968321794887 -6.7510128815955535e-15 -2.0166407480010192e-15 ;
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
	rename -uid "0A72EEE1-44C5-14BE-623D-4EA87E1C4269";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.8253327832633484 1.0423097129461563e-13 -4.8768898172869003e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -123.97049373655595 0 0 ;
	setAttr ".bps" -type "matrix" -0.0082033445699856711 -0.99342506194934987 -0.11418997954635525 0
		 0.97489351026339321 0.017465975464030864 -0.22198554760931627 0 0.22252044576664026 -0.1131440939334475 0.96834036641244869 0
		 46.340927901884804 80.795189241928057 -10.427294179779274 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ringEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_pinky_guide_001" -p "jnt_lf_wrist_guide_001";
	rename -uid "9CB42BA8-44B4-1E71-2F96-958587800223";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.3360422572314314 -4.0700827831909479 -1.6638517713144891 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -6.6628441749667893 18.250987804309499 -65.598663810785155 ;
	setAttr ".pa" -type "double3" -1.4113711398994355e-14 3.9756933518293991e-15 2.5444437451708134e-14 ;
	setAttr ".bps" -type "matrix" 0.39159246846473761 -0.85819538706956655 -0.33189759904857802 0
		 0.6546808676339434 0.51332317073410705 -0.55488042310172525 0 0.64656654738376296 -1.3525583035522981e-08 0.76285758815406712 0
		 41.892825242764452 95.684641228577135 -9.3709805441886349 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyMetacarpal001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_pinky_guide_002" -p "jnt_lf_pinky_guide_001";
	rename -uid "CB0DB955-42F5-C767-A51B-9ABFDDD6BD3C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.3187799595668164 -9.9470958159553841e-15 7.9109433117746689e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.4128597202309621 -13.061964100044738 8.8227825570228759 ;
	setAttr ".pa" -type "double3" 2.2263882770244611e-14 -4.770832022195272e-15 -1.5604596405930376e-14 ;
	setAttr ".bps" -type "matrix" 0.19192124383852854 -0.96503286870437699 -0.17854354786346407 0
		 0.96282992731049721 0.22037829912298079 -0.15617918027356881 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 43.975619569596283 91.120088462734813 -11.136271004758916 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyBase001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_lf_pinky_guide_003" -p "jnt_lf_pinky_guide_002";
	rename -uid "B11269BA-4E2A-9806-BF5F-6BBC7624B73C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.6531556962369782 -7.9502204636137623e-15 -4.2246018223030965e-15 ;
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
	rename -uid "E1950E3B-431B-22DB-2DFE-F694CB6B6BA4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.2220449461758967 4.0073622357621541e-15 2.9256053220227134e-15 ;
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
	rename -uid "5053740B-43A3-2B65-6187-B0B27A3D663C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.9444966201798326 -1.1567867823047564e-14 7.1231084749010817e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -131.91642040387364 0 0 ;
	setAttr ".bps" -type "matrix" -0.061789666546447547 -0.98926250914972291 -0.132445177710906 0
		 0.9798251220852342 -0.034852839122969104 -0.19679433359658383 0 0.19006516576883292 -0.14193296867135227 0.97145780410957816 0
		 44.824730225846523 83.49652953199157 -12.41622443326145 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "pinkyEnd001";
	setAttr ".radi" 0.5;
createNode joint -n "jnt_md_neck_guide_001" -p "jnt_md_spine_guide_006";
	rename -uid "CB83F2D0-467A-7FAD-D3CA-72A515E6C2CA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 17.414397032223746 3.6719561302165182 0.0015411094982838223 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.0029858735078902823 0.0079886089745496124 34.651424797028682 ;
	setAttr ".bps" -type "matrix" 0.002403734363234536 0.95087171677376403 0.30957556266285347 0
		 0.006759053579396308 0.30955385072775532 -0.95085785561502523 0 -0.99997426829681824 0.004378046858594619 -0.005682908035490348 0
		 0.0015410989396165363 147.27624511718503 -7.5608520508071067 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "neck001";
	setAttr ".radi" 1.1799999999999997;
createNode joint -n "jnt_md_head_guide_001" -p "jnt_md_neck_guide_001";
	rename -uid "5D8CA3FE-443B-EA14-5193-B9886DA3E2BA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 11.028817671533913 3.672253267676074e-15 -9.3003762080268654e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.00034310410222557512 -0.0086478363407610035 -18.222027511709619 ;
	setAttr ".bps" -type "matrix" 0.9999999999999678 -8.0032429164938725e-09 -4.2524292581148926e-09 0
		 7.8826654464066234e-09 0.99999988777747473 2.8000953960297401e-08 0 4.282515178523523e-09 2.8001441453627554e-08 0.9999999930132828 0
		 -3.4142020127789964e-05 157.59659086693244 -3.7071972028650269 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "headLocal001";
	setAttr ".radi" 3.35;
createNode joint -n "jnt_md_head_guide_002" -p "jnt_md_head_guide_001";
	rename -uid "9DA529C7-4F1B-76E6-B668-00826FFC5A88";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 15.523703194114292 5.1143387934435274e-15 -7.7469469385181518e-18 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1.708474944404428e-16 1.0000000000000002 -1.3877787807814457e-16 0
		 1.8011355269333396e-16 -4.0245584642661925e-16 -1.0000000000000002 0 -1 2.2204460492503131e-16 -2.2204460492503131e-16 0
		 4.1510363020447602e-15 184.62057677907538 1.5088123436061767 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "headLocal002";
	setAttr ".radi" 3.35;
createNode joint -n "jnt_lf_upperLeg_guide_001" -p "jnt_md_root_guide_001";
	rename -uid "C21D6286-4469-3C0C-7768-6F9F2EE365AD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "angle" -ln "angle" -min 0 -max 180 -at "double";
	addAttr -ci true -k true -sn "direction" -ln "direction" -min 0 -max 360 -at "double";
	setAttr ".t" -type "double3" 0.090266759847352773 0.0041162105518992576 7.8047351837158923 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999738402155 1.4924102323894761e-05 160.0316350255963 ;
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
	rename -uid "DA7D87D5-4A38-DC0D-6E6E-39A8605C13B4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "MeshPosInfo" -ln "MeshPosInfo" -dt "string";
	setAttr ".t" -type "double3" 39.714936366420915 -1.33477803019614e-12 2.4291625568689801e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -6.3086178033109326e-06 2.8213914580510326e-05 -25.207971216719997 ;
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
	rename -uid "A38C350A-45F9-D05C-F295-FFB7730008D5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "MeshPosInfo" -ln "MeshPosInfo" -dt "string";
	setAttr ".t" -type "double3" 41.700298809278706 -1.2434498922553533e-14 -3.9387864060447261e-16 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.00030801876392181298 -0.00038521195320753612 77.29225819000375 ;
	setAttr ".bps" -type "matrix" -1.046394356673993e-16 -0.46908557853089733 0.88315271613370094 0
		 -2.9607127799878646e-16 0.88315271613370094 0.46908557853089738 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158407 10.26197679760029 -8.8421918232842138 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ankle001";
	setAttr ".radi" 2;
	setAttr -l on -k on ".MeshPosInfo" -type "string" "[u'mesh_m_high_body_001.vtx[7370]', u'mesh_m_high_body_001.vtx[7374]']";
createNode joint -n "jnt_lf_ball_guide_001" -p "jnt_lf_ankle_guide_001";
	rename -uid "22849CEC-41A0-D60A-A827-809600B584C3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.061090568001859 1.3550700577399327e-14 -1.5183997765415358e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.0045708473208195e-06 -5.4554519248883257e-05 6.3047201936105255 ;
	setAttr ".bps" -type "matrix" -1.3652595559142256e-16 -0.36924442657630246 0.92933231593566024 0
		 -2.8278662734025352e-16 0.92933231593566024 0.36924442657630252 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158372 5.5424643078574043 0.043287639113749776 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ball001";
	setAttr ".radi" 2;
createNode joint -n "jnt_lf_toe_guide_001" -p "jnt_lf_ball_guide_001";
	rename -uid "1ADFA087-4A8E-DEE3-67E1-CB9E4C6438F6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" 10.061090568001809 1.083597288749303e-15 -4.7182335827297515e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.00049706870576052124 0 0 ;
	setAttr ".bps" -type "matrix" -1.3652595559142256e-16 -0.36924442657630246 0.92933231593566024 0
		 -2.8278662734025352e-16 0.92933231593566024 0.36924442657630252 0 -1 -2.2204460492503131e-16 -2.2204460492503131e-16 0
		 7.8047351837158336 1.827462690343332 9.3933842375133008 1;
	setAttr ".sd" 1;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "toe001";
	setAttr ".radi" 2;
createNode transform -n "grp_md_auto_pole_001";
	rename -uid "480D31FD-439E-8A1B-C0FD-70A79A0512D5";
createNode joint -n "jnt_lf_arm_pole_guide_001" -p "grp_md_auto_pole_001";
	rename -uid "F5CAB261-4F8C-76A7-E19E-BC8631CCACC5";
createNode joint -n "jnt_lf_leg_pole_guide_001" -p "grp_md_auto_pole_001";
	rename -uid "80582F3E-4FB3-8089-40E5-DB9C5776D3C8";
createNode transform -n "crv_auto_pole_arm" -p "grp_md_auto_pole_001";
	rename -uid "2F702067-43CC-5FE5-D100-5EAF307F22C3";
createNode nurbsCurve -n "curveShape1" -p "crv_auto_pole_arm";
	rename -uid "BB58D2B4-4466-F115-64AA-25A32CDEE0D7";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		29.999999916347981 119.99999993258348 -12.00000000475081
		39.269065856933594 128.28007507324219 -33.691581726074219
		;
createNode transform -n "crv_auto_pole_leg" -p "grp_md_auto_pole_001";
	rename -uid "9DD1CAC7-4C2D-2442-841A-9E8A6FDE9C71";
createNode nurbsCurve -n "curveShape2" -p "crv_auto_pole_leg";
	rename -uid "0CD456B6-4653-3F47-0A63-6DAA63BFFEE1";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		7.8047248389787667 50.490343053185349 2.1373977479766433
		7.8046956062316895 49.193153381347656 27.103723526000977
		;
createNode transform -s -n "persp";
	rename -uid "EE6FE1AA-4E48-5332-537A-AA81A499E841";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 19.346944829249622 54.611424657773725 188.37431484624378 ;
	setAttr ".r" -type "double3" -5.1383527296073179 1.4000000000013357 4.9711006141188288e-17 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "CB85E7F1-42CD-021C-26C3-7DB4F73FD885";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 184.66132718824994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 39.054907503444575 106.41668222610835 -10.45361718021158 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "D468CF4E-410B-3867-65E7-9094E6991015";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "2565AA78-4460-8CD1-BE59-D3B3DAE21D61";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "06C1FA81-4BE1-8E9F-00B9-3E9554C3538C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "44B1CB8C-4C0C-6A7B-E6AC-01A38B776533";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "069BF1B6-4234-5057-73C1-A0AEDE392B09";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "91F502AF-4666-769E-2F3B-9F85D6718129";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode plusMinusAverage -n "autoPole_position";
	rename -uid "27421AD9-43E2-33F7-ED00-13AF8CE511C5";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world";
	rename -uid "5FE063BB-4B17-C5F7-6FD8-7BB1D33099EB";
createNode multiplyDivide -n "autoPole_scaled";
	rename -uid "6265A2B4-4CEC-0B97-0750-238C6AA557B1";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction";
	rename -uid "D735A01B-44DD-0838-EA1D-1C80611668E4";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset";
	rename -uid "0A88C6ED-47A3-52EC-E0F7-55A7D8A567E9";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid";
	rename -uid "31C93B8B-4552-E7C9-BEAF-3DB3299333C6";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world";
	rename -uid "734E16C9-4671-B31F-5DC1-239ABD4AEA42";
createNode multiplyDivide -n "autoPole_projection";
	rename -uid "BC022C7E-4D4E-0684-FB9B-E4A0A49CE685";
createNode plusMinusAverage -n "autoPole_axis";
	rename -uid "88B8A42F-4F50-F192-B4A4-F29DA3A6C8AC";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world";
	rename -uid "8498E859-46CE-BF62-33CF-44A5F0DCE21D";
createNode multiplyDivide -n "autoPole_ratio";
	rename -uid "4F774C96-475E-CEBC-6FB1-30AB049980C4";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid";
	rename -uid "0A8ACBCA-4536-E4AA-F2C5-0E8EBF755A1C";
createNode vectorProduct -n "autoPole_dotAxis";
	rename -uid "DE5E3228-412B-4907-A9D2-528FC6818213";
createNode distanceBetween -n "autoPole_length";
	rename -uid "002B304E-418E-B66C-703A-858C11DAACD4";
createNode plusMinusAverage -n "autoPole_position1";
	rename -uid "77B20127-427F-BDED-04B9-70BE61A941CF";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world1";
	rename -uid "CC1B557E-449F-AB9D-DE66-B092BE68A2AB";
createNode multiplyDivide -n "autoPole_scaled1";
	rename -uid "498B9B48-4597-E888-55C9-A7B56CBF57C0";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction1";
	rename -uid "E2BFA1CB-4C99-5297-9A30-729A57CADEA2";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset1";
	rename -uid "CD84D15B-43B1-7DE5-CBD7-63B9A9810E1A";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid1";
	rename -uid "5BF85275-4642-CA3F-FD70-07BED8849292";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world1";
	rename -uid "41AD060D-4144-7D00-D884-3F9A64694CDE";
createNode multiplyDivide -n "autoPole_projection1";
	rename -uid "EEABBCAC-4919-20FE-24A6-6384E814F4B2";
createNode plusMinusAverage -n "autoPole_axis1";
	rename -uid "A8DCF730-4828-1A71-358A-CB945411B2A2";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world1";
	rename -uid "892FB61E-484F-2CDE-21B7-909B737F0DD5";
createNode multiplyDivide -n "autoPole_ratio1";
	rename -uid "8822998D-4792-63A1-5110-00B07C4ED6EB";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid1";
	rename -uid "D4E54E45-44F2-2F89-94B1-41A284E51531";
createNode vectorProduct -n "autoPole_dotAxis1";
	rename -uid "C0DBA9F4-4CB5-1D30-DDC7-CCA6812A7D0D";
createNode distanceBetween -n "autoPole_length1";
	rename -uid "32F15E15-483F-A43B-427E-AD8895AAF574";
createNode decomposeMatrix -n "autoPole_display_arm_cv0";
	rename -uid "52752CB2-4D68-4EF3-A453-A0BB5D711453";
createNode decomposeMatrix -n "autoPole_display_arm_cv1";
	rename -uid "4A98C145-42F6-212F-6AA3-32B6A5377CE1";
createNode decomposeMatrix -n "autoPole_display_leg_cv0";
	rename -uid "4AC9DC48-4CD7-FDF2-AF50-33AC035339B8";
createNode decomposeMatrix -n "autoPole_display_leg_cv1";
	rename -uid "29122215-4DE3-FC87-468A-58A7B217F19B";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "B9F2E942-4514-59D0-7D44-31BFD37B9AC8";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "154CF8C3-41E2-ED50-0DFB-AEBB6C2B13E2";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "69FB787F-420A-025D-5D57-1BA17A0B1F90";
createNode displayLayerManager -n "layerManager";
	rename -uid "A0CCF839-41AC-6C70-7504-A690AE10710D";
createNode displayLayer -n "defaultLayer";
	rename -uid "D8B54B34-4270-0124-7DB2-FCAA182A9EAC";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "0E27F99D-4F49-E02C-03D6-D8971FA6FD4D";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "C8FC0E0D-49D5-E72A-B876-C096C220B0C1";
	setAttr ".g" yes;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "5B2EC003-40A1-3C74-EBF1-30AB208C1C6B";
	setAttr ".version" -type "string" "5.2.1.1";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "9009FA19-41D3-6AD5-3B1A-EAAE7CC1D76E";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "E9576779-439F-CE2D-1D49-8A848A46007F";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "E834E4BC-4057-5304-6B73-7191FEEDFAB0";
	setAttr ".output_mode" 0;
	setAttr ".ai_translator" -type "string" "maya";
createNode script -n "uiConfigurationScriptNode";
	rename -uid "C09332E3-478E-2167-D340-2DAABA907D80";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n"
		+ "            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n"
		+ "            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n"
		+ "            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n"
		+ "            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n"
		+ "            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n"
		+ "            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n"
		+ "            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 941\n            -height 689\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n"
		+ "            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -showUfeItems 1\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n"
		+ "            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n"
		+ "            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -showUfeItems 1\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n"
		+ "            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n"
		+ "                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -showUfeItems 1\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n"
		+ "                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n"
		+ "                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -showUfeItems 1\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n"
		+ "                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n"
		+ "                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -connectionMinSegment 0.03\n"
		+ "                -connectionOffset 0.03\n                -connectionRoundness 0.8\n                -connectionTension -100\n                -defaultPinnedState 0\n                -additiveGraphingMode 1\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -connectionMinSegment 0.03\n                -connectionOffset 0.03\n                -connectionRoundness 0.8\n                -connectionTension -100\n                -defaultPinnedState 0\n                -additiveGraphingMode 1\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n"
		+ "                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"|persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n"
		+ "                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n"
		+ "                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -bluePencil 1\n                -greasePencils 0\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n"
		+ "                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 941\\n    -height 689\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 941\\n    -height 689\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 100 -size 300 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "7EDDC0B3-4FEE-5C57-9798-21A7C01398BB";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 10 -ast 0 -aet 30 ";
	setAttr ".st" 6;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "690EB4F5-4B56-2487-6FF9-1AB72FBBA684";
	setAttr ".tgi[0].tn" -type "string" "Œﬁ±ÍÃ‚_1";
	setAttr ".tgi[0].vl" -type "double2" -777.38092149061004 -320.2380825129772 ;
	setAttr ".tgi[0].vh" -type "double2" 778.57139763378109 320.2380825129772 ;
	setAttr -s 8 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -657.14288330078125;
	setAttr ".tgi[0].ni[0].y" -80;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 61.428569793701172;
	setAttr ".tgi[0].ni[1].y" -98.571426391601562;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" -657.14288330078125;
	setAttr ".tgi[0].ni[2].y" -184.28572082519531;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 37.142856597900391;
	setAttr ".tgi[0].ni[3].y" 34.285713195800781;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" -245.71427917480469;
	setAttr ".tgi[0].ni[4].y" 167.14285278320312;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" -320;
	setAttr ".tgi[0].ni[5].y" -80;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" -657.14288330078125;
	setAttr ".tgi[0].ni[6].y" 24.285715103149414;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" 61.428569793701172;
	setAttr ".tgi[0].ni[7].y" 167.14285278320312;
	setAttr ".tgi[0].ni[7].nvs" 18304;
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
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".dss" -type "string" "lambert1";
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
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "jnt_md_root_guide_001.s" "jnt_md_spine_guide_001.is";
connectAttr "jnt_md_spine_guide_004.s" "jnt_md_spine_guide_005.is";
connectAttr "jnt_md_spine_guide_005.s" "jnt_md_spine_guide_006.is";
connectAttr "jnt_md_spine_guide_006.s" "jnt_lf_clavicle_guide_001.is";
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
connectAttr "jnt_md_spine_guide_006.s" "jnt_md_neck_guide_001.is";
connectAttr "jnt_md_neck_guide_001.s" "jnt_md_head_guide_001.is";
connectAttr "jnt_md_head_guide_001.s" "jnt_md_head_guide_002.is";
connectAttr "jnt_md_root_guide_001.s" "jnt_lf_upperLeg_guide_001.is";
connectAttr "jnt_lf_upperLeg_guide_001.s" "jnt_lf_knee_guide_001.is";
connectAttr "jnt_lf_knee_guide_001.s" "jnt_lf_ankle_guide_001.is";
connectAttr "jnt_lf_ball_guide_001.s" "jnt_lf_toe_guide_001.is";
connectAttr "autoPole_position.o3" "jnt_lf_arm_pole_guide_001.t";
connectAttr "autoPole_position1.o3" "jnt_lf_leg_pole_guide_001.t";
connectAttr "autoPole_display_arm_cv0.ot" "curveShape1.cp[0]";
connectAttr "autoPole_display_arm_cv1.ot" "curveShape1.cp[1]";
connectAttr "autoPole_display_leg_cv0.ot" "curveShape2.cp[0]";
connectAttr "autoPole_display_leg_cv1.ot" "curveShape2.cp[1]";
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
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":defaultArnoldDisplayDriver.msg" ":defaultArnoldRenderOptions.drivers"
		 -na;
connectAttr ":defaultArnoldFilter.msg" ":defaultArnoldRenderOptions.filt";
connectAttr ":defaultArnoldDriver.msg" ":defaultArnoldRenderOptions.drvr";
connectAttr ":defaultArnoldFilter.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "shapeEditorManager.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr ":defaultArnoldDriver.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "poseInterpolatorManager.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "layerManager.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr ":defaultArnoldRenderOptions.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr ":defaultArnoldDisplayDriver.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "defaultLayer.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=notes_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_base_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_det:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopes:string=value";
dataStructure -fmt "raw" -as "name=mapManager_new_sand:string=value";
dataStructure -fmt "raw" -as "name=notes_leftSpecific_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_fountainRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesCarousel_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_tilesFloorDet:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=OffStruct:float=Offset";
dataStructure -fmt "raw" -as "name=notes_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiaryGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_frogL_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=notes_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchF_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_small:string=value";
dataStructure -fmt "raw" -as "name=RenderSettings:string=preset";
dataStructure -fmt "raw" -as "name=notes_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_right:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseForest:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_grassD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=TifLocation:string=Path";
dataStructure -fmt "raw" -as "name=notes_baseForest:string=value";
dataStructure -fmt "raw" -as "name=mapManager_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_vgtCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_geos:string=value";
dataStructure -fmt "raw" -as "name=notes_heroesChoice_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_right_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_squareRocks_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bushesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_curbsGardenGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_centerStreetGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_Suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloC:string=value";
dataStructure -fmt "raw" -as "name=notes_frogLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_trees:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_bushes_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=notes_fountainHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSide:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=notes_level1A:string=value";
dataStructure -fmt "raw" -as "name=notes_rockTerraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mainStreetMainstreetTrees04:string=value";
dataStructure -fmt "raw" -as "name=mapManager_path:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_testMode_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_square_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tilesFloorDet:string=value";
dataStructure -fmt "raw" -as "name=mapManager_square_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_treesRocksAnimalHome_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=notes_railwayGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_original:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_vgTFicus39:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_groundA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_base_left:string=value";
dataStructure -fmt "raw" -as "name=notes_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_groundC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=notes_small_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_hotelBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_bridge_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wasteLand_parShape:string=value";
dataStructure -fmt "raw" -as "name=OrgStruct:float[3]=Origin Point";
dataStructure -fmt "raw" -as "name=notes_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=IdStruct:int32=ID";
dataStructure -fmt "raw" -as "name=notes_treesRocksHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_rocks:string=value";
dataStructure -fmt "raw" -as "name=notes_terraceGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=notes_holeRock_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=notes_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloor_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_railes:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBase:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundRocks:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_background_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_center_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=notes_rockCheated_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloB:string=value";
dataStructure -fmt "raw" -as "name=notes_left_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_frogEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_widlPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoC_parShape:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=mapManager_pPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_decayFlowerBeds_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_barbacueHouseFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnelParkEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_circular:string=value";
dataStructure -fmt "raw" -as "name=mapManager_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloorGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slabsAndStairsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_juneNbhHouseE_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_Suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSide:string=value";
dataStructure -fmt "raw" -as "name=notes_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=notes_terraceBush_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_riverside_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassesCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesTrees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_grassLeftMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_groundRocks:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyFlowersBedA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_concretesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=Blur3dMetaData:string=Blur3dValue";
dataStructure -fmt "raw" -as "name=notes_terraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=notes_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=notes_floor1:string=value";
dataStructure -fmt "raw" -as "name=notes_square_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksCurbsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_degraded:string=value";
dataStructure -fmt "raw" -as "name=notes_base:string=value";
dataStructure -fmt "raw" -as "name=mapManager_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small:string=value";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=notes_mountainsCSC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=notes_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=notes_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrasStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocks:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grasses:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchH_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=notes_floorA:string=value";
dataStructure -fmt "raw" -as "name=notes_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_ferns_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloProvi3:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=notes_vgGroundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBeauty_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquare_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_circular:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=notes_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_degraded:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayArea_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_ridePiggy_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=notes_road_parShape:string=value";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=notes_path:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_chocolateFountain_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesFlowerBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayCircular_parShape:string=value";
dataStructure -fmt "raw" -as "name=keyValueStructure:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_entrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=notes_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=notes_levelC:string=value";
dataStructure -fmt "raw" -as "name=mapManager_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rightExterior_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_treesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tunnel:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left:string=value";
dataStructure -fmt "raw" -as "name=mapManager_original:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_midground_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_left:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainTrail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=notes_grassJuneBackYard_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_big_back:string=value";
dataStructure -fmt "raw" -as "name=notes_treesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_grasses:string=value";
dataStructure -fmt "raw" -as "name=notes_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloC:string=value";
dataStructure -fmt "raw" -as "name=notes_square_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vgFCarouselBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=notes_cheat_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchDegraded_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=notes_grassADecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_railes:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersRightLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantNextHouse_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_leavesDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=mapManager_levelC:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A:string=value";
dataStructure -fmt "raw" -as "name=notes_new_sand:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquareFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vegetation_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_geos:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor1:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=notes_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnel:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_big_back:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesCDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchG_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_grassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_floorGrassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_square_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchE_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassBase:string=value";
dataStructure -fmt "raw" -as "name=notes_carouselStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=notes_groundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaCorner_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloB:string=value";
dataStructure -fmt "raw" -as "name=notes_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small_grass:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes:string=value";
dataStructure -fmt "raw" -as "name=mapManager_det:string=value";
dataStructure -fmt "raw" -as "name=notes_grassC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountains_parShape:string=value";
// End of body_guide.ma
