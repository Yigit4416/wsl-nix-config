{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [ pkgs.wl-clipboard ];

    settings = {
      theme = "github_dark";
      editor = {
        true-color = true;
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        bufferline = "multiple";
        default-yank-register = "+";
        lsp.display-messages = true;
        inline-diagnostics.cursor-line = "warning";
      };
    };

    languages = {
      language-server.rust-analyzer = {
        command = "rust-analyzer";
        config = {
          check.command = "clippy";
          cargo.allFeatures = true;
          inlayHints = {
            parameterHints.enable = true;
            typeHints.enable = true;
            chainingHints.enable = true;
          };
        };
      };

      language-server.clangd = {
        command = "clangd";
        args = [
          "--background-index"
          "--clang-tidy"
          "--header-insertion=never"
          "--completion-style=detailed"
          "--fallback-style={BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never}"
        ];
      };

      language-server.gopls = {
        command = "gopls";
        config = {
          staticcheck = true;
          hints = {
            parameterNames = true;
            assignVariableTypes = true;
            compositeLiteralFields = true;
          };
        };
      };

      language = [
        {
          name = "rust";
          auto-format = true;
          indent = { tab-width = 4; unit = "    "; };
          language-servers = [ "rust-analyzer" ];
        }
        {
          name = "cpp";
          auto-format = true;
          indent = { tab-width = 4; unit = "    "; };
        }
        {
          name = "c";
          auto-format = true;
          indent = { tab-width = 4; unit = "    "; };
        }
        {
          name = "go";
          auto-format = true;
          # gofmt uses real tabs, so keep the tab char and just control its display width
          indent = { tab-width = 4; unit = "\t"; };
          language-servers = [ "gopls" ];
          formatter.command = "goimports";
        }
        {
          name = "nix";
          indent = { tab-width = 2; unit = "  "; };
        }
      ];
    };
  };
}
