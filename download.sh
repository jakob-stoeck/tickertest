#!/bin/bash
watch -n5 '\
for i in 2415952 2415961 2415968 2415972 2415987 2415944; do \
curl --compressed -s "http://sportsapi.sport1.de/liveticker/co19/ma${i}" | jq '.' > "liveticker_ma${i}.json" \
&& curl --compressed -s "http://sportsapi.sport1.de/match/ma${i}" | jq '.' > "match_ma${i}.json" \
&& curl --compressed -s "http://sportsapi.sport1.de/match-event/ma${i}" | jq '.' > "match-event_ma${i}.json"; \
done; \
curl --compressed -s "http://sportsapi.sport1.de/matches-by-date/da2016-02-06" | jq '.' > "matches-by-date2016-02-05.json"; \
curl --compressed -s http://mobile.ipnm.sport1.de/v8/media/live.xml | xmllint --format - > live.xml; \
git add . && git commit -m "update"'


# http://mobile.ipnm.sport1.de/v8/media/live.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440534.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440530.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/conference.xml

# http://www.sport1.de/live-ticker/19/2322696
# http://www.sport1.de/live-ticker/19/2322700
