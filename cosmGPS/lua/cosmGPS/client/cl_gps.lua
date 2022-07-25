net.Receive("cosmGPS:Emit", function()
    local position = net.ReadVector()

    gpsGO(position)
end)


function gpsGO(position)
    hook.Add("HUDPaint", "cosmGPS:HUD", function()

        local icon = Material("icons/point.png")
        local player_pos = LocalPlayer():GetPos()
        local dist = math.Distance(position.x, position.y, player_pos.x, player_pos.y) / 100
        if (player_pos:DistToSqr(position) < 500^2) then
            hook.Remove( "HUDPaint", "cosmGPS:HUD" )
            surface.PlaySound("gps/arrive.wav")
        end  
        local posxy = position:ToScreen()
  
        surface.SetDrawColor(color_white)
        surface.SetMaterial( icon ) -- Use our cached material
        surface.DrawTexturedRect(posxy.x, posxy.y, respW(64), respH(64)) 
        draw.SimpleText("Distance : "..math.floor(dist).."m", "trebuchet24", posxy.x - respW(20), posxy.y + respH(70), color_white, TEXT_ALIGN_LEFT)  
    end)
end
