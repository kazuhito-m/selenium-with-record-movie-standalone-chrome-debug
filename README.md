# Selenium with record movie(based by "standalone-chrome-debug").

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
    kazuhitoselenium-with-record-movie-standalone-chrome-debug

docker exec selenium-rec start-recording

# execute E2E testing...

docker exec selenium-rec end-recording

# check the output moview file.
ls *.ogv
test-evidence.ogv
```

## Author

- [kazuhito_m](https://twitter.com/kazuhito_m)
