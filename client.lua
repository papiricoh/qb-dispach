-- client.lua
RegisterNetEvent('qb-dispatch:client:toggleUI')
AddEventHandler('qb-dispatch:client:toggleUI', function(data)
    print("OK")
    SendNUIMessage({
        action = "toggleUI",
        sendData = data
    })
end)

Citizen.CreateThread(function()

    local isPauseMenu = false

	while true do
		Citizen.Wait(300)

		if IsPauseMenuActive() then -- ESC Key
			if not isPauseMenu then
				isPauseMenu = not isPauseMenu
				SendNUIMessage({ action = 'pauseMenu', value = false })
			end
		else
			if isPauseMenu then
				isPauseMenu = not isPauseMenu
				SendNUIMessage({ action = 'pauseMenu', value = true })
			end

			HideHudComponentThisFrame(1)  -- Wanted Stars
			HideHudComponentThisFrame(2)  -- Weapon Icon
			HideHudComponentThisFrame(3)  -- Cash
			HideHudComponentThisFrame(4)  -- MP Cash
			HideHudComponentThisFrame(6)  -- Vehicle Name
			HideHudComponentThisFrame(7)  -- Area Name
			HideHudComponentThisFrame(8)  -- Vehicle Class
			HideHudComponentThisFrame(9)  -- Street Name
			HideHudComponentThisFrame(13) -- Cash Change
			HideHudComponentThisFrame(17) -- Save Game
			HideHudComponentThisFrame(20) -- Weapon Stats
		end


	end
end)

RegisterNetEvent('qb-dispatch:client:addAlert')
AddEventHandler('qb-dispatch:client:addAlert', function(data)
	if data.location == nil then
		local streetHash, crossingHash = GetStreetNameAtCoord(data.coords.x, data.coords.y, data.coords.z)

		local streetName = GetStreetNameFromHashKey(streetHash)
		data.location = streetName
	end
    SendNUIMessage({
        action = "addAlert",
        value = data
    })
end)


RegisterCommand('leftButton', function()
    SendNUIMessage({
        action = "leftButton",
        sendData = nil
    })
end, false)
RegisterKeyMapping('leftButton', 'Dispatch Left', 'keyboard', 'LEFT')

RegisterCommand('rightButton', function()
    SendNUIMessage({
        action = "rightButton",
        sendData = nil
    })
end, false)
RegisterKeyMapping('rightButton', 'Dispatch Right', 'keyboard', 'RIGHT')