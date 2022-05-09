if not Config.PolyZone then
    Config.PolyZone = true
end

-- Pacific Bank Fix
if Config.PacificBank then
    if Config.PolyZone then
    -- Creates PolyZone
        PacificBank = BoxZone:Create(vector3(259.16, 223.01, 161.63), 50.2, 30.2, {
        name = "PacificBank",
        heading = 70,
        debugPoly = false
        })

        local inPacificBank = false


        -- Updates the PortalFlag if the Players enters the Polyzone created in the first segment   
        PacificBank:onPlayerInOut(function(isInside)
            local coords = GetEntityCoords(PlayerPedId())
            local interiorId = GetInteriorFromEntity(PlayerPedId())
            local portalFlag = GetInteriorPortalFlag(interiorId, 19)
        
            if isInside and portalFlag == 64 then
    
                SetInteriorPortalFlag(interiorId, 19, 0)
                RefreshInterior(interiorId)
                inPacificBank = true
            elseif isInside and portalFlag == 0 then 
                inPacificBank = true
            else
            inPacificBank = false
            end
        end)
    end


    if not Config.PolyZone then 
        local zone = {x = 262.87, y = 219.67, z = 106.26}
        local interiorId = GetInteriorAtCoords(zone.x, zone.y, zone.z)
        local portalFlag = GetInteriorPortalFlag(interiorId, 19)

        -- Updates the PortalFlag if the Player is close to the Refresh Point
            Citizen.CreateThread(function()
                while true do
                    Wait(1) 
                    local dst = GetDistanceBetweenCoords(coords,zone.x, zone.y, zone.z, false)
                    local coords = GetEntityCoords(PlayerPedId())
                        if dst <= 10 and portalFlag == 64 then
                            SetInteriorPortalFlag(interiorId, 19, 0)
                            RefreshInterior(interiorId)                       
                        else 
                        
                        end

                end
            end)
    end
end
if not Config.PacificBank then

end


-- Paleto Bank Fix 

if Config.PolyZone then 
    if Config.PaletoBank then

        if Config.PolyZone then
            -- Creates PolyZone
            PaletoBank = BoxZone:Create(vector3(-104.72, 6469.24, 32.08), 16.2, 15.0, {
            name = "PaletoBank",
            heading = 315,
            debugPoly = false
            })
    
            local inPaletoBank = false
    
    
            -- Updates the PortalFlag if the Players enters the Polyzone created in the first segment   
    
            PaletoBank:onPlayerInOut(function(isInside)
                local coords = GetEntityCoords(PlayerPedId())
                local interiorId = GetInteriorFromEntity(PlayerPedId())
                local portalFlag = GetInteriorPortalFlag(interiorId, 2)
            
                if isInside and PortalFlag == 64 then
        
                    SetInteriorPortalFlag(interiorId, 2, 0)
                    RefreshInterior(interiorId)
                    inPaletoBank = true
                elseif isInside and portalFlag == 0 then 
                    inPaletoBank = true
                else
                inPaletoBank = false
                end
            end)
        end
    
    end
    
    if not Config.PaletoBank then
    
    end
end

