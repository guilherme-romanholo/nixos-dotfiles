{
  programs.nixvim = {

    plugins = {
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;

        experimental = {
          ghost_text = true;
        };

        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };

        snippet = {
          expand = "luasnip";
        };

        formatting = {
          fields = ["kind" "abbr" "menu"];
          expandableIndicator = true;
        };

        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
          };
          documentation = {
            border = "rounded";
          };
        };
        
        sources = [
          {name = "nvim_lsp";}
          {name = "buffer"; option.get_bufnrs.__raw = "vim.api.nvim_list_bufs"; keywordLength = 3;}
          {name = "path"; keywordLength = 3;}
          {name = "luasnip"; keywordLength = 3;}
        ];

        mapping = {
          "<Tab>" = {
            modes = ["i" "s"];
            action = ''
               function(fallback)
               	if cmp.visible() then
              		cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
              	luasnip.expand_or_jump()
              else
              fallback()
                   end
              end
            '';
          };
          "<S-Tab>" = {
            modes = ["i" "s"];
            action = ''
                   function(fallback)
              	if cmp.visible() then
              		cmp.select_prev_item()
              	elseif luasnip.jumpable(-1) then
              		luasnip.jump(-1)
              	else
              		fallback()
              	end
              end
            '';
          };
          "<C-j>" = {
            action = "cmp.mapping.select_next_item()";
          };
          "<C-k>" = {
            action = "cmp.mapping.select_prev_item()";
          };
          "<C-e>" = {
            action = "cmp.mapping.abort()";
          };
          "<C-b>" = {
            action = "cmp.mapping.scroll_docs(-4)";
          };
          "<C-f>" = {
            action = "cmp.mapping.scroll_docs(4)";
          };
          "<C-Space>" = {
            action = "cmp.mapping.complete()";
          };
          "<CR>" = {
            action = "cmp.mapping.confirm({ select = true })";
          };
          "<S-CR>" = {
            action = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
        };
      };

      cmp-nvim-lsp = {enable = true;}; # lsp
      cmp-buffer = {enable = true;};
      cmp-path = {enable = true;}; # file system paths
      cmp_luasnip = {enable = true;}; # snippets
      cmp-cmdline = {enable = false;}; # autocomplete for cmdline
    };

  };

}
