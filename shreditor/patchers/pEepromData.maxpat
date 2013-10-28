{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 4,
			"architecture" : "x86"
		}
,
		"rect" : [ 417.0, 74.0, 799.0, 608.0 ],
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
					"fontsize" : 13.0,
					"hidden" : 0,
					"id" : "obj-80",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 552.0, 424.0, 150.0, 21.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "conformpath native boot",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 624.0, 552.0, 71.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "print import",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"fontsize" : 11.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-11",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 504.0, 56.0, 54.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 176.0, 48.0, 54.0, 19.0 ],
					"text" : "Abort UL",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0,
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"blinkcolor" : [ 1.0, 0.427451, 0.0, 1.0 ],
					"fgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"hidden" : 0,
					"id" : "obj-7",
					"ignoreclick" : 0,
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"patching_rect" : [ 560.0, 57.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 232.0, 48.0, 19.0, 19.0 ],
					"prototypename" : "shr_dark_circle"
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
					"id" : "obj-9",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "stopTransfer" ],
					"patching_rect" : [ 520.0, 88.0, 84.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "t stopTransfer",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"id" : "obj-8",
					"ignoreclick" : 1,
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 184.0, 488.0, 150.0, 87.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "first time we store preset, we have probably set the midi connections, so we want to know numbanks before we start initial transfer",
					"textcolor" : [ 0.094118, 0.117647, 0.137255, 1.0 ],
					"textjustification" : 0,
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
					"fontsize" : 11.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-31",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 360.0, 248.0, 45.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 288.0, 8.0, 77.0, 19.0 ],
					"text" : "File i/O",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0,
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
					"fontsize" : 11.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-27",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 456.0, 281.0, 41.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 288.0, 32.0, 52.0, 19.0 ],
					"text" : "Import",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0,
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"blinkcolor" : [ 1.0, 0.427451, 0.0, 1.0 ],
					"fgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"hidden" : 0,
					"id" : "obj-28",
					"ignoreclick" : 0,
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"patching_rect" : [ 512.0, 281.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 344.0, 32.0, 19.0, 19.0 ],
					"prototypename" : "shr_dark_circle"
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
					"fontsize" : 11.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-29",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 360.0, 280.0, 52.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 288.0, 56.0, 52.0, 19.0 ],
					"text" : "Export",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0,
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"blinkcolor" : [ 1.0, 0.427451, 0.0, 1.0 ],
					"fgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"hidden" : 0,
					"id" : "obj-30",
					"ignoreclick" : 0,
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"patching_rect" : [ 417.0, 279.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 344.0, 56.0, 19.0, 19.0 ],
					"prototypename" : "shr_dark_circle"
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
					"fontsize" : 11.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-24",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 376.0, 57.0, 45.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 176.0, 8.0, 57.0, 19.0 ],
					"text" : "Upload",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0,
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"blinkcolor" : [ 1.0, 0.427451, 0.0, 1.0 ],
					"fgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"hidden" : 0,
					"id" : "obj-26",
					"ignoreclick" : 0,
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"patching_rect" : [ 432.0, 57.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 232.0, 8.0, 19.0, 19.0 ],
					"prototypename" : "shr_dark_circle"
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
					"fontsize" : 11.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-23",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 280.0, 56.0, 59.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 72.0, 8.0, 71.0, 19.0 ],
					"text" : "Download",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0,
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"blinkcolor" : [ 1.0, 0.427451, 0.0, 1.0 ],
					"fgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"hidden" : 0,
					"id" : "obj-4",
					"ignoreclick" : 0,
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"patching_rect" : [ 337.0, 55.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.0, 8.0, 19.0, 19.0 ],
					"prototypename" : "shr_dark_circle"
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
					"id" : "obj-36",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 392.0, 168.0, 41.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 112.0, 48.0, 41.0, 20.0 ],
					"text" : "Bytes",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0,
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
					"id" : "obj-33",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 352.0, 168.0, 21.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 48.0, 48.0, 21.0, 20.0 ],
					"text" : "of",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0,
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"bordercolor" : [ 0.622449, 0.622449, 0.622449, 1.0 ],
					"drawline" : 0,
					"fgcolor" : [ 0.242355, 0.476857, 0.983694, 1.0 ],
					"floatoutput" : 0,
					"hidden" : 0,
					"id" : "obj-35",
					"ignoreclick" : 1,
					"listmode" : 0,
					"maxclass" : "rslider",
					"min" : 0,
					"mult" : 1.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"orientation" : 0,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 288.0, 192.0, 200.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 32.0, 240.0, 10.0 ],
					"size" : 100.0
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
					"id" : "obj-25",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "int" ],
					"patching_rect" : [ 488.0, 144.0, 79.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "unpack 0 0 0",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"id" : "obj-135",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 448.0, 336.0, 172.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "sprintf symout %s_eeprom.bin",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"id" : "obj-5",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 488.0, 112.0, 119.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "r ---transferProgress",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"fontsize" : 11.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-3",
					"ignoreclick" : 1,
					"linecount" : 8,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 32.0, 141.0, 105.0 ],
					"presentation" : 1,
					"presentation_linecount" : 4,
					"presentation_rect" : [ 376.0, 8.0, 240.0, 56.0 ],
					"text" : "Import or export full eeprom data to or from an external file. On import the data is loaded into the editor. You still need to tranfer it to the device using the upload function on the left.",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0,
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
					"id" : "obj-2",
					"ignoreclick" : 1,
					"linecount" : 8,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.0, 160.0, 150.0, 114.0 ],
					"presentation" : 1,
					"presentation_linecount" : 5,
					"presentation_rect" : [ 8.0, 128.0, 256.0, 74.0 ],
					"text" : "When you start editing a new Shruthi first transfer all eeprom data from the device to create a mirror. Data is automatically saved to disk every 10 seconds, or when you store a preset.",
					"textcolor" : [ 0.094118, 0.117647, 0.137255, 1.0 ],
					"textjustification" : 0,
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
					"id" : "obj-34",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 448.0, 312.0, 97.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "r ---deviceName",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"id" : "obj-160",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 384.0, 424.0, 139.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "conformpath native boot",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"id" : "obj-149",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "transferRom" ],
					"patching_rect" : [ 392.0, 88.0, 83.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "t transferRom",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"fontsize" : 11.0,
					"frgb" : 0.0,
					"hidden" : 0,
					"id" : "obj-148",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 192.0, 56.0, 77.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 8.0, 54.0, 19.0 ],
					"text" : "Eeprom ",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0,
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
					"id" : "obj-143",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 312.0, 120.0, 85.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "s ---toShruthi",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"id" : "obj-142",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "requestRom" ],
					"patching_rect" : [ 312.0, 88.0, 83.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "t requestRom",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"id" : "obj-137",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 448.0, 360.0, 88.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "prepend name",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"id" : "obj-113",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 384.0, 472.0, 85.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "s ---toShruthi",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"id" : "obj-114",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 384.0, 448.0, 133.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "prepend exportEeprom",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"color" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"hidden" : 0,
					"id" : "obj-99",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "bang" ],
					"patching_rect" : [ 384.0, 400.0, 94.0, 21.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "savedialog bin",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"id" : "obj-97",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 552.0, 400.0, 89.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "opendialog bin",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"id" : "obj-90",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 552.0, 472.0, 85.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "s ---toShruthi",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
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
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 552.0, 448.0, 133.0, 20.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "prepend importEeprom",
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"textjustification" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"bordercolor" : [ 0.862745, 0.862745, 0.862745, 0.0 ],
					"cantchange" : 0,
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"format" : 0,
					"hbgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"hidden" : 0,
					"htextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"htricolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"id" : "obj-39",
					"ignoreclick" : 1,
					"maxclass" : "number",
					"maximum" : "<none>",
					"minimum" : "<none>",
					"mouseup" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"outputonclick" : 0,
					"parameter_enable" : 0,
					"patching_rect" : [ 560.0, 192.0, 65.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 72.0, 48.0, 40.0, 19.0 ],
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"triangle" : 0,
					"tricolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"triscale" : 1.0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 0.207843, 0.207843, 0.223529, 1.0 ],
					"bordercolor" : [ 0.862745, 0.862745, 0.862745, 0.0 ],
					"cantchange" : 0,
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"format" : 0,
					"hbgcolor" : [ 0.282353, 0.286275, 0.298039, 1.0 ],
					"hidden" : 0,
					"htextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"htricolor" : [ 0.77551, 0.77551, 0.77551, 1.0 ],
					"id" : "obj-38",
					"ignoreclick" : 1,
					"maxclass" : "number",
					"maximum" : "<none>",
					"minimum" : "<none>",
					"mouseup" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"outputonclick" : 0,
					"parameter_enable" : 0,
					"patching_rect" : [ 496.0, 192.0, 65.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 48.0, 40.0, 19.0 ],
					"textcolor" : [ 0.863854, 0.863854, 0.863854, 1.0 ],
					"triangle" : 0,
					"tricolor" : [ 0.46253, 0.46253, 0.46253, 1.0 ],
					"triscale" : 1.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-113", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-137", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-135", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-99", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-143", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-143", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-114", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-160", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-35", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-149", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-97", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-99", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-135", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-142", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-90", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 560.0, 468.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-143", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-80", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.8, 0.8, 0.8, 0.9 ],
					"destination" : [ "obj-160", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"dependency_cache" : [  ]
	}

}
