{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 7
		}
,
		"rect" : [ 870.0, 606.0, 640.0, 480.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 16.0,
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
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 80.0, 61.0, 20.0 ],
					"text" : "param 37"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 752.0, 64.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Amount",
							"parameter_longname" : "Mod1Amount[1]",
							"parameter_linknames" : 1
						}

					}
,
					"varname" : "Mod1Amount[1]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 584.0, 80.0, 61.0, 20.0 ],
					"text" : "param 36"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 408.0, 80.0, 61.0, 20.0 ],
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
					"patching_rect" : [ 648.0, 80.0, 100.0, 20.0 ]
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
					"patching_rect" : [ 472.0, 80.0, 104.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 24.0, 61.0, 20.0 ],
					"text" : "param 34"
				}

			}
, 			{
				"box" : 				{
					"activeneedlecolor" : [ 0.271739, 0.271739, 0.271739, 1.0 ],
					"appearance" : 1,
					"fontface" : 0,
					"fontsize" : 11.0,
					"id" : "obj-20",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 752.0, 8.0, 47.0, 36.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 951.0, 439.0, 47.0, 36.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_mmin" : -63.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Amount",
							"parameter_longname" : "Mod1Amount",
							"parameter_linknames" : 1
						}

					}
,
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ],
					"varname" : "Mod1Amount"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 584.0, 24.0, 61.0, 20.0 ],
					"text" : "param 33"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 408.0, 24.0, 61.0, 20.0 ],
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
					"patching_rect" : [ 648.0, 24.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 839.0, 455.0, 100.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ]
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
					"patching_rect" : [ 472.0, 24.0, 104.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 727.0, 455.0, 104.0, 20.0 ],
					"textcolor" : [ 0.163043, 0.163043, 0.163043, 1.0 ]
				}

			}
 ],
		"lines" : [ 			{
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
 ],
		"parameters" : 		{
			"obj-23" : [ "Mod1Amount[1]", "Amount", 0 ],
			"obj-20" : [ "Mod1Amount", "Amount", 0 ]
		}
,
		"dependency_cache" : [  ]
	}

}
