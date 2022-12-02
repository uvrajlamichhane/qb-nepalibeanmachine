# qb-nepalibeanmachine
Bean Machine With Nepali Food

# A Nepali Bean Machine for QBCore Framework

Preview *outdated* : 

## Insert into @qb-smallresources --> server --> consumables.lua
```
--nepalibeanmachine
--Drinks
QBCore.Functions.CreateUseableItem("milktea", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("blacktea", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
--Food
QBCore.Functions.CreateUseableItem("puri", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("puff", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("samosa", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("tarkari", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("pakoda", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("panipuri", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("chawmin", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("momo", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("jari", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("selroti", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
```



## Insert into @qb-smallresources --> config.lua
```
Consumeables = {
--Food 
["panipuri"] = math.random(20, 40),
["momo"] = math.random(40, 60),
["jari"] = math.random(20, 35),
["puri"] = math.random(15, 30),
["tarkari"] = math.random(15, 30),
["chawmin"] = math.random(40, 50),
["selroti"] = math.random(20, 30),
["samosa"] = math.random(15, 30),
["pakoda"] = math.random(10, 20),
["puff"] = math.random(10, 20),
--Drinks
["blacktea"] = math.random(10, 20),
["milktea"] = math.random(15, 30),
} 
```

## Insert into @qb-core/shared/items.lua 

```
QBShared.Items = {
    --costom khaja ghar item
    ["samosa"] 				 = {["name"] = "samosa", 			["label"] = "Samosa", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "samosa.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja samosa ho raja"},
    ["puff"] 				 = {["name"] = "puff", 			 	["label"] = "Puff", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "puff.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
    ["tarkari"] 			 = {["name"] = "tarkari", 			["label"] = "Tarkari", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "tarkari.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
    ["puri"] 				 = {["name"] = "puri", 			 	["label"] = "Puri", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "puri.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
    ["blacktea"] 			 = {["name"] = "blacktea", 			["label"] = "Blacktea", 				["weight"] = 250, 		["type"] = "item", 		["image"] = "blacktea.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
    ["milktea"] 			 = {["name"] = "milktea", 			["label"] = "Milktea", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "milktea.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
    ["momo"] 				 = {["name"] = "momo", 			 	["label"] = "MoMo", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "momo.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
	["jari"] 				 = {["name"] = "jari", 			 	["label"] = "Jari", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "jari.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
	["chawmin"] 			 = {["name"] = "chawmin", 		    ["label"] = "Chawmin", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "chawmin.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
	["selroti"] 			 = {["name"] = "selroti", 			["label"] = "selroti", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "selroti.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
	["panipuri"] 			 = {["name"] = "panipuri", 			["label"] = "Pani Puri", 				["weight"] = 250, 		["type"] = "item", 		["image"] = "panipuri.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
    ["pakoda"] 				 = {["name"] = "pakoda", 			["label"] = "Pakoda", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "pakoda.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
	--For Khaja
	["aata"] 				 = {["name"] = "aata", 			 	["label"] = "Aata", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "aata.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
	["suger"] 				 = {["name"] = "suger", 			["label"] = "Suger", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "suger.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
	["aalu"] 				 = {["name"] = "aalu", 			 	["label"] = "Aalu", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "aalu.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
	["keema"] 				 = {["name"] = "keema", 			["label"] = "Keema", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "keema.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
	["chat"] 				 = {["name"] = "chat", 			 	["label"] = "Chat", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "chat.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
	["chana"] 				 = {["name"] = "chana", 			["label"] = "Chana", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "chana.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
	["milk"] 				 = {["name"] = "milk", 			 	["label"] = "Milk", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "milk.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
    ["noodles"] 			 = {["name"] = "noodles", 			["label"] = "Chawmin Noodles", 			["weight"] = 250, 		["type"] = "item", 		["image"] = "noodles.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
    ["onion"] 			     = {["name"] = "onion", 			["label"] = "Onion", 		        	["weight"] = 250, 		["type"] = "item", 		["image"] = "onion.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Xito xaRito hamro khaja"},
}
```
## Insert into @qb-core/shared/jobs.lua 
```
QBShared.Jobs = {
    ["nepalibeanmachine"] = {
        label = "Nepali Bean Machine",
        defaultDuty = true,
        grades = {
            ['1'] = {
                name = 'KamDar',
                offDutyPay = false,
                payment = 200,
            },
            ['2'] = {
                name = 'Malik',
                isboss = true,
                offDutyPay = true,
                payment = 300,
            },
        },
    },
}		
```



## Insert into @qb-bossmenu - config.lua
```
['nepalibeanmachine'] = vector3(-657.57, -862.48, 24.5),
```
# if not making use of qb-target no need to insert this into qb-target

## Insert into @qb-target - config.lua - config.targetmodels
``` 
["khajagarage"] = {
			models = {
				"ig_floyd"
			},
			options = {
				{
					type = "client",
					event = "garage:khajaGarage",
					icon = "fas fa-car",
					label = "Khaja Garage",
					job = "nepalibeanmachine",
				}
			},
			distance = 2.5,
		},
