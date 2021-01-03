if [ -e ~/bin ]
    set -gx PATH $PATH ~/bin
end

if [ -e ~/.local/bin ]
    set -gx PATH $PATH ~/.local/bin
end
