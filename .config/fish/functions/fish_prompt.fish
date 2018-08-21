function fish_prompt --description 'Write out the prompt'
    # Fish git prompt
    set __fish_git_prompt_showdirtystate 'yes'
    set __fish_git_prompt_showstashstate 'yes'
    set __fish_git_prompt_showuntrackedfiles 'yes'
    set __fish_git_prompt_showupstream 'yes'
    set __fish_git_prompt_color_branch (set_color yellow)
    set __fish_git_prompt_color_upstream_ahead (set_color green)
    set __fish_git_prompt_color_upstream_behind (set_color red)

    # Status Chars
#    set __fish_git_prompt_char_dirtystate '⚡'
#    set __fish_git_prompt_char_stagedstate '→'
#    set __fish_git_prompt_char_untrackedfiles '☡'
#    set __fish_git_prompt_char_stashstate '↩'
#    set __fish_git_prompt_char_upstream_ahead '+'
#    set __fish_git_prompt_char_upstream_behind '-'

    echo -n -s \
        [ \
        (set_color yellow) $USER \
        (set_color normal) @ \
        (set_color yellow) (hostname) \
        (set_color normal) " " (pwd) \
        (set_color blue) (__fish_git_prompt) \
        (set_color normal) "]\$ "
end
