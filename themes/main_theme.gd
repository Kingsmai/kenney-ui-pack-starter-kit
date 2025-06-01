@tool
extends ProgrammaticTheme

const UPDATE_ON_SAVE = true
const VERBOSITY = Verbosity.SILENT

const DEFAULT_FONT = "res://assets/Font/Kenney Future Narrow.ttf"

const FONT_COLOR = Color("#333333")
const FONT_UNEDITABLE_COLOR = Color("#333333AA")
const FONT_PLACEHOLDER_COLOR = Color("#999999")
const BUTTON_FONT_COLOR = Color("#ffffff")

const CLOSE_BUTTON_ICON = "res://themes/ui-pack/window_control/grey_icon_cross.png"
const CLOSE_BUTTON_BG = "res://themes/ui-pack/window_control/red_button_square_flat.png"
const CLOSE_BUTTON_HOVER_BG = "res://themes/ui-pack/window_control/red_button_square_gloss.png"
const CLOSE_BUTTON_PRESSED_BG = "res://themes/ui-pack/window_control/red_button_square_gradient.png"

const PANEL_BG = "res://themes/ui-pack/panel/panel_square_depth_line.png"
const PANEL_GREEN_BG = "res://themes/ui-pack/panel/button_square_depth_flat.png"

const BUTTON_BG = "res://themes/ui-pack/primary/button_square_depth_gradient.png"
const BUTTON_HOVER_BG = "res://themes/ui-pack/primary/button_square_depth_gloss.png"
const BUTTON_PRESSED_BG = "res://themes/ui-pack/primary/button_square_gradient.png"
const BUTTON_HOVER_PRESSED_BG = "res://themes/ui-pack/primary/button_square_gloss.png"
const BUTTON_DISABLED_BG = "res://themes/ui-pack/primary/button_square_line.png"

const CHECKBOX_UNCHECKED_DISABLED = "res://themes/ui-pack/checkboxes/check_square_grey.png"
const CHECKBOX_UNCHECKED = "res://themes/ui-pack/checkboxes/check_square_color.png"
const CHECKBOX_CHECKED_DISABLED = "res://themes/ui-pack/checkboxes/check_square_grey_checkmark.png"
const CHECKBOX_CHECKED = "res://themes/ui-pack/checkboxes/check_square_color_checkmark.png"
const RADIO_UNCHECKED_DISABLED = "res://themes/ui-pack/checkboxes/check_round_grey.png"
const RADIO_UNCHECKED = "res://themes/ui-pack/checkboxes/check_round_color.png"
const RADIO_CHECKED_DISABLED = "res://themes/ui-pack/checkboxes/check_round_round_circle.png"
const RADIO_CHECKED = "res://themes/ui-pack/checkboxes/check_round_round_circle.png"

const INPUT_BG = "res://themes/ui-pack/input/input_square.png"
const INPUT_FOCUS_BG = "res://themes/ui-pack/input/input_square.png"

const TAB_PANEL_BG = "res://themes/ui-pack/tab_container/button_square_flat_grey.png"
const TAB_SELECTED_BG = "res://themes/ui-pack/tab_container/button_square_flat.png"
const TAB_UNSELECTED_BG = "res://themes/ui-pack/tab_container/button_square_gradient.png"
const TAB_HOVER_BG = "res://themes/ui-pack/tab_container/button_square_gloss.png"
const TAB_DISABLED_BG = "res://themes/ui-pack/tab_container/button_square_flat_grey.png"

const TREE_PANEL_BG = "res://themes/ui-pack/tree/button_square_line.png"
const TREE_ICON_EXPAND = "res://themes/ui-pack/tree/icon_arrow_down_dark.svg"
const TREE_ICON_COLLAPSE = "res://themes/ui-pack/tree/icon_arrow_up_dark.svg"
const TREE_SELECTED_BG = "res://themes/ui-pack/tree/button_square_flat.png"
const TREE_HOVER_BG = "res://themes/ui-pack/tree/button_square_gloss.png"
const TREE_CHECKBOX_UNCHECKED_DISABLED = "res://themes/ui-pack/tree/check_square_grey.png"
const TREE_CHECKBOX_UNCHECKED = "res://themes/ui-pack/tree/check_square_color.png"
const TREE_CHECKBOX_CHECKED_DISABLED = "res://themes/ui-pack/tree/check_square_grey_checkmark.png"
const TREE_CHECKBOX_CHECKED = "res://themes/ui-pack/tree/check_square_color_checkmark.png"

const PROGRESS_BAR_BG = "res://themes/ui-pack/progress_bar/bar_shadow_round_outline_small.svg"
const PROGRESS_BAR_FILL = "res://themes/ui-pack/progress_bar/bar_round_gloss_small.svg"

const SCROLL_BAR_BG = "res://themes/ui-pack/scroll_bar/bar_shadow_square_small_square.svg"
const SCROLL_BAR_GRABBER = "res://themes/ui-pack/scroll_bar/bar_square_small_square.svg"
const SCROLL_BAR_GRABBER_HIGHLIGHT = "res://themes/ui-pack/scroll_bar/bar_square_gloss_small_square.svg"

const MARGIN = 8

func setup() -> void:
	set_save_path("res://themes/main_theme.tres")

func define_theme() -> void:
	#define_default_font(ResourceLoader.load(DEFAULT_FONT))
	
	var panel_style_box = stylebox_texture({
		texture = ResourceLoader.load(PANEL_BG),
		texture_margin_left = 6,
		texture_margin_top = 6,
		texture_margin_right = 6,
		texture_margin_bottom = 10
	})
	
	var no_outline_style_box = stylebox_empty({
		texture_margin_left = 10,
		texture_margin_top = 6,
		texture_margin_right = 10,
		texture_margin_bottom = 10
	})
	
	define_style("PanelContainer", {
		panel = panel_style_box
	})
	
	define_style("Panel", {
		panel = panel_style_box
	})
	
	define_style("Label", {
		font_color = FONT_COLOR
	})
	
	define_style("RichTextLabel", {
		default_color = FONT_COLOR
	})
	
	define_style("MarginContainer", {
		margin_left = MARGIN,
		margin_top = MARGIN,
		margin_right = MARGIN,
		margin_bottom = MARGIN,
	})
	
	define_style("BoxContainer", {
		separation = MARGIN
	})
	
	var button_close_style_box = stylebox_texture({
		texture = ResourceLoader.load(CLOSE_BUTTON_BG),
		texture_margin_left = 6,
		texture_margin_top = 6,
		texture_margin_right = 6,
		texture_margin_bottom = 6
	})
	
	var button_close_hover_style_box = stylebox_texture(inherit(button_close_style_box, {
		texture = ResourceLoader.load(CLOSE_BUTTON_HOVER_BG)
	}))
	
	var button_close_pressed_style_box = stylebox_texture(inherit(button_close_style_box, {
		texture = ResourceLoader.load(CLOSE_BUTTON_PRESSED_BG)
	}))
	
	define_variant_style("ButtonClose", "Button", {
		icon = ResourceLoader.load(CLOSE_BUTTON_ICON),
		normal = button_close_style_box,
		hover = button_close_hover_style_box,
		pressed = button_close_pressed_style_box
	})
	
	#region Inputs
	var input_style_box = stylebox_texture({
		texture = ResourceLoader.load(INPUT_BG),
		texture_margin_left = 10,
		texture_margin_top = 10,
		texture_margin_right = 10,
		texture_margin_bottom = 10
	})

	var input_focus_style_box = stylebox_texture(inherit(input_style_box, {
		texture = ResourceLoader.load(INPUT_FOCUS_BG)
	}))
	
	define_style("LineEdit", {
		font_color = FONT_COLOR,
		font_uneditable_color = FONT_UNEDITABLE_COLOR,
		font_placeholder_color = FONT_PLACEHOLDER_COLOR,
		caret_color = FONT_COLOR,
		normal = input_style_box,
		focus = input_focus_style_box,
		read_only = input_style_box
	})
	
	define_style("TextEdit", {
		font_color = FONT_COLOR,
		caret_color = FONT_COLOR,
		normal = input_style_box,
		focus = input_focus_style_box,
		read_only = input_style_box
	})

	define_style("CodeEdit", {
		current_line_color = Color("#cccc"),
		line_number_color = FONT_COLOR,
		font_readonly_color = FONT_UNEDITABLE_COLOR
	})
	#endregion
	
	#region Button
	var button_style_box = stylebox_texture({
		texture = ResourceLoader.load(BUTTON_BG),
		texture_margin_left = 10,
		texture_margin_top = 6,
		texture_margin_right = 10,
		texture_margin_bottom = 10
	})
	
	var button_hover_style_box = stylebox_texture(inherit(button_style_box, {
		texture = ResourceLoader.load(BUTTON_HOVER_BG)
	}))
	
	var button_pressed_style_box = stylebox_texture(inherit(button_style_box, {
		texture = ResourceLoader.load(BUTTON_PRESSED_BG)
	}))
	
	var button_hover_pressed_style_box = stylebox_texture(inherit(button_style_box, {
		texture = ResourceLoader.load(BUTTON_HOVER_PRESSED_BG)
	}))
	
	var button_disabled_style_box = stylebox_texture(inherit(button_style_box, {
		texture = ResourceLoader.load(BUTTON_DISABLED_BG)
	}))
	
	define_style("Button", {
		font_color = BUTTON_FONT_COLOR,
		font_hover_color = BUTTON_FONT_COLOR,
		font_pressed_color = BUTTON_FONT_COLOR,
		font_hover_pressed_color = BUTTON_FONT_COLOR,
		font_focus_color = BUTTON_FONT_COLOR,
		font_disabled_color = FONT_COLOR,
		normal = button_style_box,
		hover = button_hover_style_box,
		pressed = button_pressed_style_box,
		hover_pressed = button_hover_pressed_style_box,
		disabled = button_disabled_style_box,
		focus = no_outline_style_box
	})
	#endregion End of Button
	
	#region Checkbox
	define_style("CheckBox", {
		checked = ResourceLoader.load(CHECKBOX_CHECKED),
		checked_disabled = ResourceLoader.load(CHECKBOX_CHECKED_DISABLED),
		unchecked = ResourceLoader.load(CHECKBOX_UNCHECKED),
		unchecked_disabled = ResourceLoader.load(CHECKBOX_UNCHECKED_DISABLED),
		radio_checked = ResourceLoader.load(RADIO_CHECKED),
		radio_checked_disabled = ResourceLoader.load(RADIO_CHECKED_DISABLED),
		radio_unchecked = ResourceLoader.load(RADIO_UNCHECKED),
		radio_unchecked_disabled = ResourceLoader.load(RADIO_UNCHECKED_DISABLED),
		normal = stylebox_empty({}),
		hover = stylebox_empty({}),
		pressed = stylebox_empty({}),
		hover_pressed = stylebox_empty({}),
		disabled = stylebox_empty({}),
		focus = no_outline_style_box,
		font_color = FONT_COLOR,
		font_hover_color = FONT_COLOR,
		font_pressed_color = FONT_COLOR,
		font_hover_pressed_color = FONT_COLOR,
		font_focus_color = FONT_COLOR,
	})
	#endregion
	
	#region Tab Container
	var tab_panel_style_box = stylebox_texture({
		texture = ResourceLoader.load(TAB_PANEL_BG),
		texture_margin_left = 6,
		texture_margin_top = 6,
		texture_margin_right = 6,
		texture_margin_bottom = 10
	})
	
	var tab_unselected_style_box = stylebox_texture({
		texture = ResourceLoader.load(TAB_UNSELECTED_BG),
		texture_margin_left = 12,
		texture_margin_top = 6,
		texture_margin_right = 12,
		texture_margin_bottom = 10
	})
	
	var tab_selected_style_box = stylebox_texture(inherit(tab_unselected_style_box, {
		texture = ResourceLoader.load(TAB_SELECTED_BG)
	}))
	
	var tab_hovered_style_box = stylebox_texture(inherit(tab_unselected_style_box, {
		texture = ResourceLoader.load(TAB_HOVER_BG)
	}))
	
	var tab_disabled_style_box = stylebox_texture(inherit(tab_unselected_style_box, {
		texture = ResourceLoader.load(TAB_DISABLED_BG)
	}))
	
	define_style("TabContainer", {
		panel = tab_panel_style_box,
		tab_selected = tab_selected_style_box,
		tab_hovered = tab_hovered_style_box,
		tab_unselected = tab_unselected_style_box,
		tab_disabled = tab_disabled_style_box,
		tab_focus = no_outline_style_box,
		font_unselected_color = FONT_COLOR,
		font_hovered_color = FONT_COLOR,
		font_disabled_color = FONT_UNEDITABLE_COLOR
	})
	#endregion End of Tab Container
	
	#region Tree and ItemList
	var tree_panel_style_box = stylebox_texture({
		texture = ResourceLoader.load(TREE_PANEL_BG),
		texture_margin_left = 12,
		texture_margin_top = 12,
		texture_margin_right = 12,
		texture_margin_bottom = 12
	})
	
	var tree_selected_style_box = stylebox_texture({
		texture = ResourceLoader.load(TREE_SELECTED_BG),
		texture_margin_left = 12,
		texture_margin_top = 6,
		texture_margin_right = 12,
		texture_margin_bottom = 10
	})
	
	var tree_hovered_style_box = stylebox_texture(inherit(tree_selected_style_box, {
		texture = ResourceLoader.load(TREE_HOVER_BG)
	}))
	
	define_style("Tree", {
		panel = tree_panel_style_box,
		arrow = ResourceLoader.load(TREE_ICON_EXPAND),
		arrow_collapsed = ResourceLoader.load(TREE_ICON_COLLAPSE),
		arrow_collapsed_mirrored = ResourceLoader.load(TREE_ICON_COLLAPSE),
		unchecked = ResourceLoader.load(TREE_CHECKBOX_UNCHECKED),
		unchecked_disabled = ResourceLoader.load(TREE_CHECKBOX_UNCHECKED_DISABLED),
		checked = ResourceLoader.load(TREE_CHECKBOX_CHECKED),
		checked_disabled = ResourceLoader.load(TREE_CHECKBOX_CHECKED_DISABLED),
		icon_max_width = 24,
		font_color = FONT_COLOR,
		font_hovered_color = FONT_COLOR.lightened(0.2),
		font_selected_color = FONT_COLOR.darkened(0.5),
		hovered = tree_hovered_style_box,
		selected = tree_selected_style_box,
		focus = no_outline_style_box,
		selected_focus = tree_selected_style_box,
		inner_item_margin_top = 8,
		inner_item_margin_right = 8,
		inner_item_margin_left = 8,
		inner_item_margin_bottom = 8,
		button_hover = tree_hovered_style_box,
	})
	
	define_style("ItemList", {
		panel = tree_panel_style_box,
		font_color = FONT_COLOR,
		font_hovered_color = FONT_COLOR.lightened(0.2),
		font_selected_color = FONT_COLOR.darkened(0.5),
		hovered = tree_hovered_style_box,
		selected = tree_selected_style_box,
		focus = no_outline_style_box,
		selected_focus = tree_selected_style_box,
	})
	#endregion
	
	#region ProgressBar
	var progress_bar_background_style_box = stylebox_texture(inherit(
		{texture = ResourceLoader.load(PROGRESS_BAR_BG)},
		texture_margins(8, 8, 8, 8)
	))
	
	var progress_bar_fill_style_box = stylebox_texture(inherit(progress_bar_background_style_box, {
		texture = ResourceLoader.load(PROGRESS_BAR_FILL)
	}))
	
	define_style("ProgressBar", {
		background = progress_bar_background_style_box,
		fill = progress_bar_fill_style_box
	})
	#endregion
	
	#region ScrollBar
	var scrollbar_scroll_style_box = stylebox_texture(inherit(
		{texture = ResourceLoader.load(SCROLL_BAR_BG)},
		texture_margins(8),
	))
	
	var scrollbar_grabber_style_box = stylebox_texture(inherit(scrollbar_scroll_style_box, {
		texture = ResourceLoader.load(SCROLL_BAR_GRABBER)
	}))
	
	var scrollbar_grabber_highlight_style_box = stylebox_texture(inherit(scrollbar_scroll_style_box, {
		texture = ResourceLoader.load(SCROLL_BAR_GRABBER_HIGHLIGHT)
	}))
	
	var scrollbar_style = {
		scroll = scrollbar_scroll_style_box,
		grabber = scrollbar_grabber_style_box,
		grabber_highlight = scrollbar_grabber_highlight_style_box,
		grabber_pressed = scrollbar_grabber_style_box
	}
	
	define_style("VScrollBar", scrollbar_style)
	define_style("HScrollBar", scrollbar_style)
	#endregion
	
	#region GREYHACK SAVE VIEWIER Specified
	var msg_send_panel_style_box = stylebox_texture({
		texture = ResourceLoader.load(PANEL_GREEN_BG),
		texture_margin_left = 6,
		texture_margin_top = 6,
		texture_margin_right = 6,
		texture_margin_bottom = 10
	})
	
	define_variant_style("MessageOutgoing", "PanelContainer", {
		panel = msg_send_panel_style_box
	})
	#endregion
