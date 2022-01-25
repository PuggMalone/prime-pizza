local QBCore = exports['qb-core']:GetCoreObject()

-- MEALS
QBCore.Functions.CreateCallback('prime-pizza:server:get:ingredientMargherita', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local dough = Ply.Functions.GetItemByName("dough")
    local mozzarella = Ply.Functions.GetItemByName("mozzarella")
    local basil = Ply.Functions.GetItemByName("basil")
    local tsauce = Ply.Functions.GetItemByName("tsauce")
    if dough ~= nil and mozzarella ~= nil and basil ~= nil and tsauce ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('prime-pizza:server:get:ingredientPepperoni', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local dough = Ply.Functions.GetItemByName("dough")
    local mozzarella = Ply.Functions.GetItemByName("mozzarella")
    local pepperoni = Ply.Functions.GetItemByName("pepperoni")
    local tsauce = Ply.Functions.GetItemByName("tsauce")
    if dough ~= nil and mozzarella ~= nil and pepperoni ~= nil and tsauce ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('prime-pizza:server:get:ingredientLasagna', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local pasta = Ply.Functions.GetItemByName("pasta")
    local meat = Ply.Functions.GetItemByName("meat")
    local mozzarella = Ply.Functions.GetItemByName("mozzarella")
    local tsauce = Ply.Functions.GetItemByName("tsauce")
    if pasta ~= nil and meat ~= nil and mozzarella ~= nil and tsauce ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('prime-pizza:server:get:ingredientBianco', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local pasta = Ply.Functions.GetItemByName("pasta")
    local mozzarella = Ply.Functions.GetItemByName("mozzarella")
    if pasta ~= nil and mozzarella ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('prime-pizza:server:get:ingredientrisotto', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local rice = Ply.Functions.GetItemByName("catcafe-rice")
    local broth = Ply.Functions.GetItemByName("catcafe-broth")
    local parmesan = Ply.Functions.GetItemByName("parmesan")
    if rice ~= nil and broth ~= nil and parmesan ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- DESSERTS
QBCore.Functions.CreateCallback('prime-pizza:server:get:ingredientTiramisu', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local flour = Ply.Functions.GetItemByName("catcafe-flour")
    local egg = Ply.Functions.GetItemByName("catcafe-egg")
    local coffee = Ply.Functions.GetItemByName("coffee")
    local cocoa = Ply.Functions.GetItemByName("cocoa")
    if flour ~= nil and egg ~= nil and coffee ~= nil and cocoa ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('prime-pizza:server:get:ingredientTartufo', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local chocolate = Ply.Functions.GetItemByName("chocolate")
    local cocoa = Ply.Functions.GetItemByName("cocoa")
    local icecream = Ply.Functions.GetItemByName("catcafe-icecream")
    if chocolate ~= nil and cocoa ~= nil and icecream ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('prime-pizza:server:get:ingredientgelato', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cgelato = Ply.Functions.GetItemByName("cgelato")
    local pgelato = Ply.Functions.GetItemByName("pgelato")
    local rgelato = Ply.Functions.GetItemByName("rgelato")
    if cgelato ~= nil and pgelato ~= nil and rgelato ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('prime-pizza:server:get:ingredientsoda', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local sodasyrup = Ply.Functions.GetItemByName("sodasyrup")
    if sodasyrup ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('prime-pizza:server:get:ingredientdough', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local flour = Ply.Functions.GetItemByName("catcafe-flour")
    local egg = Ply.Functions.GetItemByName("catcafe-egg")
    if flour ~= nil and egg ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- Register
RegisterServerEvent('prime-pizza:server:add:to:register')
AddEventHandler('prime-pizza:server:add:to:register', function(Price, Note)
    local RandomID = math.random(1111,9999)
    Config.ActivePayments[RandomID] = {['Price'] = Price, ['Note'] = Note}
    TriggerClientEvent('prime-pizza:client:sync:register', -1, Config.ActivePayments)
end)

RegisterServerEvent('prime-pizza:server:pay:receipt')
AddEventHandler('prime-pizza:server:pay:receipt', function(Price, Note, Id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveMoney('bank', Price, 'pizza') then
        if Config.ActivePayments[tonumber(Id)] ~= nil then
            Config.ActivePayments[tonumber(Id)] = nil
			TriggerEvent('prime-pizza:Tickets:Give')
            TriggerClientEvent('prime-pizza:client:sync:register', -1, Config.ActivePayments)
			TriggerEvent('qb-bossmenu:server:addAccountMoney', "pizza", Price)
		else
            TriggerClientEvent('QBCore:Notify', src, 'Error..', 'error')
        end
    else
		TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash..', 'error')
    end
end)

RegisterServerEvent('prime-pizza:Tickets:Give')
AddEventHandler('prime-pizza:Tickets:Give', function()
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then
            if Player.PlayerData.job.name == 'pizza' and Player.PlayerData.job.onduty then
                Player.Functions.AddItem('burger-ticket', 1, false, {["quality"] = nil})
				TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'Louis receipt received', 'success')
				TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['burger-ticket'], "add", 1) 
            end
        end
    end
end)

RegisterServerEvent('prime-pizza:Tickets:Sell')
AddEventHandler('prime-pizza:Tickets:Sell', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName("burger-ticket") ~= nil then
		tickets = Player.Functions.GetItemByName("burger-ticket").amount
		pay = (tickets * Config.PayPerTicket)
		Player.Functions.RemoveItem('burger-ticket', tickets)
		Player.Functions.AddMoney('bank', pay, 'henhouse-payment')
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burger-ticket'], "remove", tickets)
		TriggerClientEvent('QBCore:Notify', src, "Tickets: "..tickets.." Total: $"..pay, 'success')
	else 
		TriggerClientEvent('QBCore:Notify', src, "No tickets to trade", 'error')
	end
end)