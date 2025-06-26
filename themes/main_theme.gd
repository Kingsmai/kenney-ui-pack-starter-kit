@tool
extends ProgrammaticTheme

const UPDATE_ON_SAVE = true
const VERBOSITY = Verbosity.SILENT
const THEME_FILE_PATH = "res://themes/main_theme.tres"

const FONT_COLOR = Color("#333333")
const FONT_UNEDITABLE_COLOR = Color("#333333AA")
const FONT_PLACEHOLDER_COLOR = Color("#999999")
const FONT_COLOR_OUTLINE = Color("#ffffff")

const MARGIN = 8

const UI_PACK_COLOR_PATH = "res://themes/ui_pack/%s/%s.svg"
const UI_PACK_EXTRA_PATH = "res://themes/ui_pack/extra/%s.svg"

const TYPE_COLORS: Dictionary[String, String] = {
	"Default": "Grey",
	"Primary": "Blue",
	"Success": "Green",
	#"Info": "Grey",
	"Warning": "Yellow",
	"Danger": "Red"
}

const PANEL_STYLES: Dictionary[String, String] = {
	"Depth": "button_square_depth_flat",
	"Flat": "button_square_flat",
}

const BUTTON_VARIANTS: Dictionary[String, Dictionary] = {
	"Default": {
		&"normal": "button_square_depth_gradient",
		&"hover": "button_square_depth_gloss",
		&"pressed": "button_square_gradient",
		&"hover_pressed": "button_square_gloss",
		&"disabled": "button_square_line",
	},
	"Plain": {
		&"normal": "button_square_depth_border",
		&"hover": "button_square_depth_line",
		&"pressed": "button_square_line",
		&"hover_pressed": "button_square_border",
		&"disabled": "button_square_line",
	}
}

const CHECKBUTTON_STATES: Dictionary[String, String] = {
	&"checked": "icon_outline_checkmark",
	&"unchecked": "icon_outline_cross",
	&"checked_disabled": "icon_checkmark",
	&"unchecked_disabled": "icon_cross",
	&"checked_mirrored": "icon_outline_checkmark",
	&"unchecked_mirrored": "icon_outline_cross",
	&"checked_disabled_mirrored": "icon_checkmark",
	&"unchecked_disabled_mirrored": "icon_cross",
}

const CHECKBOX_STATES: Dictionary[String, String] = {
	&"checked": "check_square_color_checkmark",
	&"unchecked": "check_square_color",
	&"checked_disabled": "check_square_grey_checkmark",
	&"unchecked_disabled": "check_square_grey",
	&"radio_checked": "check_round_round_circle",
	&"radio_unchecked": "check_round_color",
	&"radio_checked_disabled": "check_round_grey_circle",
	&"radio_unchecked_disabled": "check_round_grey",
}

const SLIDER_SPRITES: Dictionary[String, String] = {
	&"grabber": "icon_circle",
	&"grabber_disabled": "icon_outline_square",
	&"grabber_highlight": "icon_outline_circle",
	# It is different between horizontal and vertical
	&"tick": "slide_%s_color_section",
}

const HSLIDER_STYLEBOX_TEXTURE: Dictionary[String, String] = {
	&"grabber_area": "slide_horizontal_color",
	&"grabber_area_highlight": "slide_horizontal_color",
	&"slider": "slide_horizontal_grey",
}

const VSLIDER_STYLEBOX_TEXTURE: Dictionary[String, String] = {
	&"grabber_area": "slide_vertical_color",
	&"grabber_area_highlight": "slide_vertical_color",
	&"slider": "slide_vertical_grey",
}

const LINE_EDIT_STYLES: Dictionary[String, String] = {
	&"normal": "input_square",
	&"focus": "input_outline_square",
	&"read_only": "input_square"
}

const TAB_CONTAINER_STYLES: Dictionary[String, String] = {
	&"panel": "button_square_line",
	&"tab_selected": "button_square_flat",
	&"tab_hovered": "button_square_gloss",
	&"tab_unselected": "button_square_gradient",
	&"tab_disabled": "button_square_line",
}

const PROGRESS_BAR_BG := "button_square_line"
const PROGRESS_BAR_FILL := "button_square_depth_gloss"

const TREE_AND_ITEM_LIST_SHARE_STYLE: Dictionary[String, String] = {
	panel = "button_square_line",
	hovered = "button_square_gloss",
	selected = "button_square_flat",
	selected_focus = "button_square_flat",
}

const TREE_IMAGES: Dictionary[String, String] = {
	checked = "check_square_color_checkmark",
	unchecked_disabled = "check_square_grey",
	unchecked = "check_square_color",
	checked_disabled = "check_square_grey_checkmark",
}

func setup() -> void:
	set_save_path(THEME_FILE_PATH)

func define_theme() -> void:
	define_style("MarginContainer", {
		margin_top = MARGIN,
		margin_right = MARGIN,
		margin_bottom = MARGIN,
		margin_left = MARGIN
	})
	
	define_style("Label", {
		font_color = FONT_COLOR,
		font_outline_color = FONT_COLOR_OUTLINE
	})
	
	define_panels()
	define_buttons()
	define_line_edit()
	define_sliders()
	define_tab_container()
	define_progress_bar()
	define_tree_and_item_list()

func define_panels() -> void:
	for color in TYPE_COLORS:
		for panel_style in PANEL_STYLES:
			var panel_stylebox = stylebox_texture(inherit(
				{texture = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[color], PANEL_STYLES[panel_style]
				])},
				texture_margins(8, 10, 8, 10)
			))
			if color == "Default" and panel_style == "Depth":
				define_style("Panel", {
					panel = panel_stylebox
				})
				define_style("PanelContainer", {
					panel = panel_stylebox
				})
			else:
				var variant_style_name = "PanelContainer%s%s" % [
					color,
					panel_style if panel_style != "Depth" else "",
				]
				define_variant_style(variant_style_name, "PanelContainer", {
					panel = panel_stylebox
				})
				variant_style_name = "Panel%s%s" % [
					color,
					panel_style if panel_style != "Depth" else "",
				]
				define_variant_style(variant_style_name, "Panel", {
					panel = panel_stylebox
				})

func define_buttons() -> void:
	for button_type in TYPE_COLORS:
		# Base Button and Option Button (Since there are same state)
		for variant in BUTTON_VARIANTS:
			var button_state_styleboxes = {
					focus = stylebox_empty({}),
					font_color = FONT_COLOR,
					font_pressed_color = FONT_COLOR,
					font_hover_color = FONT_COLOR,
					font_hover_pressed_color = FONT_COLOR,
					font_focus_color = FONT_COLOR,
					font_disabled_color = FONT_UNEDITABLE_COLOR,
					icon_normal_color = FONT_COLOR,
					icon_pressed_color = FONT_COLOR,
					icon_hover_color = FONT_COLOR,
					icon_hover_pressed_color = FONT_COLOR,
					icon_focus_color = FONT_COLOR,
					icon_disabled_color = FONT_UNEDITABLE_COLOR
				}
			for button_state in BUTTON_VARIANTS[variant]:
				var button_texture = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[button_type],
					BUTTON_VARIANTS[variant][button_state]
				])
				if button_state in [&"pressed", &"hover_pressed", &"disabled"]:
					button_state_styleboxes[button_state] = stylebox_texture(inherit(
						button_state_styleboxes,
						{texture = button_texture},
						texture_margins(16, 10, 16, 10)
					))
				else:
					button_state_styleboxes[button_state] = stylebox_texture(inherit(
						button_state_styleboxes,
						{texture = button_texture},
						texture_margins(16, 8, 16, 12)
					))
			if button_type == "Default" and variant == "Default":
				define_style("Button", button_state_styleboxes)
				define_style("OptionButton", button_state_styleboxes)
			else:
				var variant_style_name = "Button%s%s" % [
					button_type if button_type != "Default" else "",
					variant if variant != "Default" else ""
				]
				define_variant_style(variant_style_name, "Button", button_state_styleboxes)
				define_variant_style("Option" + variant_style_name, "OptionButton", button_state_styleboxes)
		# CheckBox
		var checkbox_state_styleboxes = {
			normal = stylebox_empty({}),
			hover = stylebox_empty({}),
			pressed = stylebox_empty({}),
			hover_pressed = stylebox_empty({}),
			disabled = stylebox_empty({}),
		}
		for checkbox_state in CHECKBOX_STATES:
			checkbox_state_styleboxes[checkbox_state] = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[button_type],
					CHECKBOX_STATES[checkbox_state]
				])
		if button_type == "Default":
			define_style("CheckBox", checkbox_state_styleboxes)
		else:
			var variant_style_name = "CheckBox%s" % [
					button_type if button_type != "Default" else "",
				]
			define_variant_style(variant_style_name, "CheckBox", checkbox_state_styleboxes)

		# CheckButton
		var checkbutton_state_styleboxes = {
			normal = stylebox_empty({}),
			hover = stylebox_empty({}),
			pressed = stylebox_empty({}),
			hover_pressed = stylebox_empty({}),
			disabled = stylebox_empty({}),
		}
		for checkbutton_state in CHECKBUTTON_STATES:
			checkbutton_state_styleboxes[checkbutton_state] = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[button_type],
					CHECKBUTTON_STATES[checkbutton_state]
				])
		if button_type == "Default":
			define_style("CheckButton", checkbutton_state_styleboxes)
		else:
			var variant_style_name = "CheckButton%s" % [
					button_type if button_type != "Default" else "",
				]
			define_variant_style(variant_style_name, "CheckButton", checkbutton_state_styleboxes)

func define_line_edit() -> void:
	var line_edit_styles = {
		font_color = FONT_COLOR,
		font_uneditable_color = FONT_UNEDITABLE_COLOR,
		font_placeholder_color = FONT_PLACEHOLDER_COLOR,
		caret_color = FONT_COLOR,
	}
	for style in LINE_EDIT_STYLES:
		line_edit_styles[style] = stylebox_texture(inherit(
			{texture = ResourceLoader.load(UI_PACK_EXTRA_PATH % [LINE_EDIT_STYLES[style]])},
			texture_margins(8)
		))
	var text_edit_styles = line_edit_styles.duplicate()
	define_style("LineEdit", line_edit_styles)
	text_edit_styles.erase(&"font_uneditable_color")
	define_style("TextEdit", text_edit_styles)

func define_sliders() -> void:
	for color in TYPE_COLORS:
		var slider_style = {}
		for sprite in SLIDER_SPRITES:
			if sprite == &"tick":
				slider_style[sprite] = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[color],
					SLIDER_SPRITES[sprite] % ["horizontal"]
				])
			else:
				slider_style[sprite] = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[color],
					SLIDER_SPRITES[sprite]
				])
		for texture in HSLIDER_STYLEBOX_TEXTURE:
			slider_style[texture] = stylebox_texture(inherit(
				{texture = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[color],
					HSLIDER_STYLEBOX_TEXTURE[texture]
				])},
				texture_margins(16, 8),
				expand_margins(0, 0, 8, 0) if texture.begins_with("grabber") else {}
			))
		if color == "Default":
			define_style("HSlider", slider_style)
		else:
			var variant_style_name = "HSlider%s" % [color]
			define_variant_style(variant_style_name, "HSlider", slider_style)
		slider_style = slider_style.duplicate(true)
		for sprite in SLIDER_SPRITES:
			if sprite == &"tick":
				slider_style[sprite] = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[color],
					SLIDER_SPRITES[sprite] % ["vertical"]
				])
			else:
				slider_style[sprite] = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[color],
					SLIDER_SPRITES[sprite]
				])
		for texture in VSLIDER_STYLEBOX_TEXTURE:
			slider_style[texture] = stylebox_texture(inherit(
				{texture = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[color],
					VSLIDER_STYLEBOX_TEXTURE[texture]
				])},
				texture_margins(8, 16),
				expand_margins(0, 8, 0, 0) if texture.begins_with("grabber") else {}
			))
		if color == "Default":
			define_style("VSlider", slider_style)
		else:
			var variant_style_name = "VSlider%s" % [color]
			define_variant_style(variant_style_name, "VSlider", slider_style)

func define_tab_container() -> void:
	for color in TYPE_COLORS:
		var tab_container_style = {
			font_selected_color = FONT_COLOR,
			font_unselected_color = FONT_COLOR,
			font_hovered_color = FONT_COLOR,
			font_disabled_color = FONT_UNEDITABLE_COLOR,
			tab_focus = stylebox_empty({})
		}
		for style in TAB_CONTAINER_STYLES:
			tab_container_style[style] = stylebox_texture(inherit(
				{texture = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[color], TAB_CONTAINER_STYLES[style]
				])},
				texture_margins(10, 8) if style != "panel" else texture_margins(12)
			))
		if color == "Default":
			define_style("TabContainer", tab_container_style)
		else:
			var variant_style_name = "TabContainer%s" % [color]
			define_variant_style(variant_style_name, "TabContainer", tab_container_style)

func define_progress_bar() -> void:
	for color in TYPE_COLORS:
		var progress_bar_style = {
			background = stylebox_texture(inherit(
				{texture = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[color], PROGRESS_BAR_BG
				])},
				texture_margins(10)
			)),
			fill = stylebox_texture(inherit(
				{texture = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[color], PROGRESS_BAR_FILL
				])},
				texture_margins(4)
			)),
			font_color = FONT_COLOR
		}
		if color == "Default":
			define_style("ProgressBar", progress_bar_style)
		else:
			var variant_style_name = "ProgressBar%s" % [color]
			define_variant_style(variant_style_name, "ProgressBar", progress_bar_style)

func define_tree_and_item_list() -> void:
	for color in TYPE_COLORS:
		var tree_style = {
			font_color = FONT_COLOR,
			font_hovered_color = FONT_COLOR.lightened(0.2),
			font_selected_color = FONT_COLOR.darkened(0.5),
			focus = stylebox_empty({})
		}
		var item_list_style = tree_style.duplicate(true)
		for shared_style in TREE_AND_ITEM_LIST_SHARE_STYLE:
			tree_style[shared_style] = stylebox_texture(inherit(
				{texture = ResourceLoader.load(UI_PACK_COLOR_PATH % [
					TYPE_COLORS[color], TREE_AND_ITEM_LIST_SHARE_STYLE[shared_style]
				])},
				texture_margins(12)
			))
		for image in TREE_IMAGES:
			tree_style[image] = ResourceLoader.load(UI_PACK_COLOR_PATH % [
				TYPE_COLORS[color], TREE_IMAGES[image]
			])
		tree_style = inherit(tree_style, {
			inner_item_margin_top = 8,
			inner_item_margin_right = 8,
			inner_item_margin_left = 8,
			inner_item_margin_bottom = 8,
		})
		if color == "Default":
			define_style("Tree", tree_style)
			define_style("ItemList", item_list_style)
