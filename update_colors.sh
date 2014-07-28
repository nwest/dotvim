#!/bin/bash

# update_colors.sh
# Fetches Vim colorschemes from the web, since they can't be found in Git
# submodule form on a consistent basis

hash curl 2>&- ||
  { echo >&2 "Error: curl must be installed"; exit 1; }

cd "${HOME}/.vim/colors"
rm -f *.vim

for url in \
  "http://www.vim.org/scripts/download_script.php?src_id=9750" \
  "http://blog.toddwerth.com/entry_files/8/ir_black.vim" \
  "http://www.vim.org/scripts/download_script.php?src_id=11225" \
  "https://raw.githubusercontent.com/altercation/solarized/master/vim-colors-solarized/colors/solarized.vim" \
  "https://raw.githubusercontent.com/vim-scripts/Zenburn/master/colors/zenburn.vim" \
  "https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-railscasts.vim"
do
  curl --location --remote-name --remote-header-name "${url}"
  echo
done
