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
		"rect" : [ 811.0, 44.0, 789.0, 1034.0 ],
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
					"bgcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 632.0, 440.0, 32.5, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 496.0, 200.0, 18.0, 18.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-9",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 632.0, 472.0, 207.0, 45.0 ],
					"text" : "Mod7Amount $1, Mod8Amount $1, Mod9Amount $1, Mod10Amount $1, Mod11Amount $1, Mod12Amount $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 632.0, 376.0, 200.0, 45.0 ],
					"text" : "Mod1Amount $1, Mod2Amount $1, Mod3Amount $1, Mod4Amount $1, Mod5Amount $1, Mod6Amount $1"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 632.0, 344.0, 32.5, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 232.0, 200.0, 18.0, 18.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 576.0, 136.0, 32.5, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 200.0, 18.0, 18.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-8",
					"maxclass" : "number",
					"maximum" : 63,
					"minimum" : -63,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 616.0, 136.0, 50.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 40.0, 200.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"linecount" : 6,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 576.0, 176.0, 207.0, 85.0 ],
					"text" : "Mod1Amount $1, Mod2Amount $1, Mod3Amount $1, Mod4Amount $1, Mod5Amount $1, Mod6Amount $1, Mod7Amount $1, Mod8Amount $1, Mod9Amount $1, Mod10Amount $1, Mod11Amount $1, Mod12Amount $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 576.0, 56.0, 69.0, 20.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-3",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 576.0, 24.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 576.0, 296.0, 59.5, 20.0 ],
					"restore" : 					{
						"Mod10Amount" : [ 0.0 ],
						"Mod10Dst" : [ 0 ],
						"Mod10Src" : [ 0 ],
						"Mod11Amount" : [ 0.0 ],
						"Mod11Dst" : [ 0 ],
						"Mod11Src" : [ 0 ],
						"Mod12Amount" : [ 0.0 ],
						"Mod12Dst" : [ 0 ],
						"Mod12Src" : [ 0 ],
						"Mod1Amount" : [ 0.0 ],
						"Mod1Dst" : [ 0 ],
						"Mod1Src" : [ 0 ],
						"Mod2Amount" : [ 0.0 ],
						"Mod2Dst" : [ 0 ],
						"Mod2Src" : [ 0 ],
						"Mod3Amount" : [ 0.0 ],
						"Mod3Dst" : [ 0 ],
						"Mod3Src" : [ 0 ],
						"Mod4Amount" : [ 0.0 ],
						"Mod4Dst" : [ 0 ],
						"Mod4Src" : [ 0 ],
						"Mod5Amount" : [ 0.0 ],
						"Mod5Dst" : [ 0 ],
						"Mod5Src" : [ 0 ],
						"Mod6Amount" : [ 0.0 ],
						"Mod6Dst" : [ 0 ],
						"Mod6Src" : [ 0 ],
						"Mod7Amount" : [ 0.0 ],
						"Mod7Dst" : [ 0 ],
						"Mod7Src" : [ 0 ],
						"Mod8Amount" : [ 0.0 ],
						"Mod8Dst" : [ 0 ],
						"Mod8Src" : [ 0 ],
						"Mod9Amount" : [ 0.0 ],
						"Mod9Dst" : [ 0 ],
						"Mod9Src" : [ 0 ]
					}
,
					"text" : "autopattr",
					"varname" : "u652012245"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 560.0, 61.0, 20.0 ],
					"text" : "param 67"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"appearance" : 1,
					"id" : "obj-80",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 544.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 496.0, 152.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod12Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "Mod12Amount"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 560.0, 61.0, 20.0 ],
					"text" : "param 66"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 560.0, 61.0, 20.0 ],
					"text" : "param 65"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-83",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 560.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 384.0, 168.0, 100.0, 20.0 ],
					"varname" : "Mod12Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-84",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 560.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 272.0, 168.0, 104.0, 20.0 ],
					"varname" : "Mod12Src"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 512.0, 61.0, 20.0 ],
					"text" : "param 64"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"appearance" : 1,
					"fontface" : 0,
					"fontsize" : 11.0,
					"id" : "obj-86",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 496.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 496.0, 120.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod11Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "Mod11Amount"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 512.0, 61.0, 20.0 ],
					"text" : "param 63"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-88",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 512.0, 61.0, 20.0 ],
					"text" : "param 62"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-89",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 512.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 384.0, 136.0, 100.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod11Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-90",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 512.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 272.0, 136.0, 104.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod11Src"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 464.0, 61.0, 20.0 ],
					"text" : "param 61"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"appearance" : 1,
					"id" : "obj-92",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 448.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 496.0, 88.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod10Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "Mod10Amount"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 464.0, 61.0, 20.0 ],
					"text" : "param 60"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-94",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 464.0, 61.0, 20.0 ],
					"text" : "param 59"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-95",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 464.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 384.0, 104.0, 100.0, 20.0 ],
					"varname" : "Mod10Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-96",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 464.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 272.0, 104.0, 104.0, 20.0 ],
					"varname" : "Mod10Src"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 416.0, 61.0, 20.0 ],
					"text" : "param 58"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"appearance" : 1,
					"fontface" : 0,
					"fontsize" : 11.0,
					"id" : "obj-98",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 400.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 496.0, 56.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod9Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "Mod9Amount"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 416.0, 61.0, 20.0 ],
					"text" : "param 57"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-100",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 416.0, 61.0, 20.0 ],
					"text" : "param 56"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-101",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 416.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 384.0, 72.0, 100.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod9Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-102",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 416.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 272.0, 72.0, 104.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod9Src"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 368.0, 61.0, 20.0 ],
					"text" : "param 55"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"appearance" : 1,
					"id" : "obj-56",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 352.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 496.0, 24.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod8Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "Mod8Amount"
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
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 368.0, 61.0, 20.0 ],
					"text" : "param 54"
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
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 368.0, 61.0, 20.0 ],
					"text" : "param 53"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-59",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 368.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 384.0, 40.0, 100.0, 20.0 ],
					"varname" : "Mod8Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-60",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 368.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 272.0, 40.0, 104.0, 20.0 ],
					"varname" : "Mod8Src"
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
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 320.0, 61.0, 20.0 ],
					"text" : "param 52"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"appearance" : 1,
					"fontface" : 0,
					"fontsize" : 11.0,
					"id" : "obj-62",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 304.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 496.0, -8.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod7Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "Mod7Amount"
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
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 320.0, 61.0, 20.0 ],
					"text" : "param 51"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 320.0, 61.0, 20.0 ],
					"text" : "param 50"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-65",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 320.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 384.0, 8.0, 100.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod7Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-66",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 320.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 272.0, 8.0, 104.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod7Src"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-67",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 272.0, 61.0, 20.0 ],
					"text" : "param 49"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"appearance" : 1,
					"id" : "obj-68",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 256.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 232.0, 152.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod6Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"varname" : "Mod6Amount"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 272.0, 61.0, 20.0 ],
					"text" : "param 48"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 272.0, 61.0, 20.0 ],
					"text" : "param 47"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-71",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 272.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 168.0, 100.0, 20.0 ],
					"varname" : "Mod6Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-72",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 272.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 168.0, 104.0, 20.0 ],
					"varname" : "Mod6Src"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 224.0, 61.0, 20.0 ],
					"text" : "param 46"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"appearance" : 1,
					"fontface" : 0,
					"fontsize" : 11.0,
					"id" : "obj-74",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 208.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 232.0, 120.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod5Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"varname" : "Mod5Amount"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 224.0, 61.0, 20.0 ],
					"text" : "param 45"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 224.0, 61.0, 20.0 ],
					"text" : "param 44"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-77",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 224.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 136.0, 100.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod5Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-78",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 224.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 136.0, 104.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod5Src"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 176.0, 61.0, 20.0 ],
					"text" : "param 43"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"appearance" : 1,
					"id" : "obj-44",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 160.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 232.0, 88.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod4Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"varname" : "Mod4Amount"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 176.0, 61.0, 20.0 ],
					"text" : "param 42"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 176.0, 61.0, 20.0 ],
					"text" : "param 41"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-47",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 176.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 104.0, 100.0, 20.0 ],
					"varname" : "Mod4Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-48",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 176.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 104.0, 104.0, 20.0 ],
					"varname" : "Mod4Src"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 128.0, 61.0, 20.0 ],
					"text" : "param 40"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"appearance" : 1,
					"fontface" : 0,
					"fontsize" : 11.0,
					"id" : "obj-50",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 112.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 232.0, 56.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod3Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"varname" : "Mod3Amount"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 128.0, 61.0, 20.0 ],
					"text" : "param 39"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 128.0, 61.0, 20.0 ],
					"text" : "param 38"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-53",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 128.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 72.0, 100.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod3Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-54",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 128.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 72.0, 104.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod3Src"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 432.0, 80.0, 61.0, 20.0 ],
					"text" : "param 37"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"appearance" : 1,
					"id" : "obj-23",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 64.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 232.0, 24.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod2Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"varname" : "Mod2Amount"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 80.0, 61.0, 20.0 ],
					"text" : "param 36"
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
					"patching_rect" : [ 40.0, 80.0, 61.0, 20.0 ],
					"text" : "param 35"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-26",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 80.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 40.0, 100.0, 20.0 ],
					"varname" : "Mod2Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-27",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 80.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 40.0, 104.0, 20.0 ],
					"varname" : "Mod2Src"
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
					"patching_rect" : [ 432.0, 32.0, 61.0, 20.0 ],
					"text" : "param 34"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"appearance" : 1,
					"fontface" : 0,
					"fontsize" : 11.0,
					"id" : "obj-20",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 384.0, 16.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 232.0, -8.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : ".",
							"parameter_longname" : "Mod1Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.701087, 0.701087, 0.701087, 1.0 ],
					"varname" : "Mod1Amount"
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
					"patching_rect" : [ 216.0, 32.0, 61.0, 20.0 ],
					"text" : "param 33"
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
					"patching_rect" : [ 40.0, 32.0, 61.0, 20.0 ],
					"text" : "param 32"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"items" : [ "cutoff", ",", "vca", ",", "pwm1", ",", "pwm2", ",", "osc1", ",", "osc2", ",", "osc1&2", ",", "finetune", ",", "osc", "balance", ",", "noise", ",", "sub", "volume", ",", "resonance", ",", "cv", "output1", ",", "cv", "output2", ",", "env1&2", "attack", ",", "lfo1", "rate", ",", "lfo2", "rate", ",", "env1", "trigger", ",", "env2", "trigger" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 280.0, 32.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 8.0, 100.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod1Dst"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"items" : [ "lfo1", ",", "lfo2", ",", "stepseq", ",", "stepseq1st8", ",", "stepseq2nd8", ",", "arp", ",", "modwheel", ",", "atertouch", ",", "pitchbend", ",", "offset", ",", "cv", "input1", ",", "cv", "input2", ",", "cv", "input4", ",", "cv", "input4", ",", "cc", "#16", ",", "cc", "#17", ",", "cc", "#18", ",", "cc", "#19", ",", "noise", ",", "envelope1", ",", "envelope2", ",", "velocity", ",", "random", ",", "note", ",", "gate", ",", "audio", ",", "operator1", ",", "operator2", ",", "trigger1", ",", "trigger2" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 104.0, 32.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 8.0, 104.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod1Src"
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"bgcolor" : [ 0.137255, 0.145098, 0.160784, 0.4 ],
					"id" : "obj-1",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 80.0, 728.0, 37.25, 159.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 528.0, 232.0 ],
					"rounded" : 10,
					"varname" : "Display"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
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
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
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
					"destination" : [ "obj-51", 0 ],
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
					"destination" : [ "obj-56", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
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
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-56" : [ "Mod8Amount", ".", 0 ],
			"obj-80" : [ "Mod12Amount", ".", 0 ],
			"obj-74" : [ "Mod5Amount", ".", 0 ],
			"obj-23" : [ "Mod2Amount", ".", 0 ],
			"obj-62" : [ "Mod7Amount", ".", 0 ],
			"obj-86" : [ "Mod11Amount", ".", 0 ],
			"obj-44" : [ "Mod4Amount", ".", 0 ],
			"obj-98" : [ "Mod9Amount", ".", 0 ],
			"obj-20" : [ "Mod1Amount", ".", 0 ],
			"obj-68" : [ "Mod6Amount", ".", 0 ],
			"obj-92" : [ "Mod10Amount", ".", 0 ],
			"obj-50" : [ "Mod3Amount", ".", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "param.maxpat",
				"bootpath" : "/Users/thijskoerselman/Documents/Projects/Shreditor/shreditor/patches",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ]
	}

}
