hook.Add( "PlayerButtonDown", "GPS:Press", function( ply, button )
	if button != KEY_F6 then return end

	if CLIENT and not IsFirstTimePredicted() then
		return
	end

	//////////////////////////////////////////// VARIABLE ///////////////////////////////////////////////
    local main = vgui.Create("TLFrame")
    local scroll = vgui.Create("TLScroll", main)
    //////////////////////////////////////////// VARIABLE ///////////////////////////////////////////////


    main:SetSize(respW(600), respH(500))
    main:Center()
    main:MakePopup()
    main:SetDraggable(false)
    main:ShowCloseButton(true)
    main:SetHeader("COSMGPS")


    //////////////////////////////////////////// Button + scroll ///////////////////////////////////////////////
    scroll:SetSize(respW(550), respH(450))
    scroll:SetPos(respW(50), respH(60))   
    scroll:AlignLeft(respW(25)) 

    for k, gpsData in pairs (cosmGPS.Pos) do
        local button = scroll:Add("TLButton")
        button:SetSize(respW(500), respH(65))
        button:Dock(TOP)
        button:DockMargin(0,0,0,respH(15))
        button:SetText("Destination : "..gpsData.name)
        button:SetFont("TLib.Standard")
        button:SetFontHover( "TLib.Standard" )

        function button:DoClick()
            net.Start("cosmGPS:Position")
            net.WriteInt(k, 6)
            net.SendToServer()
        end
    end



end)