//Maya ASCII 2023 scene
//Name: body_guide.ma
//Last modified: Fri, Oct 23, 2026 05:57:17 PM
//Codeset: 936
requires maya "2023";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2023";
fileInfo "version" "2023";
fileInfo "cutIdentifier" "202211021031-847a9f9623";
fileInfo "osv" "Windows 11 Pro v2009 (Build: 26200)";
fileInfo "UUID" "9B903B29-4050-9110-366C-49A82FD55EEA";
createNode transform -n "grp_md_mirror_001";
	rename -uid "3325C93D-4F57-BA36-146C-9C991E7D9FA0";
createNode transform -n "mirror_jnt_rt_ankle_guide_001" -p "grp_md_mirror_001";
	rename -uid "53DCF875-45BB-A0BF-C12B-838556BA0709";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ankle_guide_001Shape" -p "mirror_jnt_rt_ankle_guide_001";
	rename -uid "D8373BC3-497C-E948-4756-D687F1BD212B";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ball_guide_001" -p "grp_md_mirror_001";
	rename -uid "3DD1F9B0-4772-7EE9-7DA8-0287405E1E73";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ball_guide_001Shape" -p "mirror_jnt_rt_ball_guide_001";
	rename -uid "B4908B51-4C1D-DBFC-D157-CA8D6A984F75";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_clavicle_guide_001" -p "grp_md_mirror_001";
	rename -uid "8AB791C2-4223-4366-8694-D38BE9356639";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_clavicle_guide_001Shape" -p "mirror_jnt_rt_clavicle_guide_001";
	rename -uid "0E7E9A1B-4F72-5BAC-3FBD-5EBF99BC07DA";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_clavicle_guide_002" -p "grp_md_mirror_001";
	rename -uid "7FE9C496-4755-D6CD-F9BB-4887C8DD9CCF";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_clavicle_guide_002Shape" -p "mirror_jnt_rt_clavicle_guide_002";
	rename -uid "82ED7A11-4549-9BEA-CE4B-718CC15468B3";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_elbow_guide_001" -p "grp_md_mirror_001";
	rename -uid "4D4A5ACC-4944-4060-DE47-BBBED394997D";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_elbow_guide_001Shape" -p "mirror_jnt_rt_elbow_guide_001";
	rename -uid "CFEA59CB-472E-EF62-4786-1CB5A57BFEAE";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_001" -p "grp_md_mirror_001";
	rename -uid "7493AC7F-497D-C38D-5959-5DBC4A1DAE6E";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_001Shape" -p "mirror_jnt_rt_index_guide_001";
	rename -uid "42FF8D6E-4E6F-8D43-A483-65B706C3C155";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_002" -p "grp_md_mirror_001";
	rename -uid "DA821971-45C5-1A5C-BDE3-3AA5F6574730";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_002Shape" -p "mirror_jnt_rt_index_guide_002";
	rename -uid "BB5185F2-4CC8-3D6D-6420-C0A222308807";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_003" -p "grp_md_mirror_001";
	rename -uid "133E896D-4D36-AB54-D00A-75A8E90F4CB5";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_003Shape" -p "mirror_jnt_rt_index_guide_003";
	rename -uid "EE2F2F67-4D36-2F50-3954-A1B23782D3B4";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_004" -p "grp_md_mirror_001";
	rename -uid "38292FCF-4432-1DAE-8DEC-EB919E722FEA";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_004Shape" -p "mirror_jnt_rt_index_guide_004";
	rename -uid "3C774B09-4BCE-F655-8DF2-68943B9EB4BA";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_index_guide_005" -p "grp_md_mirror_001";
	rename -uid "A34A4FB0-45ED-37F9-C002-28AAAF803E27";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_index_guide_005Shape" -p "mirror_jnt_rt_index_guide_005";
	rename -uid "37295333-41FC-63D9-70B6-399FCDAC9EF5";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_knee_guide_001" -p "grp_md_mirror_001";
	rename -uid "8141D39B-4816-DFB2-8F53-31B59548C653";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_knee_guide_001Shape" -p "mirror_jnt_rt_knee_guide_001";
	rename -uid "42982664-4B45-9DB1-BD22-8395DF498BA9";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_001" -p "grp_md_mirror_001";
	rename -uid "078E996B-4C92-4945-3124-E19A33068839";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_001Shape" -p "mirror_jnt_rt_middle_guide_001";
	rename -uid "9B1E8F0C-4B0C-54CF-192B-8684534485BD";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_002" -p "grp_md_mirror_001";
	rename -uid "9697BFF7-43DB-A990-00CA-BF8DF62B4791";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_002Shape" -p "mirror_jnt_rt_middle_guide_002";
	rename -uid "2F794F0D-4C04-5CCB-2B70-09A2058A5127";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_003" -p "grp_md_mirror_001";
	rename -uid "ADF91ED4-4515-3F34-58A0-2A8405EE9FE5";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_003Shape" -p "mirror_jnt_rt_middle_guide_003";
	rename -uid "6F6EACC8-48E6-121A-2AA9-8983F2CF4991";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_004" -p "grp_md_mirror_001";
	rename -uid "7737BB17-444F-B0E7-CA45-868A1D0FD2B3";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_004Shape" -p "mirror_jnt_rt_middle_guide_004";
	rename -uid "BAA0D324-4A08-DBD2-7554-4B896FD2A506";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_middle_guide_005" -p "grp_md_mirror_001";
	rename -uid "5D857E28-46D5-2DCE-A6B0-1FA7EA6987DD";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_middle_guide_005Shape" -p "mirror_jnt_rt_middle_guide_005";
	rename -uid "6C2E6F25-4E3A-E264-F0C1-169C2A76AD54";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_001" -p "grp_md_mirror_001";
	rename -uid "E192D534-4EF6-D687-57FA-39BB7BCC098E";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_001Shape" -p "mirror_jnt_rt_pinky_guide_001";
	rename -uid "971800C8-49A3-B703-A7A3-569802DC64F4";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_002" -p "grp_md_mirror_001";
	rename -uid "F30E3D1B-4817-07F3-7090-2F818D955019";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_002Shape" -p "mirror_jnt_rt_pinky_guide_002";
	rename -uid "9D626F8C-4C19-8FD3-C5D8-56B1A26BAE04";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_003" -p "grp_md_mirror_001";
	rename -uid "58236779-4CC2-25FA-41B9-6ABB24AC8D87";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_003Shape" -p "mirror_jnt_rt_pinky_guide_003";
	rename -uid "76EA9DCB-45BC-6B2C-6D30-31AA3CB051B7";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_004" -p "grp_md_mirror_001";
	rename -uid "3E3D7E55-4DBE-EB63-6C10-72916752DF48";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_004Shape" -p "mirror_jnt_rt_pinky_guide_004";
	rename -uid "AFEEC0B0-4F0B-92FF-E650-B2920ED662B3";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_pinky_guide_005" -p "grp_md_mirror_001";
	rename -uid "EB6858A9-42A6-37C1-D358-B4ADDF849D07";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_pinky_guide_005Shape" -p "mirror_jnt_rt_pinky_guide_005";
	rename -uid "D122D62E-474E-B43E-E9B5-228FEE8BC125";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_001" -p "grp_md_mirror_001";
	rename -uid "C2E42245-46C9-945E-3905-3789399C9B71";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_001Shape" -p "mirror_jnt_rt_ring_guide_001";
	rename -uid "8CDC14D3-4F8E-31E6-E03F-D787619A99E3";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_002" -p "grp_md_mirror_001";
	rename -uid "CD3396DE-4D7E-3E02-0F24-2F86339665A6";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_002Shape" -p "mirror_jnt_rt_ring_guide_002";
	rename -uid "79F29FEC-40CC-9803-1B4A-339FF9EDEE37";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_003" -p "grp_md_mirror_001";
	rename -uid "9E3EF76F-4BF5-F4F2-9D86-E99E261F006D";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_003Shape" -p "mirror_jnt_rt_ring_guide_003";
	rename -uid "D6EA5E5A-4BB4-75BD-AF2C-B0A1B1142275";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_004" -p "grp_md_mirror_001";
	rename -uid "654D38A3-48BC-028A-CF23-0383F317ABC8";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_004Shape" -p "mirror_jnt_rt_ring_guide_004";
	rename -uid "96F34824-43A6-9CE9-8CB9-B28F37888D45";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_ring_guide_005" -p "grp_md_mirror_001";
	rename -uid "546ABB5C-4F6B-155A-1681-94897363667A";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_ring_guide_005Shape" -p "mirror_jnt_rt_ring_guide_005";
	rename -uid "95179D30-4B29-B2DB-74F1-1AB81F97711B";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_scapula_guide_001" -p "grp_md_mirror_001";
	rename -uid "B4433DC2-44FB-203B-89AC-8EA411B00AC1";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_scapula_guide_001Shape" -p "mirror_jnt_rt_scapula_guide_001";
	rename -uid "BB4ABE72-4D53-B0D8-659D-CA8A3854F601";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_scapula_guide_002" -p "grp_md_mirror_001";
	rename -uid "A53FA1FD-47CA-CF66-29B5-878C8982F464";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_scapula_guide_002Shape" -p "mirror_jnt_rt_scapula_guide_002";
	rename -uid "42B9F84A-4331-31B3-9CF9-7AB6A3FB868A";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_001" -p "grp_md_mirror_001";
	rename -uid "37E1CE09-4E23-6FC0-CD6E-768C95660AFB";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_001Shape" -p "mirror_jnt_rt_thumb_guide_001";
	rename -uid "ECE0319F-432D-60A8-65BD-CCA2C54A1B5D";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_002" -p "grp_md_mirror_001";
	rename -uid "ED6B9A1F-4CA2-9834-5C8F-FAA306DF6F7A";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_002Shape" -p "mirror_jnt_rt_thumb_guide_002";
	rename -uid "3540AFF1-4935-5B39-37E6-5F9440402649";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_003" -p "grp_md_mirror_001";
	rename -uid "822C023E-4B29-8A8D-56E2-579CEDB92676";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_003Shape" -p "mirror_jnt_rt_thumb_guide_003";
	rename -uid "D030BDBB-4F35-4ED3-918A-14AE5A0C3636";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_thumb_guide_004" -p "grp_md_mirror_001";
	rename -uid "ED31C472-4829-F5FE-77CA-F7B7A1885AB0";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_thumb_guide_004Shape" -p "mirror_jnt_rt_thumb_guide_004";
	rename -uid "E056386B-482C-AC38-0F75-0BA106BD430C";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_toe_guide_001" -p "grp_md_mirror_001";
	rename -uid "35EB7145-43E1-AF30-0EE2-7B8C45C1B50B";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_toe_guide_001Shape" -p "mirror_jnt_rt_toe_guide_001";
	rename -uid "F30418AF-4A02-5BA7-8462-E5BE2185C749";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_upperArm_guide_001" -p "grp_md_mirror_001";
	rename -uid "A4621C78-4B27-50DF-2BBD-A7B480E049D3";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_upperArm_guide_001Shape" -p "mirror_jnt_rt_upperArm_guide_001";
	rename -uid "47FD55E9-402D-CBE8-3D00-41BA0E7A0586";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_upperLeg_guide_001" -p "grp_md_mirror_001";
	rename -uid "5E897667-431D-C8EA-2BD8-D8AED31A7D3C";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_upperLeg_guide_001Shape" -p "mirror_jnt_rt_upperLeg_guide_001";
	rename -uid "9B594923-4F39-0A15-94C4-2BAA988C2F7C";
	setAttr -k off ".v";
createNode transform -n "mirror_jnt_rt_wrist_guide_001" -p "grp_md_mirror_001";
	rename -uid "C23950F5-476D-D3B7-1A5B-D19A18CC2F4C";
	setAttr ".v" no;
createNode locator -n "mirror_jnt_rt_wrist_guide_001Shape" -p "mirror_jnt_rt_wrist_guide_001";
	rename -uid "B977F214-4EBC-E8AB-8A1D-50995797EB58";
	setAttr -k off ".v";
createNode transform -n "grp_md_body_guide_001";
	rename -uid "38D78002-4EBF-AFC9-4D70-89A5045DBB57";
createNode transform -n "crv_md_body_guide_001" -p "grp_md_body_guide_001";
	rename -uid "75BF80C8-4B09-02BC-863D-4D87580BEEF1";
createNode nurbsCurve -n "crv_md_body_guide_Shape1" -p "crv_md_body_guide_001";
	rename -uid "3DC5A539-4A28-4F2A-14A6-788E08AD593E";
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
	rename -uid "C57E4828-40CF-6271-63D2-80927D24E655";
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
	rename -uid "E514E013-4D90-3084-B6EE-AFA398D228DF";
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
	rename -uid "0B59B8B4-44F5-20C6-7C02-E989311A67E5";
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
	rename -uid "3D2A09E4-434B-D237-0B12-15BA0A8C7D02";
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
	rename -uid "74FEFEDE-45ED-9EAB-FFF5-D98D6E6B9E4A";
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
	rename -uid "E95ACE3C-4318-A1B5-0433-E4A5388C68C6";
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
	rename -uid "48B496FC-47DF-45B5-BA8E-80BEF78153A9";
	setAttr ".t" -type "double3" -7.1393695916255666 6.8735664927761633 1.7521513744862092 ;
	setAttr ".jo" -type "double3" -89.854742515053474 -2.4469571666007086 136.10613573140833 ;
createNode joint -n "jnt_md_spine_guide_002" -p "jnt_md_spine_guide_001";
	rename -uid "8CCAFA7E-4602-0E53-0896-429A5446BDDD";
	setAttr ".t" -type "double3" 6.0082517207697412 0.2233358082493074 -9.4580220176431088e-09 ;
	setAttr ".jo" -type "double3" 179.9999991462264 0 5.076203622587796 ;
createNode joint -n "jnt_md_spine_guide_003" -p "jnt_md_spine_guide_002";
	rename -uid "87ACE17C-4E0C-619F-F3A7-D5954586B21D";
	setAttr ".t" -type "double3" 6.0150186659302749 0.078954237818588471 1.0634604735015252e-08 ;
	setAttr ".jo" -type "double3" 0 0 -8.9510359245449607 ;
createNode joint -n "jnt_md_spine_guide_004" -p "jnt_md_spine_guide_003";
	rename -uid "14A52088-438C-9D0C-5556-11A681C41C77";
	setAttr ".t" -type "double3" 6.0569278054306439 0.3919132956114823 1.1843432825955784e-09 ;
	setAttr ".jo" -type "double3" 0 0 -6.8711318900975797 ;
createNode joint -n "jnt_md_spine_guide_005" -p "jnt_md_spine_guide_004";
	rename -uid "47941FC0-40F7-DAEB-72EB-F995A478913F";
	setAttr ".t" -type "double3" 6.1345090276004557 0.61029855976362013 -6.7153603610254945e-09 ;
	setAttr ".jo" -type "double3" -71.548593583545653 -89.999999146249152 0 ;
createNode joint -n "jnt_md_spine_guide_006" -p "jnt_md_spine_guide_005";
	rename -uid "87D5A1A7-4FF1-316E-06CA-97B496A957A7";
	setAttr ".t" -type "double3" 8.3128092306061768e-08 6.0123084481959097 -1.5165891885916911 ;
	setAttr ".jo" -type "double3" -55.74732838900217 -23.160905347045894 75.006624217064015 ;
createNode joint -n "jnt_lf_clavicle_guide_001" -p "jnt_md_spine_guide_006";
	rename -uid "4C0C1B02-4177-8830-3D82-2C87614E1D0B";
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
	rename -uid "964C2675-451A-5198-E300-B181D58E102E";
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
	rename -uid "A0C1C6AA-4178-4977-FC57-A5AA739AA48C";
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
	rename -uid "CA2C2AAD-4CA5-1F9D-F617-B0AB63B810C6";
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
	rename -uid "6B8AEF66-405D-1E46-7696-D0BBDDF01B09";
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
	rename -uid "1D82D0B6-4F5A-7A17-1FBB-A587EB042243";
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
	rename -uid "70DF02E8-48DD-71D7-401D-3FBD318B1B5F";
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
	rename -uid "DE025824-4194-93D0-6439-D8B4E3F59D69";
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
	rename -uid "004F3158-4B03-1B3F-9A05-2B85CCF0A6AE";
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
	rename -uid "048647C1-44EC-4D2A-2750-8498C755BCC7";
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
	rename -uid "DC9D35E4-41C1-0530-7EE9-6E8C8E879B2D";
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
	rename -uid "6B81AD92-483D-260B-05CD-00BAA56225FF";
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
	rename -uid "80A3AE24-4285-A887-BC6B-009DE4B1B7F1";
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
	rename -uid "B11B8DBB-4A6A-C593-2B09-98B52DBE28A8";
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
	rename -uid "6F620541-41EA-F422-A899-30BA26162083";
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
	rename -uid "2236A774-4776-D729-D3EA-2298597629A5";
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
	rename -uid "0558CC20-43A6-105C-5728-0595C40CBDE2";
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
	rename -uid "C67861F5-42E7-3324-5A3D-1286B3450BBC";
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
	rename -uid "F8C493B7-4EC9-08D8-94B2-0EB208A5422B";
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
	rename -uid "411C830A-4E6B-14BD-51CB-E599C682C190";
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
	rename -uid "168B4528-441B-2E30-92A6-4BB4ECD05233";
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
	rename -uid "8D1ABBF2-46EF-3620-13E1-11B855D959C5";
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
	rename -uid "E415A490-49F2-8F03-3AE5-C0ACC8BCF42E";
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
	rename -uid "24AE90D8-4EE0-7146-A00E-559A8A896225";
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
	rename -uid "7D760707-4C9B-6FB4-7929-83893E55B641";
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
	rename -uid "3CC69AF8-4E3D-C4EE-9875-17B7306ADE17";
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
	rename -uid "BE56902E-4BC4-7480-A3CF-57A9D7A848E0";
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
	rename -uid "FD4E73C7-4BD1-C486-F42E-0E9BF646D5B0";
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
	rename -uid "1ADD6880-46B0-AA4F-B3C9-F9AA0D965FEE";
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
	rename -uid "6D683F21-497C-B4DF-E96E-F5AD645F0BA4";
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
	rename -uid "15560B62-4ED6-DCE3-5023-E69DA7C7DBAC";
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
	rename -uid "AF98B40C-4AE0-437E-335A-AB9DC75C1E56";
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
	rename -uid "C8EA31A3-4078-0ED7-2B02-E790E419B03C";
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
	rename -uid "D23EC9FF-43EF-BDF3-6314-A2A3BC716814";
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
	rename -uid "B48EA606-465A-37A2-56E8-15B11A7B4186";
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
	rename -uid "320C16CD-4571-1420-C1C0-5EA2DA4FEA5E";
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
	rename -uid "EE6DBE6D-41E1-F9BD-11A3-97BB3DE23CE5";
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
	rename -uid "DE0EA14F-4F97-F5F8-DF75-4C81D7843E3C";
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
	rename -uid "B0DF17F7-4889-21F8-FFB3-BEADD57166E5";
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
	setAttr ".lr" -type "double3" -180.0000014787795 -180 179.99999999999994 ;
	setAttr ".rst" -type "double3" -11.813794085361032 -5.6843418860808015e-14 5.3290705182007514e-15 ;
	setAttr ".rsrr" -type "double3" -180.00000147877947 -180 179.99999999999989 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_upperArm_guide_001" -p "jnt_rt_scapula_guide_001";
	rename -uid "E20424AC-4E39-81F1-5976-1E8FABF753C1";
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
	rename -uid "6B386CC2-4B55-0A33-2AB4-4F85A764FBAC";
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
	rename -uid "94DD71FF-4B4B-3519-F391-E7BBF33C3749";
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
	rename -uid "184F327E-4A60-E666-5E5B-9E8D9799B6AD";
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
	rename -uid "4E30AFED-483D-DD2F-FAE6-55B30E4F0A8F";
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
	rename -uid "2FC10EA0-49E3-9DCF-BBA8-0FA817EC03DA";
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
	rename -uid "084B3562-48D6-DE73-B796-3BB6F67E1253";
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
	rename -uid "C3E52E0E-472D-CE99-1962-05A776EB7710";
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
	setAttr ".lr" -type "double3" -1.309143521245566e-08 -6.3611112567804499e-15 -2.226388222914356e-14 ;
	setAttr ".rst" -type "double3" -2.9801289421417891 -2.8421709430404007e-14 -1.4210854715202004e-14 ;
	setAttr ".rsrr" -type "double3" -1.3091454295783752e-08 -1.908332754768005e-14 6.3611109862299631e-15 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_003_parentConstraint1" -p "jnt_rt_thumb_guide_003";
	rename -uid "34323E1F-4880-9013-92B4-EEAA45B1084E";
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
	setAttr ".lr" -type "double3" 1.4585758965960699e-06 4.4879579865863534e-06 24.695720974245056 ;
	setAttr ".rst" -type "double3" -3.7644131533578644 2.8421709430404007e-14 -7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" 1.4585759335151859e-06 4.4879579729953201e-06 24.695720974245123 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_002_parentConstraint1" -p "jnt_rt_thumb_guide_002";
	rename -uid "7E8C3935-4736-F078-32B1-7D9B3C4B1EB6";
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
	setAttr ".lr" -type "double3" 4.6510119488125079e-07 3.200237652997788e-06 16.538182024682552 ;
	setAttr ".rst" -type "double3" -4.0813853793719375 -4.2632564145606011e-14 1.4210854715202004e-14 ;
	setAttr ".rsrr" -type "double3" 4.6510119984991975e-07 3.2002376335054952e-06 16.538182024682548 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_thumb_guide_001_parentConstraint1" -p "jnt_rt_thumb_guide_001";
	rename -uid "7C35CB6C-4BB9-950B-712D-7B9C11903126";
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
	setAttr ".lr" -type "double3" -0.54083898427569166 -10.765680502058514 5.7350758014733891 ;
	setAttr ".rst" -type "double3" -26.886953474794517 26.515375117795916 3.9754412671804431 ;
	setAttr ".rsrr" -type "double3" 137.92773570508504 129.02631817106962 102.20808408974612 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_index_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "437C8C57-46BB-6978-BD05-FEAE158991EA";
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
	rename -uid "5C68894C-42C0-A733-D371-5CBF998953B7";
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
	rename -uid "104F5C04-4216-53FF-84B4-65B1C61C0C53";
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
	rename -uid "4C871703-4AA9-D8B1-D1A5-A299A4E8D1D4";
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
	rename -uid "FCACF989-43A2-377A-AC6F-7B875F705B71";
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
	rename -uid "548DDC59-4BA7-0415-7581-BEB2E5F3DEE0";
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
	setAttr ".lr" -type "double3" 2.4172215579122605e-13 -5.9714914144477582e-13 2.3734889310421368e-13 ;
	setAttr ".rst" -type "double3" -2.7578831976663665 2.1742607714259066e-11 2.0097701280974434e-11 ;
	setAttr ".rsrr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_004_parentConstraint1" -p "jnt_rt_index_guide_004";
	rename -uid "B4267077-4997-E221-42A8-32B4977CF7BF";
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
	setAttr ".lr" -type "double3" 2.4172215579122605e-13 -5.9714914144477582e-13 2.3734889310421368e-13 ;
	setAttr ".rst" -type "double3" -3.9915790935964068 0 7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_003_parentConstraint1" -p "jnt_rt_index_guide_003";
	rename -uid "B76F415A-42CE-C4E9-5705-88ADF285AE13";
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
	setAttr ".lr" -type "double3" 2.4172215579122605e-13 -5.9714914144477582e-13 2.3734889310421368e-13 ;
	setAttr ".rst" -type "double3" -4.6030102918318931 0 7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" 2.337707690875673e-13 -6.0510052814843472e-13 2.3098778374128675e-13 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_002_parentConstraint1" -p "jnt_rt_index_guide_002";
	rename -uid "B0271B98-4816-2762-48C5-D68780095AAE";
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
	setAttr ".lr" -type "double3" -0.13517139271932455 -0.55988519587811347 27.145834753298281 ;
	setAttr ".rst" -type "double3" -6.3330235352054061 -1.4210854715202004e-14 2.1316282072803006e-14 ;
	setAttr ".rsrr" -type "double3" -0.13517139271932938 -0.55988519587811525 27.145834753298256 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_index_guide_001_parentConstraint1" -p "jnt_rt_index_guide_001";
	rename -uid "08F0488F-41D1-59FD-8175-F3BFC544052E";
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
	setAttr ".lr" -type "double3" 47.50823307152033 -75.13709886984455 -59.549996483992949 ;
	setAttr ".rst" -type "double3" -28.934834148043542 26.385518187176363 2.4999003211692354 ;
	setAttr ".rsrr" -type "double3" -0.30799950080807958 12.605192021140542 -2.788122544855252 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_middle_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "330FA720-4E17-5CE3-FC3E-2BA8311172A8";
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
	rename -uid "3DA5275B-4B50-39AC-4EF0-8698E85E8D8A";
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
	rename -uid "82101BA5-4325-3CF4-8A29-E3BC25C5A8AE";
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
	rename -uid "77934821-4A8D-3DAE-6CCA-A78B8950C32B";
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
	rename -uid "60B8969C-436A-CAA4-CE8F-0A8F656D1622";
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
	rename -uid "A2890576-42BF-1E8F-17AF-E88F3D121872";
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
	setAttr ".lr" -type "double3" 3.0272275121735932e-09 8.9387782255157754e-15 -2.2445761686552056e-14 ;
	setAttr ".rst" -type "double3" -2.9261303558643448 2.7000623958883807e-13 -1.2434497875801753e-14 ;
	setAttr ".rsrr" -type "double3" 3.0272238644373319e-09 1.7969370922357985e-14 -2.8806874229874907e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_004_parentConstraint1" -p "jnt_rt_middle_guide_004";
	rename -uid "098529C2-4DBE-46BA-C8E9-D4873230DFEB";
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
	setAttr ".lr" -type "double3" -3.6538762441946188e-15 8.9387909079061037e-15 -1.9083329300635913e-14 ;
	setAttr ".rst" -type "double3" -3.501428012076083 -1.4210854715202004e-14 -5.3290705182007514e-15 ;
	setAttr ".rsrr" -type "double3" -7.3016284307130417e-15 1.7969386566508883e-14 -1.9083330522958676e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_003_parentConstraint1" -p "jnt_rt_middle_guide_003";
	rename -uid "FA9B6335-428E-0704-80C5-4EB11446C050";
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
	setAttr ".lr" -type "double3" -3.6538762441946188e-15 8.9387909079061037e-15 -1.9083329300635913e-14 ;
	setAttr ".rst" -type "double3" -5.1829527930584334 1.4210854715202004e-14 0 ;
	setAttr ".rsrr" -type "double3" -7.3016284307130417e-15 1.7969386566508883e-14 -1.9083330522958676e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_002_parentConstraint1" -p "jnt_rt_middle_guide_002";
	rename -uid "51197CDD-4C46-5F49-45F6-BA94C82CE4D2";
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
	setAttr ".lr" -type "double3" -0.32315892490453446 -2.1843600718445604 16.828873178827102 ;
	setAttr ".rst" -type "double3" -5.9056921935997835 -1.4210854715202004e-14 1.7763568394002505e-14 ;
	setAttr ".rsrr" -type "double3" -0.32315892490453341 -2.1843600718445493 16.828873178827109 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_middle_guide_001_parentConstraint1" -p "jnt_rt_middle_guide_001";
	rename -uid "66860572-4306-9290-6949-01A8AFCA0D16";
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
	setAttr ".lr" -type "double3" -90.530113085838977 -112.22912582963762 68.262449206712247 ;
	setAttr ".rst" -type "double3" -30.3852904227296 25.459431622868532 1.9576565689092575 ;
	setAttr ".rsrr" -type "double3" -0.50798744202058288 -7.3490571721279023 7.8975513865994529 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_ring_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "4C7CC03E-4EA1-74BE-C365-D4AA822BA8A8";
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
	rename -uid "F94A139F-4FF7-AA4B-6924-E9A5B4324BE9";
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
	rename -uid "0D06E6B9-466E-9992-46F0-77AD79C46743";
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
	rename -uid "3AFFD091-4524-1521-742D-E9B9F3BD1435";
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
	rename -uid "AE3BF483-486A-C574-3477-9C959D37771A";
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
	rename -uid "CE3B40BD-4941-0FEB-4181-6E95917B1B98";
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
	setAttr ".lr" -type "double3" -6.3611093629270304e-15 1.9083328088781101e-14 2.0673605429512861e-14 ;
	setAttr ".rst" -type "double3" -2.8253327832633488 -1.4210854715202004e-14 1.1013412404281553e-13 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_004_parentConstraint1" -p "jnt_rt_ring_guide_004";
	rename -uid "3636BC04-4973-EB4A-5220-12818392C9E7";
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
	setAttr ".lr" -type "double3" -6.3611093629270304e-15 1.9083328088781101e-14 2.0673605429512861e-14 ;
	setAttr ".rst" -type "double3" -2.7139968321795038 1.4210854715202004e-14 -3.5527136788005009e-15 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_003_parentConstraint1" -p "jnt_rt_ring_guide_003";
	rename -uid "D1C0ED4B-4E2F-2AB1-DFE8-72A1C8B41863";
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
	setAttr ".lr" -type "double3" -6.3611093629270304e-15 1.9083328088781101e-14 2.0673605429512861e-14 ;
	setAttr ".rst" -type "double3" -4.564804549506789 1.4210854715202004e-14 0 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317565e-14 5.5659706925611542e-14 3.8166656177562195e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_002_parentConstraint1" -p "jnt_rt_ring_guide_002";
	rename -uid "8382D693-491C-9C58-4A41-BCB2B4E6B60F";
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
	setAttr ".lr" -type "double3" -3.0223625454874625 -13.924486251583344 24.381045871513649 ;
	setAttr ".rst" -type "double3" -5.8644210548804239 -4.2632564145606011e-14 1.7763568394002505e-15 ;
	setAttr ".rsrr" -type "double3" -3.0223625454874576 -13.924486251583316 24.381045871513667 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ring_guide_001_parentConstraint1" -p "jnt_rt_ring_guide_001";
	rename -uid "CA86F6DC-45AB-895E-41B7-3BBF93BF22E3";
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
	setAttr ".lr" -type "double3" -94.829111004337335 -134.82557601297918 48.705405392380626 ;
	setAttr ".rst" -type "double3" -31.049928443481477 24.156771940431156 1.6829657480732436 ;
	setAttr ".rsrr" -type "double3" -0.34776484501474897 -31.684347521770238 1.2254880921545954 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_pinky_guide_001" -p "jnt_rt_wrist_guide_001";
	rename -uid "E8AC49F3-4B2A-4740-2E53-95B9CB777B9E";
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
	rename -uid "86327094-43D7-AFF0-24A5-8E9573BCDD9D";
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
	rename -uid "48AF2B1E-454C-DF84-24A7-13AD5A900910";
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
	rename -uid "EB2C18AF-4905-AF39-9920-4EBCAB58B0D8";
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
	rename -uid "F306EDEA-4E2E-EF64-2391-0FAA35CB2EB3";
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
	rename -uid "1628CACC-4F51-BDC4-7A63-E7971122E757";
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
	setAttr ".lr" -type "double3" -6.3611093629270107e-15 6.0430538947806828e-14 4.6118042881221001e-14 ;
	setAttr ".rst" -type "double3" -1.9444966201798479 1.4210854715202004e-14 -7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_004_parentConstraint1" -p "jnt_rt_pinky_guide_004";
	rename -uid "22C8D356-4C8F-B4F6-C6B0-8EA8524C8D13";
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
	setAttr ".lr" -type "double3" -6.3611093629270107e-15 6.0430538947806828e-14 4.6118042881221001e-14 ;
	setAttr ".rst" -type "double3" -2.2220449461758847 0 7.1054273576010019e-15 ;
	setAttr ".rsrr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_003_parentConstraint1" -p "jnt_rt_pinky_guide_003";
	rename -uid "CBEB0CDC-443F-0D16-4676-59A9EE6E9B0D";
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
	setAttr ".lr" -type "double3" -6.3611093629270107e-15 6.0430538947806828e-14 4.6118042881221001e-14 ;
	setAttr ".rst" -type "double3" -3.6531556962369649 -2.8421709430404007e-14 -1.0658141036401503e-14 ;
	setAttr ".rsrr" -type "double3" -6.3611093629269965e-15 8.2694421718051442e-14 5.2479152244148028e-14 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_002_parentConstraint1" -p "jnt_rt_pinky_guide_002";
	rename -uid "4D872DD5-4D15-9189-6353-F4B3FD5ED902";
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
	setAttr ".lr" -type "double3" -0.73441779669427887 -2.6175398536187959 31.340870629514317 ;
	setAttr ".rst" -type "double3" -5.3187799595668181 -1.4210854715202004e-14 3.5527136788005009e-15 ;
	setAttr ".rsrr" -type "double3" -0.73441779669426821 -2.6175398536187768 31.340870629514367 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_pinky_guide_001_parentConstraint1" -p "jnt_rt_pinky_guide_001";
	rename -uid "4E0D7272-4CBA-E70F-286F-DBB744E21539";
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
	setAttr ".lr" -type "double3" -111.31818736867685 -152.84660684303094 38.934561212339034 ;
	setAttr ".rst" -type "double3" -31.405355798267514 22.675263201098446 1.800107074966931 ;
	setAttr ".rsrr" -type "double3" 8.5335367814477294 -49.099647567295825 -18.552853930180156 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_wrist_guide_001_parentConstraint1" -p "jnt_rt_wrist_guide_001";
	rename -uid "78F688CD-4674-58D1-229B-C6B19151CE33";
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
	setAttr ".rst" -type "double3" -21.180998921756064 0 -3.5527136788005009e-15 ;
	setAttr ".rsrr" -type "double3" 128.08229345384436 132.93989349989832 83.619292671175742 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_elbow_guide_001_parentConstraint1" -p "jnt_rt_elbow_guide_001";
	rename -uid "C1651ABE-450F-0DAD-0BDA-DD943D3A0EF4";
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
	setAttr ".lr" -type "double3" -0.22949392969037927 14.039317072850002 -1.8636293617127433 ;
	setAttr ".rst" -type "double3" -27.395612197271689 18.519674796295 -0.19772206553258442 ;
	setAttr ".rsrr" -type "double3" -2.9674302657713705 13.645504964482884 -24.430394373669429 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_upperArm_guide_001_parentConstraint1" -p "jnt_rt_upperArm_guide_001";
	rename -uid "9EA52CDB-4F0B-E5F6-4C9A-41AA448DB735";
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
	setAttr ".lr" -type "double3" -66.100621461659514 -27.765273094278804 138.40121632138082 ;
	setAttr ".rst" -type "double3" 1.3031669319233039 -5.2568261096760409 3.5540999978206376 ;
	setAttr ".rsrr" -type "double3" -66.1006214616595 -27.765273094278754 138.40121632138082 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_scapula_guide_001_parentConstraint1" -p "jnt_rt_scapula_guide_001";
	rename -uid "D5CF186C-4AE5-2F81-D660-9FB1E616EBDC";
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
	setAttr ".lr" -type "double3" -332.03163080848248 7.0948458185682099 152.04242100109974 ;
	setAttr ".rst" -type "double3" -2.0025831020120677e-06 4.2632564145606011e-14 1.7763568394002505e-15 ;
	setAttr ".rsrr" -type "double3" -332.03163080848248 7.0948458185681735 152.04242100109977 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_clavicle_guide_002_parentConstraint1" -p "jnt_rt_clavicle_guide_002";
	rename -uid "6E64D55F-4381-8A6F-87FF-4B9394632DA3";
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
	setAttr ".lr" -type "double3" 162.38206356138878 177.14835768295833 18.249372188254814 ;
	setAttr ".rst" -type "double3" -10.889342927023975 0 7.9936057773011271e-15 ;
	setAttr ".rsrr" -type "double3" 162.3820635613888 177.14835768295836 18.24937218825476 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_clavicle_guide_001_parentConstraint1" -p "jnt_rt_clavicle_guide_001";
	rename -uid "AB5A7FAD-4297-3751-808D-07AE9518A7F1";
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
	setAttr ".lr" -type "double3" 9.8496776798784609 -36.108797175155352 -29.613819513924923 ;
	setAttr ".rst" -type "double3" 9.2690145740343581 2.2850031578620502 4.2544972014629856 ;
	setAttr ".rsrr" -type "double3" 9.8496776798784644 -36.108797175155324 -29.613819513924955 ;
	setAttr -k on ".w0";
createNode joint -n "jnt_rt_upperLeg_guide_001" -p "jnt_md_root_guide_001";
	rename -uid "3A6211A4-466B-7F87-0224-34B11FB7B3C4";
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
	rename -uid "8E635B6B-46DE-CAE0-DA3A-69B4028B4EA3";
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
	rename -uid "A1163151-4AD5-77EB-717B-109194ADA72B";
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
	rename -uid "CF5AC59D-4E6D-67F5-C46C-9D940BFE85DA";
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
	rename -uid "AB319224-4545-5BAE-6C18-6BA58D396D8E";
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
	rename -uid "73FE6EC5-4652-5497-35AB-00A75691B469";
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
	setAttr ".lr" -type "double3" 8.3689515218887686e-05 -0.00084837376017915511 1.7826477691728126e-09 ;
	setAttr ".rst" -type "double3" -10.061090566062497 -3.4347191757433393e-10 -0.0001975427998104351 ;
	setAttr ".rsrr" -type "double3" -7.0820342723103074e-05 -0.001124932530911191 1.4283611968242512e-09 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ball_guide_001_parentConstraint1" -p "jnt_rt_ball_guide_001";
	rename -uid "9C59D84A-49F6-0F87-6C3F-B1B1ED8EF57E";
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
	setAttr ".lr" -type "double3" 0.00011204745293786078 0.00082351777886182287 -12.609440387848572 ;
	setAttr ".rst" -type "double3" -10.061090567994976 -4.8615778069915905e-10 1.1774994796098781e-05 ;
	setAttr ".rsrr" -type "double3" 0.00011656428575880431 0.00078263569815421755 -12.609440385605803 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_ankle_guide_001_parentConstraint1" -p "jnt_rt_ankle_guide_001";
	rename -uid "3216562C-49FA-7AF7-4197-50AA66484B6C";
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
	setAttr ".lr" -type "double3" 6.8694732184051185e-05 -2.5311527346704884e-05 -130.93022326688651 ;
	setAttr ".rst" -type "double3" 40.814974859602536 8.5468902815067107 -2.4631307736555641e-05 ;
	setAttr ".rsrr" -type "double3" 0.00042636606410780225 -179.99930714016733 2.5997845205305877e-09 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "jnt_rt_knee_guide_001_parentConstraint1" -p "jnt_rt_knee_guide_001";
	rename -uid "7433F838-4ADB-3B2C-4DBE-968E1CC5A240";
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
	rename -uid "05947B80-4C13-605E-C8D8-7BA96282465B";
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
	setAttr ".lr" -type "double3" -180.00018153027574 7.8741482563057063e-06 179.99999999997829 ;
	setAttr ".rst" -type "double3" -5.4740998008547166 -5.5636970162257953 0.039537336507059706 ;
	setAttr ".rsrr" -type "double3" -180.00018153027577 7.8741482435834934e-06 179.99999999997831 ;
	setAttr -k on ".w0";
createNode transform -n "grp_md_auto_pole_001";
	rename -uid "8CE95DF9-4AD4-0AAA-2B61-D489CFBF0DA3";
createNode joint -n "jnt_lf_arm_pole_guide_001" -p "grp_md_auto_pole_001";
	rename -uid "C7C06E7F-4A2C-558F-3508-8C8DB02197FA";
createNode joint -n "jnt_lf_leg_pole_guide_001" -p "grp_md_auto_pole_001";
	rename -uid "81BD5288-41F6-683E-5CAE-6584793DFC04";
createNode joint -n "jnt_rt_arm_pole_guide_001" -p "grp_md_auto_pole_001";
	rename -uid "3B401337-4BB7-92D3-594A-60B010F52FEE";
createNode joint -n "jnt_rt_leg_pole_guide_001" -p "grp_md_auto_pole_001";
	rename -uid "A42E95E9-4604-CE45-8288-688CA4C571B8";
createNode transform -n "crv_auto_pole_arm" -p "grp_md_auto_pole_001";
	rename -uid "C76F34E2-4262-E68B-5C75-2FB5F7B7E8F4";
createNode nurbsCurve -n "curveShape1" -p "crv_auto_pole_arm";
	rename -uid "C34F6234-47AD-A4AF-4CDB-CCAC1BD8BEC8";
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
createNode transform -n "crv_auto_pole_leg" -p "grp_md_auto_pole_001";
	rename -uid "E95C6BD0-447D-57EB-8363-F28B63B708E7";
createNode nurbsCurve -n "curveShape2" -p "crv_auto_pole_leg";
	rename -uid "D96CDE1E-4271-8CD6-A08C-A9902EE432BF";
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
createNode transform -n "crv_auto_pole_rt_arm" -p "grp_md_auto_pole_001";
	rename -uid "52E79ADB-4A80-18D0-DA9D-36BC2E11CCE1";
createNode nurbsCurve -n "curveShape3" -p "crv_auto_pole_rt_arm";
	rename -uid "340F6528-4E80-6F01-A089-68BE78FB231C";
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
createNode transform -n "crv_auto_pole_rt_leg" -p "grp_md_auto_pole_001";
	rename -uid "AAB55E6A-4CF1-0DCD-CBA7-FE84389392C7";
createNode nurbsCurve -n "curveShape4" -p "crv_auto_pole_rt_leg";
	rename -uid "FEA3120D-4A5D-D1D4-8972-21A6384035CC";
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
createNode plusMinusAverage -n "autoPole_position";
	rename -uid "09F1D500-4E06-E071-38CE-90AA763A6231";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world";
	rename -uid "A7F27451-4566-EDB0-6595-6EAE4D438331";
createNode multiplyDivide -n "autoPole_scaled";
	rename -uid "72F8E529-4A5D-9ECF-3835-55B7A92FDC16";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction";
	rename -uid "EDAFC2D7-4D46-73BE-55F3-95B2A1F85CDA";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset";
	rename -uid "34CDCCBD-40D7-BDD5-E340-D1B8665099C8";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid";
	rename -uid "24F0ACF6-4AA2-7D72-B9DE-6CB75EFC6542";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world";
	rename -uid "4AE8F410-48A1-203F-2F7E-D3BDA72D4122";
createNode multiplyDivide -n "autoPole_projection";
	rename -uid "F2105DF3-4209-D610-6942-1D92E4116E68";
createNode plusMinusAverage -n "autoPole_axis";
	rename -uid "CE9409B6-4E0D-4DF4-4664-5D90FB07F8E6";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world";
	rename -uid "BCA0303E-40D8-6290-F298-BB9D87E4D17E";
createNode multiplyDivide -n "autoPole_ratio";
	rename -uid "BFE75D3D-43C7-CEDB-0459-2F8D9804F480";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid";
	rename -uid "625E4CF7-4DAC-AF45-9437-529C8ED17A53";
createNode vectorProduct -n "autoPole_dotAxis";
	rename -uid "00DC6EEA-4893-2834-2F87-7F954DA37407";
createNode distanceBetween -n "autoPole_length";
	rename -uid "BE879745-4061-D414-8090-3A9940D9F609";
createNode plusMinusAverage -n "autoPole_position1";
	rename -uid "68CBC4AA-4EDE-5ED2-1DEA-B5A9B6DFE8C7";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world1";
	rename -uid "260C3553-4513-4F41-0E69-85BB2F194636";
createNode multiplyDivide -n "autoPole_scaled1";
	rename -uid "53A978EC-4002-A657-214F-AB96D98D1E97";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction1";
	rename -uid "91A863E2-4C26-A2AF-043E-938618C22A80";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset1";
	rename -uid "E9ADB71F-4F9C-3357-20A5-99B194E7ACD2";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid1";
	rename -uid "46AAD348-429B-80D0-FF1E-F28D824B5083";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world1";
	rename -uid "3774BE27-4BE5-BF1B-F100-BB9130D7069B";
createNode multiplyDivide -n "autoPole_projection1";
	rename -uid "A3BE4FD0-45E0-DB59-5E73-7B8E517C976A";
createNode plusMinusAverage -n "autoPole_axis1";
	rename -uid "2AB19B46-4F13-EB0C-1257-1084FCC5B933";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world1";
	rename -uid "7348325C-4BC4-1931-464F-C7B9806DE1A8";
createNode multiplyDivide -n "autoPole_ratio1";
	rename -uid "42505D41-4C57-F4A3-02B1-6E9666BF8FF4";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid1";
	rename -uid "7888D407-4C52-A7C3-497C-BA8003D343B6";
createNode vectorProduct -n "autoPole_dotAxis1";
	rename -uid "BFC904F8-465E-8A76-2D62-6EA55CA46E31";
createNode distanceBetween -n "autoPole_length1";
	rename -uid "0DCF5820-4A52-22D4-3647-3DA76FC273F1";
createNode plusMinusAverage -n "autoPole_position2";
	rename -uid "B3F96A6E-4605-74A3-E6F2-BBBB679047DB";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world2";
	rename -uid "70CD8E34-407C-859D-14B0-66A49F62836C";
createNode multiplyDivide -n "autoPole_scaled2";
	rename -uid "39DBA0A9-41D8-02F5-F780-A497E6CABF4C";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction2";
	rename -uid "F2A7D9AD-4789-31E6-17FF-06868DBF6B8E";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset2";
	rename -uid "0BD42BD4-4370-498E-12CA-1BAC4D002E9B";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid2";
	rename -uid "560532FB-4F7E-E6E3-BB84-1CA0AABE24FF";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world2";
	rename -uid "8F3B4FF6-417E-1AF8-9BEB-75872CD80586";
createNode multiplyDivide -n "autoPole_projection2";
	rename -uid "23D78F13-46BC-68BF-483D-AE8FAE0181EB";
createNode plusMinusAverage -n "autoPole_axis2";
	rename -uid "13D3AB4C-43B1-F42E-3BE2-469CAFF0FF0C";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world2";
	rename -uid "925BF48F-43E1-84D3-901D-DDAFB69D6A7D";
createNode multiplyDivide -n "autoPole_ratio2";
	rename -uid "1825B109-4FCA-0027-6213-B9BD8F8B8DFA";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid2";
	rename -uid "8286FB4D-43B3-5126-FB42-BB9548779B0D";
createNode vectorProduct -n "autoPole_dotAxis2";
	rename -uid "256E0433-4094-A7B4-8318-EE93D508EF41";
createNode distanceBetween -n "autoPole_length2";
	rename -uid "13CD6CE2-439B-7D8A-0E33-F6BBCA6991A5";
createNode plusMinusAverage -n "autoPole_position3";
	rename -uid "F807E2FE-45B9-7772-1F69-24A00B70C6A0";
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_mid_world3";
	rename -uid "212BF896-4F96-34B8-BC3A-FDBC0C031AF0";
createNode multiplyDivide -n "autoPole_scaled3";
	rename -uid "BA846D19-499E-BACF-2186-0A9CD9DBEAC3";
	setAttr ".i2" -type "float3" 25 25 25 ;
createNode multiplyDivide -n "autoPole_direction3";
	rename -uid "F64214ED-4BBA-F0E0-7415-7D937D6D6BA1";
	setAttr ".op" 2;
createNode plusMinusAverage -n "autoPole_offset3";
	rename -uid "492D7F00-458F-880E-F0C4-BD803E443D70";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode plusMinusAverage -n "autoPole_toMid3";
	rename -uid "9F7AC960-418B-A0A3-E599-0DAAC0605CBC";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_start_world3";
	rename -uid "8B3000F2-4158-CC78-2D4D-30B16FDD52B4";
createNode multiplyDivide -n "autoPole_projection3";
	rename -uid "5637C727-48CD-D0E4-AF04-048296387453";
createNode plusMinusAverage -n "autoPole_axis3";
	rename -uid "AE9405AA-4E56-DD63-673D-2AAA0951434F";
	setAttr ".op" 2;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
createNode decomposeMatrix -n "autoPole_end_world3";
	rename -uid "86673803-489D-6206-E256-9EB3F582AF98";
createNode multiplyDivide -n "autoPole_ratio3";
	rename -uid "8DF56F35-4804-14C7-FF34-61B40B28CE9E";
	setAttr ".op" 2;
createNode vectorProduct -n "autoPole_dotMid3";
	rename -uid "BA9047AE-409B-BDAA-912D-B58613A51FB0";
createNode vectorProduct -n "autoPole_dotAxis3";
	rename -uid "6C1B321E-4210-8F99-EA5D-36B38973E570";
createNode distanceBetween -n "autoPole_length3";
	rename -uid "0C65F526-4227-2C97-5ED7-17A20DC724D4";
createNode decomposeMatrix -n "autoPole_display_arm_cv0";
	rename -uid "FCA35166-465D-D1E5-BBE6-99B8AAF87F0A";
createNode decomposeMatrix -n "autoPole_display_arm_cv1";
	rename -uid "943732E6-44C9-B6B2-51B3-1596980B5485";
createNode decomposeMatrix -n "autoPole_display_leg_cv0";
	rename -uid "4BDF9D96-4580-BBB6-B73C-7B89D23E1CA3";
createNode decomposeMatrix -n "autoPole_display_leg_cv1";
	rename -uid "99659DF8-466C-E29D-C619-4E8C8312BE7A";
createNode decomposeMatrix -n "autoPole_display_rt_arm_cv0";
	rename -uid "DCBABF02-46BF-C47B-C714-29AEEAFD03E5";
createNode decomposeMatrix -n "autoPole_display_rt_arm_cv1";
	rename -uid "B05B0289-4C64-8CE2-0A1C-50A8FC84AAD5";
createNode decomposeMatrix -n "autoPole_display_rt_leg_cv0";
	rename -uid "B1E62F52-40BD-DD6C-9DBD-7191FB0C822F";
createNode decomposeMatrix -n "autoPole_display_rt_leg_cv1";
	rename -uid "30BBA2FC-4C85-AC9A-AD3A-E7B5D9AE76A3";
createNode decomposeMatrix -n "decomposeMatrix73";
	rename -uid "B1C77FB9-4D0A-8126-956A-B8890C845A13";
createNode multMatrix -n "multMatrix73";
	rename -uid "9C1223C1-4D29-C818-7465-E5860C41A93C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix74";
	rename -uid "63A43D7B-49F0-AF3D-BAA4-F68B0DBF6039";
createNode multMatrix -n "multMatrix74";
	rename -uid "9C65CC3E-4DC0-7336-EBB6-C5B910FCD5BA";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix75";
	rename -uid "FDBE09CC-4F2A-FAB2-3607-1896950C7DA5";
createNode multMatrix -n "multMatrix75";
	rename -uid "3E920B71-483C-56B7-54A0-18AD45224145";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix76";
	rename -uid "47F8163B-4F53-E3D1-3CF3-249A7AC91882";
createNode multMatrix -n "multMatrix76";
	rename -uid "E9E2C1F6-4CAC-BD65-C4E9-A482D2CF17E5";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix77";
	rename -uid "EF73FB7D-4F11-C607-E3C7-64A302A86E63";
createNode multMatrix -n "multMatrix77";
	rename -uid "76B7AFD4-4BB7-E948-1814-55A73259F1DF";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix78";
	rename -uid "FE2A396D-4ED3-F82E-D6D5-909224DA2CC4";
createNode multMatrix -n "multMatrix78";
	rename -uid "A669437E-4BD5-CE04-C986-ECB7CD044518";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix79";
	rename -uid "82C6B99C-496F-F0DB-7BE7-66B8283F9DD1";
createNode multMatrix -n "multMatrix79";
	rename -uid "D199F399-4EF3-D3F1-3EDF-2ABCE5A676B8";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix80";
	rename -uid "964B6AC7-4E9B-DDAF-A079-7FB7655CC22D";
createNode multMatrix -n "multMatrix80";
	rename -uid "03C19F94-4F1F-BE16-66C0-0CA954765F67";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix81";
	rename -uid "48725F72-4AAB-3A82-9576-82966356FEE3";
createNode multMatrix -n "multMatrix81";
	rename -uid "0D49002D-4B08-9BA0-7A26-EB82A5BD87DE";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix82";
	rename -uid "D8470178-45B1-F33B-B190-06871206C28A";
createNode multMatrix -n "multMatrix82";
	rename -uid "9E1E2043-400D-9D19-6127-DDB034DCD3DA";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix83";
	rename -uid "EF0980CE-4F41-4B3C-D6FA-A68F546A9CE0";
createNode multMatrix -n "multMatrix83";
	rename -uid "3E3B087F-4868-5C11-89D3-4D9484211193";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix84";
	rename -uid "0D7E8245-443C-A480-6380-68BA55C5F367";
createNode multMatrix -n "multMatrix84";
	rename -uid "3A631957-4AAD-03F1-B646-1ABC63B2ED1C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix85";
	rename -uid "363BF2C9-4F21-F04F-0CAE-589637C7D1BE";
createNode multMatrix -n "multMatrix85";
	rename -uid "83B9C796-46F2-21B4-E96A-98917745F76F";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix86";
	rename -uid "E8A60D3F-40DA-1490-7D65-7788E65C475C";
createNode multMatrix -n "multMatrix86";
	rename -uid "DE23A380-4BCB-6FA4-D94D-CCAA35881A10";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix87";
	rename -uid "08E88D10-4C63-CF24-C7DA-4092A4A20268";
createNode multMatrix -n "multMatrix87";
	rename -uid "4988CDE5-4E91-BBCF-8053-3486C1C2A76D";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix88";
	rename -uid "4F4F1019-4875-7FE5-D868-8C86EEC275DD";
createNode multMatrix -n "multMatrix88";
	rename -uid "58D13318-4AD5-6660-876A-359886FD0165";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix89";
	rename -uid "F8A94D90-41E5-2BE2-0E0A-7CADF4EE5C9D";
createNode multMatrix -n "multMatrix89";
	rename -uid "7C4E1C3B-41BF-1A97-0B54-E684C7D95B8F";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix90";
	rename -uid "89F83A3E-4911-5650-E2CE-38B965B6E00A";
createNode multMatrix -n "multMatrix90";
	rename -uid "E74B69CF-43A5-80D3-0691-8DB3BC7B4F95";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix91";
	rename -uid "F3DCD118-45F5-4AE0-DDD8-EE87DA365E2F";
createNode multMatrix -n "multMatrix91";
	rename -uid "2D4281F8-4C3D-D755-F445-A888CE085723";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix92";
	rename -uid "B966F654-47B4-8003-A85C-0986AA1184A5";
createNode multMatrix -n "multMatrix92";
	rename -uid "8E880339-4532-7CE9-C5EA-C9AC6D2AB049";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix93";
	rename -uid "9F97AC2C-419F-6EA1-1A0D-6C84E9AA38FC";
createNode multMatrix -n "multMatrix93";
	rename -uid "28883653-43E5-4A93-D737-61B56580B3A4";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix94";
	rename -uid "E6E0BF6C-492E-63F1-D192-82B91A89A586";
createNode multMatrix -n "multMatrix94";
	rename -uid "747FC834-4A0C-F4B0-9976-F49272DD6B54";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix95";
	rename -uid "842578D8-4851-0314-C2F0-46BEAB12D24B";
createNode multMatrix -n "multMatrix95";
	rename -uid "92C4FFBA-4E3D-D0D0-E7B5-368B3838CE75";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix96";
	rename -uid "E844FE63-4653-790D-5939-309462E6C2CD";
createNode multMatrix -n "multMatrix96";
	rename -uid "6DF154AC-4330-8DF1-09BB-0B8C66EEDC4C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix97";
	rename -uid "1EC21987-44BC-B564-58F0-98B922660143";
createNode multMatrix -n "multMatrix97";
	rename -uid "AEE4F6CB-42FE-D6D2-3027-0D87C2191842";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix98";
	rename -uid "0629B694-44BB-93C6-88EC-EDAAA1D226F0";
createNode multMatrix -n "multMatrix98";
	rename -uid "A711C821-46E2-55BA-AD66-38BD240D8A66";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix99";
	rename -uid "2DB0C92D-41D6-2237-3BF9-A99D6C3F6244";
createNode multMatrix -n "multMatrix99";
	rename -uid "EB28FF3A-4A99-E401-2495-E0B913FE12C1";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix100";
	rename -uid "CB68624F-4540-761B-97E6-7F8D400023A1";
createNode multMatrix -n "multMatrix100";
	rename -uid "7BC55FFB-428E-D991-124F-D5BD5D009E90";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix101";
	rename -uid "3611CEE1-470D-6082-68B1-5E961440AEAD";
createNode multMatrix -n "multMatrix101";
	rename -uid "299F9EC6-43B0-5E85-7DE7-A182DFF8522C";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix102";
	rename -uid "B22548B7-4D3A-2C3D-680E-84A2FA651814";
createNode multMatrix -n "multMatrix102";
	rename -uid "FE156D8D-442D-F102-075E-06815AB5AD44";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix103";
	rename -uid "A272AF74-40EB-C08A-1669-6DB5E60155F5";
createNode multMatrix -n "multMatrix103";
	rename -uid "E493EBFB-4826-1BBD-0454-679EDEEA64FB";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix104";
	rename -uid "6149CE71-4C36-4B0A-9F5A-A7A50CA45579";
createNode multMatrix -n "multMatrix104";
	rename -uid "38458FF6-4ED7-D0AA-0EE9-F0AC6BD0E680";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix105";
	rename -uid "626DC3A4-46D7-7D08-16AA-68B361E5D004";
createNode multMatrix -n "multMatrix105";
	rename -uid "DDE884FB-4E07-FAAD-8E15-5BA56067D997";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix106";
	rename -uid "4739ACFB-468B-CD7E-6C8F-E998882E6824";
createNode multMatrix -n "multMatrix106";
	rename -uid "4A1D7DC1-4E81-987B-C523-CE9D8AE6DF4D";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix107";
	rename -uid "08131D48-454C-3136-0322-1A84897B9A2B";
createNode multMatrix -n "multMatrix107";
	rename -uid "AE7BEF37-48F8-4C52-0790-0893E76ACA49";
	setAttr -s 3 ".i";
	setAttr ".i[0]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".i[2]" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode decomposeMatrix -n "decomposeMatrix108";
	rename -uid "8607D067-48E1-93BE-889D-CC80E6739507";
createNode multMatrix -n "multMatrix108";
	rename -uid "30046AAC-4180-9BA4-CC4B-A9B2317E58E7";
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
	setAttr -s 2 ".r";
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
dataStructure -fmt "raw" -as "name=mapManager_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=notes_degraded:string=value";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=notes_ferns_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=notes_square_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchH_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_vgGroundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grasses:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquare_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=mapManager_circular:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBeauty_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane5:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocks:string=value";
dataStructure -fmt "raw" -as "name=notes_base:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrasStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_treesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_degraded:string=value";
dataStructure -fmt "raw" -as "name=notes_floor1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSC:string=value";
dataStructure -fmt "raw" -as "name=notes_vgFCarouselBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_cheat_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorA:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_hojas:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesFlowerBed_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left:string=value";
dataStructure -fmt "raw" -as "name=notes_ridePiggy_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayArea_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassA_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_original:string=value";
dataStructure -fmt "raw" -as "name=notes_midground_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_levelC:string=value";
dataStructure -fmt "raw" -as "name=keyValueStructure:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloProvi3:string=value";
dataStructure -fmt "raw" -as "name=notes_chocolateFountain_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_square_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayCircular_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_left:string=value";
dataStructure -fmt "raw" -as "name=notes_floorA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base:string=value";
dataStructure -fmt "raw" -as "name=notes_road_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayMain_Flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_leaves:string=value";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=notes_sidewalkGrassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_path:string=value";
dataStructure -fmt "raw" -as "name=mapManager_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_big_back:string=value";
dataStructure -fmt "raw" -as "name=notes_rightExterior_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_entrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=mapManager_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainTrail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassJuneBackYard_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_treesB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves:string=value";
dataStructure -fmt "raw" -as "name=notes_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_vegetation_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_left:string=value";
dataStructure -fmt "raw" -as "name=notes_grasses:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksFence_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor1:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloB:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=notes_grassC_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_levelC:string=value";
dataStructure -fmt "raw" -as "name=notes_leavesDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchDegraded_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_road_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloC:string=value";
dataStructure -fmt "raw" -as "name=notes_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=notes_big_back:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_mountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchG_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_new_sand:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantNextHouse_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersMain_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=notes_grassADecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySquareFlowers_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane3:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSideground:string=value";
dataStructure -fmt "raw" -as "name=notes_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwaySpaceland_Main_Leaves:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees:string=value";
dataStructure -fmt "raw" -as "name=mapManager_small_grass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesCDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sand_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_level1A:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersRightLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloP1:string=value";
dataStructure -fmt "raw" -as "name=notes_carouselStairs_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_leaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_railes:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundWoods_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_grassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnel:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassBase:string=value";
dataStructure -fmt "raw" -as "name=notes_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_decayFlowerBeds_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_groundB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=notes_terraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorGrassA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassDetail_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slabsAndStairsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchE_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyFlowersBedA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_concretesGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grassLeftMountains_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseLeaves:string=value";
dataStructure -fmt "raw" -as "name=notes_leftSpecific_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_barbacueHouseFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_geos:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsRight:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_CombinedGrass:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaCorner_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassesCenter_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_square_ground:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloorGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_terraceBush_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_throwbotLeft_scatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=notes_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_det:string=value";
dataStructure -fmt "raw" -as "name=notes_juneNbhHouseE_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesMountainsGrass_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_frogEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_arbustosScatt:string=value";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=mapManager_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesTrees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_riverSide:string=value";
dataStructure -fmt "raw" -as "name=notes_tunnelParkEntrance_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_circular:string=value";
dataStructure -fmt "raw" -as "name=notes_polySurface56:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassB_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_Suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_riverside_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_strap_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_widlPatchB_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA9:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=Blur3dMetaData:string=Blur3dValue";
dataStructure -fmt "raw" -as "name=notes_bricksTielMainStreet_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_groundRocks:string=value";
dataStructure -fmt "raw" -as "name=notes_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane6:string=value";
dataStructure -fmt "raw" -as "name=notes_tilesFloorDet:string=value";
dataStructure -fmt "raw" -as "name=notes_base_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane4:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_squareRocks_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_amp_lyref_cmp0010_layGround:string=value";
dataStructure -fmt "raw" -as "name=notes_groundPlane_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_vgtCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayRocket_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_snapshot_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloor:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tilesFloorDet:string=value";
dataStructure -fmt "raw" -as "name=notes_fountainRight_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopes:string=value";
dataStructure -fmt "raw" -as "name=notes_grassRightMountains:string=value";
dataStructure -fmt "raw" -as "name=notes_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=notes_grassScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatter:string=value";
dataStructure -fmt "raw" -as "name=mapManager_tunnel:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGround:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=mapManager_new_sand:string=value";
dataStructure -fmt "raw" -as "name=notes_floorSquare:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorFlower:string=value";
dataStructure -fmt "raw" -as "name=notes_frogL_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_slopes_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_scatterGround:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor_c_geo:string=value";
dataStructure -fmt "raw" -as "name=RenderSettings:string=preset";
dataStructure -fmt "raw" -as "name=notes_wildPatchF_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeavesCarousel_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_centerStreetGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiaryGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_small:string=value";
dataStructure -fmt "raw" -as "name=notes_bushesA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoB_parShape:string=value";
dataStructure -fmt "raw" -as "name=OffStruct:float=Offset";
dataStructure -fmt "raw" -as "name=notes_frogLeft_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_curbsGarden_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCDecay_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_beautyGrassPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayLeaves_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseForest:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_base_right:string=value";
dataStructure -fmt "raw" -as "name=notes_grass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_square_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA:string=value";
dataStructure -fmt "raw" -as "name=notes_baseForest:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_terracesSuelo:string=value";
dataStructure -fmt "raw" -as "name=notes_mainStreetMainstreetTrees04:string=value";
dataStructure -fmt "raw" -as "name=notes_det:string=value";
dataStructure -fmt "raw" -as "name=notes_grassD_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground03_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_base_left:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksTopiary:string=value";
dataStructure -fmt "raw" -as "name=notes_stairs_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_floorConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=TifLocation:string=Path";
dataStructure -fmt "raw" -as "name=mapManager_level1B_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_rockTerraces_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_small_grass:string=value";
dataStructure -fmt "raw" -as "name=mapManager_riverSide:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloC:string=value";
dataStructure -fmt "raw" -as "name=notes_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_level1A:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksGrounds:string=value";
dataStructure -fmt "raw" -as "name=notes_trees:string=value";
dataStructure -fmt "raw" -as "name=notes_Suelo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_throwbotLeftScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_path:string=value";
dataStructure -fmt "raw" -as "name=notes_testMode_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_decayGrassPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_curbsGardenGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_square_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_levelUnoA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_railwayGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=notes_groundC_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rocks:string=value";
dataStructure -fmt "raw" -as "name=notes_grassCampfire_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchD_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=mapManager_drawBridge_physPivot:string=value";
dataStructure -fmt "raw" -as "name=notes_heroesChoice_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_ground:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_Scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_fountainHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane2:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront:string=value";
dataStructure -fmt "raw" -as "name=mapManager_mountainCSB:string=value";
dataStructure -fmt "raw" -as "name=notes_treesRocksAnimalHome_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_floorOrangeConcrete_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloP2:string=value";
dataStructure -fmt "raw" -as "name=notes_original:string=value";
dataStructure -fmt "raw" -as "name=notes_vgTFicus39:string=value";
dataStructure -fmt "raw" -as "name=notes_grassB_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_grass_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_wasteLand_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slopesGroundGrassC_Combined:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo1:string=value";
dataStructure -fmt "raw" -as "name=notes_bushes_parShape:string=value";
dataStructure -fmt "raw" -as "name=OrgStruct:float[3]=Origin Point";
dataStructure -fmt "raw" -as "name=mapManager_walkwayRocket_flowers:string=value";
dataStructure -fmt "raw" -as "name=notes_floor_flowers:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorSquare:string=value";
dataStructure -fmt "raw" -as "name=mapManager_restaurantBack:string=value";
dataStructure -fmt "raw" -as "name=notes_hotelBack_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_geos:string=value";
dataStructure -fmt "raw" -as "name=mapManager_bricksTopiary_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_baseScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_right_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_flowersSquare:string=value";
dataStructure -fmt "raw" -as "name=notes_wildPatchA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined1:string=value";
dataStructure -fmt "raw" -as "name=notes_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=notes_center_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grass_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_grassBase:string=value";
dataStructure -fmt "raw" -as "name=mapManager_groundRocks:string=value";
dataStructure -fmt "raw" -as "name=mapManager_scatt:string=value";
dataStructure -fmt "raw" -as "name=notes_background_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_mountainsCSA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=notes_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=notes_railes:string=value";
dataStructure -fmt "raw" -as "name=notes_flowersHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=IdStruct:int32=ID";
dataStructure -fmt "raw" -as "name=notes_ground_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_holeRock_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floor:string=value";
dataStructure -fmt "raw" -as "name=notes_treesRocksHA_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_slopesGroundGrassD_Combined:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA8:string=value";
dataStructure -fmt "raw" -as "name=notes_left_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_floorScatt:string=value";
dataStructure -fmt "raw" -as "name=notes_pPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_trees_left1:string=value";
dataStructure -fmt "raw" -as "name=notes_groundA_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_rockCheated_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_grassGround_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_midgroundPlane:string=value";
dataStructure -fmt "raw" -as "name=mapManager_juneBackYard:string=value";
dataStructure -fmt "raw" -as "name=notes_floorCampfire:string=value";
dataStructure -fmt "raw" -as "name=notes_bridge_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_terraceGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_restaurantFront_parShape:string=value";
dataStructure -fmt "raw" -as "name=mapManager_backWall_c_geo:string=value";
dataStructure -fmt "raw" -as "name=mapManager_sueloB:string=value";
dataStructure -fmt "raw" -as "name=notes_rockSignRollo_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_stoneFloor_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_suelo:string=value";
dataStructure -fmt "raw" -as "name=notes_bricksCurbsGrass_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_sueloA:string=value";
dataStructure -fmt "raw" -as "name=notes_snapshot_Combined2:string=value";
dataStructure -fmt "raw" -as "name=notes_trees_parShape:string=value";
dataStructure -fmt "raw" -as "name=notes_slideSundaeRightScatt:string=value";
dataStructure -fmt "raw" -as "name=mapManager_suelofuente:string=value";
dataStructure -fmt "raw" -as "name=mapManager_rocskLeftPLA:string=value";
dataStructure -fmt "raw" -as "name=mapManager_concretePath_c_geo:string=value";
dataStructure -fmt "raw" -as "name=notes_walkwayAreaC_parShape:string=value";
// End of body_guide.ma
