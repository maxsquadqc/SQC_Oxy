
ESX = exports["es_extended"]:getSharedObject()

-- RECOLTE
Citizen.CreateThread(function()
    
            while true do
                
                local count = exports.ox_inventory:Search('count', 'plastic')
                local interval = 1 
                local ped = PlayerPedId()   
                local pos = GetEntityCoords(ped)
                local car = IsPedInAnyVehicle(ped, false)
                local distance = GetDistanceBetweenCoords(pos, Config.Position.Recolte.x, Config.Position.Recolte.y, Config.Position.Recolte.z, true)

                if car then
                    Citizen.Wait(0)

                    if distance < Config.CarDistance then
                    DrawMarker(2, Config.Position.Recolte.x, Config.Position.Recolte.y, Config.Position.Recolte.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)

                    end

                else


  if distance > Config.DrawDistance then
   
    interval = 200
  else
    interval = 1
    DrawMarker(2, Config.Position.Recolte.x, Config.Position.Recolte.y, Config.Position.Recolte.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)

  end

if distance < 1 then
    ESX.TextUI(_U('recolte', "info"))

        if IsControlJustPressed(1, 51) then

            ESX.Progressbar('Recolte en cour...', 5000,{
                FreezePlayer = true, 
                animation ={
                    type = "anim",
                    dict = "anim@mp_player_intmenu@key_fob@", 
                    lib ="fob_click" 
                }, 
                onFinish = function()
                    TriggerServerEvent("PremierEvent")
            end})
       
      end 
    else
        ESX.HideUI()
  end

  Citizen.Wait(interval)
end
end 
end)
--
-- TRAITEMENT

Citizen.CreateThread(function()
 
    while true do
        
local interval = 1 
local ped = PlayerPedId()   
local pos = GetEntityCoords(ped)
local findped = FindFirstPed(ped)
local findnext = FindNextPed(findped, ped)
local car = IsPedInAnyVehicle(ped, false)
local count = exports.ox_inventory:Search('count', 'plastic')
local oxy = exports.ox_inventory:Search('count', 'oxy')
local distance = GetDistanceBetweenCoords(pos, Config.Position.Traitement.x, Config.Position.Traitement.y, Config.Position.Traitement.z, true)

if car then
    Citizen.Wait(0)
    if distance < Config.CarDistance then
        
    DrawMarker(2, Config.Position.Traitement.x, Config.Position.Traitement.y, Config.Position.Traitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
    end
else

if distance > Config.DrawDistance then
interval = 200

else

    
interval = 1

DrawMarker(2, Config.Position.Traitement.x, Config.Position.Traitement.y, Config.Position.Traitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)

end

if distance < 1 then
ESX.TextUI(_U('traitement', "info"))

 if IsControlJustPressed(1, 51) then
 
        ESX.Progressbar('Traitement en cour...', 5000,{
         FreezePlayer = true, 
         animation ={
            type = "anim",
            dict = "anim@mp_player_intmenu@key_fob@", 
            lib ="fob_click" 
         }, 
         onFinish = function()
            if count < 2 then
                ESX.ShowNotification('Vous aver '..count.." Plastic", 'error', 1000)
                Citizen.Wait(1000)
                ESX.ShowNotification(_U('plastic_err', 'error', 1000))
                
                else
                TriggerServerEvent("DeuxiemeEvent")

            end
             
        end})

 end
else
    ESX.HideUI()
   
end

Citizen.Wait(interval)

end
end
end)
--
-- VENTE

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()

        Citizen.Wait(500)

        if IsControlJustPressed(1, 244) then
            Citizen.Wait(500)
            print('test')
        end
    end


end)