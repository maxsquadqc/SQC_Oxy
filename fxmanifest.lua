fx_version 'adamant'

game 'gta5'

description 'Script testing'

version '1.7.5'

shared_script '@es_extended/imports.lua'

server_scripts {
    '@es_extended/locale.lua',
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'locales/fr.lua',
    'server/server.lua',
    'locales/*.lua'
	
}

client_scripts {
    '@es_extended/locale.lua',
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'locales/fr.lua',
	'client/client.lua',
    'locales/*.lua'
	
}

dependencies {
	'es_extended'
}
