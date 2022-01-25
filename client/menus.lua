
-- target

-- NH - Context --

RegisterNetEvent('nh-context:PMeals', function(data)
    local id = data.id
    local number = data.number
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "| Available Meals |",
            txt = "",
        },
        {
            id = 2,
            header = "Margherita Pizza",
            txt = "Dough , Mozzarella, Basil, Tomato Sauce",
            params = {
                event = "prime-pizza:Margherita"
            }
        },
        {
            id = 3,
            header = "Pepperoni Pizza",
            txt = "Dough , Mozzarella, Pepperoni, Tomato Sauce",
            params = {
                event = "prime-pizza:Pepperoni"
            }
        },
        {
            id = 4,
            header = "Lasagna",
            txt = "Pasta , Meat , Mozzarella , Tomato Sauce",
            params = {
                event = "prime-pizza:Lasagna"
            }
        },
        {
            id = 5,
            header = "Pasta in Bianco",
            txt = "Pasta , Mozzarella",
            params = {
                event = "prime-pizza:Bianco"
            }
        },
        {
            id = 6,
            header = "Risotto",
            txt = "Rice , Broth, Parmesan",
            params = {
                event = "prime-pizza:Risotto"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)

RegisterNetEvent('nh-context:PDMeals', function(data)
    local id = data.id
    local number = data.number
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "| Available Desserts |",
            txt = "",
        },
        {
            id = 2,
            header = "Tiramisu",
            txt = "Flour , Egg , Coffee , Cococa",
            params = {
                event = "prime-pizza:Tiramisu"
            }
        },
        {
            id = 3,
            header = "Tartufo di Pizzo",
            txt = "Chocolate , Cocoa , Ice Cream",
            params = {
                event = "prime-pizza:Tartufo"
            }
        },
        {
            id = 4,
            header = "Trio of Gelato",
            txt = "Chocolate Scoop , Pistachio Scoop , Raspberry Scoop",
            params = {
                event = "prime-pizza:gelato"
            }
        },
        {
            id = 5,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)


RegisterNetEvent('nh-context:POrderMenu', function(data)
    local id = data.id
    local number = data.number
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Fridge |",
            txt = "",
        },
        {
            id = 1,
            header = "Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "prime-pizza:shop"
            }
        },
        {
            id = 2,
            header = "Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "prime-pizza:Storage2"
            }
        },
        {
            id = 3,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)

RegisterNetEvent('nh-context:PDrinkMenu', function(data)
    local id = data.id
    local number = data.number
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Drink Menu |",
            txt = "",
        },
        {
            id = 1,
            header = "Cola",
            txt = "Soda Syrup",
            params = {
                event = "prime-pizza:Cola"
            }
        },
        {
            id = 2,
            header = "Sprunk",
            txt = "Soda Syrup",
            params = {
                event = "prime-pizza:Sprunk"
            }
        },
        {
            id = 3,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)

-- Till Stuff --
--RegisterNetEvent("prime-pizza:bill", function()
--    local dialog = exports['qb-input']:ShowInput({
--        header = "Create Receipt",
--        submitText = "Submit",
--        inputs = {
--            {
--                type = 'number',
--                isRequired = true,
--               name = 'id',
--                text = 'paypal id'
--            },
--            {
--                type = 'number',
--                isRequired = true,
--                name = 'amount',
--                text = 'amount!'
--            }
--        }
--    })
--    if dialog then
--        if not dialog.id or not dialog.amount then return end
--        TriggerServerEvent("prime-pizza:bill:player", dialog.id, dialog.amount)
--    end
-- end)
Citizen.CreateThread(function()
exports['qb-target']:AddBoxZone("HenReceipt1", vector3(-584.07, -1058.69, 22.34), 0.5, 0.5, {
    name="HenReceipt1",
    heading = 0,
	debugPoly = false,
	minZ=19.04,
	maxZ=23.04,
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

exports['qb-target']:AddBoxZone("HenReceipt2", vector3(-584.09, -1061.47, 22.34), 0.5, 0.5, {
    name="HenReceipt2",
    heading = 0,
	debugPoly = false,
	minZ=19.04,
	maxZ=23.04,
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

exports['qb-target']:AddBoxZone("pcraftmeal", vector3(-591.23, -1056.56, 22.36), 2.0, 1.0, {
    name="pcraftmeal",
    heading = 0,
	debugPoly = false,
	minZ = 21.36,
	maxZ = 25.36,
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

exports['qb-target']:AddBoxZone("pcraftdessert", vector3(-591.02, -1059.68, 22.35), 1.0, 1.0, {
    name="pcraftdessert",
    heading = 0,
	debugPoly = false,
	minZ = 21.35,
	maxZ = 25.35,
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
end)