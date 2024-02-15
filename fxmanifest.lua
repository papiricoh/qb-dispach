fx_version 'cerulean'
games { 'gta5' }

author 'Papiricoh'
description 'qb-dispatch'
version '1.0.0'


server_scripts {
    'server.lua',
}

-- Archivos del lado del cliente
client_scripts {
    'client.lua',  -- Ruta a tu script del lado del cliente
    -- otros scripts del cliente si los hay
}

-- Archivos de UI (HTML, CSS, JavaScript)
ui_page 'ui-vue/dist/index.html' -- Ruta a tu archivo HTML principal de la UI

-- Si tienes archivos adicionales para la UI, como CSS o JavaScript, debes incluirlos aquí
files {
    'ui-vue/dist/*',
    'ui-vue/dist/assets/*',
}
