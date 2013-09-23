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
		"rect" : [ 953.0, 78.0, 647.0, 1077.0 ],
		"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
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
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 712.0, 60.0, 20.0 ],
					"text" : "param 11"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-35",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 696.0, 47.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.0, 128.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "SubShape",
							"parameter_shortname" : "Shape",
							"parameter_type" : 2,
							"parameter_mmax" : 10.0,
							"parameter_enum" : [ "sq1", "tr1", "pl1", "sq2", "tr2", "pl2", "click", "glitch", "blow", "metal", "pop" ],
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "SubShape"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 656.0, 61.0, 20.0 ],
					"text" : "param 10"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-33",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 640.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 128.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "NoiseVolume",
							"parameter_shortname" : "Noise",
							"parameter_type" : 1,
							"parameter_mmax" : 63.0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "NoiseVolume"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 600.0, 55.0, 20.0 ],
					"text" : "param 9"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-31",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 584.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 128.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "SubVolume",
							"parameter_shortname" : "SubVol",
							"parameter_type" : 1,
							"parameter_mmax" : 63.0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "SubVolume"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 512.0, 55.0, 20.0 ],
					"text" : "param 8"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-26",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 496.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 128.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "OscMix",
							"parameter_shortname" : "Mix",
							"parameter_type" : 1,
							"parameter_mmax" : 63.0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "OscMix"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 448.0, 55.0, 20.0 ],
					"text" : "param 7"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-28",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 432.0, 49.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.0, 64.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "Osc2Detune",
							"parameter_shortname" : "Detune",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "Osc2Detune"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 392.0, 55.0, 20.0 ],
					"text" : "param 6"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 376.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 64.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "Osc2Range",
							"parameter_shortname" : "Range",
							"parameter_type" : 1,
							"parameter_mmin" : -24.0,
							"parameter_mmax" : 24.0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "Osc2Range"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 336.0, 55.0, 20.0 ],
					"text" : "param 5"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-22",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 320.0, 49.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 64.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "Osc2Parameter",
							"parameter_shortname" : "Param",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "Osc2Parameter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 272.0, 55.0, 20.0 ],
					"text" : "param 4"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-24",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 256.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 64.0, 50.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "Osc2Shape",
							"parameter_shortname" : "Shape",
							"parameter_type" : 2,
							"parameter_mmax" : 33.0,
							"parameter_enum" : [ "none", "saw", "square", "triang", "zsaw", "zreso", "ztri", "zpulse", "zsync", "pad", "fm", "waves", "tampur", "digitl", "metall", "bowed", "slap", "organ", "male", "user", "8bits", "crush", "pwm", "noise", "vowel", "belish", "polatd", "cello", "clpswp", "female", "fmtvoc", "frmnt2", "res3hp", "electp", "vibes" ],
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "Osc2Shape"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 216.0, 55.0, 20.0 ],
					"text" : "param 3"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-8",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 200.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.0, 0.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "ModulationOperator",
							"parameter_shortname" : "Operator",
							"parameter_type" : 2,
							"parameter_mmax" : 13.0,
							"parameter_enum" : [ "sum", "sync", "ring", "xor", "fuzz", ">>4", ">>8", "fold", "bits", "duo", "2steps", "4steps", "8steps", "seqmix" ],
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "ModulationOperator"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 160.0, 55.0, 20.0 ],
					"text" : "param 2"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 144.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 0.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "Osc1Range",
							"parameter_shortname" : "Range",
							"parameter_type" : 1,
							"parameter_mmin" : -24.0,
							"parameter_mmax" : 24.0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "Osc1Range"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 104.0, 55.0, 20.0 ],
					"text" : "param 1"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-4",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 88.0, 49.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 0.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "Osc1Parameter",
							"parameter_shortname" : "Param",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "Osc1Parameter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 40.0, 55.0, 20.0 ],
					"text" : "param 0"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 24.0, 24.0, 50.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 50.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "Osc1Shape",
							"parameter_shortname" : "Shape",
							"parameter_type" : 2,
							"parameter_mmax" : 33.0,
							"parameter_enum" : [ "none", "saw", "square", "triang", "zsaw", "zreso", "ztri", "zpulse", "zsync", "pad", "fm", "waves", "tampur", "digitl", "metall", "bowed", "slap", "organ", "male", "user", "8bits", "crush", "pwm", "noise", "vowel", "belish", "polatd", "cello", "clpswp", "female", "fmtvoc", "frmnt2", "res3hp", "electp", "vibes" ],
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "Osc1Shape"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-20" : [ "Osc2Range", "Range", 0 ],
			"obj-8" : [ "ModulationOperator", "Operator", 0 ],
			"obj-4" : [ "Osc1Parameter", "Param", 0 ],
			"obj-6" : [ "Osc1Range", "Range", 0 ],
			"obj-35" : [ "SubShape", "Shape", 0 ],
			"obj-22" : [ "Osc2Parameter", "Param", 0 ],
			"obj-33" : [ "NoiseVolume", "Noise", 0 ],
			"obj-1" : [ "Osc1Shape", "Shape", 0 ],
			"obj-28" : [ "Osc2Detune", "Detune", 0 ],
			"obj-24" : [ "Osc2Shape", "Shape", 0 ],
			"obj-31" : [ "SubVolume", "SubVol", 0 ],
			"obj-26" : [ "OscMix", "Mix", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "param.maxpat",
				"bootpath" : "/Users/thijskoerselman/Documents/Projects/Shreditor/shreditor/patchers",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ]
	}

}
