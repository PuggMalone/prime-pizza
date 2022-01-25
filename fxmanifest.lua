fx_version 'cerulean'
game 'gta5'

author 'Legos'
description 'Pizza Restaurant by Legos'
version '1.1.0'

ui_page {'html/index.html'}

shared_scripts {
    'config.lua'
}

client_scripts {
	'client/main.lua',
	'client/garage.lua',
	'client/menus.lua'
}

server_script 'server/*.lua'

exports {
    'GetActiveRegister',
    'qb-target',
}

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js',
} 