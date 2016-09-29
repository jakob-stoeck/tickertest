#!/bin/bash
watch -n5 '\
for i in 8315073; do \
curl --compressed -s "http://sportsapi.sport1.de/liveticker/co132/ma${i}" | jq '.' > "liveticker_ma${i}.json"; \
curl --compressed -s "http://sportsapi.sport1.de/match/ma${i}" | jq '.' > "match_ma${i}.json"; \
curl --compressed -s "http://sportsapi.sport1.de/match-event/ma${i}" | jq '.' > "match-event_ma${i}.json"; \
curl --compressed -s "https://api.sport1.de/api/sports/liveticker/co132/ma${i}" | jq '.' > "liveticker_ma${i}_sport1_cdn.json"; \
curl --compressed -s "https://api.sport1.de/api/sports/match/ma${i}" | jq '.' > "match_ma${i}_sport1_cdn.json"; \
curl --compressed -s "https://api.sport1.de/api/sports/match-event/ma${i}" | jq '.' > "match-event_ma${i}_sport1_cdn.json"; \
done; \
curl --compressed -s "http://sportsapi.sport1.de/matches-by-date/da2016-09-29" | jq -S '.' > "matches-by-date2016-09-29.json"; \
curl --compressed -s "https://api.sport1.de/api/sports/complete-gameplan/co132/sp1" | jq -S '.' > "complete-gameplan-19_sport1_cdn.json"; \
curl --compressed -s "https://api.sport1.de/api/sports/matches-by-date/da2016-09-29" | jq -S '.' > "matches-by-date2016-09-29_sport1_cdn.json"; \
curl --compressed -s "http://www.kicker.de/news/fussball/uefa/spielrunde/europa-league/2016-17/2/3687230/livematch_fc-schalke-04-2_rb-salzburg-964.html" | lynx -dump -stdin -nolist > "kicker-8315073.txt"; \
curl --compressed -s http://sport.bild.de/fussball/europa-league/ma8315073/direkter-vergleich/ | lynx -dump -stdin -nolist > "bild-8315073.txt"; \
git add . && git commit -m "update"'


# http://mobile.ipnm.sport1.de/v8/media/live.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440534.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440530.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/conference.xml

# http://www.sport1.de/live-ticker/19/2322696
# http://www.sport1.de/live-ticker/19/2322700
