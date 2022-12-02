fx_version 'cerulean'
game 'gta5'

author 'UvrajLamichhane'
description 'qb-nepalibeanmachine for QBCore Created By UvrajLamichhane'
version '3.1.0'

shared_scripts {
    'config.lua'
}

client_scripts {
	'client/main.lua',
	'client/menus.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}
