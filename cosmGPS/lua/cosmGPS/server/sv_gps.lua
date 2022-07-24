util.AddNetworkString("cosmGPS:Position")
util.AddNetworkString("cosmGPS:Emit")

resource.AddFile("materials/icons/point.png")
resource.AddFile("sound/gps/arrive.wav")


net.Receive("cosmGPS:Position", function(len, ply)
    local id = net.ReadInt(6)
    local positionData = cosmGPS.Pos[id]
    
    position = positionData.position

    net.Start("cosmGPS:Emit")
        net.WriteVector(position)
    net.Send(ply)
end)