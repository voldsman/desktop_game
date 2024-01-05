# online run
# https://schellingb.github.io/LoveWebBuilder/


# to run from project root
# chmod +x ./scripts/build.sh
# ./scripts/build.sh

# build love file
GAME_NAME="desktop_game"
zip -9 -r "$GAME_NAME.love" . -x "./scripts/*" -x ".DS_Store"
mv "$GAME_NAME.love" ./scripts/dist/
