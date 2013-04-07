{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 7
		}
,
		"rect" : [ 512.0, 144.0, 535.0, 797.0 ],
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
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 328.0, 104.0, 59.5, 20.0 ],
					"restore" : 					{
						"Cutoff" : [ 0.0 ],
						"Envelope" : [ 0.0 ],
						"Lfo" : [ 0.0 ],
						"Resonance" : [ 0.0 ]
					}
,
					"text" : "autopattr",
					"varname" : "u217000673"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 159.0, 107.861328, 61.0, 20.0 ],
					"text" : "param 15"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 119.0, 83.861328, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.0, 0.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 1,
							"parameter_shortname" : "Lfo",
							"parameter_longname" : "Lfo",
							"parameter_linknames" : 1,
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0
						}

					}
,
					"varname" : "Lfo"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 55.0, 107.861328, 61.0, 20.0 ],
					"text" : "param 14"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-80",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 15.0, 83.861328, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 0.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 1,
							"parameter_shortname" : "Envelope",
							"parameter_longname" : "Envelope",
							"parameter_linknames" : 1,
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0
						}

					}
,
					"varname" : "Envelope"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 159.0, 43.861328, 61.0, 20.0 ],
					"text" : "param 13"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 120.0, 16.0, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 0.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 1,
							"parameter_shortname" : "Reson",
							"parameter_longname" : "Resonance",
							"parameter_linknames" : 1,
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0
						}

					}
,
					"varname" : "Resonance"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 55.0, 43.861328, 61.0, 20.0 ],
					"text" : "param 12"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-75",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 15.0, 19.861328, 44.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 44.0, 47.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 1,
							"parameter_shortname" : "Cutoff",
							"parameter_longname" : "Cutoff",
							"parameter_linknames" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "Cutoff"
				}

			}
 ],
		"lines" : [ 			{
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
					"destination" : [ "obj-78", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
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
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-82", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-75" : [ "Cutoff", "Cutoff", 0 ],
			"obj-82" : [ "Lfo", "Lfo", 0 ],
			"obj-80" : [ "Envelope", "Envelope", 0 ],
			"obj-78" : [ "Resonance", "Reson", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "param.maxpat",
				"bootpath" : "/Users/thijskoerselman/Documents/Projects/ShruthiEditor",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
 ]
	}

}
