local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = false

-- target

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("nepalibeanmachineDuty", vector3(278.8, -973.56, 29.42), 0.5, 0.5, {
        name="nepalibeanmachineDuty",
        heading=0,
        debugPoly=false,
        minZ=26.22,
        maxZ=30.22,
	}, {
		options = {
		    {  
			event = "qb-nepalibeanmachine:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "nepalibeanmachine",
		    },
		},
		distance = 1.5
	})

		exports['qb-target']:AddBoxZone("khaja_tray_1", vector3(279.94, -972.56, 29.42), 0.9, 0.5, {
            name="khaja_tray_1",
            heading=270,
            debugPoly=false,
            minZ=26.02,
            maxZ=30.02,
		}, {
			options = {
			    {
				event = "qb-nepalibeanmachine:Tray1",
				icon = "far fa-clipboard",
				label = "Tray 1",
			    },
			},
			distance = 1.5
		})

        exports['qb-target']:AddBoxZone("khaja_tray_2", vector3(283.32, -969.9, 29.43), 1.5, 0.5, {
            name="khaja_tray_2",
            heading=90,
            debugPoly=false,
            minZ=25.63,
            maxZ=29.63,
		}, {
			options = {
			    {
				event = "qb-nepalibeanmachine:Tray2",
				icon = "far fa-clipboard",
				label = "Table 1",
			    },
			},
			distance = 1.5
		})

        exports['qb-target']:AddBoxZone("khaja_tray_3", vector3(283.29, -966.28, 29.42), 1.7, 0.5, {
            name="khaja_tray_3",
            heading=270,
            debugPoly=false,
            minZ=25.62,
            maxZ=29.62,
		}, {
			options = {
			    {
				event = "qb-nepalibeanmachine:Tray1",
				icon = "far fa-clipboard",
				label = "Table 2",
			    },
			},
			distance = 1.5
		})

        exports['qb-target']:AddBoxZone("khaja_tray_4", vector3(279.64, -967.7, 29.42), 1.7, 0.5, {
            name="khaja_tray_4",
            heading=90,
            debugPoly=false,
            minZ=25.62,
            maxZ=29.62,
		}, {
			options = {
			    {
				event = "qb-nepalibeanmachine:Tray4",
				icon = "far fa-clipboard",
				label = "Table 3",
			    },
			},
			distance = 1.5
		})

        exports['qb-target']:AddBoxZone("teadrinks", vector3(280.97, -975.17, 29.42), 0.5, 0.3, {
            name="teadrinks",
            heading=0,
           debugPoly=false,
            minZ=26.42,
            maxZ=30.42
            }, {
            options = {
                {
                event = "nh-context:TeaMenu",
                icon = "fas fa-filter",
                label = "Make Some Tea",
                job = "nepalibeanmachine",
                },
            },
            distance = 1.5
            })


        exports['qb-target']:AddBoxZone("craftkhaja", vector3(279.51, -975.13, 29.42), 0.9, 0.5, {
            name="craftkhaja",
            heading=270,
            debugPoly=false,
            minZ=26.42,
            maxZ=30.42,
        }, {
                options = {
                    {
                        event = "nh-context:Khaja",
                        icon = "fas fa-box",
                        label = "Khaja Work Station",
                        job = "nepalibeanmachine",
                    },
                },
                distance = 1.5
            })

         exports['qb-target']:AddBoxZone("khajafridge", vector3(278.98, -971.88, 29.42), 0.9, 0.5, {
            name="khajafridge",
            heading=180,
            debugPoly=false,
            minZ=26.62,
            maxZ=30.62,
        }, {
                options = {
                    {
                        event = "nh-context:OrderMenu",
                        icon = "fas fa-laptop",
                        label = "Order Ingredients!",
                        job = "nepalibeanmachine",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("nepalibeanmachinedisplay", vector3(283.16, -976.29, 29.42), 0.9, 0.5, {
            name="nepalibeanmachinedisplay",
            heading=315,
            debugPoly=false,
            minZ=26.42,
            maxZ=30.42,
        }, {
                options = {
                    {
                        event = "qb-nepalibeanmachine:Storage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = "nepalibeanmachine",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("nepalibeanmachine_register_1", vector3(280.97, -972.55, 29.42), 0.5, 0.5, {
            name="nepalibeanmachine_register_1",
            heading=270,
            debugPoly=false,
            minZ=26.02,
            maxZ=30.02,
        }, {
                options = {
                    {
                        event = "qb-nepalibeanmachine:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "nepalibeanmachine",
                    },
                },
                distance = 1.5
            })
end)


-- QB-MENU --
RegisterNetEvent('nh-context:Khaja', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Available Khaja |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• MoMo",
            txt = "aata , keema",
            params = {
                event = "qb-nepalibeanmachine:momo"
            }
        },
        {
            
            header = "• Samosa",
            txt = "aata , aalu",
            params = {
                event = "qb-nepalibeanmachine:samosa"
            }
        },
        {
            
            header = "• Puri",
            txt = "chat , aata",
            params = {
                event = "qb-nepalibeanmachine:puri"
            }
        },
        {
            
            header = "• Jari",
            txt = "aata , suger",
            params = {
                event = "qb-nepalibeanmachine:jari"
            }
        },
        {
            
            header = "• Chawmin",
            txt = "noodles",
            params = {
                event = "qb-nepalibeanmachine:chawmin"
            }
        },
        {
            
            header = "• Pakoda",
            txt = "onion , aata",
            params = {
                event = "qb-nepalibeanmachine:pakoda"
            }
        },
        {
            
            header = "• Tarkari",
            txt = "aalu , chana",
            params = {
                event = "qb-nepalibeanmachine:tarkari"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)

RegisterNetEvent('nh-context:TeaMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            id = 0,
            header = "| Tea Menu |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Black Tea",
            txt = "suger",
            params = {
                event = "qb-nepalibeanmachine:blacktea"
            }
        },
        {
            
            header = "• Milk Tea",
            txt = "milk , suger",
            params = {
                event = "qb-nepalibeanmachine:milktea"
            }
        },
        {
           
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)

RegisterNetEvent('nh-context:OrderMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Fridge |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-nepalibeanmachine:shop"
            }
        },
        {
            
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-nepalibeanmachine:bill")
AddEventHandler("qb-nepalibeanmachine:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Bill",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Bill Price ($)", -- text you want to be displayed as a place holder
                name = "billprice", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = false -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("qb-nepalibeanmachine:bill:player", bill.citizenid, bill.billprice)
    end
end)

