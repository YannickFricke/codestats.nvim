local M = {}

local function has_value (tab, val)
  for index, value in ipairs(tab) do
      if value == val then
          return true
      end
  end

  return false
end

local ignored_filetypes = {
  "startify",
  "TelescopePrompt",
  "NvimTree"
}

function M.is_filetype_ignored(filetype)
  return has_value(ignored_filetypes, filetype)
end

local mapped_filetypes = {
  [""] = "Plain text",
  ["ada"] = "Ada",
  ["ansible"] = "Ansible",
  ["ansible_hosts"] = "Ansible",
  ["ansible_template"] = "Ansible",
  ["c"] = "C/C++",
  ["cs"] = "C#",
  ["clojure"] = "Clojure",
  ["cmake"] = "CMake",
  ["coffee"] = "CoffeeScript",
  ["cpp"] = "C/C++",
  ["css"] = "CSS",
  ["dart"] = "Dart",
  ["diff"] = "Diff",
  ["eelixir"] = "HTML (EEx)",
  ["elixir"] = "Elixir",
  ["elm"] = "Elm",
  ["erlang"] = "Erlang",
  ["fish"] = "Shell Script (fish)",
  ["fsharp"] = "F#",
  ["gitcommit"] = "Git Commit Message",
  ["gitconfig"] = "Git Config",
  ["gitrebase"] = "Git Rebase Message",
  ["glsl"] = "GLSL",
  ["go"] = "Go",
  ["haskell"] = "Haskell",
  ["html"] = "HTML",
  ["htmldjango"] = "HTML (Django)",
  ["java"] = "Java",
  ["javascript"] = "JavaScript",
  ["json"] = "JSON",
  ["jsp"] = "JSP",
  ["jsx"] = "JavaScript (JSX)",
  ["kotlin"] = "Kotlin",
  ["lua"] = "Lua",
  ["markdown"] = "Markdown",
  ["objc"] = "Objective-C",
  ["objcpp"] = "Objective-C++",
  ["ocaml"] = "OCaml",
  ["pascal"] = "Pascal",
  ["perl"] = "Perl",
  ["perl6"] = "Perl 6",
  ["pgsql"] = "SQL (PostgreSQL)",
  ["php"] = "PHP",
  ["plsql"] = "PL/SQL",
  ["puppet"] = "Puppet",
  ["purescript"] = "PureScript",
  ["python"] = "Python",
  ["ruby"] = "Ruby",
  ["rust"] = "Rust",
  ["scala"] = "Scala",
  ["scheme"] = "Scheme",
  ["scss"] = "SCSS",
  ["sh"] = "Shell Script",
  ["sql"] = "SQL",
  ["sqloracle"] = "SQL (Oracle)",
  ["tcl"] = "Tcl",
  ["tcsh"] = "Shell Script (tcsh)",
  ["tex"] = "TeX",
  ["toml"] = "TOML",
  ["typescript"] = "TypeScript",
  ["vb"] = "Visual Basic",
  ["vbnet"] = "Visual Basic .NET",
  ["vim"] = "VimL",
  ["yaml"] = "YAML",
  ["zsh"] = "Shell Script (Zsh)",
}

function M.get_language(filetype)
  return mapped_filetypes[filetype] or filetype
end

return M
