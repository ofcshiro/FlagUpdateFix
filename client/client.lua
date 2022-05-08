
-- Creates PolyZone
Bank = BoxZone:Create(vector3(259.16, 223.01, 161.63), 50.2, 30.2, {
    name = "Bank",
    heading = 70,
    debugPoly = false
})

local inBank = false


-- Updates the PortalFlag if the Players enters the Polyzone created in the first segment
Bank:onPlayerInOut(function(isInside)
    local coords = GetEntityCoords(PlayerPedId())
    local interiorId = GetInteriorFromEntity(PlayerPedId())
    local portalFlag = GetInteriorPortalFlag(interiorId, 19)
    if isInside and portalFlag == 64 then
    
        SetInteriorPortalFlag(interiorId, 19, 0)
        RefreshInterior(interiorId)
        inBank = true
    elseif isInside and portalFlag == 0 then 
        inBank = true
    else
        inBank = false
    end
end)


exports("checkInBank", insideBank)

