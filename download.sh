#!/bin/bash
watch -n5 '\
for i in 8305396; do \
curl --compressed -s "http://sportsapi.sport1.de/liveticker/co19/ma${i}" | jq '.' > "liveticker_ma${i}.json" \
&& curl --compressed -s "http://sportsapi.sport1.de/match/ma${i}" | jq '.' > "match_ma${i}.json" \
&& curl --compressed -s "http://sportsapi.sport1.de/match-event/ma${i}" | jq '.' > "match-event_ma${i}.json" \
&& curl --compressed -s "https://api.sport1.de/api/sports/liveticker/co19/ma${i}" | jq '.' > "liveticker_ma${i}_sport1_cdn.json" \
&& curl --compressed -s "https://api.sport1.de/api/sports/match/ma${i}" | jq '.' > "match_ma${i}_sport1_cdn.json" \
&& curl --compressed -s "https://api.sport1.de/api/sports/match-event/ma${i}" | jq '.' > "match-event_ma${i}_sport1_cdn.json" \
&& curl --compressed -s "https://feedmonster.onefootball.com/ticker/il/index.php?lang=en&do=match&competitionId=5&seasonId=1699&matchdayId=0&matchId=504221&format=json&gzip=0" | jq '.' > "onefootball-${i}.json"; \
done; \
curl --compressed -s "http://sportsapi.sport1.de/matches-by-date/da2016-09-28" | jq '.' > "matches-by-date2016-09-28.json"; \
curl --compressed -s "https://api.sport1.de/api/sports/matches-by-date/da2016-09-28" | jq '.' > "matches-by-date2016-09-28.json"; \
curl --compressed -s "http://www.kicker.de/news/fussball/chleague/spielrunde/champions-league/2016-17/2/3685876/livematch_madrid-atletico_bayern-muenchen-14.html" > "kicker-8305396.html"; \
curl --compressed -s http://sport.bild.de/fussball/champions-league/konferenz-ticker | lynx -dump -stdin -nolist > "bild-8305396.txt"; \
git add . && git commit -m "update"'


# http://mobile.ipnm.sport1.de/v8/media/live.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440534.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440530.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/conference.xml

# http://www.sport1.de/live-ticker/19/2322696
# http://www.sport1.de/live-ticker/19/2322700
