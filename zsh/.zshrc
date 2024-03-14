while read file
do
	source "$ZDOTDIR/$file.zsh"
done <<-EOF
prompt
env
aliases
plugins
options
EOF
