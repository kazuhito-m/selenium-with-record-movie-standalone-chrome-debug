Selenium with record movie(based by "standalone-chrome-debug")
===

## What's this

`Selenium Standalone` を元に、「デスクトップの動画録画ができる機能」を付加したコンテナイメージ。

base image: [selenium/standalone-chrome-debug](https://hub.docker.com/r/selenium/standalone-chrome-debug)

## Usage

基本的には [bese imageでの使い方](https://github.com/SeleniumHQ/docker-selenium/tree/master/StandaloneChromeDebug) と同様。

### Recoding movie

```bash
docker run -d -p 4444:4444 -p 5900:5900 \
    -v ${PWD}:/output \
    --name selenium-rec \
    kazuhito/selenium-with-record-movie-standalone-chrome-debug

docker exec selenium-rec start-recording

# execute E2E testing...
# ex: ./gradlew clean imtegrationTest

docker exec selenium-rec end-recording

# check the output moview file.
ls *.ogv
test-evidence.ogv
```

### Option

`docker run -e [環境変数]=[値]`  で設定出来る「このコンテナ独自の環境変数」。

- `RECORDING_WAIT_SECCOND` : 録画開始前に必ず入る「猶予秒」値。defaultは `5`

## Author

- [kazuhito_m](https://twitter.com/kazuhito_m)
