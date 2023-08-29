#!/bin/bash


#
# Start Point
#
echo "Program Start!!!"

#
# Target URL
#
URL="https://cs.skku.edu/rest/board/list/recent"


#
# Notification Function
#
function notify() {
  echo $2 | terminal-notifier -title "$1개의 공지사항" -open "https://cs.skku.edu/news/recent/list" -sound default 
}

#
# 
#
if [ -f checkpoint ]; then
  RECENT_ID=$(cat checkpoint)
else
  RECENT_ID=0
fi

curl -s $URL | tee notices.json | jq ".aaData | map(select(.id > $RECENT_ID))" > news.json
news_count=$(jq 'length' news.json)

if [[ $news_count > 0 ]]; then
  RECENT_ID=$(jq 'max_by(.id) | .id' news.json)
  preview=$(jq 'max_by(.id) | .title' news.json)
  echo $RECENT_ID > checkpoint

  echo [$(date +"%m-%dT%H:%M:%S")] New notices : $news_count
  notify $news_count "$preview"
fi