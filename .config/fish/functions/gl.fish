# Defined in - @ line 0
function gl --description 'alias gl git log --graph --abbrev-commit --pretty=oneline --decorate --date-order --all'
	git log --graph --abbrev-commit --pretty=oneline --decorate --date-order --all $argv;
end
