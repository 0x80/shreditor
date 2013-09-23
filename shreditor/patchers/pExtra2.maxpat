{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 2,
			"architecture" : "x86"
		}
,
		"rect" : [ 461.0, 540.0, 1139.0, 871.0 ],
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
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 392.0, 256.0, 61.0, 20.0 ],
					"text" : "param 92"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-54",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 336.0, 240.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 200.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "lowpass", "highpass" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 4.0,
							"parameter_type" : 1,
							"parameter_shortname" : "F1Mode",
							"parameter_longname" : "DspMode1",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "DspMode1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-50",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 248.0, 616.0, 150.0, 60.0 ],
					"text" : "TODO put gate on output of inactive cards. To prevent presets from outputting wrong stuff"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"frgb" : 0.0,
					"id" : "obj-46",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 58.0, 16.0, 170.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 24.0, 192.0, 21.0 ],
					"text" : "No additional  filter parameters"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-25",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 13.0, 16.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 16.0, 37.0, 20.0 ],
					"text" : "LPF"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-65",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 776.0, 800.0, 66.0, 18.0 ],
					"text" : "offset 0 $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1056.0, 680.0, 32.5, 20.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1016.0, 680.0, 32.5, 20.0 ],
					"text" : "6"
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
					"outlettype" : [ "int" ],
					"patching_rect" : [ 976.0, 680.0, 32.5, 20.0 ],
					"text" : "5"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 936.0, 680.0, 32.5, 20.0 ],
					"text" : "4"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 896.0, 680.0, 32.5, 20.0 ],
					"text" : "3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 856.0, 680.0, 32.5, 20.0 ],
					"text" : "2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 816.0, 680.0, 32.5, 20.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 776.0, 680.0, 32.5, 20.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 776.0, 776.0, 36.0, 20.0 ],
					"text" : "* -64"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-51",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 944.0, 600.0, 32.5, 18.0 ],
					"text" : "pvk"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-49",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 904.0, 600.0, 34.0, 18.0 ],
					"text" : "4pm"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-48",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 864.0, 600.0, 32.5, 18.0 ],
					"text" : "lpf"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 8,
					"outlettype" : [ "bang", "bang", "bang", "bang", "bang", "bang", "bang", "" ],
					"patching_rect" : [ 776.0, 648.0, 299.0, 20.0 ],
					"text" : "select lpf ssm svf dsp pvk 4pm dly"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 776.0, 600.0, 83.0, 20.0 ],
					"text" : "r ---filterType"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 776.0, 824.0, 69.0, 20.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-44",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 784.0, 192.0, 34.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 408.0, 34.0, 20.0 ],
					"text" : "DLY"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 832.0, 448.0, 61.0, 20.0 ],
					"text" : "param 93"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-37",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 776.0, 432.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.0, 392.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 15.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Flavour",
							"parameter_longname" : "DelayFlavour",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "DelayFlavour"
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
					"outlettype" : [ "" ],
					"patching_rect" : [ 832.0, 384.0, 61.0, 20.0 ],
					"text" : "param 92"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-39",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 776.0, 368.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 392.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 15.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Fdbck",
							"parameter_longname" : "DelayFeedback",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "DelayFeedback"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 832.0, 320.0, 61.0, 20.0 ],
					"text" : "param 85"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-41",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 776.0, 304.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 392.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Level",
							"parameter_longname" : "DelayLevel",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "DelayLevel"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 832.0, 256.0, 61.0, 20.0 ],
					"text" : "param 84"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-43",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 776.0, 240.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 392.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 1,
							"parameter_shortname" : "Time",
							"parameter_longname" : "DelayTime",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "DelayTime"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 688.0, 320.0, 61.0, 20.0 ],
					"text" : "param 93"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-35",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 632.0, 304.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 328.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "liquid", "ms", "wobbly", "whacky" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Flavour",
							"parameter_longname" : "4pmFlavour",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "4pmFlavour"
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
					"patching_rect" : [ 688.0, 256.0, 61.0, 20.0 ],
					"text" : "param 92"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-33",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 632.0, 240.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 328.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "lp4", "lp3", "lp2", "lp1", "hp1", "hp2", "hp3", "bp2", "bp4", "notch", "phaser", "hp2+lp", "hp3+lp", "notch+lp", "phasr+lp" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Flt Mode",
							"parameter_longname" : "4pmMode",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "4pmMode"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-31",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 640.0, 192.0, 34.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 344.0, 34.0, 20.0 ],
					"text" : "4PM"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 392.0, 320.0, 61.0, 20.0 ],
					"text" : "param 93"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-30",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 336.0, 304.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 200.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 15.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Program",
							"parameter_longname" : "DspProgram",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "DspProgram"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 344.0, 192.0, 34.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 216.0, 34.0, 20.0 ],
					"text" : "DSP"
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
					"patching_rect" : [ 392.0, 448.0, 61.0, 20.0 ],
					"text" : "param 85"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-24",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 336.0, 432.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.0, 200.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Param2",
							"parameter_longname" : "DspParam2",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "DspParam2"
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
					"patching_rect" : [ 392.0, 384.0, 61.0, 20.0 ],
					"text" : "param 84"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-28",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 336.0, 368.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 200.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 1,
							"parameter_shortname" : "Param1",
							"parameter_longname" : "DspParam1",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "DspParam1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-21",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 488.0, 192.0, 34.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 280.0, 34.0, 20.0 ],
					"text" : "PVK"
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
					"patching_rect" : [ 536.0, 384.0, 61.0, 20.0 ],
					"text" : "param 85"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 480.0, 368.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 264.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "off", "on" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "FmFdbck",
							"parameter_longname" : "PvkFmFeedback",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "PvkFmFeedback"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 536.0, 256.0, 61.0, 20.0 ],
					"text" : "param 92"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-18",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 480.0, 240.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 264.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "lowpass", "bandpass" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Flt Mode",
							"parameter_longname" : "PvkMode1",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "PvkMode1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 536.0, 320.0, 61.0, 20.0 ],
					"text" : "param 84"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-16",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 480.0, 304.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 264.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "off", "on" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "OD",
							"parameter_longname" : "PvkOverdrive",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "PvkOverdrive"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-14",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 72.0, 192.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 88.0, 37.0, 20.0 ],
					"text" : "SSM"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.0, 256.0, 61.0, 20.0 ],
					"text" : "param 84"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-13",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 64.0, 240.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 72.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 1,
							"parameter_shortname" : "Highpass",
							"parameter_longname" : "SsmHighpass",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "SsmHighpass"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-11",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 192.0, 34.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 152.0, 34.0, 20.0 ],
					"text" : "SVF"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 248.0, 448.0, 61.0, 20.0 ],
					"text" : "param 93"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-9",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 192.0, 432.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 136.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "+lp", "+bp", "+hp", ">lp", ">bp", ">hp" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "F2 Mode",
							"parameter_longname" : "SvfMode2",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "SvfMode2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 248.0, 384.0, 61.0, 20.0 ],
					"text" : "param 92"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 192.0, 368.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 136.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "lpf", "bpf", "hpf", "lp<", "bp<", "hp<" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "F1Mode",
							"parameter_longname" : "SvfMode1",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "SvfMode1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 248.0, 320.0, 61.0, 20.0 ],
					"text" : "param 85"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 192.0, 304.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.0, 136.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 1,
							"parameter_shortname" : "F2 Reson",
							"parameter_longname" : "SvfResonance2",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "SvfResonance2"
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
					"patching_rect" : [ 248.0, 256.0, 61.0, 20.0 ],
					"text" : "param 84"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 192.0, 240.0, 52.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 136.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 1,
							"parameter_shortname" : "F2 Cut",
							"parameter_longname" : "SvfCutoff2",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "SvfCutoff2"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
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
					"destination" : [ "obj-3", 0 ],
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
					"destination" : [ "obj-45", 0 ],
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
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
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
					"destination" : [ "obj-37", 0 ],
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
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-13" : [ "SsmHighpass", "Highpass", 0 ],
			"obj-24" : [ "DspParam2", "Param2", 0 ],
			"obj-39" : [ "DelayFeedback", "Fdbck", 0 ],
			"obj-9" : [ "SvfMode2", "F2 Mode", 0 ],
			"obj-28" : [ "DspParam1", "Param1", 0 ],
			"obj-41" : [ "DelayLevel", "Level", 0 ],
			"obj-20" : [ "PvkFmFeedback", "FmFdbck", 0 ],
			"obj-5" : [ "SvfResonance2", "F2 Reson", 0 ],
			"obj-33" : [ "4pmMode", "Flt Mode", 0 ],
			"obj-30" : [ "DspProgram", "Program", 0 ],
			"obj-7" : [ "SvfMode1", "F1Mode", 0 ],
			"obj-18" : [ "PvkMode1", "Flt Mode", 0 ],
			"obj-16" : [ "PvkOverdrive", "OD", 0 ],
			"obj-3" : [ "SvfCutoff2", "F2 Cut", 0 ],
			"obj-37" : [ "DelayFlavour", "Flavour", 0 ],
			"obj-43" : [ "DelayTime", "Time", 0 ],
			"obj-54" : [ "DspMode1", "F1Mode", 0 ],
			"obj-35" : [ "4pmFlavour", "Flavour", 0 ]
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
