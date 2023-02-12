ESX = exports['es_extended']:getSharedObject()

for k,v in pairs(Config.Recoltes) do

    print(k, v)

    local RecoltesPoints = lib.points.new(v, 5, {})

    function RecoltesPoints:nearby()

        if self.currentDistance < 5 then
            DrawMarker(2, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 200, 20, 20, 50, false, true, 2, nil, nil, false)
        end
        if self.currentDistance <= 2 and IsControlJustReleased(0, 38) then
            local count = exports.ox_inventory:Search('count', k)
            

            if count > Config.LimiteOnPlayerRecoltes then 
                lib.notify({
                    title = 'Recoltes',
                    description = 'Vous ne pouvez plus recolter.',
                    type = 'error'
                })   

                return
            end

            if lib.progressCircle({
                duration = 2000,
                position = 'bottom',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = true,
                    combat = true,
                    move = true,
                },
                anim = {
                    dict = 'mp_player_intdrink',
                    clip = 'loop_bottle'
                },
                prop = {
                    model = `prop_ld_flow_bottle`,
                    pos = vec3(0.03, 0.03, 0.02),
                    rot = vec3(0.0, 0.0, -1.5)
                },
            }) then 
                TriggerServerEvent('sqc_recoltes:recolte', k)
            end
        end
    end
end


    
for k,v in pairs(Config.Traitement) do

    print(k, v)

    local TraitementPoints = lib.points.new(v.coords, 5, {})

    function TraitementPoints:nearby()

        if self.currentDistance < 5 then
            DrawMarker(2, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 200, 20, 20, 50, false, true, 2, nil, nil, false)
        end
        if self.currentDistance <= 2 and IsControlJustReleased(0, 38) then
            local count = exports.ox_inventory:Search('count', k)
            local hasPlastic = exports.ox_inventory:Search('count', 'plastic')
            local hasMedicament = exports.ox_inventory:Search('count', 'medicament')
            if hasPlastic >= 2 and hasMedicament >= 2 then 
               
            if lib.progressCircle({
                duration = 2000,
                position = 'bottom',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = true,
                    combat = true,
                    move = true,
                },
                anim = {
                    dict = 'mp_player_intdrink',
                    clip = 'loop_bottle'
                },
                prop = {
                    model = `prop_ld_flow_bottle`,
                    pos = vec3(0.03, 0.03, 0.02),
                    rot = vec3(0.0, 0.0, -1.5)
                },
            }) then
               TriggerServerEvent('sqc_recoltes:traitement', k, count, v.item, v.quantity)
            end
            else
           
                lib.notify({
                    title = 'Traitement',
                    description = 'Vous n\'avez pas les ingredients nécessaire pour traiter.',
                    type = 'error'
                })   

                return
            end
        end
    end
end
