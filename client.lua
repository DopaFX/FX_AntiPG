
---
---ANTI PG BY FXDOPA
---

Citizen.CreateThread(function()
	while true do
		local veh = GetVehiclePedIsIn(PlayerPedId())

		if veh ~= 0 then
			local material_id = GetVehicleWheelSurfaceMaterial(veh, 1)
			local wheel_type = GetVehicleWheelType(veh)

			if wheel_type == 3 or wheel_type == 4 then -- If have Off-road/Suv's/Motorcycles wheel grip its equal
			else
				if material_id == 4 or material_id == 1 or material_id == 3 then -- All road (sandy/los santos/paleto bay)
					-- On road
				else
					-- Off road
					local speed = GetEntitySpeed(veh) * 3.6 -- Convert speed from m/s to km/h

					if speed > Config.SpeedDetect then
						ESX.ShowHelpNotification('Your vehicle is not off-road. Be careful, or you will damage it!')
			
						local healthEngine = GetVehicleEngineHealth(veh)
                        
                        Citizen.Wait(750)

						local healthEngineNew = healthEngine - (healthEngine * 0.3)
						SetVehicleEngineHealth(veh, healthEngineNew)
					end
				end
			end
		end
		Citizen.Wait(1000)
	end
end)
