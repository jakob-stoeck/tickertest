#!/bin/bash
LEAGUE=4;
watch -n5 '\
for i in 2322696 2322700; do \
curl -s "http://sportsapi.sport1.de/liveticker/co19/ma${i}" | jq '.' > "liveticker_ma${i}.json" \
&& curl -s "http://sportsapi.sport1.de/match/ma${i}" | jq '.' > "match_ma${i}.json" \
&& curl -s "http://sportsapi.sport1.de/match-event/ma${i}" | jq '.' > "match-event_ma${i}.json"; \
done; \
curl -sO http://mobile.ipnm.sport1.de/v8/media/live.xml; \
for j in 440534 440530; do \
curl -sO "http://mobile.ipnm.sport1.de/v8/soccer/leagues/${LEAGUE}/game/${j}.xml" \
&& curl -s http://mobile.ipnm.sport1.de/v8/soccer/leagues/${LEAGUE}/conference.xml > conference${LEAGUE}.xml; \
done; \
git add . && git commit -m "update"'


# http://mobile.ipnm.sport1.de/v8/media/live.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440534.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440530.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/conference.xml

# http://www.sport1.de/live-ticker/19/2322696
# http://www.sport1.de/live-ticker/19/2322700
