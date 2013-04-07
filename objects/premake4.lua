--[[
This is a script for Premake 4.x

Example build using GNU Make:
$ premake4 gmake
$ make config=release
--]]

solution "MutableSysex"

	configurations { "Debug", "Release" }
	-- platforms { "native", "universal" }
	platforms { "native", "x32", "x64" }

    libdirs {
		-- "../sandbox/lib",
        -- "/opt/local/lib",
        "/usr/local/lib",
        -- "include/max-includes",
    }

    includedirs {
    	"include/*",
			"include/max-includes/*",
			"include/msp-includes/*",
      -- "/usr/local/include",

    }

    defines {
    	PRODUCT_VERSION = "6.1.0"
  	}

    -- Configuration dependent settings
    -- * is used to target all variants
	configuration 	{ "Debug*" }
		defines 	{ "_DEBUG", "DEBUG"}
		flags   	{ "Symbols", "ExtraWarnings" }
		targetdir	"bin"

	configuration 	{ "Release*" }
  	defines 	{ "NDEBUG" }
  	flags   	{ "Optimize" }
		targetdir	"bin"

    -- Project dependent settings
	project "Cc2Nrpn"
		language 	"C++"
		kind     	"Bundle"
		targetname 	"vx.cc2nrpn.mxo"
		location 	"build"
		-- pchheader ( "macho-prefix.pch" )

		-- recursively include files from the source directory
		files {
		    "src/vx.cc2nrpn.cpp", -- add files based on project name
		    "include/common/commonsyms.c",
		    -- "include/maxcpp6.h",
		}

		-- includedirs {
  --   	"include/**",
		-- 	-- "include/max-includes/**",
  --     "/usr/local/include",

  --   }

		links {
			-- "Cosi"
			"Carbon.framework",
			-- "MaxAPI.framework",
			-- "MaxAudioAPI.framework"

		}

		-- linkoptions {
		-- 	"-framework Carbon",
		-- 	"-framework MaxAPI",
		-- 	-- "-framework MaxAudioAPI",
		-- }

		-- if(_ACTION == "gmake") then
		-- 	includedirs { "src" }
		-- 	pchheader ( "macho-prefix.pch" )
		-- 	print("action gmake")
		-- else
		-- 	pchheader ( "../src/Vaux-Prefix.h" )
		-- 	print("action not gmake")
		-- end



		-- buildoptions { "-Wno-reorder" }

	-- add custom install target
	-- based on example at http://github.com/trezker/allua/blob/master/premake4.lua
	-- newaction {
	-- 	trigger     = "install",
	-- 	description = "Install the binaries",
	-- 	execute = function ()
	-- 		-- copy files, etc. here
	-- 		os.mkdir(_OPTIONS["install_prefix"].."bin/");
	-- 		files = os.matchfiles("bin/*")
	-- 		print ("Installing files to " .. _OPTIONS["install_prefix"] .."bin/")
	-- 		for k, f in pairs(files) do
	-- 			print ("Copying " .. f)
	-- 			os.copyfile(f, _OPTIONS["install_prefix"].."bin/")
	-- 		end
	-- 	end
	-- }
	--
	-- newaction {
	-- 	trigger     = "docs",
	-- 	description = "Build documentation",
	-- 	execute = function ()
	-- 		os.execute("../NaturalDocs/NaturalDocs -i include -i src -i test -i docs/nd -o HTML docs/html -p nd -ro")
	-- 	end
	-- }
	--
	-- if not _OPTIONS["install_prefix"] then
	--    _OPTIONS["install_prefix"] = "../sandbox/"
	-- end
	--
	-- -- Add trailing / to install_prefix if not already there
	-- if not ("/" == _OPTIONS["install_prefix"]:sub(_OPTIONS["install_prefix"]:len())) then
	-- 	_OPTIONS["install_prefix"] = _OPTIONS["install_prefix"] .. "/"
	-- end
	--



   -- if _ACTION == "clean" then
   --     os.rmdir("build")
   -- end

   -- if _ACTION == "install" then
   --     os.copyfile("bin/*", "../sandbox/bin")
   -- end

    -- if _ACTION == "clean" then
    --     os.rmdir("bin")
    -- end

