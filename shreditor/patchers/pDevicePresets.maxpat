{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 1,
			"revision" : 0,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 34.0, 79.0, 1368.0, 762.0 ],
		"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 8.0, 8.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 0,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-61",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 510.5, 17.0, 59.0, 31.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.5, 23.0, 92.0, 19.0 ],
					"style" : "",
					"text" : "Hardware Info",
					"textcolor" : [ 0.623529, 0.623529, 0.623529, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-46",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 344.0, 816.0, 150.0, 33.0 ],
					"style" : "",
					"text" : "not sure if this is the best time to check this",
					"textcolor" : [ 0.094118, 0.117647, 0.137255, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 310.0, 898.0, 85.0, 22.0 ],
					"style" : "",
					"text" : "s ---toShruthi",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "requestVersion" ],
					"patching_rect" : [ 433.0, 878.0, 97.0, 22.0 ],
					"style" : "",
					"text" : "t requestVersion",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 428.0, 784.0, 34.0, 22.0 ],
					"style" : "",
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "requestNumBanks" ],
					"patching_rect" : [ 310.0, 848.0, 116.0, 22.0 ],
					"style" : "",
					"text" : "t requestNumBanks",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.79,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_color2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"id" : "obj-98",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 456.0, 408.0, 91.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.5, -1.0, 91.0, 22.0 ],
					"style" : "",
					"text" : "storagewindow",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-101",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 249.0, 672.0, 150.0, 20.0 ],
					"style" : "",
					"text" : "DevicePresets"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 729.25, 683.0, 85.0, 22.0 ],
					"style" : "",
					"text" : "s ---toShruthi",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 771.0, 616.0, 133.0, 22.0 ],
					"style" : "",
					"text" : "prepend setNumBanks",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "..." ],
					"patching_rect" : [ 824.0, 440.0, 27.0, 22.0 ],
					"style" : "",
					"text" : "t ...",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.91328, 0.91328, 0.91328, 0.75 ],
					"blinkcolor" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"id" : "obj-99",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.71328, 0.71328, 0.71328, 1.0 ],
					"patching_rect" : [ 600.0, 384.0, 20.0, 20.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 784.0, 400.0, 56.0, 22.0 ],
					"style" : "",
					"text" : "route list",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.79,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_color2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"id" : "obj-86",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 456.0, 448.0, 79.0, 22.0 ],
					"style" : "",
					"text" : "clientwindow",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 729.25, 584.0, 93.0, 22.0 ],
					"restore" : [ 0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "pattr numbanks",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "numbanks"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 729.25, 608.0, 19.0, 22.0 ],
					"style" : "",
					"text" : "_",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-92",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 729.25, 560.0, 97.0, 22.0 ],
					"style" : "",
					"text" : "route numbanks",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 729.25, 536.0, 92.0, 22.0 ],
					"style" : "",
					"text" : "r ---fromShruthi",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-89",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 729.25, 640.0, 74.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 550.0, 59.0, 32.0, 19.0 ],
					"style" : "",
					"text" : "0",
					"textcolor" : [ 0.623529, 0.623529, 0.623529, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-90",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 661.75, 640.0, 64.0, 31.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.5, 59.0, 70.0, 19.0 ],
					"style" : "",
					"text" : "Num Banks:",
					"textcolor" : [ 0.623529, 0.623529, 0.623529, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.79,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_color2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"id" : "obj-88",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 759.0, 488.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "set",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 759.0, 464.0, 60.0, 22.0 ],
					"style" : "",
					"text" : "loadbang",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-83",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 656.0, 504.0, 74.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 550.0, 41.0, 38.0, 19.0 ],
					"style" : "",
					"textcolor" : [ 0.623529, 0.623529, 0.623529, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-82",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 594.5, 504.0, 59.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 481.5, 41.0, 59.0, 19.0 ],
					"style" : "",
					"text" : "Firmware:",
					"textcolor" : [ 0.623529, 0.623529, 0.623529, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 656.0, 400.0, 84.0, 22.0 ],
					"restore" : [ "undefined" ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "pattr firmware",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"varname" : "firmware"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 656.0, 376.0, 87.0, 22.0 ],
					"style" : "",
					"text" : "route firmware",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 656.0, 352.0, 92.0, 22.0 ],
					"style" : "",
					"text" : "r ---fromShruthi",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 656.0, 464.0, 19.0, 22.0 ],
					"style" : "",
					"text" : "_",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 656.0, 432.0, 144.0, 22.0 ],
					"style" : "",
					"text" : "sprintf symout %d.%.2d",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.91328, 0.91328, 0.91328, 0.75 ],
					"blinkcolor" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"id" : "obj-118",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.71328, 0.71328, 0.71328, 1.0 ],
					"patching_rect" : [ 416.0, 40.0, 20.0, 20.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.79,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_color2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"id" : "obj-116",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 440.0, 200.0, 37.0, 22.0 ],
					"style" : "",
					"text" : "none",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-113",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 486.0, 168.0, 55.0, 23.0 ],
					"style" : "",
					"text" : "midiinfo",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.79,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_color2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"gradient" : 0,
					"id" : "obj-112",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 486.0, 144.0, 70.0, 23.0 ],
					"style" : "",
					"text" : "controllers",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-100",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 264.5, 168.0, 55.0, 23.0 ],
					"style" : "",
					"text" : "midiinfo",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-102",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 168.0, 55.0, 23.0 ],
					"style" : "",
					"text" : "midiinfo",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 990.5, 96.0, 42.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 403.0, 60.0, 37.0, 19.0 ],
					"style" : "",
					"text" : "Chan",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.270588, 0.270588, 0.270588, 1.0 ],
					"bgoncolor" : [ 0.55, 0.55, 0.55, 1.0 ],
					"fontsize" : 11.0,
					"id" : "obj-108",
					"legacytextcolor" : 1,
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 300.5, 88.0, 64.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 408.0, 8.0, 56.0, 16.0 ],
					"rounded" : 14.0,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "textbutton",
							"parameter_shortname" : "textbutton",
							"parameter_type" : 3,
							"parameter_initial" : [ -1 ],
							"parameter_invisible" : 1
						}

					}
,
					"style" : "",
					"text" : "Rescan",
					"textcolor" : [ 0.623529, 0.623529, 0.623529, 1.0 ],
					"textoncolor" : [ 0.623529, 0.623529, 0.623529, 1.0 ],
					"textovercolor" : [ 0.898039, 0.898039, 0.898039, 1.0 ],
					"usebgoncolor" : 1,
					"usetextovercolor" : 1,
					"varname" : "textbutton"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 504.0, 72.0, 80.0, 22.0 ],
					"style" : "",
					"text" : "s ---toShruthi",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.79,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_color2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 56.0, 112.0, 37.0, 22.0 ],
					"style" : "",
					"text" : "clear",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-62",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 832.0, 656.0, 248.0, 47.0 ],
					"style" : "",
					"text" : "stored but not shown, zodat we maar 1x de midi port hoeven aan te maken, en niet bij poort verandering en dan weer op channel.",
					"textcolor" : [ 0.094118, 0.117647, 0.137255, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-67",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 856.0, 56.0, 22.0 ],
					"style" : "",
					"text" : "deferlow",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "requestNumBanks" ],
					"patching_rect" : [ 40.0, 888.0, 116.0, 22.0 ],
					"style" : "",
					"text" : "t requestNumBanks",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-103",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 832.0, 92.0, 22.0 ],
					"style" : "",
					"text" : "r ---presetStore",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 161.0, 878.0, 85.0, 22.0 ],
					"style" : "",
					"text" : "s ---toShruthi",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 144.0, 832.0, 141.0, 22.0 ],
					"style" : "",
					"text" : "prepend switchToDevice",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 146.0, 779.0, 56.0, 22.0 ],
					"style" : "",
					"text" : "deferlow",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-76",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 218.0, 771.0, 150.0, 33.0 ],
					"style" : "",
					"text" : "preset recall -> eeprom wordt intern geregeld",
					"textcolor" : [ 0.094118, 0.117647, 0.137255, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 146.0, 747.0, 97.0, 22.0 ],
					"style" : "",
					"text" : "r ---presetRecall",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frozen_object_attributes" : 					{
						"autorestore" : 0
					}
,
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 832.0, 736.0, 105.0, 22.0 ],
					"restore" : [ 0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "pattr midiChannel",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "midiChannel"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-56",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 344.0, 29.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 8.0, 40.0, 19.0 ],
					"style" : "",
					"text" : "Slot",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 816.0, 200.0, 155.0, 22.0 ],
					"style" : "",
					"text" : "loadmess YourDeviceLabel",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-114",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 1,
							"revision" : 0,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 34.0, 79.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 8.0, 8.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 104.0, 120.0, 150.0, 60.0 ],
									"style" : "",
									"text" : "try to read the preset file, if it doesn't exist call write to create an empty new one at location"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-106",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 266.0, 356.0, 74.0, 22.0 ],
									"style" : "",
									"text" : "pack write s"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-102",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 178.0, 356.0, 73.0, 22.0 ],
									"style" : "",
									"text" : "pack read s"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-79",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "" ],
									"patching_rect" : [ 178.0, 316.0, 46.0, 22.0 ],
									"style" : "",
									"text" : "sel 0 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-78",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 178.0, 284.0, 119.0, 22.0 ],
									"style" : "",
									"text" : "zl compare notfound"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-75",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 264.0, 152.0, 90.0, 22.0 ],
									"style" : "",
									"text" : "route presetfile"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-76",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 264.0, 128.0, 92.0, 22.0 ],
									"style" : "",
									"text" : "r ---fromShruthi"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-65",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 37.0, 239.0, 459.0, 35.0 ],
									"style" : "",
									"text" : "\"Macintosh HD:/Users/thijskoerselman/Library/Application Support/Vauxlab/Shreditor/DevicePresets.json\""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-63",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 408.0, 152.0, 261.0, 35.0 ],
									"style" : "",
									"text" : "\"/Users/thijskoerselman/Library/Application Support/Vauxlab/Shreditor/DevicePresets.json\""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-41",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 178.0, 204.0, 79.0, 22.0 ],
									"style" : "",
									"text" : "absolutepath"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-113",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 217.0, 436.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-113", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-102", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-113", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-106", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-102", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-106", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-102", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-75", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-106", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-75", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-75", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-76", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-79", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-78", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-102", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-79", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-106", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-79", 1 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 80.0, 520.0, 92.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p loadpresetfile",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-43",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 504.0, 672.0, 74.0, 19.0 ],
					"style" : "",
					"text" : "Panic",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"blinkcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"id" : "obj-33",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"patching_rect" : [ 584.0, 672.0, 20.0, 20.0 ],
					"prototypename" : "shr_dark_circle",
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-23",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 752.0, 128.0, 74.0, 19.0 ],
					"style" : "",
					"text" : "Receiving",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-18",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 376.0, 89.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 77.0, 29.0, 91.0, 18.0 ],
					"style" : "",
					"text" : "shift-click to store ",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 152.0, 360.0, 103.0, 22.0 ],
					"style" : "",
					"text" : "loadmess clearall",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 824.0, 104.0, 24.0, 22.0 ],
					"style" : "",
					"text" : "t b",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 824.0, 80.0, 131.0, 22.0 ],
					"style" : "",
					"text" : "r ---midiControllerInput",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"blinkcolor" : [ 1.0, 0.427451, 0.0, 1.0 ],
					"id" : "obj-57",
					"ignoreclick" : 1,
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"patching_rect" : [ 824.0, 128.0, 20.0, 20.0 ],
					"prototypename" : "shr_dark_circle",
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 832.0, 712.0, 178.0, 22.0 ],
					"style" : "",
					"text" : "r ---systemSettingsMidiChannel",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-34",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 568.0, 776.0, 171.0, 33.0 ],
					"style" : "",
					"text" : "send all notes off for selected chan",
					"textcolor" : [ 0.094118, 0.117647, 0.137255, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.91328, 0.91328, 0.91328, 0.75 ],
					"blinkcolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"id" : "obj-45",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.71328, 0.71328, 0.71328, 1.0 ],
					"patching_rect" : [ 536.0, 784.0, 20.0, 20.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 576.0, 816.0, 101.0, 22.0 ],
					"style" : "",
					"text" : "r ---midiChannel",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 536.0, 848.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "+ 1",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.79,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_color2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"id" : "obj-51",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 536.0, 816.0, 32.5, 22.0 ],
					"style" : "",
					"text" : "175",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 536.0, 904.0, 83.0, 22.0 ],
					"style" : "",
					"text" : "s ---toMidiOut",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.79,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_color2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"id" : "obj-54",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 536.0, 872.0, 57.0, 22.0 ],
					"style" : "",
					"text" : "$1 123 0",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 584.0, 736.0, 80.0, 22.0 ],
					"style" : "",
					"text" : "s ---toShruthi",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.79,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"bgfillcolor_color2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"gradient" : 0,
					"id" : "obj-48",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 584.0, 704.0, 39.0, 22.0 ],
					"style" : "",
					"text" : "panic",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 296.0, 408.0, 57.0, 22.0 ],
					"style" : "",
					"text" : "pipe 200",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 296.0, 432.0, 56.0, 22.0 ],
					"style" : "",
					"text" : "deferlow",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 864.0, 304.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "s ---deviceName",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-109",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 232.0, 584.0, 104.0, 33.0 ],
					"style" : "",
					"text" : "preset store also writes to file",
					"textcolor" : [ 0.094118, 0.117647, 0.137255, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-105",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 144.0, 576.0, 56.0, 22.0 ],
					"style" : "",
					"text" : "deferlow",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-104",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "writeagain" ],
					"patching_rect" : [ 144.0, 600.0, 72.0, 22.0 ],
					"style" : "",
					"text" : "t writeagain",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 144.0, 704.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "s ---presetRecall",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 144.0, 672.0, 70.0, 22.0 ],
					"style" : "",
					"text" : "route recall",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-31",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 408.0, 42.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 183.5, 59.0, 42.0, 19.0 ],
					"style" : "",
					"text" : "Ctrlr In",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 502.0, 272.0, 96.0, 22.0 ],
					"style" : "",
					"text" : "prepend symbol",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 502.0, 232.0, 134.0, 22.0 ],
					"restore" : [ "MPK mini" ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "pattr midiControllerPort",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "midiControllerPort"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1094.5, 112.0, 19.0, 22.0 ],
					"style" : "",
					"text" : "_",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 1094.5, 72.0, 157.0, 22.0 ],
					"restore" : [ 16 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "pattr midiControllerChannel",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "midiControllerChannel"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1126.5, 112.0, 151.0, 22.0 ],
					"style" : "",
					"text" : "s ---midiControllerChannel",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hint" : "The channel of the extra incoming MIDI input",
					"htricolor" : [ 1.0, 0.427231, 0.000534, 1.0 ],
					"id" : "obj-28",
					"maxclass" : "number",
					"maximum" : 16,
					"minimum" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1038.5, 96.0, 42.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 438.0, 59.0, 32.0, 22.0 ],
					"prototypename" : "Live",
					"style" : "",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"tricolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"triscale" : 0.75
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 606.0, 272.0, 128.0, 22.0 ],
					"style" : "",
					"text" : "s ---midiControllerPort",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_color" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"fontsize" : 11.0,
					"hint" : "Extra MIDI input routed to Shruthi",
					"id" : "obj-9",
					"items" : [ "MPK mini", ",", "Ableton Push Live Port", ",", "Ableton Push User Port", ",", "Fireface 400 (B21) Port 1", ",", "Fireface 400 (B21) Port 2", ",", "to Max 1", ",", "to Max 2" ],
					"labelclick" : 1,
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 486.0, 200.0, 168.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 240.0, 59.0, 160.0, 21.0 ],
					"prototypename" : "shreditor",
					"style" : "",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 272.0, 280.0, 96.0, 22.0 ],
					"style" : "",
					"text" : "prepend symbol",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 24.0, 280.0, 96.0, 22.0 ],
					"style" : "",
					"text" : "prepend symbol",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frozen_object_attributes" : 					{
						"autorestore" : 0
					}
,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 24.0, 240.0, 118.0, 22.0 ],
					"restore" : [ 0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "pattr midiOutputPort",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "midiOutputPort"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frozen_object_attributes" : 					{
						"autorestore" : 0
					}
,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 272.0, 240.0, 109.0, 22.0 ],
					"restore" : [ 0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "pattr midiInputPort",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "midiInputPort"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-131",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 816.0, 256.0, 63.0, 22.0 ],
					"style" : "",
					"text" : "sprintf %s",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"autorestore" : "DevicePresets.json",
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 1.0, 0.543994, 0.077547, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 144.0, 640.0, 298.0, 22.0 ],
					"saved_object_attributes" : 					{
						"client_rect" : [ 4, 45, 579, 473 ],
						"parameter_enable" : 0,
						"storage_rect" : [ 766, 45, 1220, 303 ]
					}
,
					"style" : "",
					"text" : "pattrstorage DevicePresets @greedy 2 @savemode 0",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "DevicePresets"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-95",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 816.0, 280.0, 19.0, 22.0 ],
					"style" : "",
					"text" : "_",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-94",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 944.0, 264.0, 61.0, 22.0 ],
					"style" : "",
					"text" : "route text",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frozen_object_attributes" : 					{
						"autorestore" : 0
					}
,
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 816.0, 232.0, 105.0, 22.0 ],
					"restore" : [ "YourDeviceLabel" ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "pattr deviceName",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"varname" : "deviceName"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-53",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1000.0, 208.0, 73.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 53.0, 40.0, 19.0 ],
					"style" : "",
					"text" : "Label",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"autoscroll" : 0,
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"bordercolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-44",
					"keymode" : 1,
					"lines" : 1,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"outputmode" : 1,
					"parameter_enable" : 0,
					"patching_rect" : [ 944.0, 232.0, 136.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 40.0, 50.0, 128.0, 24.0 ],
					"prototypename" : "shreditor",
					"style" : "",
					"tabmode" : 0,
					"text" : "YourDeviceLabel",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"active1" : [ 0.309804, 0.580392, 1.0, 1.0 ],
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"bubblesize" : 11,
					"embed" : 0,
					"emptycolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 1,
					"fontsize" : 11.0,
					"hint" : "Switch between devices. Use shift-click on a slot to store current settings",
					"id" : "obj-119",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "preset", "int", "preset", "int" ],
					"patching_rect" : [ 152.0, 408.0, 128.0, 24.0 ],
					"pattrstorage" : "DevicePresets",
					"presentation" : 1,
					"presentation_rect" : [ 40.0, 8.0, 128.0, 24.0 ],
					"stored1" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"style" : "",
					"textcolor" : [ 0.501961, 0.501961, 0.501961, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 200.0, 88.0, 85.0, 22.0 ],
					"style" : "",
					"text" : "r ---initLevel0",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-6",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 472.0, 51.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 183.5, 8.0, 51.0, 19.0 ],
					"style" : "",
					"text" : "Midi Out",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 0.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 440.0, 43.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 183.5, 33.0, 43.0, 19.0 ],
					"style" : "",
					"text" : "Midi In",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 832.0, 760.0, 103.0, 22.0 ],
					"style" : "",
					"text" : "s ---midiChannel",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 128.0, 280.0, 95.0, 22.0 ],
					"style" : "",
					"text" : "s ---midiOutPort",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 376.0, 280.0, 86.0, 22.0 ],
					"style" : "",
					"text" : "s ---midiInPort",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.79,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_color2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"gradient" : 0,
					"id" : "obj-35",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 504.0, 40.0, 147.0, 23.0 ],
					"style" : "",
					"text" : "populateMidiPortMenus",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_color" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"fontsize" : 11.0,
					"hint" : "Extra MIDI input routed to Shruthi",
					"id" : "obj-36",
					"items" : [ "AU DLS Synth 1", ",", "MPK mini", ",", "Ableton Push Live Port", ",", "Ableton Push User Port", ",", "Fireface 400 (B21) Port 1", ",", "Fireface 400 (B21) Port 2", ",", "from Max 1", ",", "from Max 2" ],
					"labelclick" : 1,
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 56.0, 200.0, 168.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 240.0, 8.0, 160.0, 21.0 ],
					"prototypename" : "shreditor",
					"style" : "",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_color" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"fontsize" : 11.0,
					"hint" : "Extra MIDI input routed to Shruthi",
					"id" : "obj-2",
					"items" : [ "MPK mini", ",", "Ableton Push Live Port", ",", "Ableton Push User Port", ",", "Fireface 400 (B21) Port 1", ",", "Fireface 400 (B21) Port 2", ",", "to Max 1", ",", "to Max 2" ],
					"labelclick" : 1,
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 232.0, 200.0, 168.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 240.0, 33.0, 160.0, 21.0 ],
					"prototypename" : "shreditor",
					"style" : "",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-100", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-102", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-112", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-69", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-67", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-122", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-104", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-100", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-102", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-112", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-113", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-122", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-116", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 448.0, 197.0 ],
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-105", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-119", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-32", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-119", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-95", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-83", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-119", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
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
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-48", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-37", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-72", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
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
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-91", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-94", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-51", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-50", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 0 ]
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
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 0 ]
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
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-119", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-71", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-87", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-74", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-75", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-81", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-88", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-122", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-66", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-83", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-131", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-97", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-92", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-91", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-89", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-96", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-69", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-108" : [ "textbutton", "textbutton", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "_.maxpat",
				"bootpath" : "~/Documents/Projects/Shreditor/shreditor/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "DevicePresets.json",
				"bootpath" : "~/Documents/Projects/Shreditor/shreditor/data",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
