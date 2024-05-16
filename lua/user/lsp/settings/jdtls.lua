local bash = function(cmd)
	-- Run command as sub-process
	local handle = io.popen(cmd)
	-- Read output
	local read = handle:read('*a')
	-- Close sub-process
	handle:close()

	-- Replace newline with a space
	return read:gsub('[\n\r]', ' ')
	-- Credits: https://stackoverflow.com/questions/9676113/lua-os-execute-return-value
end

-- Paths
local user       = os.getenv("USER")
local jdtls_path = '/home/' .. user .. '/.local/share/nvim/mason/packages/jdtls/'
local cache_path = '/home/' .. user .. '/.cache/jdtls/'

-- equinox version may change
local equinox_version = bash('ls ' .. jdtls_path .. 'plugins | grep equinox.launcher_')
local jar_path = jdtls_path .. 'plugins/' .. (equinox_version:gsub(' ', ''))

-- Using incubator modules: jdk.incubator.vector, jdk.incubator.foreign
-- ????
return {
	cmd = {
		'java',

		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',

		-- All below are not technically default configuration
		'-Dosgi.configuration.cascaded=true',
		'-Dosgi.checkConfiguration=true',
		'-Dosgi.sharedConfiguration.area=' .. jdtls_path .. 'config_linux',
		'-Dosgi.sharedConfiguration.area.readOnly=true',

		-- '-Xms1G',
		'-Xms124M',
		'-Xmx524M',

		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',

		'-jar', jar_path,
		'-configuration', cache_path .. 'config',
		'-data', cache_path .. 'workspace',
	}
}

-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = cache_path .. project_name

--[[
-Declipse.application=org.eclipse.jdt.ls.core.id1
-Dosgi.bundles.defaultStartLevel=4
-Declipse.product=org.eclipse.jdt.ls.core.product
-Dosgi.checkConfiguration=true
-Dosgi.sharedConfiguration.area=/home/vako/.local/share/nvim/mason/packages/jdtls/config_linux
-Dosgi.sharedConfiguration.area.readOnly=true
-Dosgi.configuration.cascaded=true

-Xms1G

--add-modules=ALL-SYSTEM
--add-opens java.base/java.util=ALL-UNNAMED
--add-opens java.base/java.lang=ALL-UNNAMED

-jar /home/vako/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.800.v20240304-1850.jar
-data /home/vako/.cache/jdtls/workspace
-configuration /home/vako/.cache/jdtls/config


--]]
