{ pkgs, ... }:

{

  programs.vscode = {
    # Enable vscode
    enable = true;

    # Add vscode extensions
    extensions = with pkgs.vscode-extensions; [

    ];

    # Vscode user settings
    userSettings = {
      "workbench.colorTheme" = "Min Dark";
      "symbols.hidesExplorerArrows" = false;
      "workbench.iconTheme" = "symbols";
      "editor.fontSize" = 14;
      "editor.lineHeight" = 1.8;
      "editor.rulers" = [ 80 120 ];
      "editor.renderLineHighLight" = "gutter";
      "editor.fontLigatures" = true;
      "workbench.startupEditor" = "newUntitleFile";
      "workbench.editor.labelFormat" = "short";
      "explorer.compactFolders" = true;
      "editor.semanticHighlighting.enabled" = false;
      "breadcrumbs.enabled" = false;
      "workbench.activityBar.location" = "hidden";
      "editor.minimap.enabled" = false;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.horizontal" = "hidden";
      "workbench.statusBar.visible" = false;
      "apc.electron" = {
        "titleBarStyle" = "hiddenInset";
      };
    };

  };

}
