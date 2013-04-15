{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 0,
			"architecture" : "x86"
		}
,
		"rect" : [ 500.0, 64.0, 1431.0, 799.0 ],
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
					"id" : "obj-3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 128.0, 101.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 160.0, 68.0, 20.0 ],
					"text" : "Filterboard"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 128.0, 88.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 128.0, 47.0, 20.0 ],
					"text" : "Scale"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-72",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 168.0, 552.0, 20.0, 20.0 ]
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
					"patching_rect" : [ 832.0, 312.0, 44.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "4cv in", "programmer", "pedals" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 16.0,
							"parameter_type" : 2,
							"parameter_shortname" : "CV",
							"parameter_longname" : "SystemCvMode",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "SystemCvMode"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"patching_rect" : [ 696.0, 312.0, 44.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 176.0, 64.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "C-1", "C0", "C1", "C2", "C3", "C4", "C5", "C6" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 16.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Split",
							"parameter_longname" : "SystemSplit",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "SystemSplit"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"patching_rect" : [ 640.0, 312.0, 44.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 64.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "off", "thru", "seq", "ctrl", "split", "full", "1>l", "2>1", "3>2", "4>3", "5>4", "6>5", "7>6", "8>7" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 16.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Midi",
							"parameter_longname" : "SystemMidiMode",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"presentation_rect" : [ 64.0, 64.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 16.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Channel",
							"parameter_longname" : "SystemChannel",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.0, 440.0, 54.0, 20.0 ],
					"text" : "gate 1 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "int" ],
					"patching_rect" : [ 296.0, 152.0, 46.0, 20.0 ],
					"text" : "t 1 l 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-58",
					"items" : [ "equal", ",", "just", ",", "pythagorean", ",", "1/4", "eb", ",", "1/4", "e", ",", "1/4", "ea", ",", "bhairav", ",", "gunakri", ",", "marwa", ",", "shree", ",", "purvi", ",", "bilawal", ",", "yaman", ",", "kafi", ",", "bhimpalasree", ",", "darbari", ",", "bageshree", ",", "rageshree", ",", "khamaj", ",", "mi'mal", ",", "parameshwari", ",", "rangeshwari", ",", "gangeshwari", ",", "kameshwari", ",", "palas", "kafi", ",", "natbhairav", ",", "m.kauns", ",", "bairagi", ",", "b.todi", ",", "chandradeep", ",", "kaushik", "todi", ",", "jogeshwari", ",", "rasia" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 368.0, 272.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 128.0, 104.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"presentation_rect" : [ 8.0, 64.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 126.0,
							"parameter_mmin" : -127.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Tuning",
							"parameter_longname" : "SystemTuning",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "SystemTuning"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"patching_rect" : [ 472.0, 312.0, 44.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 8.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "off", "on" ],
							"parameter_unitstyle" : 0,
							"parameter_type" : 2,
							"parameter_shortname" : "Legato",
							"parameter_longname" : "SystemLegato",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "SystemLegato"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"presentation_rect" : [ 64.0, 8.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 1,
							"parameter_invisible" : 2,
							"parameter_shortname" : "WTF",
							"parameter_longname" : "sdf"
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"presentation_rect" : [ 8.0, 8.0, 48.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 2.0,
							"parameter_mmin" : -2.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Octave",
							"parameter_longname" : "SystemOctave",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "SystemOctave"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 208.0, 440.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 208.0, 408.0, 128.0, 20.0 ],
					"text" : "metro 1000 @active 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 208.0, 472.0, 88.0, 20.0 ],
					"text" : "zl reg"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 208.0, 504.0, 62.0, 20.0 ],
					"text" : "zl change"
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
					"patching_rect" : [ 208.0, 528.0, 157.0, 20.0 ],
					"text" : "prepend setSystemSettings"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-11",
					"items" : [ "lpf", ",", "ssm", ",", "svf", ",", "dsp", ",", "pvk", ",", "4pm", ",", "dly" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 760.0, 344.0, 56.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 160.0, 56.0, 20.0 ]
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
					"patching_rect" : [ 208.0, 552.0, 68.0, 20.0 ],
					"text" : "s toShruthi"
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
					"patching_rect" : [ 296.0, 112.0, 99.0, 20.0 ],
					"text" : "r systemSettings"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 784.0, 384.0, 69.0, 20.0 ],
					"text" : "s filterType"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 11,
					"numoutlets" : 11,
					"outlettype" : [ "", "", "", "", "", "", "", "", "", "", "" ],
					"patching_rect" : [ 336.0, 184.0, 512.0, 20.0 ],
					"text" : "route octave raga portamento legato tuning channel midimode split filter cvmode"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
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
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-42", 0 ]
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
					"destination" : [ "obj-61", 0 ],
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
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-62", 0 ]
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
 ],
		"parameters" : 		{
			"obj-50" : [ "sdf", "WTF", 0 ],
			"obj-56" : [ "SystemTuning", "Tuning", 0 ],
			"obj-48" : [ "SystemOctave", "Octave", 0 ],
			"obj-55" : [ "SystemLegato", "Legato", 0 ],
			"obj-71" : [ "SystemCvMode", "CV", 0 ],
			"obj-68" : [ "SystemMidiMode", "Midi", 0 ],
			"obj-65" : [ "SystemChannel", "Channel", 0 ],
			"obj-69" : [ "SystemSplit", "Split", 0 ]
		}
,
		"dependency_cache" : [  ]
	}

}
