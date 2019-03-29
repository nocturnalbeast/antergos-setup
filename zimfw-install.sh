#!/bin/zsh

git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim
for template_file in ${ZDOTDIR:-${HOME}}/.zim/templates/*; do
  user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
  cat ${template_file} ${user_file}(.N) > ${user_file}.tmp && mv ${user_file}{.tmp,}
done

zsh -c source ${ZDOTDIR:-${HOME}}/.zlogin

git clone https://github.com/denysdovhan/spaceship-prompt ${ZIM_HOME}/modules/prompt/external-themes/spaceship-prompt
ln -s ${ZIM_HOME}/modules/prompt/external-themes/spaceship-prompt/spaceship.zsh-theme ${ZIM_HOME}/modules/prompt/functions/prompt_spaceshipprompt_setup

sed 's/zprompt_theme=.*/zprompt_theme='spaceshipprompt'/' ${ZDOTDIR:-${HOME}}/.zimrc