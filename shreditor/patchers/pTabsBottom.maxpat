{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 3,
			"architecture" : "x86"
		}
,
		"rect" : [ 540.0, 313.0, 974.0, 841.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 8.0, 8.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-11",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 168.0, 520.0, 151.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 128.0, 536.0, 261.0, 20.0 ],
					"text" : "User wavetable transfer is not yet implemented",
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-12",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 658.0, 641.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 656.0, 640.0, 35.0, 20.0 ],
					"text" : "640"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 666.0, 197.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 664.0, 200.0, 31.0, 20.0 ],
					"text" : "200"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 680.0, 448.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 656.0, 440.0, 31.0, 20.0 ],
					"text" : "440"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 632.0, 598.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 632.0, 640.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 630.0, 450.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 632.0, 440.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 592.0, 352.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 640.0, 200.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "bpatcher",
					"name" : "pMatrix.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 192.0, 568.0, 224.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 200.0, 568.0, 224.0 ],
					"varname" : "pMatrix"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 720.0, 80.0, 69.0, 20.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-2",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 720.0, 40.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "bpatcher",
					"name" : "pSequencer.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 568.0, 176.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 8.0, 568.0, 192.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-34::obj-80" : [ "Mod12Amount", ".", 0 ],
			"obj-1::obj-192" : [ "grid", "grid", 0 ],
			"obj-34::obj-74" : [ "Mod5Amount", ".", 0 ],
			"obj-34::obj-23" : [ "Mod2Amount", ".", 0 ],
			"obj-34::obj-62" : [ "Mod7Amount", ".", 0 ],
			"obj-1::obj-191" : [ "sequencerSteps", "steps", 0 ],
			"obj-34::obj-86" : [ "Mod11Amount", ".", 0 ],
			"obj-34::obj-44" : [ "Mod4Amount", ".", 0 ],
			"obj-34::obj-98" : [ "Mod9Amount", ".", 0 ],
			"obj-34::obj-20" : [ "Mod1Amount", ".", 0 ],
			"obj-34::obj-68" : [ "Mod6Amount", ".", 0 ],
			"obj-34::obj-92" : [ "Mod10Amount", ".", 0 ],
			"obj-34::obj-50" : [ "Mod3Amount", ".", 0 ],
			"obj-34::obj-56" : [ "Mod8Amount", ".", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "pSequencer.maxpat",
				"bootpath" : "/Users/thijskoerselman/Documents/Projects/Shreditor/shreditor/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "pMatrix.maxpat",
				"bootpath" : "/Users/thijskoerselman/Documents/Projects/Shreditor/shreditor/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "param.maxpat",
				"bootpath" : "/Users/thijskoerselman/Documents/Projects/Shreditor/shreditor/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "_.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
