local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}
local onDuty = false
local debug = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Duty 

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "pizza" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('prime-pizza:toggleDuty', function()
	onDuty = not onDuty
	TriggerServerEvent('QBCore:ToggleDuty')
end)

RegisterNetEvent("prime-pizza:Tray1")
AddEventHandler("prime-pizza:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "pizzatray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pizzatray1", {
        maxweight = 10000,
        slots = 5,
    })
end)

RegisterNetEvent("prime-pizza:Storage")
AddEventHandler("prime-pizza:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "pizzastorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pizzastorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("prime-pizza:Storage2")
AddEventHandler("prime-pizza:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "pizzastorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pizzastorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

--MEALS

RegisterNetEvent("prime-pizza:Margherita")
AddEventHandler("prime-pizza:Margherita", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('prime-pizza:server:get:ingredientMargherita', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Margherita Pizza..", 6000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@prop_human_bbq@male@idle_a",
					anim = "idle_b",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "dough", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "mozzarella", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "basil", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "tsauce", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pizza-margherita", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pizza-margherita"], "add")
                    			QBCore.Functions.Notify("You made a Margherita Pizza", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)

RegisterNetEvent("prime-pizza:Pepperoni")
AddEventHandler("prime-pizza:Pepperoni", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('prime-pizza:server:get:ingredientPepperoni', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Pepperoni Pizza..", 6000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@prop_human_bbq@male@idle_a",
					anim = "idle_b",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "dough", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "mozzarella", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "pepperoni", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "tsauce", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pizza-pepperoni", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pizza-pepperoni"], "add")
                    			QBCore.Functions.Notify("You made a Pepperoni Pizza", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)

RegisterNetEvent("prime-pizza:Lasagna")
AddEventHandler("prime-pizza:Lasagna", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('prime-pizza:server:get:ingredientLasagna', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making some Lasagna..", 6000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@prop_human_bbq@male@idle_a",
					anim = "idle_b",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "pasta", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "meat", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "mozzarella", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "tsauce", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pizza-lasagna", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pizza-lasagna"], "add")
                    			QBCore.Functions.Notify("You made some Lasagna", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)

RegisterNetEvent("prime-pizza:Bianco")
AddEventHandler("prime-pizza:Bianco", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('prime-pizza:server:get:ingredientBianco', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Boiling Pasta..", 6000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@prop_human_bbq@male@idle_a",
					anim = "idle_b",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "pasta", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "mozzarella", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pizza-bianco", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pizza-bianco"], "add")
                    			QBCore.Functions.Notify("You made a plate of Pasta in Bianco", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)

RegisterNetEvent("prime-pizza:Risotto")
AddEventHandler("prime-pizza:Risotto", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('prime-pizza:server:get:ingredientrisotto', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making some Risotto..", 6000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@prop_human_bbq@male@idle_a",
					anim = "idle_b",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "catcafe-rice", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "catcafe-broth", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "parmesan", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pizza-risotto", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pizza-risotto"], "add")
                    			QBCore.Functions.Notify("You made a plate of Risotto", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)

--- DESSERTS

RegisterNetEvent("prime-pizza:Tiramisu")
AddEventHandler("prime-pizza:Tiramisu", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('prime-pizza:server:get:ingredientTiramisu', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Tiramisu..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@prop_human_parking_meter@male@idle_a",
					anim = "idle_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "catcafe-flour", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "catcafe-egg", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "coffee", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocoa", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pizza-tiramisu", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pizza-tiramisu"], "add")
                    			QBCore.Functions.Notify("You made a Tiramisu", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)


RegisterNetEvent("prime-pizza:Tartufo")
AddEventHandler("prime-pizza:Tartufo", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('prime-pizza:server:get:ingredientTartufo', function(HasItem)  
    		if HasItem then
				QBCore.Functions.Progressbar("pickup_sla", "Making Tartufo di Pizzo..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@prop_human_parking_meter@male@idle_a",
					anim = "idle_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "chocolate", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocoa", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "catcafe-icecream", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pizza-tartufo", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pizza-tartufo"], "add")
                    			QBCore.Functions.Notify("You made a Tartufo di Pizzo", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)

RegisterNetEvent("prime-pizza:gelato")
AddEventHandler("prime-pizza:gelato", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('prime-pizza:server:get:ingredientgelato', function(HasItem)  
    		if HasItem then
				QBCore.Functions.Progressbar("pickup_sla", "Scooping Gelato..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@prop_human_parking_meter@male@idle_a",
					anim = "idle_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "cgelato", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "pgelato", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rgelato", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pizza-gelato", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pizza-gelato"], "add")
                    			QBCore.Functions.Notify("You made a Trio of Gelato", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)

-- DRINKS
RegisterNetEvent("prime-pizza:Cola")
AddEventHandler("prime-pizza:Cola", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('prime-pizza:server:get:ingredientsoda', function(HasItem)  
    		if HasItem then
				QBCore.Functions.Progressbar("pickup_sla", "Pouring Cola..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@prop_human_atm@male@idle_a",
					anim = "idle_b",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "sodasyrup", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "cola", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cola"], "add")
                    			QBCore.Functions.Notify("You poured a cup of Cola", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have any soda syrup", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)

RegisterNetEvent("prime-pizza:Sprunk")
AddEventHandler("prime-pizza:Sprunk", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('prime-pizza:server:get:ingredientsoda', function(HasItem)  
    		if HasItem then
				QBCore.Functions.Progressbar("pickup_sla", "Pouring Sprunk..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@prop_human_atm@male@idle_a",
					anim = "idle_b",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "sodasyrup", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "sprunk", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sprunk"], "add")
                    			QBCore.Functions.Notify("You poured a cup of Sprunk", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have any soda syrup", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)

-- COFFEE AND DOUGH
RegisterNetEvent("prime-pizza:dough")
AddEventHandler("prime-pizza:dough", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('prime-pizza:server:get:ingredientdough', function(HasItem)  
    		if HasItem then
				QBCore.Functions.Progressbar("pickup_sla", "Kneading Dough..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@heist_safehouse_intro@variations@male@kitchen",
					anim = "kitchen_part_one_loop",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "catcafe-flour", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "catcafe-egg", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "dough", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["dough"], "add")
                    			QBCore.Functions.Notify("You made Dough", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)

RegisterNetEvent("prime-pizza:coffee")
AddEventHandler("prime-pizza:coffee", function()
	if onDuty then
		QBCore.Functions.Progressbar("pickup_sla", "Pouring Coffee..", 4000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {
			animDict = "amb@prop_human_atm@male@idle_a",
			anim = "idle_b",
			flags = 8,
		}, {}, {}, function() -- Done
			TriggerServerEvent('QBCore:Server:AddItem', "coffee", 1)
						TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["coffee"], "add")
						QBCore.Functions.Notify("You poured a cup of Coffee", "success")
		end, function()
			QBCore.Functions.Notify("Cancelled..", "error")
		end)
	else 
		QBCore.Functions.Notify("You must be clocked into work", "error")
	end
end)

-- Functions --
function MakeSoftdrinkC()
    TriggerServerEvent('QBCore:Server:RemoveItem', "sodasyrup", 1)
    QBCore.Functions.Progressbar("pickup", "Filling up cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "cola", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cola"], "add")
    QBCore.Functions.Notify("You made a Cola", "success")
end  

function MakeSoftdrinkS()
    TriggerServerEvent('QBCore:Server:RemoveItem', "sodasyrup", 1)
    QBCore.Functions.Progressbar("pickup", "Filling up cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "sprunk", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sprunk"], "add")
    QBCore.Functions.Notify("You made a Sprunk", "success")
end  

RegisterNetEvent("prime-pizza:shop")
AddEventHandler("prime-pizza:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "louis", Config.Items)
end)

--Menus--

-- RegisterNetEvent('nh-context:PMeals', function(data)
-- 	local id = data.id
--     local number = data.number
--     TriggerEvent('nh-context:createMenu', {
--         {
--             header = "| Available Meals |",
--             txt = "",
--         },
--         {
--             header = "Margherita Pizza",
--             context = "Dough , Mozzarella , Basil, Tomato Sauce",
-- 				event = "prime-pizza:Margherita"
			
--         },
--         {
--             header = "Pepperoni Pizza",
--             context = "Dough , Mozzarella , Pepperoni, Tomato Sauce",
--             event = "prime-pizza:Pepperoni"
--         },
--         {
--             header = "Lasagna",
--             context = "Pasta , Meat , Mozzarella , Tomato Sauce",
--             event = "prime-pizza:Lasagna"
--         },
-- 		{
--             header = "Pasta in Bianco",
--             context = "Pasta , Mozzarella",
--             event = "prime-pizza:Bianco"
--         },
-- 		{
--             header = "Risotto",
--             context = "Rice , Broth, Parmesan",
--             event = "prime-pizza:Risotto"
--         },
--         {
--             header = "Close (ESC)",
--             context = "",
--         },
--     })
-- end)

-- RegisterNetEvent('nh-context:PDMeals', function(data)
--     TriggerEvent('nh-context:createMenu', {
--         {
--             header = "| Available Desserts |",
--             txt = "",
--         },
--         {
--             header = "Tiramisu",
--             context = "Flour , Egg , Coffee , Cocoa",
--             event = "prime-pizza:Tiramisu"
--         },
--         {
--             header = "Tartufo di Pizzo",
--             context = "Chocolate , Cocoa , Ice Cream",
--             event = "prime-pizza:Tartufo"
--         },
-- 		{
--             header = "Trio of Gelato",
--             context = "Chocolate Scoop , Pistachio Scoop , Raspberry Scoop",
--             event = "prime-pizza:gelato"
--         },
--         {
--             header = "Close (ESC)",
--             context = "",
--         },
--     })
-- end)


RegisterNetEvent('nh-context:POrderMenu', function(data)
    TriggerEvent('nh-context:createMenu', {
        {
            header = "| Fridge |",
            txt = "",
        },
        {
            header = "Order Items",
            context = "Order New Ingredients!",
            event = "prime-pizza:shop"
        },
        {
            header = "Close (ESC)",
            context = "",
        },
    })
end)

RegisterNetEvent('nh-context:PDrinkMenu', function(data)
    TriggerEvent('nh-context:createMenu', {
        {
            header = "| Drink Menu |",
            txt = "",
        },
        {
            header = "Cola",
            context = "Soda Syrup",
            event = "prime-pizza:Cola"
        },
		{
            header = "Sprunk",
            context = "Soda Syrup",
            event = "prime-pizza:Sprunk"
        },
        {
            header = "Close (ESC)",
            txt = "",
        },
    })
end)

-- Receipt
RegisterNetEvent('prime-pizza:Ticket:Menu', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "Pizza Payment", txt = "Do you want trade your tickets for payment?" },
        { header = "Yes", server = true, params = { event = "prime-pizza:Tickets:Sell" } },
        { header = "No", event = "prime-pizza:Tickets:Sell:no" },
    })
end)

RegisterNetEvent('prime-pizza:client:open:payment')
AddEventHandler('prime-pizza:client:open:payment', function()
    SetNuiFocus(true, true)
    SendNUIMessage({action = 'OpenPayment', payments = Config.ActivePayments})
end)

RegisterNetEvent('prime-pizza:client:open:register')
AddEventHandler('prime-pizza:client:open:register', function()
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else
		SetNuiFocus(true, true)
        SendNUIMessage({action = 'OpenRegister'})
	end
end)

RegisterNetEvent('prime-pizza:client:sync:register')
AddEventHandler('prime-pizza:client:sync:register', function(RegisterConfig)
    Config.ActivePayments = RegisterConfig
end)

function GetActiveRegister()
    return Config.ActivePayments
end

RegisterNUICallback('Click', function()
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback('ErrorClick', function()
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('AddPrice', function(data)
    TriggerServerEvent('prime-pizza:server:add:to:register', data.Price, data.Note)
end)

RegisterNUICallback('PayReceipt', function(data)
    TriggerServerEvent('prime-pizza:server:pay:receipt', data.Price, data.Note, data.Id)
end)

RegisterNUICallback('CloseNui', function()
    SetNuiFocus(false, false)
end)

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("PizzaReceipt1", vector3(810.94, -750.8, 26.78), 1.0, 1.0, {
		name="PizzaReceipt1",
		heading = 0,
		debugPoly = false,
		minZ=25.78,
  		maxZ=29.78,
	}, {
		options = {
			{
			event = "prime-pizza:client:open:register",
			icon = "fas fa-credit-card",
			label = "Charge Customer",
			job = "pizza",
			},
			{
			event = "prime-pizza:client:open:payment",
			icon = "fas fa-cash-register",
			label = "Make Payment",
			},
		},
		distance = 2.0
	})
	
	exports['qb-target']:AddBoxZone("PizzaReceipt2", vector3(810.99, -751.96, 26.78), 1.0, 1.0, {
		name="PizzaReceipt2",
		heading = 0,
		debugPoly = false,
		minZ=25.78,
 		maxZ=29.78,
	}, {
		options = {
			{
			event = "prime-pizza:client:open:register",
			icon = "fas fa-credit-card",
			label = "Charge Customer",
			job = "pizza",
			},
			{
			event = "prime-pizza:client:open:payment",
			icon = "fas fa-cash-register",
			label = "Make Payment",
			},
		},
		distance = 2.0
	})
	
	exports['qb-target']:AddBoxZone("Pcraftmeal", vector3(808.23, -762.25, 26.78), 1.0, 1.0, {
		name="Pcraftmeal",
		heading = 0,
		debugPoly = false,
		minZ = 25.78,
		maxZ = 29.78,
	}, {
		options = {
			{
			event = "nh-context:PMeals",
			icon = "fas fa-hat-chef",
			label = "Meal Station",
			job = "pizza",
			},
		},
		distance = 2.0
	})
	
	exports['qb-target']:AddBoxZone("Pcraftdessert", vector3(809.3, -761.09, 26.78), 1.0, 1.0, {
		name="Pcraftdessert",
		heading = 0,
		debugPoly = false,
		minZ = 25.78,
		maxZ = 29.78,
	}, {
		options = {
			{
			event = "nh-context:PDMeals",
			icon = "fas fa-oven",
			label = "Dessert Station",
			job = "pizza",
			},
		},
		distance = 2.0
	})

	exports['qb-target']:AddBoxZone("Pcraftsoda", vector3(811.34, -765.39, 26.78), 1.0, 1.0, {
		name="Pcraftsoda",
		heading = 0,
		debugPoly = false,
		minZ = 25.78,
		maxZ = 29.78,
	}, {
		options = {
			{
			event = "nh-context:PDrinkMenu",
			icon = "fas fa-glass",
			label = "Soda Station",
			job = "pizza",
			},
		},
		distance = 2.0
	})

	exports['qb-target']:AddBoxZone("pizzafridge", vector3(805.54, -761.8, 26.78), 2.0, 1.0, {
		name="pizzafridge",
		heading = 0,
		debugPoly = false,
		minZ = 25.78,
		maxZ = 29.78,
	}, {
		options = {
			{
			event = "nh-context:POrderMenu",
			icon = "fas fa-laptop",
			label = "Order Ingredients",
			job = "pizza",
			},
		},
		distance = 2.0
	})

	exports['qb-target']:AddBoxZone("pizzaduty", vector3(804.55, -760.82, 31.27), 1.0, 1.0, {
		name="pizzaduty",
		heading = 0,
		debugPoly = false,
		minZ = 30.27,
		maxZ= 34.27,
	}, {
		options = {
			{
			event = "prime-pizza:toggleDuty",
			icon = "fas fa-clipboard",
			label = "Clock On/Off",
			job = "pizza",
			},
		},
		distance = 2.0
	})

	exports['qb-target']:AddBoxZone("Pfreezer", vector3(803.74, -756.55, 26.78), 2.0, 1.0, {
		name="Pfreezer",
		heading = 270,
		debugPoly = false,
		minZ = 25.78,
		maxZ= 29.78,
	}, {
		options = {
			{
			event = "prime-pizza:Storage",
			icon = "fas fa-box",
            label = "Storage",
            job = "pizza",
			},
		},
		distance = 2.0
	})

	exports['qb-target']:AddBoxZone("pizzaboss", vector3(796.57, -748.8, 31.27), 2.0, 1.0, {
		name="pizzaboss",
		heading = 0,
		debugPoly = false,
		minZ= 30.27,
  		maxZ= 34.27,
	}, {
		options = {
			{
			event = "qb-bossmenu:client:openMenu",
			icon = "fas fa-clipboard",
			label = "access boss menu",
            job = "pizza",
			},
		},
		distance = 2.0
	})

	exports['qb-target']:AddBoxZone("pizzatray", vector3(811.15, -752.95, 26.78), 1.0, 1.0, {
		name="pizzatray",
		heading = 0,
		debugPoly = false,
		minZ=25.78,
 		maxZ=29.78,
	}, {
		options = {
			{
			event = "prime-pizza:Tray1",
			icon = "far fa-clipboard",
			label = "Take Food",
			},
		},
		distance = 2.0
	})

	exports['qb-target']:AddBoxZone("doughknead", vector3(807.76, -756.84, 26.78), 2.0, 1.0, {
		name="doughknead",
		heading = 270,
		debugPoly = false,
		minZ=25.78,
 		maxZ=29.78,
	}, {
		options = {
			{
			event = "prime-pizza:dough",
			icon = "far fa-pizza-slice",
			label = "Knead Dough",
			},
		},
		distance = 2.0
	})

	exports['qb-target']:AddBoxZone("pourcoffeP", vector3(811.38, -764.35, 26.78), 1.0, 1.0, {
		name="pourcoffeP",
		heading = 0,
		debugPoly = false,
		minZ=25.78,
 		maxZ=29.78,
	}, {
		options = {
			{
			event = "prime-pizza:coffee",
			icon = "far fa-coffee",
			label = "Pour Coffee",
			},
		},
		distance = 2.0
	})
	end)