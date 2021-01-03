set darwin_firefox /Applications/Firefox.app/Contents/MacOS/firefox
set darwin_chrome /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

if [ -e $darwin_firefox ]
    set -gx BROWSER $darwin_firefox
else if [ -e $darwin_chrome ]
    set -gx BROWSER $darwin_chrome
end
