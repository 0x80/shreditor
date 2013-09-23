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
		"rect" : [ 169.0, 227.0, 1431.0, 766.0 ],
		"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 8.0, 8.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 0,
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
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "int" ],
					"patching_rect" : [ 240.0, 96.0, 46.0, 20.0 ],
					"text" : "t 1 l 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 248.0, 464.0, 54.0, 20.0 ],
					"text" : "gate 1 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 848.0, 408.0, 85.0, 20.0 ],
					"text" : "s ---filterType"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 448.0, 504.0, 180.0, 20.0 ],
					"text" : "s ---systemSettingsMidiChannel"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 784.0, 312.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 152.0, 96.0, 37.0, 20.0 ],
					"text" : "Filter",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-71",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.955487, 0.975006, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 848.0, 312.0, 44.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "SystemCvMode",
							"parameter_shortname" : "CV",
							"parameter_type" : 2,
							"parameter_mmax" : 16.0,
							"parameter_enum" : [ "4cv in", "programmer", "pedals" ],
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "SystemCvMode"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-69",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.955487, 0.975006, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 696.0, 312.0, 49.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.0, 0.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "SystemSplit",
							"parameter_shortname" : "Split",
							"parameter_type" : 2,
							"parameter_mmax" : 16.0,
							"parameter_enum" : [ "C-1", "C0", "C1", "C2", "C3", "C4", "C5", "C6" ],
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "SystemSplit"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-68",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.955487, 0.975006, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 640.0, 312.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 64.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "SystemMidiMode",
							"parameter_shortname" : "Midi",
							"parameter_type" : 2,
							"parameter_mmax" : 16.0,
							"parameter_enum" : [ "off", "thru", "seq", "ctrl", "split", "full", "1>l", "2>1", "3>2", "4>3", "5>4", "6>5", "7>6", "8>7" ],
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "SystemMidiMode"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-67",
					"linecount" : 10,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 656.0, 440.0, 150.0, 141.0 ],
					"text" : "octave\nraga\nportamento\nlegato\nmaster_tuning\nmidi_channel\nmidi_out_mode\nmidi_split_point\nfilter\ncv mode"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-65",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.955487, 0.975006, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 584.0, 312.0, 44.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 64.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "SystemChannel",
							"parameter_shortname" : "Channel",
							"parameter_type" : 1,
							"parameter_mmax" : 16.0,
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "SystemChannel"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-64",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 336.0, 440.0, 69.0, 20.0 ],
					"text" : "temp block"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"framecolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"id" : "obj-58",
					"items" : [ "equal", ",", "just", ",", "pythagorean", ",", "1/4", "eb", ",", "1/4", "e", ",", "1/4", "ea", ",", "bhairav", ",", "gunakri", ",", "marwa", ",", "shree", ",", "purvi", ",", "bilawal", ",", "yaman", ",", "kafi", ",", "bhimpalasree", ",", "darbari", ",", "bageshree", ",", "rageshree", ",", "khamaj", ",", "mi'mal", ",", "parameshwari", ",", "rangeshwari", ",", "gangeshwari", ",", "kameshwari", ",", "palas", "kafi", ",", "natbhairav", ",", "m.kauns", ",", "bairagi", ",", "b.todi", ",", "chandradeep", ",", "kaushik", "todi", ",", "jogeshwari", ",", "rasia" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 400.0, 256.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 152.0, 64.0, 96.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-56",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.955487, 0.975006, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 528.0, 312.0, 44.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 64.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "SystemTuning",
							"parameter_shortname" : "Tuning",
							"parameter_type" : 1,
							"parameter_mmin" : -127.0,
							"parameter_mmax" : 126.0,
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "SystemTuning"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-55",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.955487, 0.975006, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 472.0, 312.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 0.0, 49.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "SystemLegato",
							"parameter_shortname" : "Legato",
							"parameter_type" : 2,
							"parameter_enum" : [ "off", "on" ],
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "SystemLegato"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-50",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.955487, 0.975006, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 416.0, 312.0, 44.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 0.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "SystemPortamento",
							"parameter_shortname" : "Porta",
							"parameter_type" : 1,
							"parameter_mmax" : 63.0,
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "SystemPortamento"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-48",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.955487, 0.975006, 1.0, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 352.0, 312.0, 44.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "SystemOctave",
							"parameter_shortname" : "Octave",
							"parameter_type" : 1,
							"parameter_mmin" : -2.0,
							"parameter_mmax" : 2.0,
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "SystemOctave"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 10,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 352.0, 408.0, 480.0, 20.0 ],
					"text" : "pak 0 0 0 0 0 0 0 0 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 248.0, 496.0, 157.0, 20.0 ],
					"text" : "prepend setSystemSettings"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"framecolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"id" : "obj-11",
					"items" : [ "lpf", ",", "ssm", ",", "svf", ",", "dsp", ",", "pvk", ",", "4pm", ",", "dly" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 760.0, 344.0, 56.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 192.0, 96.0, 56.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 248.0, 520.0, 85.0, 20.0 ],
					"text" : "s ---toShruthi"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 240.0, 72.0, 111.0, 20.0 ],
					"text" : "r ---systemSettings"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 10,
					"outlettype" : [ "int", "int", "int", "int", "int", "int", "int", "int", "int", "int" ],
					"patching_rect" : [ 352.0, 184.0, 464.0, 20.0 ],
					"text" : "unpack 0 0 0 0 0 0 0 0 0 0"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 8 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 430.0, 307.0 ],
					"source" : [ "obj-21", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 9 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 1 ],
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
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 6 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 9 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-71", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-65" : [ "SystemChannel", "Channel", 0 ],
			"obj-68" : [ "SystemMidiMode", "Midi", 0 ],
			"obj-56" : [ "SystemTuning", "Tuning", 0 ],
			"obj-55" : [ "SystemLegato", "Legato", 0 ],
			"obj-50" : [ "SystemPortamento", "Porta", 0 ],
			"obj-48" : [ "SystemOctave", "Octave", 0 ],
			"obj-69" : [ "SystemSplit", "Split", 0 ],
			"obj-71" : [ "SystemCvMode", "CV", 0 ]
		}
,
		"dependency_cache" : [  ]
	}

}
