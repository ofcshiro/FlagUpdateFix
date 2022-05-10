-- Pacific Bank Fix

if Config.PacificBank then

    if Config.PolyZone then
        -- Creates the PolyZone for the Pacific Bank
        PacificBank = BoxZone:Create(vector3(259.16, 223.01, 161.63), 50.2, 30.2, {
            name = "PacificBank",
            heading = 70,
            debugPoly = false
        })
    
        local inPacificBank = false

        -- Updates the portalflag if a player enters the polyzone
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
        local ZoneVec = vector3(262.87,219.67,106.26)
        local interiorId = GetInteriorAtCoords(zone.x, zone.y, zone.z)

        Citizen.CreateThread(function()
            while true do
                Wait(1)
                local portalFlag = GetInteriorPortalFlag(interiorId, 19)
                local PlayerVec = GetEntityCoords(PlayerPedId())
                local dist = #(PlayerVec.xy - ZoneVec.xy)
                if dist <= 10 and portalFlag == 64 then 
                    SetInteriorPortalFlag(interiorId, 19, 0)
                    RefreshInterior(interiorId)
                elseif dist <= 10 and portalFlag == 0 then
                else
                end 
            end
        end)
    end
end

if not Config.PacificBank then
-- Does nothing because Pacific Bank is disabled
end


-- Paleto Bank Fix

if Config.PaletoBank then 

    if Config.PolyZone then 
        -- Creates a PolyZone inside of Paleto Bank
        PaletoBank = BoxZone:Create(vector3(-104.72, 6469.24, 32.08), 16.2, 15.0, {
            name = "PaletoBank",
            heading = 315,
            debugPoly = false
        })

        local inPaletoBank = false

        -- Updates portalflag if player enters the polyzone
        PaletoBank:onPlayerInOut(function(isInside)
            local coords = GetEntityCoords(PlayerPedId())
            local interiorId = GetInteriorFromEntity(PlayerPedId())
            local portalFlag = GetInteriorPortalFlag(interiorId, 2)
            
            if isInside and portalFlag == 64 then
                SetInteriorPortalFlag(interiorId, 2, 0)
                RefreshInterior(interiorId)
                inPaletoBank = true
            elseif isInside and portlaFlag == 0 then
            else
            end  
        
        end)
    end

    if not Config.PolyZone then
        local zone = {x = -104.37, y = 6468.01, z = 31.62}
        local ZoneVec = vector3(-104.37,6468.01,31.62)
        local interiorId = GetInteriorAtCoords(zone.x, zone.y, zone.z)

        Citizen.CreateThread(function()
            while true do
                Wait(2)
                local portalFlag = GetInteriorPortalFlag(interiorId, 2)
                local PlayerVec = GetEntityCoords(PlayerPedId())
                local dist = #(PlayerVec.xy - ZoneVec.xy)

                if dist <= 8 and portalFlag == 64 then
                    SetInteriorPortalFlag(interiorId, 2, 0)
                    RefreshInterior(interiorId)
                elseif dist <= 8 and portalFlag == 0 then
                    -- Does Nothing
                else
                end
            end
        end)
    end
end

if not Config.PaletoBank then
-- Does nothing because Paleto Bank is disabled in Config.
end
