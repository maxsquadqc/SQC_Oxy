
ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("PremierEvent")

AddEventHandler("PremierEvent", function()
    local _src = source
    local random = math.random(1, 3) --Returns a number between 1 and 3
    print("Premiere demande recu")
    exports.ox_inventory:AddItem(_src, 'plastic', random)
    Citizen.Wait(10)
    TriggerClientEvent('esx:showNotification', _src, 'Vous avez recu '..random..' plastic', 'success', 2000)

end)

RegisterNetEvent("DeuxiemeEvent")

AddEventHandler("DeuxiemeEvent", function()
    local _src = source
    local ox_inv = exports.ox_inventory
    local random = math.random(1, 3) --Returns a number between 1 and 3
    print("Deuxieme demande recu")
    
    ox_inv:RemoveItem(_src, 'plastic', 2)
    Citizen.Wait(500)
    ox_inv:AddItem(_src, 'oxy', random)
    Citizen.Wait(10)
    TriggerClientEvent('esx:showNotification', _src, 'Vous avez recu '..random..' oxy', 'success', 2000)


end)

RegisterNetEvent("test")

AddEventHandler("test", function()
    local _src = source
    exports.ox_inventory:Search(inv, search, item, 'dodo')

end)