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
		"rect" : [ 624.0, 109.0, 542.0, 1010.0 ],
		"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
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
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 73.0, 324.138672, 61.0, 20.0 ],
					"text" : "param 98"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.309057, 0.581928, 1.0, 1.0 ],
					"activeneedlecolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 16.0, 304.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 64.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 2,
							"parameter_shortname" : "Input2",
							"parameter_longname" : "Op2Input2",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "lfo1", "lfo2", "stepseq", "step1st8", "step2nd8", "arp", "modwheel", "atertch", "pitchbnd", "offset", "cv input1", "cv input2", "cv input4", "cv input4", "cc #16", "cc #17", "cc #18", "cc #19", "noise", "envelop1", "envelop2", "velocity", "random", "note", "gate", "audio", "optor1", "optor2", "trigger1", "trigger2", "value 4", "value 8", "value 16", "value 32" ]
						}

					}
,
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "Op2Input2"
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
					"patching_rect" : [ 72.0, 384.0, 61.0, 20.0 ],
					"text" : "param 99"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.309057, 0.581928, 1.0, 1.0 ],
					"activeneedlecolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 16.0, 368.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 64.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Op",
							"parameter_longname" : "Op2Operator",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "add", "multiply", "max", "min", "xor", ">=", "<=", "quantize", "lag" ]
						}

					}
,
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "Op2Operator"
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
					"patching_rect" : [ 72.0, 256.0, 61.0, 20.0 ],
					"text" : "param 97"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.309057, 0.581928, 1.0, 1.0 ],
					"activeneedlecolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-9",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 16.0, 240.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 64.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 2,
							"parameter_shortname" : "Input1",
							"parameter_longname" : "Op2Input1",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "lfo1", "lfo2", "stepseq", "step1st8", "step2nd8", "arp", "modwheel", "atertch", "pitchbnd", "offset", "cv input1", "cv input2", "cv input4", "cv input4", "cc #16", "cc #17", "cc #18", "cc #19", "noise", "envelop1", "envelop2", "velocity", "random", "note", "gate", "audio", "optor1", "optor2", "trigger1", "trigger2", "value 4", "value 8", "value 16", "value 32" ]
						}

					}
,
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "Op2Input1"
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
					"patching_rect" : [ 73.0, 116.138672, 61.0, 20.0 ],
					"text" : "param 95"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.309057, 0.581928, 1.0, 1.0 ],
					"activeneedlecolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 16.0, 96.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 0.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 2,
							"parameter_shortname" : "Input2",
							"parameter_longname" : "Op1Input2",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "lfo1", "lfo2", "stepseq", "step1st8", "step2nd8", "arp", "modwheel", "atertch", "pitchbnd", "offset", "cv input1", "cv input2", "cv input4", "cv input4", "cc #16", "cc #17", "cc #18", "cc #19", "noise", "envelop1", "envelop2", "velocity", "random", "note", "gate", "audio", "optor1", "optor2", "trigger1", "trigger2", "value 4", "value 8", "value 16", "value 32" ]
						}

					}
,
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "Op1Input2"
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
					"patching_rect" : [ 72.0, 176.0, 61.0, 20.0 ],
					"text" : "param 96"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.309057, 0.581928, 1.0, 1.0 ],
					"activeneedlecolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-80",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 16.0, 160.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 0.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Op",
							"parameter_longname" : "Op1Operator",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "add", "multiply", "max", "min", "xor", ">=", "<=", "quantize", "lag" ]
						}

					}
,
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "Op1Operator"
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
					"patching_rect" : [ 72.0, 48.0, 61.0, 20.0 ],
					"text" : "param 94"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.309057, 0.581928, 1.0, 1.0 ],
					"activeneedlecolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-75",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 16.0, 32.0, 48.0, 51.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 52.0, 51.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 2,
							"parameter_shortname" : "Input1",
							"parameter_longname" : "Op1Input1",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "lfo1", "lfo2", "stepseq", "step1st8", "step2nd8", "arp", "modwheel", "atertch", "pitchbnd", "offset", "cv input1", "cv input2", "cv input4", "cv input4", "cc #16", "cc #17", "cc #18", "cc #19", "noise", "envelop1", "envelop2", "velocity", "random", "note", "gate", "audio", "optor1", "optor2", "trigger1", "trigger2", "value 4", "value 8", "value 16", "value 32" ]
						}

					}
,
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "Op1Input1"
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
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
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
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
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
					"destination" : [ "obj-76", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-76", 0 ]
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
					"destination" : [ "obj-9", 0 ],
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
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-9" : [ "Op2Input1", "Input1", 0 ],
			"obj-5" : [ "Op2Input2", "Input2", 0 ],
			"obj-75" : [ "Op1Input1", "Input1", 0 ],
			"obj-7" : [ "Op2Operator", "Op", 0 ],
			"obj-3" : [ "Op1Input2", "Input2", 0 ],
			"obj-80" : [ "Op1Operator", "Op", 0 ]
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
