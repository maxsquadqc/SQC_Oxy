ESX = exports['es_extended']:getSharedObject()
local ox_inventory = exports.ox_inventory

RegisterNetEvent('sqc_recoltes:recolte')
AddEventHandler('sqc_recoltes:recolte', function(Item)
    if Item == nil then return end 
    local source = source

    local countItem = ox_inventory:Search(source, 'count', Item)
    local randomQuantity = math.random(Config.ItemPerRecolteMin, Config.ItemPerRecolteMax)
    if countItem > Config.LimiteOnPlayerRecoltes then 
        return

    else 
        if ox_inventory:CanCarryItem(source, Item, randomQuantity) then
            ox_inventory:AddItem(source, Item, randomQuantity)
        else
            lib.notify({
                title = 'Recolte',
                description = 'Vous ne pouvez plus rammasser de Plastic, penser a les traiter.',
                type = 'error'
            })
        end
    end

end)


RegisterNetEvent('sqc_recoltes:traitement')
AddEventHandler('sqc_recoltes:traitement', function(Item, Quantity, ItemReward, QuantityReward)
    if Item == nil then return end 
    if Quantity == nil then return end
    if ItemReward == nil then return end
    if QuantityReward == nil then return end

    local source = source

   -- local countItem = ox_inventory:Search(source, 'count', Item)
   local hasPlastic = ox_inventory:Search(source, 'count', 'plastic')
   local hasMedicament = ox_inventory:Search(source, 'count', 'medicament')
    local randomQuantity = math.random(1, QuantityReward)

    if hasPlastic >= 2 and hasMedicament >= 2 then       
        if ox_inventory:CanCarryItem(source, Item, randomQuantity) then
            ox_inventory:RemoveItem(source, 'plastic', 2)
            ox_inventory:RemoveItem(source, 'medicament', 2)
            ox_inventory:AddItem(source, 'Oxy', randomQuantity)
        else
 
        end
    else 

        return
    end

end)