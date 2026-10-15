screenshot_fullscreen() {
  noctalia msg screenshot-fullscreen
}

screenshot-region() {
  noctalia msg screenshot-region
}

choice=$(echo -e "Screenshot Fullscreen\nScreenshot Region" | noctalia dmenu)
echo $choice

case "$choice" in
"Screenshot Fullscreen")
  screenshot-fullscreen
  ;;
"Screenshot Region")
  screenshot-region
  ;;
*)
  echo default
  ;;
esac
