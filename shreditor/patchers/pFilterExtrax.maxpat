{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 8
		}
,
		"rect" : [ 432.0, 218.0, 924.0, 699.0 ],
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
		"imprint" : 1,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-52",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 392.0, 256.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 92",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-54",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 336.0, 240.0, 52.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 2.5, 192.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 4.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Mode",
							"parameter_longname" : "DspMode1",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "lowpass", "highpass" ]
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "DspMode1"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"bubble" : 0,
					"bubblepoint" : 0.5,
					"bubbleside" : 1,
					"bubbletextmargin" : 5,
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-50",
					"ignoreclick" : 1,
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 248.0, 616.0, 150.0, 60.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "TODO put gate on output of inactive cards. To prevent presets from outputting wrong stuff",
					"textcolor" : [ 0.094118, 0.117647, 0.137255, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"bubble" : 0,
					"bubblepoint" : 0.5,
					"bubbleside" : 1,
					"bubbletextmargin" : 5,
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-46",
					"ignoreclick" : 1,
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 58.0, 16.0, 158.0, 31.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 16.0, 177.0, 19.0 ],
					"text" : "No additional  filter parameters",
					"textcolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"bubble" : 0,
					"bubblepoint" : 0.5,
					"bubbleside" : 1,
					"bubbletextmargin" : 5,
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-25",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 13.0, 16.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 16.0, 37.0, 20.0 ],
					"text" : "LPF",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"hidden" : 0,
					"id" : "obj-65",
					"ignoreclick" : 0,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 776.0, 800.0, 66.0, 18.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "offset 0 $1",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-60",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1056.0, 680.0, 32.5, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "0",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-61",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1016.0, 680.0, 32.5, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "6",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-62",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 976.0, 680.0, 32.5, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "5",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-63",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 936.0, 680.0, 32.5, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "4",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-59",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 896.0, 680.0, 32.5, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "3",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-58",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 856.0, 680.0, 32.5, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "2",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-57",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 816.0, 680.0, 32.5, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "1",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-56",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 776.0, 680.0, 32.5, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "0",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-53",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 776.0, 776.0, 36.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "* -64",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"hidden" : 0,
					"id" : "obj-51",
					"ignoreclick" : 0,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 944.0, 600.0, 32.5, 18.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "pvk",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"hidden" : 0,
					"id" : "obj-49",
					"ignoreclick" : 0,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 904.0, 600.0, 34.0, 18.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "4pm",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"hidden" : 0,
					"id" : "obj-48",
					"ignoreclick" : 0,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 864.0, 600.0, 32.5, 18.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "lpf",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-45",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 8,
					"outlettype" : [ "bang", "bang", "bang", "bang", "bang", "bang", "bang", "" ],
					"patching_rect" : [ 776.0, 648.0, 299.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "select lpf ssm svf dsp pvk 4pm dly",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-26",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 776.0, 600.0, 83.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "r ---filterType",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-10",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 776.0, 824.0, 69.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"bubble" : 0,
					"bubblepoint" : 0.5,
					"bubbleside" : 1,
					"bubbletextmargin" : 5,
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-44",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 784.0, 192.0, 34.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 408.0, 34.0, 20.0 ],
					"text" : "DLY",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-36",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 832.0, 448.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 93",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-37",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 776.0, 432.0, 52.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.5, 384.0, 48.0, 49.0 ],
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
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "DelayFlavour"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-38",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 832.0, 384.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 92",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-39",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 776.0, 368.0, 52.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 93.0, 384.0, 56.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 15.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Feedback",
							"parameter_longname" : "DelayFeedback",
							"parameter_linknames" : 1
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "DelayFeedback"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-40",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 832.0, 320.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 85",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-41",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 776.0, 304.0, 52.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.5, 384.0, 48.0, 49.0 ],
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
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "DelayLevel"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-42",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 832.0, 256.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 84",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-43",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 776.0, 240.0, 52.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 2.5, 384.0, 48.0, 49.0 ],
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
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "DelayTime"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-34",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 688.0, 320.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 93",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-35",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 632.0, 304.0, 55.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.5, 320.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Flavour",
							"parameter_longname" : "4pmFlavour",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "liquid", "ms", "wobbly", "whacky" ]
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "4pmFlavour"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-32",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 688.0, 256.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 92",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-33",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 632.0, 240.0, 47.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 2.5, 320.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Mode",
							"parameter_longname" : "4pmMode",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "lp4", "lp3", "lp2", "lp1", "hp1", "hp2", "hp3", "bp2", "bp4", "notch", "phaser", "hp2+lp", "hp3+lp", "notch+lp", "phasr+lp" ]
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "4pmMode"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"bubble" : 0,
					"bubblepoint" : 0.5,
					"bubbleside" : 1,
					"bubbletextmargin" : 5,
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-31",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 640.0, 192.0, 34.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 344.0, 34.0, 20.0 ],
					"text" : "4PM",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-29",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 392.0, 320.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 93",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-30",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 336.0, 304.0, 52.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.5, 192.0, 48.0, 49.0 ],
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
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "DspProgram"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"bubble" : 0,
					"bubblepoint" : 0.5,
					"bubbleside" : 1,
					"bubbletextmargin" : 5,
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-22",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 344.0, 192.0, 34.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 216.0, 34.0, 20.0 ],
					"text" : "DSP",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-23",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 392.0, 448.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 85",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-24",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 336.0, 432.0, 52.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.5, 192.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 1,
							"parameter_shortname" : "P2",
							"parameter_longname" : "DspParam2",
							"parameter_linknames" : 1
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "DspParam2"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-27",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 392.0, 384.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 84",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-28",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 336.0, 368.0, 52.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 192.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 1,
							"parameter_shortname" : "P1",
							"parameter_longname" : "DspParam1",
							"parameter_linknames" : 1
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "DspParam1"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"bubble" : 0,
					"bubblepoint" : 0.5,
					"bubbleside" : 1,
					"bubbletextmargin" : 5,
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-21",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 488.0, 192.0, 34.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 280.0, 34.0, 20.0 ],
					"text" : "PVK",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-19",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 536.0, 384.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 85",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-20",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 480.0, 368.0, 57.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 93.0, 256.0, 56.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Feedback",
							"parameter_longname" : "PvkFmFeedback",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "off", "on" ]
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "PvkFmFeedback"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-17",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 536.0, 256.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 92",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-18",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 480.0, 240.0, 53.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 2.5, 256.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Mode",
							"parameter_longname" : "PvkMode1",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "lowpass", "bandpass" ]
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "PvkMode1"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-15",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 536.0, 320.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 84",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-16",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 480.0, 304.0, 57.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.5, 256.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Drive",
							"parameter_longname" : "PvkOverdrive",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "off", "on" ]
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "PvkOverdrive"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"bubble" : 0,
					"bubblepoint" : 0.5,
					"bubbleside" : 1,
					"bubbletextmargin" : 5,
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-14",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 72.0, 192.0, 37.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 88.0, 37.0, 20.0 ],
					"text" : "SSM",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-12",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 120.0, 256.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 84",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-13",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 64.0, 240.0, 52.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 2.5, 64.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 1,
							"parameter_shortname" : "HP",
							"parameter_longname" : "SsmHighpass",
							"parameter_linknames" : 1
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "SsmHighpass"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"bubble" : 0,
					"bubblepoint" : 0.5,
					"bubbleside" : 1,
					"bubbletextmargin" : 5,
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-11",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 192.0, 34.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 152.0, 34.0, 20.0 ],
					"text" : "SVF",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-8",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 248.0, 448.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 93",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-9",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 192.0, 432.0, 53.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.5, 128.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Mode 2",
							"parameter_longname" : "SvfMode2",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "+lp", "+bp", "+hp", ">lp", ">bp", ">hp" ]
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "SvfMode2"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-6",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 248.0, 384.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 92",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-7",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 192.0, 368.0, 56.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 2.5, 128.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 2,
							"parameter_shortname" : "Mode 1",
							"parameter_longname" : "SvfMode1",
							"parameter_linknames" : 1,
							"parameter_enum" : [ "lpf", "bpf", "hpf", "lp<", "bp<", "hp<" ]
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "SvfMode1"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-4",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 248.0, 320.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 85",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-5",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 192.0, 304.0, 52.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.5, 128.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 63.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Reson 2",
							"parameter_longname" : "SvfResonance2",
							"parameter_linknames" : 1
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "SvfResonance2"
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 0,
					"id" : "obj-2",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 248.0, 256.0, 61.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "param 84",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 0.295176, 0.553973, 0.94902, 1.0 ],
					"activeneedlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"appearance" : 0,
					"background" : 0,
					"bordercolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"dialcolor" : [ 0.752941, 0.784314, 0.839216, 1.0 ],
					"focusbordercolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"hidden" : 0,
					"id" : "obj-3",
					"ignoreclick" : 0,
					"maxclass" : "live.dial",
					"needlecolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"panelcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"parameter_enable" : 1,
					"patching_rect" : [ 192.0, 240.0, 52.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 96.0, 128.0, 48.0, 49.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 1,
							"parameter_shortname" : "Cut 2",
							"parameter_longname" : "SvfCutoff2",
							"parameter_linknames" : 1
						}

					}
,
					"showname" : 1,
					"shownumber" : 1,
					"textcolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"triangle" : 0,
					"tribordercolor" : [ 0.27451, 0.32549, 0.4, 1.0 ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 1.0 ],
					"varname" : "SvfCutoff2"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-33", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-32", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-37", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-41", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-56", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-60", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-62", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-63", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-24" : [ "DspParam2", "P2", 0 ],
			"obj-37" : [ "DelayFlavour", "Flavour", 0 ],
			"obj-54" : [ "DspMode1", "Mode", 0 ],
			"obj-18" : [ "PvkMode1", "Mode", 0 ],
			"obj-43" : [ "DelayTime", "Time", 0 ],
			"obj-7" : [ "SvfMode1", "Mode 1", 0 ],
			"obj-16" : [ "PvkOverdrive", "Drive", 0 ],
			"obj-33" : [ "4pmMode", "Mode", 0 ],
			"obj-30" : [ "DspProgram", "Program", 0 ],
			"obj-35" : [ "4pmFlavour", "Flavour", 0 ],
			"obj-28" : [ "DspParam1", "P1", 0 ],
			"obj-5" : [ "SvfResonance2", "Reson 2", 0 ],
			"obj-9" : [ "SvfMode2", "Mode 2", 0 ],
			"obj-41" : [ "DelayLevel", "Level", 0 ],
			"obj-39" : [ "DelayFeedback", "Feedback", 0 ],
			"obj-13" : [ "SsmHighpass", "HP", 0 ],
			"obj-20" : [ "PvkFmFeedback", "Feedback", 0 ],
			"obj-3" : [ "SvfCutoff2", "Cut 2", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "param.maxpat",
				"bootpath" : "/Users/thijskoerselman/Documents/Projects/Shreditor/shreditor/patchers",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
 ]
	}

}
