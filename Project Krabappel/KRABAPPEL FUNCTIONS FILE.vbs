'MISC functions <<<<<<<<<<MERGE INTO FUNCTIONS FILE, THANKS TO LUKE

Function add_months(D,E,F)
  'D = months to Add or Subtract 
  'E = Starting Date
  'F = Var to name the return variable
  calc_date = DateAdd("m", D, E)
  A = calc_date
  B = calc_date
  C = calc_date	
  A = Replace(Left(A, 2), "/", "")
  If len(A) = 1 then A = "0"&A
  If Mid(Mid(B, 3, 3),2,1) = "/" then
	B = "0"&Left(Mid(B, 3, 3),1)
  ElseIf Mid(Mid(B, 3, 3),2,1) <> "/" then
	B = Replace(Mid(B, 3, 3), "/", "")
	If len(B) = 1 then B = "0"&B
  End If
  C = Right(C,2)
  F = A & "/" & B & "/" & C
End Function

Function maxis_dater(A,B,C)
	'A = Input Date
	'B = Output Date Name
	'C = Specific name of date type
	
	error_message = "The date you used for your "& C &" is not a recognizable date format or was left blank."
	error_message_title = "Incorrect date format found."
	
	A = trim(A)
	A = replace(A, " ", "          ")
	A = replace(A, "  ", "          ")
	A = replace(A, "/", "          ")
	A = replace(A, "\", "          ")
	A = replace(A, "-", "          ")
	A = replace(A, ".", "          ")
	A = replace(A, ",", "          ")
	If InStr(A,"          ") = 0 then
		Do
			X = Len(A)
			If X < 4 or X > 8 then
				A = ""
				MsgBox error_message, error_message_title
				Exit Do				
			ElseIf X = 4 then
				If Left(A,2) = Left(year(now), 2) then
					A = ""
					MsgBox error_message, error_message_title
					Exit Do
				ElseIf Left(A,2) <> Left(year(now), 2) then
					valid_date = MsgBox("Did you mean: 0"&Left(A,1)&"/0"&Mid(A,2,1)&"/"&Right(A,2)&" for your "&C&"?",4,"Date Validation")
					If valid_date = 6 then 
						A = "0"&Left(A,1)&"/0"&Mid(A,2,1)&"/" & Right(A,2)
						Exit Do
					ElseIf valid_date = 7 then
						A = ""
						MsgBox error_message, error_message_title
						Exit Do
					End If
				End If
			ElseIf X = 5 then
				If Left(A,1) <> "0" then
					valid_date = MsgBox("Did you mean: 0"&Left(A,1)&"/"&Mid(A,2,2)&"/"&Right(A,2)&" for your "&C&"?",4,"Date Validation")
					If valid_date = 6 then 
						A = "0"&Left(A,1)&"/"&Mid(A,2,2)&"/"&Right(A,2)
						Exit Do
					End If
					If valid_date = 7 then valid_date = MsgBox("Did you mean: "&Left(A,2)&"/0"&Mid(A,3,1)&"/"&Right(A,2)&" for your "&C&"?",4,"Date Validation")
					If valid_date = 6 then 
						A = Left(A,2)&"/0"&Mid(A,3,1)&"/"&Right(A,2)
						Exit Do
					End If
					If valid_date = 7 then
						A = ""
						MsgBox error_message, error_message_title
						Exit Do
					End If
				ElseIf Left(A,1) = "0" then
					valid_date = MsgBox("Did you mean: "&Left(A,2)&"/0"&Mid(A,3,1)&"/"&Right(A,2)&" for your "&C&"?",4,"Date Validation")
					If valid_date = 6 then A = Left(A,2)&"/0"&Mid(A,3,1)&"/"&Right(A,2)
					If valid_date = 7 then
						A = ""
						MsgBox error_message, error_message_title
						Exit Do
					End If
				End If
			ElseIf X = 6 then
				If Left(A,1) <> "0" then
					valid_date = MsgBox("Did you mean: "&Left(A,2)&"/"&Mid(A,3,2)&"/"&Right(A,2)&" for your "&C&"?",4,"Date Validation")
					If valid_date = 6 then 
						A = Left(A,2)&"/"&Mid(A,3,2)&"/"&Right(A,2)
						Exit Do
					End If
					If valid_date = 7 then valid_date = MsgBox("Did you mean: 0"&Left(A,1)&"/0"&Mid(A,2,1)&"/"&Right(A,2)&" for your "&C&"?",4,"Date Validation")
					If valid_date = 6 then 
						A = "0"&Left(A,1)&"/0"&Mid(A,2,1)&"/"&Right(A,2)
						Exit Do
					End If
					If valid_date = 7 then
						A = ""
						MsgBox error_message, error_message_title
						Exit Do
					End If
				ElseIf Left(A,1) = "0" then
					valid_date = MsgBox("Did you mean: "&Left(A,2)&"/"&Mid(A,3,2)&"/"&Right(A,2)&" for your "&C&"?",4,"Date Validation")
					If valid_date = 6 then A = Left(A,2)&"/"&Mid(A,3,2)&"/"&Right(A,2)
					If valid_date = 7 then
						A = ""
						MsgBox error_message, error_message_title
						Exit Do
					End If
				End If
			ElseIf X = 7 then
				If Left(A,1) <> "0" then
					valid_date = MsgBox("Did you mean: 0"&Left(A,1)&"/"&Mid(A,2,2)&"/"&Right(A,2)&" for your "&C&"?",4,"Date Validation")
					If valid_date = 6 then 
						A = "0"&Left(A,1)&"/"&Mid(A,2,2)&"/"&Right(A,2)
						Exit Do
					End If
					If valid_date = 7 then valid_date = MsgBox("Did you mean: "&Left(A,2)&"/0"&Mid(A,3,1)&"/"&Right(A,2)&" for your "&C&"?",4,"Date Validation")
					If valid_date = 6 then 
						A = Left(A,2)&"/0"&Mid(A,3,1)&"/"&Right(A,2)
						Exit Do
					End If
					If valid_date = 7 then
						A = ""
						MsgBox error_message, error_message_title
						Exit Do
					End If
				ElseIf Left(A,1) = "0" then
					valid_date = MsgBox("Did you mean: "&Left(A,2)&"/0"&Mid(A,3,1)&"/"&Right(A,2)&" for your "&C&"?",4,"Date Validation")
					If valid_date = 6 then A = Left(A,2)&"/0"&Mid(A,3,1)&"/"&Right(A,2)
					If valid_date = 7 then
						A = ""
						MsgBox error_message, error_message_title
						Exit Do
					End If
				End If
			ElseIf X = 8 then
				valid_date = MsgBox("Did you mean: "&Left(A,2)&"/"&Mid(A,3,2)&"/"&Right(A,2)&" for your "&C&"?",4,"Date Validation")
				If valid_date = 6 then 
					A = Left(A,2)&"/"&Mid(A,3,2)&"/"&Right(A,2)
					Exit Do
				End If
				If valid_date = 7 then
					A = ""
					MsgBox error_message,error_message_title
					Exit Do
				End If
			End If
		Loop until valid_date = 6
	ElseIf InStr(A,"          ") <> 0 then 
		X = trim(Left(A, 5))
		If len(X) = 1 then X = "0" & X
		Y = trim(Mid(A, 5, 10))
		If len(Y) = 1 then Y = "0" & Y
		Z = trim(Right(A, 5))	
		If len(Z) = 4 then Z = Right(Z, 2)
		B = X & "/" & Y & "/" & Z
	End If	
End Function

Function debugger()
	EMReadScreen panel_error_found, 80, 24, 1
	panel_error_found = trim(panel_error_found)
	If panel_error_found <> "" then
		msgbox("Error Found: " & panel_error_found)
	End If
End Function

'Excel Function <<<<<<<MERGE INTO FUNCTIONS FILE, THANKS TO LUKE

Function excel_open(file_url, visible_status, alerts_status, ObjExcel, objWorkbook)
	Set objExcel = CreateObject("Excel.Application") 'Allows a user to perform functions within Microsoft Excel
	objExcel.Visible = visible_status
	Set objWorkbook = objExcel.Workbooks.Open(file_url) 'Opens an excel file from a specific URL
	objExcel.DisplayAlerts = alerts_status
End Function

'BIG SLEW OF MAXIS WRITE FUNCTIONS------------------------------------------------------------------------------------------
Function write_panel_to_MAXIS_ABPS(abps_supp_coop,abps_gc_status)
	call navigate_to_screen("STAT","PARE")							'Starts by creating an array of all the kids on PARE
	EMReadScreen abps_pare_check, 1, 2, 78
	If abps_pare_check = "0" then
		MsgBox "No PARE exists. Exiting Creating ABPS."
	ElseIf abps_pare_check <> "0" then
		child_list = ""
		row = 8
		Do
			EMReadScreen child_check, 2, row, 24
			If child_check <> "__" then
				If child_list = "" then
					child_list = child_check
				ElseIf child_list <> "" then		
					child_list = child_list & "," & child_check
				End If
			End If
			row = row + 1
			If row = 18 then
				PF8
				row = 8
			End If
		Loop until child_check = "__"
		call navigate_to_screen("STAT","ABPS")						'Navigates to ABPS to enter kids in
		call create_panel_if_nonexistent		
		abps_child_list = split(child_list, ",")
		row = 15
		for each abps_child in abps_child_list
			EMWriteScreen abps_child, row, 35
			EMWriteScreen "2", row, 53
			EMWriteScreen "1", row, 67
			row = row + 1
			If row = 18 then
				PF8
				row = 15
			End If		
		next
		call MAXIS_dater(date, abps_act_date, "Actual Date")
		EMWriteScreen left(abps_act_date,2)			, 18, 38
		EMWriteScreen mid(abps_act_date,4,2)		, 18, 41
		EMWriteScreen "20" & right(abps_act_date,2)	, 18, 44
		EMWriteScreen reference_number, 4, 47		'Enters the reference_number
		If abps_supp_coop <> "" then
			abps_supp_coop = ucase(abps_supp_coop)
			abps_supp_coop = left(abps_supp_coop,1)
			EMWriteScreen abps_supp_coop, 4, 73
		End If
		If abps_gc_status <> "" then
			EMWriteScreen abps_gc_status, 5, 47
		End If
		transmit
	End If
End Function

Function write_panel_to_MAXIS_ACCT(acct_type, acct_numb, acct_location, acct_balance, acct_bal_ver, acct_date, acct_withdraw, acct_cash_count, acct_snap_count, acct_HC_count, acct_GRH_count, acct_IV_count, acct_joint_owner, acct_share_ratio, acct_interest_date_mo, acct_interest_date_yr)
	Call Navigate_to_screen("STAT", "ACCT")  'navigates to the stat panel
	call create_panel_if_nonexistent
	Emwritescreen acct_type, 6, 44  'enters the account type code
	Emwritescreen acct_numb, 7, 44  'enters the account number
	Emwritescreen acct_location, 8, 44  'enters the account location
	Emwritescreen acct_balance, 10, 46  'enters the balance
	Emwritescreen acct_bal_ver, 10, 63  'enters the balance verification
	call create_MAXIS_friendly_date(acct_date, 0, 11, 44)  'enters the account balance date in a MAXIS friendly format. mm/dd/yy
	Emwritescreen acct_withdraw, 12, 46  'enters the withdrawl penalty
	Emwritescreen acct_cash_count, 14, 50  'enters y/n if counted for cash
	Emwritescreen acct_snap_count, 14, 57  'enters y/n if counted for snap
	Emwritescreen acct_HC_count, 14, 64  'enters y/n if counted for HC
	Emwritescreen acct_GRH_count, 14, 72  'enters y/n if counted for grh
	Emwritescreen acct_IV_count, 14, 80  'enters y/n if counted for IV
	Emwritescreen acct_joint_owner, 15, 44  'enters if it is a jointly owned acct
	Emwritescreen left(acct_share_ratio, 1), 15, 76  'enters the ratio of ownership using the left 1 digit of what is entered into the file
	Emwritescreen right(acct_share_ratio, 1), 15, 80  'enters the ratio of ownership using the right 1 digit of what is entered into the file
	Emwritescreen acct_interest_date_mo, 17, 57  'enters the next interest date MM format
	Emwritescreen acct_interest_date_yr, 17, 60  'enters the next interest date YY format
	transmit
	transmit
End Function

FUNCTION write_panel_to_MAXIS_ACUT(ACUT_shared, ACUT_heat, ACUT_air, ACUT_electric, ACUT_fuel, ACUT_garbage, ACUT_water, ACUT_sewer, ACUT_other, ACUT_phone, ACUT_heat_verif, ACUT_air_verif, ACUT_electric_verif, ACUT_fuel_verif, ACUT_garbage_verif, ACUT_water_verif, ACUT_sewer_verif, ACUT_other_verif)
	call navigate_to_screen("STAT", "ACUT")
	call create_panel_if_nonexistent
		EMWritescreen ACUT_shared, 6, 42
		EMWritescreen ACUT_heat, 10, 61
		EMWritescreen ACUT_air, 11, 61
		EMWritescreen ACUT_electric, 12, 61
		EMWritescreen ACUT_fuel, 13, 61
		EMWritescreen ACUT_garbage, 14, 61
		EMWritescreen ACUT_water, 15, 61
		EMWritescreen ACUT_sewer, 16, 61
		EMWritescreen ACUT_other, 17, 61
		EMWritescreen ACUT_heat_verif, 10, 55
		EMWritescreen ACUT_air_verif, 11, 55
		EMWritescreen ACUT_electric_verif, 12, 55
		EMWritescreen ACUT_fuel_verif, 13, 55
		EMWritescreen ACUT_garbage_verif, 14, 55
		EMWritescreen ACUT_water_verif, 15, 55
		EMWritescreen ACUT_sewer_verif, 16, 55
		EMWritescreen ACUT_other_verif, 17, 55
		EMWritescreen Left(ACUT_phone, 1), 18, 55
	transmit
end function

'---This function writes using the variables read off of the specialized excel template to the busi panel in MAXIS
Function write_panel_to_MAXIS_BUSI(busi_type, busi_start_date, busi_end_date, busi_cash_total_retro, busi_cash_total_prosp, busi_cash_total_ver, busi_IV_total_prosp, busi_IV_total_ver, busi_snap_total_retro, busi_snap_total_prosp, busi_snap_total_ver, busi_hc_total_prosp_a, busi_hc_total_ver_a, busi_hc_total_prosp_b, busi_hc_total_ver_b, busi_cash_exp_retro, busi_cash_exp_prosp, busi_cash_exp_ver, busi_IV_exp_prosp, busi_IV_exp_ver, busi_snap_exp_retro, busi_snap_exp_prosp, busi_snap_exp_ver, busi_hc_exp_prosp_a, busi_hc_exp_ver_a, busi_hc_exp_prosp_b, busi_hc_exp_ver_b, busi_retro_hours, busi_prosp_hours, busi_hc_total_est_a, busi_hc_total_est_b, busi_hc_exp_est_a, busi_hc_exp_est_b, busi_hc_hours_est)
	Call navigate_to_screen("STAT", "BUSI")  'navigates to the stat panel
	call create_panel_if_nonexistent
	Emwritescreen busi_type, 5, 37  'enters self employment type
	call create_MAXIS_friendly_date(busi_start_date, 0, 5, 54)  'enters self employment start date in MAXIS friendly format mm/dd/yy
	call create_MAXIS_friendly_date(busi_end_date, 0, 5, 71)  'enters self employment start date in MAXIS friendly format mm/dd/yy
	Emwritescreen "x", 7, 26  'this enters into the gross income calculator
	Transmit
	Do
		Emreadscreen busi_gross_income_check, 12, 06, 35  'This checks to see if the gross income calculator has actually opened. 
		If busi_gross_income_check = "Gross Income" then  'If it has opened then it will enter the information, if not it will loop until it has then enter.
			Emwritescreen busi_cash_total_retro, 9, 43  'enters the cash total income retrospective number
			Emwritescreen busi_cash_total_prosp, 9, 59  'enters the cash total income prospective number
			Emwritescreen busi_cash_total_ver, 9, 73    'enters the cash total income verification code
			Emwritescreen busi_IV_total_prosp, 10, 59   'enters the IV total income prospective number
			Emwritescreen busi_IV_total_ver, 10, 73     'enters the IV total income verification code
			Emwritescreen busi_snap_total_retro, 11, 43 'enters the snap total income retro number
			Emwritescreen busi_snap_total_prosp, 11, 59 'enters the snap total income prosp number
			Emwritescreen busi_snap_total_ver, 11, 73   'enters the snap total verification code
			Emwritescreen busi_hc_total_prosp_a, 12, 59 'enters the HC total income prospective number for method a
			Emwritescreen busi_hc_total_ver_a, 12, 73   'enters the HC total income verification code for method a
			Emwritescreen busi_hc_total_prosp_b, 13, 59 'enters the HC total income prospective number for method b
			Emwritescreen busi_hc_total_ver_b, 13, 73   'enters the HC total income verification code for method b
			Emwritescreen busi_cash_exp_retro, 15, 43   'enters the cash expenses retrospective number
			Emwritescreen busi_cash_exp_prosp, 15, 59   'enters the cash expenses prospective number
			Emwritescreen busi_cash_exp_ver, 15, 73     'enters the cash expenses verification code
			Emwritescreen busi_IV_exp_prosp, 16, 59     'enters the IV expenses retro number
			Emwritescreen busi_IV_exp_ver, 9, 73        'enters the IV expenses verification code
			Emwritescreen busi_snap_exp_retro, 17, 43   'enters the snap expenses retro number
			Emwritescreen busi_snap_exp_prosp, 17, 59   'enters the snap expenses prospective number
			Emwritescreen busi_snap_exp_ver, 17, 73     'enters the snap expenses verif code
			Emwritescreen busi_hc_exp_prosp_a, 18, 59   'enters the hc expenses prospective number for method a
			Emwritescreen busi_hc_exp_ver, a, 18, 73    'enters the hc expenses verification code for method a
			Emwritescreen busi_hc_exp_prosp_b, 19, 59   'enters the hc expenses prospective number for method b
			Emwritescreen busi_hc_exp_ver_b, 19, 73	  'enters the hc expenses verification code for method b
		End IF
	Loop until busi_gross_income_check = "Gross Income"
	pf3
	Emwritescreen busi_retro_hours, 14, 59  'enters the retrospective hours
	Emwritescreen busi_prosp_hours, 14, 73  'enters the prospective hours
	'determine if benefit month is month +1. Bene_month needs to be multiplied by one because it is saved as a string. Converts it to a number.
	Emreadscreen bene_month, 20, 55  
	IF (bene_month * 1 = (datepart("M", date)+1)) THEN 'if the month is current month + 1 then information can be entered on the hc income estimator
		Emwritescreen "x", 17, 29
		transmit
		Do
			Emreadscreen busi_hc_income_estimate_check, 18, 04, 42
			If busi_hc_income_estimate_check = "HC Income Estimate" then  'if the income estimator is open it will enter the data.
				Emwritescreen busi_hc_total_est_a, 7, 54                'enters hc total income estimation for method A
				Emwritescreen busi_hc_total_est_b, 8, 54                'enters hc total income estimation for method B
				Emwritescreen busi_hc_exp_est_a, 11, 54                 'enters hc expense estimation for method A
				Emwritescreen busi_hc_exp_est_b, 12, 54                 'enters hc expense estimation for method B
				Emwritescreen busi_hc_hours_est, 18, 58                 'enters hc hours estimation
				pf3									  'exits hc income estimator pop-up
			End If
		Loop until busi_hc_income_estimate_check = "HC Income Estimate"  'looks until hc income estimator actually opens.
	End IF
end function

Function write_panel_to_MAXIS_CARS(cars_type, cars_year, cars_make, cars_model, cars_trade_in, cars_loan, cars_value_source, cars_ownership_ver, cars_amount_owed, cars_amount_owed_ver, cars_date, cars_owed_as_of, cars_use, cars_HC_benefit, cars_joint_owner, cars_share_ratio)
	Call Navigate_to_screen("STAT", "CARS")  'navigates to the stat screen
	call create_panel_if_nonexistent
	Emwritescreen cars_type, 6, 43  'enters the vehicle type
	Emwritescreen cars_year, 8, 31  'enters the vehicle year
	Emwritescreen cars_make, 8, 43  'enters the vehicle make
	Emwritescreen cars_model, 8, 66  'enters the vehicle model
	Emwritescreen cars_trade_in, 9, 45  'enters the trade in value
	Emwritescreen cars_loan, 9, 62  'enters the loan value
	Emwritescreen cars_value_source, 9, 80  'enters the source of value information
	Emwritescreen cars_ownership_ver, 10, 60  'enters the ownership verification code
	Emwritescreen cars_amount_owed, 12, 45  'enters the amount owed on vehicle
	Emwritescreen cars_amount_owed_ver, 12, 60  'enters the amount owed verification code
	call create_MAXIS_friendly_date(cars_date, 0, 13, 43)  'enters the amouted owed as of date in a MAXIS friendly format. mm/dd/yy
	Emwritescreen cars_use, 15, 43  'enters the use code for the vehicle
	Emwritescreen cars_HC_benefit, 15, 76  'enters if the vehicle is for client benefit
	Emwritescreen cars_joint_owner, 16, 43  'enters if it is a jointly owned car
	Emwritescreen left(cars_share_ratio, 1), 16, 76  'enters the ratio of ownership using the left 1 digit of what is entered into the file
	Emwritescreen right(cars_share_ratio, 1), 16, 80  'enters the ratio of ownership using the right 1 digit of what is entered into the file
End Function

'---This function writes using the variables read off of the specialized excel template to the cash panel in MAXIS
Function write_panel_to_MAXIS_CASH(cash_amount)
	Call navigate_to_screen("STAT", "CASH")  'navigates to the stat panel
	call create_panel_if_nonexistent
	Emwritescreen cash_amount, 8, 39
End Function

FUNCTION write_panel_to_MAXIS_DCEX(DCEX_provider, DCEX_reason, DCEX_subsidy, DCEX_child_number1, DCEX_child_number1_ver, DCEX_child_number1_retro, DCEX_child_number1_pro, DCEX_child_number2, DCEX_child_number2_ver, DCEX_child_number2_retro, DCEX_child_number2_pro, DCEX_child_number3, DCEX_child_number3_ver, DCEX_child_number3_retro, DCEX_child_number3_pro, DCEX_child_number4, DCEX_child_number4_ver, DCEX_child_number4_retro, DCEX_child_number4_pro, DCEX_child_number5, DCEX_child_number5_ver, DCEX_child_number5_retro, DCEX_child_number5_pro, DCEX_child_number6, DCEX_child_number6_ver, DCEX_child_number6_retro, DCEX_child_number6_pro)
	call navigate_to_screen("STAT", "DCEX") 
	call create_panel_if_nonexistent
	EMWritescreen DCEX_provider, 6, 47
	EMWritescreen DCEX_reason, 7, 44
	EMWritescreen DCEX_subsidy, 8, 44
	EMWritescreen DCEX_child_number1, 11, 29
	EMWritescreen DCEX_child_number2, 12, 29
	EMWritescreen DCEX_child_number3, 13, 29
	EMWritescreen DCEX_child_number4, 14, 29
	EMWritescreen DCEX_child_number5, 15, 29
	EMWritescreen DCEX_child_number6, 16, 29
	EMWritescreen DCEX_child_number1_ver, 11, 41
	EMWritescreen DCEX_child_number2_ver, 12, 41
	EMWritescreen DCEX_child_number3_ver, 13, 41
	EMWritescreen DCEX_child_number4_ver, 14, 41
	EMWritescreen DCEX_child_number5_ver, 15, 41
	EMWritescreen DCEX_child_number6_ver, 16, 41
	EMWritescreen DCEX_child_number1_retro, 11, 48
	EMWritescreen DCEX_child_number2_retro, 12, 48
	EMWritescreen DCEX_child_number3_retro, 13, 48
	EMWritescreen DCEX_child_number4_retro, 14, 48
	EMWritescreen DCEX_child_number5_retro, 15, 48
	EMWritescreen DCEX_child_number6_retro, 16, 48
	EMWritescreen DCEX_child_number1_pro, 11, 63
	EMWritescreen DCEX_child_number2_pro, 11, 63
	EMWritescreen DCEX_child_number3_pro, 11, 63
	EMWritescreen DCEX_child_number4_pro, 11, 63
	EMWritescreen DCEX_child_number5_pro, 11, 63
	EMWritescreen DCEX_child_number6_pro, 11, 63
	transmit
End function

FUNCTION write_panel_to_MAXIS_DIET(DIET_mfip_1, DIET_mfip_1_ver, DIET_mfip_2, DIET_mfip_2_ver, DIET_msa_1, DIET_msa_1_ver, DIET_msa_2, DIET_msa_2_ver, DIET_msa_3, DIET_msa_3_ver, DIET_msa_4, DIET_msa_4_ver)
	call navigate_to_screen("STAT", "DIET")
	EMWriteScreen reference_number, 20, 76
	EMWriteScreen "NN", 20, 79
	transmit

	EMWriteScreen DIET_mfip_1, 8, 40
	EMWriteScreen DIET_mfip_1_ver, 8, 51
	EMWriteScreen DIET_mfip_2, 9, 40
	EMWriteScreen DIET_mfip_2_ver, 9, 51
	EMWriteScreen DIET_msa_1, 11, 40
	EMWriteScreen DIET_msa_1_ver, 11, 51
	EMWriteScreen DIET_msa_2, 12, 40
	EMWriteScreen DIET_msa_2_ver, 12, 51
	EMWriteScreen DIET_msa_3, 13, 40
	EMWriteScreen DIET_msa_3_ver, 13, 51
	EMWriteScreen DIET_msa_4, 14, 40
	EMWriteScreen DIET_msa_4_ver, 14, 51
	transmit
END FUNCTION

'---This function writes using the variables read off of the specialized excel template to the disa panel in MAXIS
Function write_panel_to_MAXIS_DISA(disa_begin_date, disa_end_date, disa_cert_begin, disa_cert_end, disa_wavr_begin, disa_wavr_end, disa_grh_begin, disa_grh_end, disa_cash_status, disa_cash_status_ver, disa_snap_status, disa_snap_status_ver, disa_hc_status, disa_hc_status_ver, disa_waiver, disa_drug_alcohol)
	Call navigate_to_screen("STAT", "DISA")  'navigates to the stat panel
	call create_panel_if_nonexistent
	call create_MAXIS_friendly_date(disa_begin_date, 0, 6, 47)  'enters the disability begin date in a MAXIS friendly format. mm/dd/yy
	call create_MAXIS_friendly_date(disa_end_date, 0, 6, 69)  'enters the disability end date in a MAXIS friendly format. mm/dd/yy
	call create_MAXIS_friendly_date(disa_cert_begin, 0, 7, 47)  'enters the disability certification begin date in a MAXIS friendly format. mm/dd/yy
	call create_MAXIS_friendly_date(disa_cert_end, 0, 7, 69)  'enters the disability certification end date in a MAXIS friendly format. mm/dd/yy
	call create_MAXIS_friendly_date(disa_wavr_begin, 0, 8, 47)  'enters the disability waiver begin date in a MAXIS friendly format. mm/dd/yy
	call create_MAXIS_friendly_date(disa_wavr_end, 0, 8, 69)  'enters the disability waiver end date in a MAXIS friendly format. mm/dd/yy
	call create_MAXIS_friendly_date(disa_ghr_begin, 0, 9, 47)  'enters the disability ghr begin date in a MAXIS friendly format. mm/dd/yy
	call create_MAXIS_friendly_date(disa_ghr_end, 0, 9, 69)  'enters the disability ghr end date in a MAXIS friendly format. mm/dd/yy
	Emwritescreen disa_cash_status, 11, 59  'enters status code for cash disa status
	Emwritescreen disa_cash_status_ver, 11, 69  'enters verification code for cash disa status
	Emwritescreen disa_snap_status, 12, 59  'enters status code for snap disa status
	Emwritescreen disa_snap_status_ver, 12, 69  'enters verification code for snap disa status
	Emwritescreen disa_hc_status, 13, 59  'enters status code for hc disa status
	Emwritescreen disa_hc_status_ver, 13, 69  'enters verification code for hc disa status
	Emwritescreen disa_waiver, 14, 59  'enters home and comminuty waiver code
	Emwritescreen disa_1619, 16, 59  'enters 1619 status
	Emwritescreen disa_drug_alcohol, 18, 69  'enters material drug & alcohol verification
End Function

Function write_panel_to_MAXIS_DSTT(DSTT_ongoing_income, DSTT_HH_income_stop_date, DSTT_income_expected_amt)
	call navigate_to_screen("STAT", "DSTT")
	call ERRR_screen_check
	call create_panel_if_nonexistent
	EMWriteScreen DSTT_ongoing_income, 6, 69
	call create_MAXIS_friendly_date(HH_income_stop_date, 0, 9, 69)
	EMWriteScreen income_expected_amt, 12, 71
End function

FUNCTION write_panel_to_MAXIS_EATS(eats_together, eats_boarder, eats_group_one, eats_group_two, eats_group_three)
	IF reference_number = "01" THEN
		call navigate_to_screen("STAT", "EATS")
		call create_panel_if_nonexistent
		EMWriteScreen eats_together, 4, 72
		EMWriteScreen eats_boarder, 5, 72
		IF ucase(eats_together) = "N" THEN
			EMWriteScreen "01", 13, 28
			eats_group_one = replace(eats_group_one, " ", "")
			eats_group_one = split(eats_group_one, ",")
			eats_col = 39
			FOR EACH eats_household_member IN eats_group_one
				EMWriteScreen eats_household_member, 13, eats_col
				eats_col = eats_col + 4
			NEXT
			EMWriteScreen "02", 14, 28
			eats_group_two = replace(eats_group_two, " ", "")
			eats_group_two = split(eats_group_two, ",")
			eats_col = 39
			FOR EACH eats_household_member IN eats_group_two
				EMWriteScreen eats_household_member, 14, eats_col
				eats_col = eats_col + 4
			NEXT
			IF eats_group_three <> "" THEN
				EMWriteScreen "03", 15, 28
				eats_group_three = replace(eats_group_three, " ", "")
				eats_group_three = split(eats_group_three, ",")
				eats_col = 39
				FOR EACH eats_household_member IN eats_group_three
					EMWriteScreen eats_household_member, 15, eats_col
					eats_col = eats_col + 4
				NEXT
			END IF
		END IF
	transmit
	END IF
END FUNCTION

Function write_panel_to_MAXIS_EMMA(EMMA_medical_emergency, EMMA_health_consequence, EMMA_verification, EMMA_begin_date, EMMA_end_date)
	call navigate_to_screen("STAT", "EMMA")
	call ERRR_screen_check
	call create_panel_if_nonexistent
	EMWriteScreen EMMA_medical_emergency, 6, 46
	EMWriteScreen EMMA_health_consequence, 8, 46
	EMWriteScreen EMMA_verification, 10, 46
	call create_MAXIS_friendly_date(EMMA_begin_date, 0, 12, 46)
	call create_MAXIS_friendly_date(EMMA_end_date, 0, 14, 46)
End function

FUNCTION write_panel_to_MAXIS_EMPS(EMPS_orientation_date, EMPS_orientation_attended, EMPS_good_cause, EMPS_sanc_begin, EMPS_sanc_end, EMPS_memb_at_home, EMPS_care_family, EMPS_crisis, EMPS_hard_employ, EMPS_under1, EMPS_DWP_date)
	call navigate_to_screen("STAT", "EMPS")
	call create_panel_if_nonexistent
	If EMPS_orientation_date <> "" then call create_MAXIS_friendly_date(EMPS_orientation_date, 0, 5, 39) 'enter orientation date
	EMWritescreen left(EMPS_orientation_attended, 1), 5, 65 
	EMWritescreen EMPS_good_cause, 5, 79
	If EMPS_sanc_begin <> "" then call create_MAXIS_friendly_date(EMPS_sanc_begin, 1, 6, 39) 'Sanction begin date
	If EMPS_sanc_end <> "" then call create_MAXIS_friendly_date(EMPS_sanc_end, 1, 6, 65) 'Sanction end date
	EMWritescreen left(EMPS_memb_at_home, 1), 8, 76
	EMWritescreen left(EMPS_care_family, 1), 9, 76
	EMWritescreen left(EMPS_crisis, 1), 10, 76
	EMWritescreen EMPS_hard_employ, 11, 76
	EMWritescreen left(EMPS_under1, 1), 12, 76
	EMWritescreen "n", 13, 76 'enters n for child under 12 weeks
	If EMPS_DWP_date <> "" then call create_MAXIS_friendly_date(EMPS_DWP_date, 1, 17, 40) 'DWP plan date
End Function	

Function write_panel_to_MAXIS_FACI(FACI_vendor_number, FACI_name, FACI_type, FACI_FS_eligible, FACI_FS_facility_type, FACI_date_in, FACI_date_out)
	call navigate_to_screen("STAT", "FACI")
	call ERRR_screen_check
	call create_panel_if_nonexistent
	EMWriteScreen FACI_vendor_number, 5, 43
	EMWriteScreen FACI_name, 6, 43
	EMWriteScreen FACI_type, 7, 43
	EMWriteScreen FACI_FS_eligible, 8, 43
	If FACI_date_in <> "" then 
		call create_MAXIS_friendly_date(FACI_date_in, 0, 14, 47)
		EMWriteScreen datepart("YYYY", FACI_date_in), 14, 53
	End if
	If FACI_date_out <> "" then 
		call create_MAXIS_friendly_date(FACI_date_out, 0, 14, 71)
		EMWriteScreen datepart("YYYY", FACI_date_out), 14, 77
	End if
	transmit
	transmit
End function

Function write_panel_to_MAXIS_HCRE(hcre_appl_addnd_date_input,hcre_retro_months_input,hcre_recvd_by_service_date_input)
	call navigate_to_screen("STAT","HCRE")
	call create_panel_if_nonexistent
	'Converting the Appl Addendum Date into a usable format
	call MAXIS_dater(hcre_appl_addnd_date_input, hcre_appl_addnd_date_output, "HCRE Addendum Date") 
	'Converting the Received by service date into a usable format
	call MAXIS_dater(hcre_recvd_by_service_date_input, hcre_recvd_by_service_date_output, "received by Service Date") 
	'Converts Retro Months Input into a negative
	hcre_retro_months_input = (Abs(hcre_retro_months_input)*(-1))
	call add_months(hcre_retro_months_input,hcre_appl_addnd_date_output,hcre_retro_date_output)
	row = 1
	col = 1
	EMSearch "* " & reference_number, row, col
		'Appl Addendum Request Date
	EMWriteScreen left(hcre_appl_addnd_date_output,2)		, row, col + 29	
	EMWriteScreen mid(hcre_recvd_by_service_date_input,4,2)	, row, col + 32	
	EMWriteScreen right(hcre_appl_addnd_date_output,2)		, row, col + 35
		'Coverage Request Date
	EMWriteScreen left(hcre_retro_date_output,2)	, row, col + 42	
	EMWriteScreen right(hcre_retro_date_output,2)	, row, col + 45
		'Recv By Sv Date
	EMWriteScreen left(hcre_recvd_by_service_date_output,2)	, row, col + 51	
	EMWriteScreen mid(hcre_recvd_by_service_date_output,4,2), row, col + 54	
	EMWriteScreen right(hcre_recvd_by_service_date_output,2), row, col + 57

	transmit
	
	'========================= REMOVE AFTER TESTING ======================
	
	call debugger()
	
	'=====================================================================
	
End Function

FUNCTION write_panel_to_MAXIS_HEST(HEST_FS_choice_date, HEST_first_month, HEST_heat_air_retro, HEST_electric_retro, HEST_phone_retro, HEST_heat_air_pro, HEST_electric_pro, HEST_phone_pro)
	call navigate_to_screen("STAT", "HEST")
	call create_panel_if_nonexistent
	Emwritescreen "01", 6, 40
	call create_MAXIS_friendly_date(HEST_FS_choice_date, 0, 7, 40)
	EMWritescreen HEST_first_month, 8, 61 
	'Filling in the #/FS units field (always 01)
	If ucase(left(HEST_heat_air_retro, 1)) = "Y" then EMWritescreen "01", 13, 42
	If ucase(left(HEST_heat_air_pro, 1)) = "Y" then EMWritescreen "01", 13, 68
	If ucase(left(HEST_electric_retro, 1)) = "Y" then EMWritescreen "01", 14, 42
	If ucase(left(HEST_electric_pro, 1)) = "Y" then EMWritescreen "01", 14, 68
	If ucase(left(HEST_phone_retro, 1)) = "Y" then EMWritescreen "01", 15, 42
	If ucase(left(HEST_phone_pro, 1)) = "Y" then EMWritescreen "01", 15, 68
	EMWritescreen left(HEST_heat_air_retro, 1), 13, 34
	EMWritescreen left(HEST_electric_retro, 1), 14, 34
	EMWritescreen left(HEST_phone_retro, 1), 15, 34
	EMWritescreen left(HEST_heat_air_pro, 1), 13, 60
	EMWritescreen left(HEST_electric_pro, 1), 14, 60
	EMWritescreen left(HEST_phone_pro, 1), 15, 60
	transmit
End function

Function write_panel_to_MAXIS_IMIG(IMIG_imigration_status, IMIG_entry_date, IMIG_status_date, IMIG_status_ver, IMIG_status_LPR_adj_from, IMIG_nationality)
	call navigate_to_screen("STAT", "IMIG")
	call ERRR_screen_check
	call create_panel_if_nonexistent
	call create_MAXIS_friendly_date(date, 0, 5, 45)						'Writes actual date, needs to add 2000 as this is weirdly a 4 digit year
	EMWriteScreen datepart("yyyy", date), 5, 51
	EMWriteScreen IMIG_imigration_status, 6, 45							'Writes imig status
	call create_MAXIS_friendly_date(IMIG_entry_date, 0, 7, 45)			'Enters year as a 2 digit number, so have to modify manually
	EMWriteScreen datepart("yyyy", IMIG_entry_date), 7, 51
	call create_MAXIS_friendly_date(IMIG_status_date, 0, 7, 71)			'Enters year as a 2 digit number, so have to modify manually
	EMWriteScreen datepart("yyyy", IMIG_status_date), 7, 77
	EMWriteScreen IMIG_status_ver, 8, 45								'Enters status ver
	EMWriteScreen IMIG_status_LPR_adj_from, 9, 45						'Enters status LPR adj from
	EMWriteScreen IMIG_nationality, 10, 45								'Enters nationality
	transmit
	transmit
End function

Function write_panel_to_MAXIS_INSA(insa_pers_coop_ohi,insa_good_cause_status,insa_good_cause_cliam_date,insa_good_cause_evidence,insa_coop_cost_effect,insa_insur_name,insa_prescrip_drug_cover,insa_prescrip_end_date)
	call navigate_to_screen("STAT","INSA")
	call create_panel_if_nonexistent
	
	'Resp Persons Coop With OHI
	If insa_pers_coop_ohi <> "" then
		insa_pers_coop_ohi = ucase(insa_pers_coop_ohi)
		insa_pers_coop_ohi = left(insa_pers_coop_ohi,1)
		EMWriteScreen insa_pers_coop_ohi, 19, 78
	End If
	
	'Good Cause Status
	If insa_good_cause_status <> "" then
		EMWriteScreen insa_good_cause_status, 5, 62
	End If
	
	'Good Cause Claim Date
	If insa_good_cause_cliam_date <> "" then
		call MAXIS_dater(insa_good_cause_cliam_date, insa_good_cause_cliam_date_output, "Good Cause Claim Date")
		EMWriteScreen left(insa_good_cause_cliam_date_output,2)	, 6, 62	
		EMWriteScreen mid(insa_good_cause_cliam_date_output,4,2), 6, 65	
		EMWriteScreen right(insa_good_cause_cliam_date_output,2), 6, 68
	End If
	
	'Good Cause Evidence
	If insa_good_cause_evidence <> "" then
		insa_good_cause_evidence = ucase(insa_good_cause_evidence)
		insa_good_cause_evidence = left(insa_good_cause_evidence,1)
		EMWriteScreen insa_good_cause_evidence, 19, 78
	End If
	
	'Coop With cost effective rqmt
	If insa_coop_cost_effect <> "" then
		insa_coop_cost_effect = ucase(insa_coop_cost_effect)
		insa_coop_cost_effect = left(insa_coop_cost_effect,1)
		EMWriteScreen insa_coop_cost_effect, 19, 78
	End If
	
	'Insurance Company
	If insa_insur_name <> "" then
		EMWriteScreen insa_insur_name, 10, 38
	End If
	
	'Prescription Drug Coverage
	If insa_prescrip_drug_cover <> "" then
		insa_prescrip_drug_cover = ucase(insa_prescrip_drug_cover)
		insa_prescrip_drug_cover = left(insa_prescrip_drug_cover,1)
		EMWriteScreen insa_prescrip_drug_cover, 11, 62
	End If
	
	'Prescription Drug Coverage End Date
	If insa_prescrip_end_date <> "" then
		call MAXIS_dater(insa_prescrip_end_date, insa_prescrip_end_date_output, "Good Cause Claim Date")
		EMWriteScreen left(insa_prescrip_end_date_output,2)	, 12, 62	
		EMWriteScreen mid(insa_prescrip_end_date_output,4,2), 12, 65	
		EMWriteScreen right(insa_prescrip_end_date_output,2), 12, 68
	End If
	
	'Covered Persons Ref Nbr
	row = 15
	col = 30
	insa_ref_nmb_loc = 1
	EMReadScreen insa_space_avail, 2, row, col
	Do
		If insa_space_avail <> "__" and insa_space_avail <> reference_number then
			col = col + 4
			insa_ref_nmb_loc = insa_ref_nmb_loc + 1
			If insa_ref_nmb_loc = 11 then
				row = 16
				col = 30
			ElseIf insa_ref_nmb_loc = 21 then
				msgbox "No covered person spaces are available."
			End If
		ElseIf insa_space_avail = "__" then
			EMWriteScreen reference_number, row, col
		End If
		EMReadScreen insa_space_avail, 2, row, col
	Loop until insa_space_avail = reference_number
	
	transmit

End Function

FUNCTION write_panel_to_MAXIS_JOBS(jobs_inc_type, jobs_inc_verif, jobs_employer_name, jobs_inc_start, jobs_wkly_hrs, jobs_hrly_wage, jobs_pay_freq)
	call navigate_to_screen("STAT", "JOBS")
	EMWriteScreen reference_number, 20, 76
	EMWriteScreen "NN", 20, 79
	transmit

	EMWriteScreen jobs_inc_type, 5, 38
	EMWriteScreen jobs_inc_verif, 6, 38
	EMWriteScreen jobs_employer_name, 7, 42
	call create_MAXIS_friendly_date(jobs_inc_start, 0, 9, 35)
	EMWriteScreen jobs_pay_freq, 18, 35
	
	'===== navigates to the SNAP PIC to update the PIC =====
	EMWriteScreen "X", 19, 38
	transmit
	DO
		EMReadScreen at_snap_pic, 12, 3, 22
	LOOP UNTIL at_snap_pic = "Food Support"
	call create_MAXIS_friendly_date(date, 0, 5, 34)
	EMWriteScreen jobs_pay_freq, 5, 64
	EMWriteScreen jobs_wkly_hrs, 8, 64
	EMWriteScreen jobs_hrly_wage, 9, 66
	transmit
	transmit
	EMReadScreen jobs_pic_hrs_per_pp, 6, 16, 51
	EMReadScreen jobs_pic_wages_per_pp, 7, 17, 57
	transmit		'<=====navigates out of the PIC

		'=====the following bit is for the retrospective & prospective pay dates=====
	EMReadScreen bene_month, 2, 20, 55
	EMReadScreen bene_year, 2, 20, 58
	retro_month = bene_month - 2
	retro_year = bene_year
		IF retro_month < 1 THEN
			retro_month = bene_month + 10
			retro_year = bene_year - 1
		END IF

	EMWriteScreen retro_month, 12, 25
	EMWriteScreen "05", 12, 28
	EMWriteScreen retro_year, 12, 31
	EMWriteScreen "________", 12, 38
	EMWriteScreen jobs_pic_wages_per_pp, 12, 38
	EMWriteScreen bene_month, 12, 54
	EMWriteScreen "05", 12, 57
	EMWriteScreen bene_year, 12, 60
	EMWriteScreen "________", 12, 67
	EMWriteScreen jobs_pic_wages_per_pp, 12, 67
	
	IF jobs_pay_freq = "2" OR jobs_pay_freq = "3" THEN
		EMWriteScreen retro_month, 13, 25
		EMWriteScreen "19", 13, 28
		EMWriteScreen retro_year, 13, 31
		EMWriteScreen "________", 13, 38
		EMWriteScreen jobs_pic_wages_per_pp, 13, 38
		EMWriteScreen bene_month, 13, 54
		EMWriteScreen "19", 13, 57
		EMWriteScreen bene_year, 13, 60
		EMWriteScreen "________", 13, 67
		EMWriteScreen jobs_pic_wages_per_pp, 13, 67
	ELSEIF pay_freq = "4" THEN
		EMWriteScreen retro_month, 13, 25
		EMWriteScreen "12", 13, 28
		EMWriteScreen retro_year, 13, 31
		EMWriteScreen "________", 13, 38
		EMWriteScreen jobs_pic_wages_per_pp, 13, 38
		EMWriteScreen retro_month, 14, 25
		EMWriteScreen "19", 14, 28
		EMWriteScreen retro_year, 14, 31
		EMWriteScreen "________", 14, 38
		EMWriteScreen jobs_pic_wages_per_pp, 14, 38
		EMWriteScreen retro_month, 15, 25
		EMWriteScreen "26", 15, 28
		EMWriteScreen retro_year, 15, 31
		EMWriteScreen "________", 15, 38
		EMWriteScreen jobs_pic_wages_per_pp, 15, 38
		EMWriteScreen bene_month, 13, 54
		EMWriteScreen "12", 13, 57
		EMWriteScreen bene_year, 13, 60
		EMWriteScreen "________", 13, 67
		EMWriteScreen jobs_pic_wages_per_pp, 13, 67
		EMWriteScreen bene_month, 14, 54 
		EMWriteScreen "19", 14, 57 
		EMWriteScreen bene_year, 14, 60 
		EMWriteScreen "________", 14, 67 
		EMWriteScreen jobs_pic_wages_per_pp, 14, 67
		EMWriteScreen bene_month, 15, 54
		EMWriteScreen "26", 15, 57
		EMWriteScreen bene_year, 15, 60
		EMWriteScreen "________", 15, 67
		EMWriteScreen jobs_pic_wages_per_pp, 15, 67
	END IF

	'=====determines if the benefit month is current month + 1 and dumps information into the HC income estimator
	IF (bene_month * 1) = (datepart("M", DATE) + 1) THEN		'<===== "bene_month * 1" is needed to convert bene_month from a string to a useable number
		EMWriteScreen "X", 19, 54
		transmit
		EMWriteScreen "________", 9, 65
		EMWriteScreen jobs_pic_wages_per_pp, 11, 63
		transmit
		transmit
	END IF
END FUNCTION

Function write_panel_to_MAXIS_MEDI(SSN_first, SSN_mid, SSN_last, MEDI_claim_number_suffix, MEDI_part_A_premium, MEDI_part_B_premium, MEDI_part_A_begin_date, MEDI_part_B_begin_date)
	call navigate_to_screen("STAT", "MEDI")
	call ERRR_screen_check
	call create_panel_if_nonexistent
	EMWriteScreen SSN_first, 6, 44				'Next three lines pulled
	EMWriteScreen SSN_mid, 6, 48
	EMWriteScreen SSN_last, 6, 51
	EMWriteScreen MEDI_claim_number_suffix, 6, 56
	EMWriteScreen MEDI_part_A_premium, 7, 46
	EMWriteScreen MEDI_part_B_premium, 7, 73
	If MEDI_part_A_begin_date <> "" then call create_MAXIS_friendly_date(MEDI_part_A_begin_date, 0, 15, 24)
	If MEDI_part_B_begin_date <> "" then call create_MAXIS_friendly_date(MEDI_part_B_begin_date, 0, 15, 54)
	transmit
	transmit
End function

FUNCTION write_panel_to_MAXIS_MMSA(mmsa_liv_arr, mmsa_cont_elig, mmsa_spous_inc, mmsa_shared_hous)
	IF mmsa_liv_arr <> "" THEN
		call navigate_to_screen("STAT", "MMSA")
		EMWriteScreen "NN", 20, 79
		transmit
		EMWriteScreen mmsa_liv_arr, 7, 54
		EMWriteScreen mmsa_cont_elig, 9, 54
		EMWriteScreen mmsa_spous_inc, 12, 62
		EMWriteScreen mmsa_shared_hous, 14, 62
		transmit
	END IF
END FUNCTION

Function write_panel_to_MAXIS_MSUR(msur_begin_date)
	call navigate_to_screen("STAT","MSUR")
	call create_panel_if_nonexistent
	call MAXIS_dater(msur_begin_date,return_date,"MNSure Begin Date")
	'msur_begin_date This is the date MSUR began for this client  
	col = 36
	row = 7
	'Places the Begin Date on the next available line	
	'This Can be uncommented once End Date logic is in place------------
	
	'Do
	'	msgbox row
	'	EMReadScreen no_date_check, 2, row, col	
	'	If no_date_check <> "__" then
	'		row = row + 2
	'	End If
	'Loop until no_date_check = "__"
	
	'-------------------------------------------------------------------
	EMWriteScreen left(return_date, 2)			, row, col		'Enters Month
	EMWriteScreen mid(return_date, 4, 2)		, row, col + 3	'Enters Day
	EMWriteScreen "20" & right(return_date, 2)	, row, col + 6	'Enters Year
	transmit
End Function

'---This function writes using the variables read off of the specialized excel template to the othr panel in MAXIS
Function write_panel_to_MAXIS_OTHR(othr_type, othr_cash_value, othr_cash_value_ver, othr_owed, othr_owed_ver, othr_date, othr_cash_count, othr_SNAP_count, othr_HC_count, othr_IV_count, othr_joint, othr_share_ratio)
	Call navigate_to_screen("STAT", "OTHR")  'navigates to the stat panel
	call create_panel_if_nonexistent
	Emwritescreen othr_type, 6, 40  'enters other asset type
	Emwritescreen othr_cash_value, 8, 40  'enters cash value of asset
	Emwritescreen othr_cash_value_ver, 8, 57  'enters cash value verification code
	Emwritescreen othr_owed, 9, 40  'enters amount owed value
	Emwritescreen othr_owed_ver, 9, 57  'enters amount owed verification code
	call create_MAXIS_friendly_date(othr_date, 0, 10, 39)  'enters the as of date in a MAXIS friendly format. mm/dd/yy
	Emwritescreen othr_cash_count, 12, 50  'enters y/n if counted for cash
	Emwritescreen othr_SNAP_count, 12, 57  'enters y/n if counted for snap
	Emwritescreen othr_HC_count, 12, 64  'enters y/n if counted for hc
	Emwritescreen othr_IV_count, 12, 73  'enters y/n if counted for iv
	Emwritescreen othr_joint_owner, 13, 44  'enters if it is a jointly owned other asset
	Emwritescreen left(othr_share_ratio, 1), 15, 50  'enters the ratio of ownership using the left 1 digit of what is entered into the file
	Emwritescreen right(othr_share_ratio, 1), 15, 54  'enters the ratio of ownership using the right 1 digit of what is entered into the file
End Function

FUNCTION write_panel_to_MAXIS_PARE(PARE_child_1, PARE_child_1_relation, PARE_child_1_verif, PARE_child_2, PARE_child_2_relation, PARE_child_2_verif, PARE_child_3, PARE_child_3_relation, PARE_child_3_verif, PARE_child_4, PARE_child_4_relation, PARE_child_4_verif, PARE_child_5, PARE_child_5_relation, PARE_child_5_verif, PARE_child_6, PARE_child_6_relation, PARE_child_6_verif)
	Call navigate_to_screen("STAT", "PARE") 
	call create_panel_if_nonexistent
	EMWritescreen PARE_child_1, 8, 24
	EMWritescreen PARE_child_1_relation, 8, 53
	EMWritescreen PARE_child_1_verif, 8, 71
	EMWritescreen PARE_child_2, 9, 24
	EMWritescreen PARE_child_2_relation, 9, 53
	EMWritescreen PARE_child_2_verif, 9, 71
	EMWritescreen PARE_child_3, 10, 24
	EMWritescreen PARE_child_3_relation, 10, 53
	EMWritescreen PARE_child_3_verif, 10, 71
	EMWritescreen PARE_child_4, 11, 24
	EMWritescreen PARE_child_4_relation, 11, 53
	EMWritescreen PARE_child_4_verif, 11, 71
	EMWritescreen PARE_child_5, 12, 24
	EMWritescreen PARE_child_5_relation, 12, 53
	EMWritescreen PARE_child_5_verif, 12, 71
	EMWritescreen PARE_child_6, 13, 24
	EMWritescreen PARE_child_6_relation, 13, 53
	EMWritescreen PARE_child_6_verif, 13, 71
	transmit
end function

'---This function writes using the variables read off of the specialized excel template to the pben panel in MAXIS
Function write_panel_to_MAXIS_PBEN(pben_referal_date, pben_type, pben_appl_date, pben_appl_ver, pben_IAA_date, pben_disp)
	Call navigate_to_screen("STAT", "PBEN")  'navigates to the stat panel
	call create_panel_if_nonexistent
	Emreadscreen pben_row_check, 2, 8, 24  'reads the MAXIS screen to find out if the PBEN row has already been used. 
	If pben_row_check = "  " THEN   'if the row is blank it enters it in the 8th row.
		Emwritescreen pben_type, 8, 24  'enters pben type code
		call create_MAXIS_friendly_date(pben_referal_date, 0, 8, 40)  'enters referal date in MAXIS friendly format mm/dd/yy
		call create_MAXIS_friendly_date(pben_appl_date, 0, 8, 51)  'enters appl date in  MAXIS friendly format mm/dd/yy
		Emwritescreen pben_appl_ver, 8, 62  'enters appl verification code
		call create_MAXIS_friendly_date(pben_IAA_date, 0, 8, 66)  'enters IAA date in MAXIS friendly format mm/dd/yy
		Emwritescreen pben_disp, 8, 77  'enters the status of pben application 
	else 
		EMreadscreen pben_row_check, 2, 9, 24  'if row 8 is filled already it will move to row 9 and see if it has been used. 
		IF pben_row_check = "  " THEN  'if the 9th row is blank it enters the information there. 
		'second pben row
			Emwritescreen pben_type, 9, 24
			call create_MAXIS_friendly_date(pben_referal_date, 0, 9, 40)
			call create_MAXIS_friendly_date(pben_appl_date, 0, 9, 51)
			Emwritescreen pben_appl_ver, 9, 62
			call create_MAXIS_friendly_date(pben_IAA_date, 0, 9, 66)
			Emwritescreen pben_disp, 9, 77
		else
		Emreadscreen pben_row_check, 2, 10, 24  'if row 8 is filled already it will move to row 9 and see if it has been used.
			IF pben-row_check = "  " THEN  'if the 9th row is blank it enters the information there.
			'third pben row
				Emwritescreen pben_type, 10, 24
				call create_MAXIS_friendly_date(pben_referal_date, 0, 10, 40)
				call create_MAXIS_friendly_date(pben_appl_date, 0, 10, 51)
				Emwritescreen pben_appl_ver, 10, 62
				call create_MAXIS_friendly_date(pben_IAA_date, 0, 10, 66)
				Emwritescreen pben_disp, 10, 77
			END IF
		END IF
	END IF
End Function

Function write_panel_to_MAXIS_PDED(PDED_wid_deduction, PDED_adult_child_disregard, PDED_wid_disregard, PDED_unea_income_deduction_reason, PDED_unea_income_deduction_value, PDED_earned_income_deduction_reason, PDED_earned_income_deduction_value, PDED_ma_epd_inc_asset_limit, PDED_guard_fee, PDED_rep_payee_fee, PDED_other_expense, PDED_shel_spcl_needs, PDED_excess_need, PDED_restaurant_meals)
	call navigate_to_screen("STAT","PDED")
	call create_panel_if_nonexistent
	
	'====================== FIX LATER ============================
	
	'Pickle Disregard
		'ADD ME LATER
		
	'=============================================================
		
	'Disa Widow/ers Deductionpded_shel_spcl_needs
	If pded_wid_deduction <> "" then
		pded_wid_deduction = ucase(pded_wid_deduction)
		pded_wid_deduction = left(pded_wid_deduction,1)
		EMWriteScreen pded_wid_deduction, 7, 60
	End If
	
	'Disa Adult Child Disregard
	If pded_adult_child_disregard <> "" then
		pded_adult_child_disregard = ucase(pded_adult_child_disregard)
		pded_adult_child_disregard = left(pded_adult_child_disregard,1)
		EMWriteScreen pded_adult_child_disregard, 8, 60
	End If
	
	'Widow/ers Disregard
	If pded_wid_disregard <> "" then
		pded_wid_disregard = ucase(pded_wid_disregard)
		pded_wid_disregard = left(pded_wid_disregard,1)
		EMWriteScreen pded_wid_disregard, 9, 60
	End If

	'Other Unearned Income Deduction
	If pded_unea_income_deduction_reason <> "" and pded_unea_income_deduction_value <> "" then
		EMWriteScreen pded_unea_income_deduction_value, 10, 62
		EMWriteScreen "X", 10, 25
		Transmit
		EMWriteScreen pded_unea_income_deduction_reason, 10, 51
		Transmit
		PF3
	End If

	'Other Earned Income Deduction
	If pded_earned_income_deduction_reason <> "" and pded_earned_income_deduction_value <> "" then
		EMWriteScreen pded_earned_income_deduction_value, 11, 62
		EMWriteScreen "X", 11, 27
		Transmit
		EMWriteScreen pded_earned_income_deduction_reason, 10, 51
		Transmit
		PF3
	End If
	
	'Extend MA-EPD Income/Asset Limits
	If pded_ma_epd_inc_asset_limit <> "" then
		pded_ma_epd_inc_asset_limit = ucase(pded_ma_epd_inc_asset_limit)
		pded_ma_epd_inc_asset_limit = left(pded_ma_epd_inc_asset_limit,1)
		EMWriteScreen pded_ma_epd_inc_asset_limit, 12, 65
	End If
	
	'====================== FIX LATER ============================
	
	'Blind/Disa Student Child Disregard
	'If  <> "" then
		'ADD LOGIC LATER
	'End If
	
	'=============================================================
	
	'Guardianship Fee
	If pded_guard_fee <> "" then
		EMWriteScreen pded_guard_fee, 15, 44
	End If
	
	'Rep Payee Fee
	If pded_rep_payee_fee <> "" then
		EMWriteScreen pded_guard_fee, 15, 70
	End If
	
	'Other Expense
	If pded_other_expense <> "" then
		EMWriteScreen pded_other_expense, 18, 41
	End If
	
	'Shelter Special Needs
	If pded_shel_spcl_needs <> "" then
		pded_shel_spcl_needs = ucase(pded_shel_spcl_needs)
		pded_shel_spcl_needs = left(pded_shel_spcl_needs,1)
		EMWriteScreen pded_shel_spcl_needs, 18, 78
	End If
	
	'Excess Need
	If pded_excess_need <> "" then
		EMWriteScreen pded_excess_need, 19, 41
	End If
	
	'Restaurant Meals
	If pded_restaurant_meals <> "" then
		pded_restaurant_meals = ucase(pded_restaurant_meals)
		pded_restaurant_meals = left(pded_restaurant_meals,1)
		EMWriteScreen pded_restaurant_meals, 19, 78
	End If
		
	Transmit
	
End Function

FUNCTION write_panel_to_MAXIS_PREG(PREG_conception_date, PREG_conception_date_ver, PREG_third_trimester_ver,PREG_due_date, PREG_multiple_birth)
	call navigate_to_screen("STAT", "PREG")
	call create_panel_if_nonexistent
	EMWritescreen "NN", 20, 79
	transmit
	call create_MAXIS_friendly_date(PREG_conception_date, 1, 6, 53)
	call create_MAXIS_friendly_date(PREG_due_date, 1, 10, 53)
	EMWritescreen PREG_conception_date_ver, 6, 75
	EMWritescreen PREG_third_trimester_ver, 8, 75
	EMWritescreen PREG_multiple_birth, 14, 53
	transmit
end function

'---This function writes using the variables read off of the specialized excel template to the rbic panel in MAXIS
Function write_panel_to_MAXIS_RBIC(rbic_type, rbic_start_date, rbic_end_date, rbic_group_1, rbic_retro_income_group_1, rbic_prosp_income_group_1, rbic_ver_income_group_1, rbic_group_2, rbic_retro_income_group_2, rbic_prosp_income_group_2, rbic_ver_income_group_2, rbic_group_3, rbic_retro_income_group_3, rbic_prosp_income_group_3, rbic_ver_income_group_3, rbic_retro_hours, rbic_prosp_hours, rbic_exp_type_1, rbic_exp_retro_1, rbic_exp_prosp_1, rbic_exp_ver_1, rbic_exp_type_2, rbic_exp_retro_2, rbic_exp_prosp_2, rbic_exp_ver_2)
	call navigate_to_screen("STAT", "RBIC")  'navigates to the stat panel
	call create_panel_if_nonexistent
	EMwritescreen rbic_type, 5, 44  'enters rbic type code
	call create_MAXIS_friendly_date(rbic_start_date, 0, 6, 44)  'creates and enters a MAXIS friend date in the format mm/dd/yy for rbic start date
	call create_MAXIS_friendly_date(rbic_end_date, 6, 68)  'creates and enters a MAXIS friend date in the format mm/dd/yy for rbic end date
	rbic_group_1 = replace(rbic_group_1, " ", "")  'this will replace any spaces in the array with nothing removing the spaces.
	rbic_group_1 = split(rbic_group_1, ",")  'this will split up the reference numbers in the array based on commas
	rbic_col = 25                            'this will set the starting column to enter rbic reference numbers
	For each rbic_hh_memb in rbic_group_1    'for each reference number that is in the array for group 1 it will enter the reference numbers into the correct row.
		EMwritescreen rbic_hh_memb, 10, rbic_col
		rbic_col = rbic + 3
	NEXT
	EMwritescreen rbic_retro_income_group_1, 10, 47  'enters the rbic retro income for group 1
	EMwritescreen rbic_prosp_income_group_1, 10, 62  'enters the rbic prospective income for group 1
	EMwritescreen rbic_ver_income_group_1, 10, 76    'enters the income verification code for group 1
	rbic_group_2 = replace(rbic_group_2, " ", "")
	rbic_group_2 = split(rbic_group_2, ",")
	rbic_col = 25
	For each rbic_hh_memb in rbic_group_2    'for each reference number that is in the array for group 2 it will enter the reference numbers into the correct row.
		EMwritescreen rbic_hh_memb, 11, rbic_col
		rbic_col = rbic + 3
	NEXT
	EMwritescreen rbic_retro_income_group_2, 11, 47  'enters the rbic retro income for group 2
	EMwritescreen rbic_prosp_income_group_2, 11, 62  'enters the rbic prospective income for group 2
	EMwritescreen rbic_ver_income_group_2, 11, 76    'enters the income verification code for group 2
	rbic_group_3 = replace(rbic_group_3, " ", "")
	rbic_group_3 = split(rbic_group_3, ",")
	rbic_col = 25
	For each rbic_hh_memb in rbic_group_3    'for each reference number that is in the array for group 3 it will enter the reference numbers into the correct row.
		EMwritescreen rbic_hh_memb, 10, rbic_col
		rbic_col = rbic + 3
	NEXT
	EMwritescreen rbic_retro_income_group_3, 12, 47  'enters the rbic retro income for group 3
	EMwritescreen rbic_prosp_income_group_3, 12, 62  'enters the rbic prospective income for group 3
	EMwritescreen rbic_ver_income_group_3, 12, 76    'enters the income verification code for group 3
	EMwritescreen rbic_retro_hours, 13, 52  'enters the retro hours
	EMwritescreen rbic_prosp_hours, 13, 67  'enters the prospective hours
	EMwritescreen rbic_exp_type_1, 15, 25   'enters the expenses type for group 1
	EMwritescreen rbic_exp_retro_1, 15, 47  'enters the expenses retro for group 1
	EMwritescreen rbic_exp_prosp_1, 15, 62  'enters the expenses prospective for group 1
	EMwritescreen rbic_exp_ver_1, 15, 76    'enters the expenses verification code for group 1
	EMwritescreen rbic_exp_type_2, 16, 25   'enters the expenses type for group 2
	EMwritescreen rbic_exp_retro_2, 16, 47  'enters the expenses retro for group 2
	EMwritescreen rbic_exp_prosp_2, 16, 62  'enters the expenses prospective for group 2
	EMwritescreen rbic_exp_ver_2, 16, 76    'enters the expenses verification code for group 2
end function

'---This function writes using the variables read off of the specialized excel template to the rest panel in MAXIS
Function write_panel_to_MAXIS_REST(rest_type, rest_type_ver, rest_market, rest_market_ver, rest_owed, rest_owed_ver, rest_date, rest_status, rest_joint, rest_share_ratio, rest_agreement_date)
	Call navigate_to_screen("STAT", "REST")  'navigates to the stat panel
	call create_panel_if_nonexistent
	Emwritescreen rest_type, 6, 39  'enters residence type
	Emwritescreen rest_type_ver, 6, 62  'enters verification of residence type
	Emwritescreen rest_market, 8, 41  'enters market value of residence
	Emwritescreen rest_market_ver, 8, 62  'enters market value verification code
	Emwritescreen rest_owed, 9, 41  'enters amount owned on residence
	Emwritescreen rest_owed_ver, 9, 62  'enters amount owed verification code
	call create_MAXIS_friendly_date(rest_date, 0, 10, 39)  'enters the as of date in a MAXIS friendly format. mm/dd/yy
	Emwritescreen rest_status, 12, 54  'enters property status code
	Emwritescreen rest_joint, 13, 54  'enters if it is a jointly owned home
	Emwritescreen left(rest_share_ratio, 1), 14, 54  'enters the ratio of ownership using the left 1 digit of what is entered into the file
	Emwritescreen right(rest_share_ratio, 1), 14, 58  'enters the ratio of ownership using the right 1 digit of what is entered into the file
	call create_MAXIS_friendly_date(rest_agreement_date, 0, 16, 62)
End Function

Function write_panel_to_MAXIS_SCHL(SCHL_status, SCHL_ver, SCHL_type, SCHL_district_nbr, SCHL_kindergarten_start_date, SCHL_grad_date, SCHL_grad_date_ver, SCHL_primary_secondary_funding, SCHL_FS_eligibility_status, SCHL_higher_ed)
	call navigate_to_screen("STAT", "SCHL")
	call ERRR_screen_check
	call create_panel_if_nonexistent
	call create_MAXIS_friendly_date(date, 0, 5, 40)						'Writes actual date, needs to add 2000 as this is weirdly a 4 digit year
	EMWriteScreen datepart("yyyy", date), 5, 46
	EMWriteScreen SCHL_status, 6, 40
	EMWriteScreen SCHL_ver, 6, 63
	EMWriteScreen SCHL_type, 7, 40
	EMWriteScreen SCHL_district_nbr, 8, 40
	If SCHL_kindergarten_start_date <> "" then call create_MAXIS_friendly_date(SCHL_kindergarten_start_date, 0, 10, 63)
	EMWriteScreen left(SCHL_grad_date, 2), 11, 63
	EMWriteScreen right(SCHL_grad_date, 2), 11, 66
	EMWriteScreen SCHL_grad_date_ver, 12, 63
	EMWriteScreen SCHL_primary_secondary_funding, 14, 63
	EMWriteScreen SCHL_FS_eligibility_status, 16, 63
	EMWriteScreen SCHL_higher_ed, 18, 63
	transmit
	transmit
End function

'---This function writes using the variables read off of the specialized excel template to the secu panel in MAXIS
Function write_panel_to_MAXIS_SECU(secu_type, secu_pol_numb, secu_name, secu_cash_val, secu_date, secu_cash_ver, secu_face_val, secu_withdraw, secu_cash_count, secu_SNAP_count, secu_HC_count, secu_GRH_count, secu_IV_count, secu_joint, secu_share_ratio)
	Call navigate_to_screen("STAT", "SECU")  'navigates to the stat panel
	call create_panel_if_nonexistent
	Emwritescreen secu_type, 6, 50  'enters security type
	Emwritescreen secu_pol_numb, 7, 50  'enters policy number
	Emwritescreen secu_name, 8, 50  'enters name of policy
	Emwritescreen secu_cash_val, 10, 52  'enters cash value of policy
	call create_MAXIS_friendly_date(secu_date, 0, 11, 35)  'enters the as of date in a MAXIS friendly format. mm/dd/yy
	Emwritescreen secu_cash_ver, 11, 50  'enters cash value verification code
	Emwritescreen secu_face_val, 12, 52  'enters face value of policy
	Emwritescreen secu_withdraw, 13, 52  'enters withdrawl penalty
	Emwritescreen secu_cash_count, 15, 50  'enters y/n if counted for cash
	Emwritescreen secu_SNAP_count, 15, 57  'enters y/n if counted for snap
	Emwritescreen secu_HC_count, 15, 64  'enters y/n if counted for hc
	Emwritescreen secu_GRH_count, 15, 72  'enters y/n if counted for grh
	Emwritescreen secu_IV_count, 15, 80  'enters y/n if counted for iv
	Emwritescreen secu_joint, 16, 44  'enters if it is a jointly owned security
	Emwritescreen left(secu_share_ratio, 1), 16, 76  'enters the ratio of ownership using the left 1 digit of what is entered into the file
	Emwritescreen right(secu_share_ratio, 1), 16, 80  'enters the ratio of ownership using the right 1 digit of what is entered into the file
End Function

FUNCTION write_panel_to_MAXIS_SHEL(SHEL_subsidized, SHEL_shared, SHEL_paid_to, SHEL_rent_retro, SHEL_rent_retro_ver, SHEL_rent_pro, SHEL_rent_pro_ver, SHEL_lot_rent_retro, SHEL_lot_rent_retro_ver, SHEL_lot_rent_pro, SHEL_lot_rent_pro_ver, SHEL_mortgage_retro, SHEL_mortgage_retro_ver, SHEL_mortgage_pro, SHEL_mortgage_pro_ver, SHEL_insur_retro, SHEL_insur_retro_ver, SHEL_insur_pro, SHEL_insur_pro_ver, SHEL_taxes_retro, SHEL_taxes_retro_ver, SHEL_taxes_pro, SHEL_taxes_pro_ver, SHEL_room_retro, SHEL_room_retro_ver, SHEL_room_pro, SHEL_room_pro_ver, SHEL_garage_retro, SHEL_garage_retro_ver, SHEL_garage_pro, SHEL_garage_pro_ver, SHEL_subsidy_retro, SHEL_subsidy_retro_ver, SHEL_subsidy_pro, SHEL_subsidy_pro_ver)
	call navigate_to_screen("STAT", "SHEL")
	call create_panel_if_nonexistent
	EMWritescreen SHEL_subsidized, 6, 42
	EMWritescreen SHEL_shared, 6, 60
	EMWritescreen SHEL_paid_to, 7, 46
	EMWritescreen SHEL_rent_retro, 11, 37
	EMWritescreen SHEL_rent_retro_ver, 11, 48
	EMWritescreen SHEL_rent_pro, 11, 56
	EMWritescreen SHEL_rent_pro_ver, 11, 67
	EMWritescreen SHEL_lot_rent_retro, 12, 37
	EMWritescreen SHEL_lot_rent_retro_ver, 12, 48
	EMWritescreen SHEL_lot_rent_pro, 12, 56
	EMWritescreen SHEL_lot_rent_pro_ver, 12, 67
	EMWritescreen SHEL_mortgage_retro, 13, 37
	EMWritescreen SHEL_mortgage_retro_ver, 13, 48
	EMWritescreen SHEL_mortgage_pro, 13, 56
	EMWritescreen SHEL_insur_retro, 14, 37 
	EMWritescreen SHEL_insur_retro_ver, 14, 48
	EMWritescreen SHEL_insur_pro, 14, 56
	EMWritescreen SHEL_insur_pro_ver, 14, 67
	EMWritescreen SHEL_taxes_retro, 15, 37
	EMWritescreen SHEL_taxes_retro_ver, 15, 48
	EMWritescreen SHEL_taxes_pro, 15, 56
	EMWritescreen SHEL_taxes_pro_ver, 15, 67
	EMWritescreen SHEL_room_retro, 16, 37
	EMWritescreen SHEL_room_retro_ver, 16, 48
	EMWritescreen SHEL_room_pro, 16, 56
	EMWritescreen SHEL_room_pro_ver, 16, 67
	EMWritescreen SHEL_garage_retro, 17, 37
	EMWritescreen SHEL_garage_retro_ver, 17, 48
	EMWritescreen SHEL_garage_pro, 17, 56
	EMWritescreen SHEL_garage_pro_ver, 17, 67
	EMWritescreen SHEL_subsidy_retro, 18, 37
	EMWritescreen SHEL_subsidy_retro_ver, 18, 48
	EMWritescreen SHEL_subsidy_pro, 18, 56
	EMWritescreen SHEL_subsidy_pro, 18, 67
	transmit
end function

FUNCTION write_panel_to_MAXIS_SIBL(SIBL_group_1, SIBL_group_2, SIBL_group_3)
	call navigate_to_screen("STAT", "SIBL")
	call create_panel_if_nonexistent
	If SIBL_group_1 <> "" then 
		EMWritescreen "01", 7, 28
		SIBL_group_1 = replace(SIBL_group_1, " ", "") 'Removing spaces
		SIBL_group_1 = split(SIBL_group_1, ",") 'Splits the sibling group value into an array by commas
		SIBL_col = 39
		For Each SIBL_group_member in SIBL_group_1 'Writes the member numbers onto the group line
			EMWritescreen SIBL_group_member, 7, SIBL_col
			SIBL_col = SIBL_col + 4
		Next
	End if
	
	If SIBL_group_2 <> "" then
		EMWritescreen "02", 8, 28
		SIBL_group_2 = replace(SIBL_group_2, " ", "")
		SIBL_group_2 = split(SIBL_group_2, ",")
		SIBL_col = 39
		For Each SIBL_group_member in SIBL_group_2
			EMWritescreen SIBL_group_member, 8, SIBL_col
			SIBL_col = SIBL_col + 4
		Next
	End if
	
	If SIBL_group_3 <> "" then
		EMWritescreen "03", 9, 28
		SIBL_group_2 = replace(SIBL_group_3, " ", "")
		SIBL_group_2 = split(SIBL_group_3, ",")
		SIBL_col = 39
		For Each SIBL_group_member in SIBL_group_3
			EMWritescreen SIBL_group_member, 9, SIBL_col
			SIBL_col = SIBL_col + 4
		Next
	End if		
	transmit
end function

Function write_panel_to_MAXIS_SPON(SPON_type, SPON_ver, SPON_name, SPON_state)
	call navigate_to_screen("STAT", "SPON")
	call ERRR_screen_check
	call create_panel_if_nonexistent
	EMWriteScreen SPON_type, 6, 38
	EMWriteScreen SPON_ver, 6, 62
	EMWriteScreen SPON_name, 8, 38
	EMWriteScreen SPON_state, 10, 62
	transmit
End function

Function write_panel_to_MAXIS_STEC(STEC_type_1, STEC_amt_1, STEC_actual_from_thru_months_1, STEC_ver_1, STEC_earmarked_amt_1, STEC_earmarked_from_thru_months_1, STEC_type_2, STEC_amt_2, STEC_actual_from_thru_months_2, STEC_ver_2, STEC_earmarked_amt_2, STEC_earmarked_from_thru_months_2)
	call navigate_to_screen("STAT", "STEC")
	call ERRR_screen_check
	call create_panel_if_nonexistent
	EMWriteScreen STEC_type_1, 8, 25				'STEC 1
	EMWriteScreen STEC_amt_1, 8, 31
	EMWriteScreen left(STEC_actual_from_thru_months_1, 2), 8, 41
	EMWriteScreen mid(STEC_actual_from_thru_months_1, 4, 2), 8, 44
	EMWriteScreen mid(STEC_actual_from_thru_months_1, 7, 2), 8, 48
	EMWriteScreen right(STEC_actual_from_thru_months_1, 2), 8, 51
	EMWriteScreen STEC_ver_1, 8, 55
	EMWriteScreen STEC_earmarked_amt_1, 8, 59
	EMWriteScreen left(STEC_earmarked_from_thru_months_1, 2), 8, 69
	EMWriteScreen mid(STEC_earmarked_from_thru_months_1, 4, 2), 8, 72
	EMWriteScreen mid(STEC_earmarked_from_thru_months_1, 7, 2), 8, 76
	EMWriteScreen right(STEC_earmarked_from_thru_months_1, 2), 8, 79
	EMWriteScreen STEC_type_2, 9, 25				'STEC 1
	EMWriteScreen STEC_amt_2, 9, 31
	EMWriteScreen left(STEC_actual_from_thru_months_2, 2), 9, 41
	EMWriteScreen mid(STEC_actual_from_thru_months_2, 4, 2), 9, 44
	EMWriteScreen mid(STEC_actual_from_thru_months_2, 7, 2), 9, 48
	EMWriteScreen right(STEC_actual_from_thru_months_2, 2), 9, 51
	EMWriteScreen STEC_ver_2, 9, 55
	EMWriteScreen STEC_earmarked_amt_2, 9, 59
	EMWriteScreen left(STEC_earmarked_from_thru_months_2, 2), 9, 69
	EMWriteScreen mid(STEC_earmarked_from_thru_months_2, 4, 2), 9, 72
	EMWriteScreen mid(STEC_earmarked_from_thru_months_2, 7, 2), 9, 76
	EMWriteScreen right(STEC_earmarked_from_thru_months_2, 2), 9, 79
End function

Function write_panel_to_MAXIS_STIN(STIN_type_1, STIN_amt_1, STIN_avail_date_1, STIN_months_covered_1, STIN_ver_1, STIN_type_2, STIN_amt_2, STIN_avail_date_2, STIN_months_covered_2, STIN_ver_2)
	call navigate_to_screen("STAT", "STIN")
	call ERRR_screen_check
	call create_panel_if_nonexistent
	EMWriteScreen STIN_type_1, 8, 27				'STIN 1
	EMWriteScreen STIN_amt_1, 8, 34
	call create_MAXIS_friendly_date(STIN_avail_date_1, 0, 8, 46)
	EMWriteScreen left(STIN_months_covered_1, 2), 8, 58
	EMWriteScreen mid(STIN_months_covered_1, 4, 2), 8, 61
	EMWriteScreen mid(STIN_months_covered_1, 7, 2), 8, 67
	EMWriteScreen right(STIN_months_covered_1, 2), 8, 70
	EMWriteScreen STIN_ver_1, 8, 76
	EMWriteScreen STIN_type_2, 9, 27				'STIN 2
	EMWriteScreen STIN_amt_2, 9, 34
	call create_MAXIS_friendly_date(STIN_avail_date_2, 0, 9, 46)
	EMWriteScreen left(STIN_months_covered_2, 2), 9, 58
	EMWriteScreen mid(STIN_months_covered_2, 4, 2), 9, 61
	EMWriteScreen mid(STIN_months_covered_2, 7, 2), 9, 67
	EMWriteScreen right(STIN_months_covered_2, 2), 9, 70
	EMWriteScreen STIN_ver_2, 9, 76
End function

Function write_panel_to_MAXIS_STWK(STWK_empl_name, STWK_wrk_stop_date, STWK_wrk_stop_date_verif, STWK_inc_stop_date, STWK_refused_empl_yn, STWK_vol_quit, STWK_ref_empl_date, STWK_gc_cash, STWK_gc_grh, STWK_gc_fs, STWK_fs_pwe, STWK_maepd_ext)
	call navigate_to_screen("STAT","STWK")
	call create_panel_if_nonexistent
	
	'Employer Name
	If stwk_empl_name <> "" then
		EMWriteScreen stwk_empl_name, 6, 46
	End If 
	
	'Work Stop Date and Verif
	If stwk_wrk_stop_date <> "" then
		call MAXIS_dater(stwk_wrk_stop_date, stwk_wrk_stop_date_output, "Good Cause Claim Date")
		EMWriteScreen left(stwk_wrk_stop_date_output,2)	, 7, 46	
		EMWriteScreen mid(stwk_wrk_stop_date_output,4,2), 7, 49	
		EMWriteScreen right(stwk_wrk_stop_date_output,2), 7, 52
	End If
	If stwk_wrk_stop_date_verif <> "" then
		EMWriteScreen stwk_wrk_stop_date_verif, 7, 63
	End If
	
	'Income Stop Date 
	If stwk_inc_stop_date <> "" then
		call MAXIS_dater(stwk_inc_stop_date, stwk_inc_stop_date_output, "Good Cause Claim Date")
		EMWriteScreen left(stwk_inc_stop_date_output,2)	, 8, 46	
		EMWriteScreen mid(stwk_inc_stop_date_output,4,2), 8, 49	
		EMWriteScreen right(stwk_inc_stop_date_output,2), 8, 52
	End If
	
	'Refused Empl
	If stwk_refused_empl_yn <> "" then
		stwk_refused_empl_yn = ucase(stwk_empl_yn)
		stwk_refused_empl_yn = left(stwk_empl_yn,1)
		EMWriteScreen stwk_refused_empl_yn, 8, 78
	End If
	
	'Voluntarily Quit
	If stwk_vol_quit <> "" then
		stwk_vol_quit = ucase(stwk_vol_quit)
		stwk_vol_quit = left(stwk_vol_quit,1)
		EMWriteScreen stwk_vol_quit, 10, 46
	End If
	
	'Refused Empl Date
	If stwk_ref_empl_date <> "" then
		call MAXIS_dater(stwk_ref_empl_date, stwk_ref_empl_date_output, "Good Cause Claim Date")
		EMWriteScreen left(stwk_ref_empl_date_output,2)	, 10, 72	
		EMWriteScreen mid(stwk_ref_empl_date_output,4,2), 10, 75	
		EMWriteScreen right(stwk_ref_empl_date_output,2), 10, 78
	End If
	
	'Good Cause cash, grh, fs
	If stwk_gc_cash <> "" then
		stwk_gc_cash = ucase(stwk_gc_cash)
		stwk_gc_cash = left(stwk_gc_cash,1)
		EMWriteScreen stwk_gc_cash, 12, 52
	End If
	If stwk_gc_grh <> "" then
		stwk_gc_grh = ucase(stwk_gc_grh)
		stwk_gc_grh = left(stwk_gc_grh,1)
		EMWriteScreen stwk_gc_grh, 12, 60
	End If
	If stwk_gc_fs <> "" then
		stwk_gc_fs = ucase(stwk_gc_fs)
		stwk_gc_fs = left(stwk_gc_fs,1)
		EMWriteScreen stwk_gc_fs, 12, 67
	End If
	
	'FS PWE
	If stwk_fs_pwe <> "" then
		stwk_fs_pwe = ucase(stwk_fs_pwe)
		stwk_fs_pwe = left(stwk_fs_pwe,1)
		EMWriteScreen stwk_fs_pwe, 12, 67
	End If
	
	'MA-EPD Extension
	If stwk_maepd_ext <> "" then
		EMWriteScreen stwk_maepd_ext, 16, 46
	End If

	Transmit
	
End Function

FUNCTION write_panel_to_MAXIS_TYPE_PROG_REVW(appl_date, type_cash_yn, type_hc_yn, type_fs_yn, prog_mig_worker, revw_ar_or_ir, revw_exempt)
	call navigate_to_screen("STAT", "TYPE")
	IF reference_number = "01" THEN
		EMWriteScreen "NN", 20, 79
		transmit
		EMWriteScreen type_cash_yn, 6, 28
		EMWriteScreen type_hc_yn, 6, 37
		EMWriteScreen type_fs_yn, 6, 46
		EMWriteScreen "N", 6, 55
		EMWriteScreen "N", 6, 64
		EMWriteScreen "N", 6, 73
		type_row = 7
		DO				'<=====this DO/LOOP populates "N" for all other HH members on TYPE so the script can get past TYPE when the reference number = "01"
			EMReadScreen type_does_hh_memb_exist, 2, type_row, 3
			IF type_does_hh_memb_exist <> "  " THEN
				EMWriteScreen "N", type_row, 28
				EMWriteScreen "N", type_row, 37
				EMWriteScreen "N", type_row, 46
				EMWriteScreen "N", type_row, 55
				type_row = type_row + 1
			ELSE
				EXIT DO
			END IF
		LOOP WHILE type_does_hh_memb_exist <> "  "
	ELSE
		PF9
		type_row = 7
		DO
			EMReadScreen type_does_hh_memb_exist, 2, type_row, 3
			IF type_does_hh_memb_exist = reference_number THEN
				EMWriteScreen type_cash_yn, type_row, 28
				EMWriteScreen type_hc_yn, type_row, 37
				EMWriteScreen type_fs_yn, type_row, 46
				EMWriteScreen "N", type_row, 55
				exit do
			ELSE
				type_row = type_row + 1
			END IF
		LOOP UNTIL type_does_hh_memb_exist = reference_number
	END IF	
	transmit		'<===== when reference_number = "01" this transmit will navigate to PROG, else, it will navigate to STAT/WRAP

	IF reference_number = "01" THEN		'<===== only accesses PROG & REVW if reference_number = "01"
		call navigate_to_screen("STAT", "PROG")
		EMWriteScreen "NN", 20, 71
		transmit
			IF type_cash_yn = "Y" THEN
				call create_MAXIS_friendly_date(appl_date, 0, 6, 33)
				call create_MAXIS_friendly_date(appl_date, 0, 6, 44)
				call create_MAXIS_friendly_date(appl_date, 0, 6, 55)
			END IF
			IF type_fs_yn = "Y" THEN
				call create_MAXIS_friendly_date(appl_date, 0, 10, 33)
				call create_MAXIS_friendly_date(appl_date, 0, 10, 44)
				call create_MAXIS_friendly_date(appl_date, 0, 10, 55)
			END IF
			IF type_hc_yn = "Y" THEN
				call create_MAXIS_friendly_date(appl_date, 0, 12, 33)
				call create_MAXIS_friendly_date(appl_date, 0, 12, 55)
			END IF
			EMWriteScreen mig_worker, 18, 67
			transmit
			EMWriteScreen mig_worker, 18, 67
			transmit

		call navigate_to_screen("STAT", "REVW")
		EMWriteScreen "NN", 20, 71
		transmit
			IF type_cash_yn = "Y" THEN
				cash_review_date = dateadd("YYYY", 1, appl_date)
				call create_MAXIS_friendly_date(cash_review_date, 0, 9, 37)
			END IF
			IF type_fs_yn = "Y" THEN
				EMWriteScreen "X", 5, 58
				transmit
				DO
					EMReadScreen food_support_reports, 20, 5, 30
				LOOP UNTIL food_support_reports = "FOOD SUPPORT REPORTS"
				fs_csr_date = dateadd("M", 6, appl_date)
				fs_er_date = dateadd("M", 12, appl_date)
				call create_MAXIS_friendly_date(fs_csr_date, 0, 9, 26)
				call create_MAXIS_friendly_date(fs_er_date, 0, 9, 64)
				transmit
			END IF
			IF type_hc_yn = "Y" THEN
				EMWriteScreen "X", 5, 71
				transmit
				DO
					EMReadScreen health_care_renewals, 20, 4, 32
				LOOP UNTIL health_care_renewals = "HEALTH CARE RENEWALS"
				IF revw_ar_or_ir = "AR" THEN
					call create_MAXIS_friendly_date((dateadd("M", 6, appl_date)), 0, 8, 71)
				ELSEIF revw_ar_or_ir = "IR" THEN
					call create_MAXIS_friendly_date((dateadd("M", 6, appl_date)), 0, 8, 27)
				END IF
				call create_MAXIS_friendly_date((dateadd("M", 12, appl_date)), 0, 9, 27)
				EMWriteScreen revw_exempt, 9, 71
				transmit
			END IF
	END IF
END FUNCTION

FUNCTION write_panel_to_MAXIS_UNEA(unea_inc_type, unea_inc_verif, unea_claim_suffix, unea_start_date, unea_pay_freq, unea_inc_amount, ssn_first, ssn_mid, ssn_last)
	call navigate_to_screen("STAT", "UNEA")
	EMWriteScreen reference_number, 20, 76
	EMWriteScreen "NN", 20, 79
	transmit

	EMWriteScreen unea_inc_type, 5, 37
	EMWriteScreen unea_inc_verif, 5, 65
	EMWriteScreen (ssn_first & ssn_mid & ssn_last & unea_claim_suffix), 6, 37
	call create_MAXIS_friendly_date(unea_start_date, 0, 7, 37)

	'=====Navigates to the PIC for UNEA=====
	EMWriteScreen "X", 10, 26
	transmit
	EMWriteScreen unea_pay_freq, 5, 64
	EMWriteScreen unea_inc_amount, 8, 66
	calc_month = datepart("M", date)
		IF len(calc_month) = 1 THEN calc_month = "0" & calc_month
	calc_day = datepart("D", date)
		IF len(calc_day) = 1 THEN calc_day = "0" & calc_day
	calc_year = datepart("YYYY", date)
	EMWriteScreen calc_month, 5, 34
	EMWriteScreen calc_day, 5, 37
	EMWriteScreen calc_year, 5, 40
	transmit
	transmit
	transmit		'<=====navigates out of the PIC

	'=====the following bit is for the retrospective & prospective pay dates=====
	EMReadScreen bene_month, 2, 20, 55
	EMReadScreen bene_year, 2, 20, 58
	retro_month = bene_month - 2
	retro_year = bene_year
		IF retro_month < 1 THEN
			retro_month = bene_month + 10
			retro_year = bene_year - 1
		END IF

	EMWriteScreen retro_month, 13, 25
	EMWriteScreen "05", 13, 28
	EMWriteScreen retro_year, 13, 31
	EMWriteScreen "________", 13, 39
	EMWriteScreen unea_inc_amount, 13, 39
	EMWriteScreen bene_month, 13, 54
	EMWriteScreen "05", 13, 57
	EMWriteScreen bene_year, 13, 60
	EMWriteScreen "________", 13, 68
	EMWriteScreen unea_inc_amount, 13, 68
	
	IF unea_pay_freq = "2" OR unea_pay_freq = "3" THEN
		EMWriteScreen retro_month, 14, 25
		EMWriteScreen "19", 14, 28
		EMWriteScreen retro_year, 14, 31
		EMWriteScreen "________", 14, 39
		EMWriteScreen unea_inc_amount, 14, 39
		EMWriteScreen bene_month, 14, 54
		EMWriteScreen "19", 14, 57
		EMWriteScreen bene_year, 14, 60
		EMWriteScreen "________", 14, 68
		EMWriteScreen unea_inc_amount, 14, 68
	ELSEIF unea_pay_freq = "4" THEN
		EMWriteScreen retro_month, 14, 25
		EMWriteScreen "12", 14, 28
		EMWriteScreen retro_year, 14, 31
		EMWriteScreen "________", 14, 39
		EMWriteScreen unea_inc_amount, 14, 39
		EMWriteScreen retro_month, 15, 25
		EMWriteScreen "19", 15, 28
		EMWriteScreen retro_year, 15, 31
		EMWriteScreen "________", 15, 39
		EMWriteScreen unea_inc_amount, 15, 39
		EMWriteScreen retro_month, 16, 25
		EMWriteScreen "26", 16, 28
		EMWriteScreen retro_year, 16, 31
		EMWriteScreen "________", 16, 39
		EMWriteScreen unea_inc_amount, 16, 39
		EMWriteScreen bene_month, 14, 54
		EMWriteScreen "12", 14, 57
		EMWriteScreen bene_year, 14, 60
		EMWriteScreen "________", 14, 68
		EMWriteScreen unea_inc_amount, 14, 68
		EMWriteScreen bene_month, 15, 54 
		EMWriteScreen "19", 15, 57 
		EMWriteScreen bene_year, 15, 60 
		EMWriteScreen "________", 15, 68 
		EMWriteScreen unea_inc_amount, 15, 68 
		EMWriteScreen bene_month, 16, 54
		EMWriteScreen "26", 16, 57
		EMWriteScreen bene_year, 16, 60
		EMWriteScreen "________", 16, 68
		EMWriteScreen unea_inc_amount, 16, 68
	END IF

	'=====determines if the benefit month is current month + 1 and dumps information into the HC income estimator
	IF (bene_month * 1) = (datepart("M", date) + 1) THEN		'<===== "bene_month * 1" is needed to convert bene_month from a string to a useable number
		EMWriteScreen "X", 6, 56
		transmit
		EMWriteScreen "________", 9, 65
		EMWriteScreen unea_inc_amount, 9, 65
		EMWriteScreen unea_pay_freq, 10, 63
		transmit
		transmit
	END IF

END FUNCTION

FUNCTION write_panel_to_MAXIS_WREG(wreg_fs_pwe, wreg_fset_status, wreg_defer_fs, wreg_fset_orientation_date, wreg_fset_sanction_date, wreg_num_sanctions, wreg_abawd_status, wreg_ga_basis)
	call navigate_to_screen("STAT", "WREG")
	call create_panel_if_nonexistent

	EMWriteScreen wreg_fs_pwe, 6, 68
	EMWriteScreen wreg_fset_status, 8, 50
	EMWriteScreen wreg_defer_fs, 8, 80
	call create_MAXIS_friendly_date(wreg_fset_orientation_date, 0, 9, 50)
	IF wreg_fset_sanction_date <> "" THEN call create_MAXIS_friendly_date(wreg_fset_orientation_date, 0, 10, 50)
	IF wreg_num_sanctions <> "" THEN EMWriteScreen wreg_num_sanctions, 11, 50
	EMWriteScreen wreg_abawd_status, 13, 50
	EMWriteScreen wreg_ga_basis, 15, 50

	transmit
END FUNCTION
