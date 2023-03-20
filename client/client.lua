if Config.PolyZone then 
    if Config.PacificBank then 
        -- Creates the PolyZone for the Pacific Bank
        PacificBank = BoxZone:Create(vector3(259.16, 223.01, 161.63), 50.2, 30.2, {
            name = "PacificBank",
            heading = 70,
            debugPoly = false
        })
    
        -- Updates the portalflag if a player enters the polyzone
        PacificBank:onPlayerInOut(function(isInside)
            local coords = GetEntityCoords(PlayerPedId())
            local interiorId = GetInteriorFromEntity(PlayerPedId())
            local portalFlag = GetInteriorPortalFlag(interiorId, 19)

            if isInside and portalFlag == 64 then 
                SetInteriorPortalFlag(interiorId, 19, 0)
                RefreshInterior(interiorId)
            end 
        end)    
    end

    if Config.PaletoBank then 
        -- Creates a PolyZone inside of Paleto Bank
        PaletoBank = BoxZone:Create(vector3(-104.72, 6469.24, 32.08), 16.2, 15.0, {
            name = "PaletoBank",
            heading = 315,
            debugPoly = false
        })

        -- Updates portalflag if player enters the polyzone
        PaletoBank:onPlayerInOut(function(isInside)
            local coords = GetEntityCoords(PlayerPedId())
            local interiorId = GetInteriorFromEntity(PlayerPedId())
            local portalFlag = GetInteriorPortalFlag(interiorId, 2)
            
            if isInside and portalFlag == 64 then
                SetInteriorPortalFlag(interiorId, 2, 0)
                RefreshInterior(interiorId)
            end  
        
        end)
    end
else
    if Config.PacificBank then 
        local zone = {x = 262.87, y = 219.67, z = 106.26}
        local ZoneVec = vector3(262.87,219.67,106.26)
        local interiorId = GetInteriorAtCoords(zone.x, zone.y, zone.z)

        Citizen.CreateThread(function()
            while true do
                local portalFlag = GetInteriorPortalFlag(interiorId, 19)
                local PlayerVec = GetEntityCoords(PlayerPedId())
                local dist = #(PlayerVec.xy - ZoneVec.xy)

                if dist <= 10 and portalFlag == 64 then 
                    SetInteriorPortalFlag(interiorId, 19, 0)
                    RefreshInterior(interiorId)
                end 

                Wait(1500)
            end
        end)
    end

    if Config.PaletoBank then 
        local zone = {x = -104.37, y = 6468.01, z = 31.62}
        local ZoneVec = vector3(-104.37,6468.01,31.62)
        local interiorId = GetInteriorAtCoords(zone.x, zone.y, zone.z)

        Citizen.CreateThread(function()
            while true do
                local portalFlag = GetInteriorPortalFlag(interiorId, 2)
                local PlayerVec = GetEntityCoords(PlayerPedId())
                local dist = #(PlayerVec.xy - ZoneVec.xy)

                if dist <= 8 and portalFlag == 64 then
                    SetInteriorPortalFlag(interiorId, 2, 0)
                    RefreshInterior(interiorId)
                end

                Wait(1500)
            end
        end)
    end
end
