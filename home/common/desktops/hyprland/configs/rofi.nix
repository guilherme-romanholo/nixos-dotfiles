{

  programs.rofi = {
    enable = true;
    theme = {
      "*" = {
        background-color = "#845543";
      };
    };

  };

# /*
#  * Tokyonight colorscheme (big icons) for rofi
#  * User: w8ste
#  */
# 
# 
# // define colors etc.
# * {
#     bg: #24283b;
#     hv: #9274ca; 
#     primary: #C5C8C6; 
#     ug: #0B2447;
#     font: "Monospace 11";
#     background-color: @bg;
#     //dark: @bg;
#     border: 0px;
#     kl: #7aa2f7;
#     black: #000000;
# 
#     transparent: rgba(46,52,64,0);
# }
# 
# // defines different aspects of the window
# window {
#     width: 700;
#     /*since line wont work with height, i comment it out 
#     if you rather control the size via height
#     just comment it out */
#     //height: 500;
# 
#     orientation: horizontal;
#     location: center;
#     anchor: center;
#     transparency: "screenshot";
#     border-color: @transparent;   
#     border: 0px;
#     border-radius: 6px;
#     spacing: 0;
#     children: [ mainbox ];
# }
# 
# mainbox {
#     spacing: 0;
#     children: [ inputbar, message, listview ];
# }
# 
# inputbar {
#     color: @kl;
#     padding: 11px;
#     border: 3px 3px 2px 3px;
#     border-color: @primary;
#     border-radius: 6px 6px 0px 0px;
# }
# 
# message {
#     padding: 0;
#     border-color: @primary;
#     border: 0px 1px 1px 1px;
# }
# 
# entry, prompt, case-indicator {
#     text-font: inherit;
#     text-color: inherit;
# }
# 
# entry {
#     cursor: pointer;
# }
# 
# prompt {
#     margin: 0px 5px 0px 0px;
# }
# 
# listview {
#     layout: vertical;
#     //spacing: 5px;
#     padding: 8px;
#     lines: 7;
#     columns: 2;
#     border: 0px 3px 3px 3px; 
#     border-radius: 0px 0px 6px 6px;
#     border-color: @primary;
#     dynamic: false;
# }
# 
# element {
#     padding: 2px;
#     vertical-align: 1;
#     color: @kl;
#     font: inherit;
# }
# 
# element-text {
#     background-color: inherit;
#     text-color: inherit;
#     vertical-align: 0.5;
# }
# 
# element selected.normal {
#     color: @black;
#     background-color: @hv;
# }
# 
# element normal active {
#     background-color: @hv;
#     color: @black;
# }
# 
# element-icon {
#     background-color: inherit;
#     text-color: inherit;
#     size: 2.5em;
# }
# 
# element normal urgent {
#     background-color: @primary;
# }
# 
# element selected active {
#     background: @hv;
#     foreground: @bg;
# }
# 
# button {
#     padding: 6px;
#     color: @primary;
#     horizonatal-align: 0.5;
# 
#     border: 2px 0px 2px 2px;
#     border-radius: 4px 0px 0px 4px;
#     border-color: @primary;
# }
# 
# button selected normal {
#     border: 2px 0px 2px 2px;
#     border-color: @primary;
# }








}
