#!/bin/bash
watch -n5 '\
for i in 2322696 2322700 2309743 2309737; do \
curl -s "http://sportsapi.sport1.de/liveticker/co19/ma${i}" | jq '.' > "liveticker_ma${i}.json" \
&& curl -s "http://sportsapi.sport1.de/match/ma${i}" | jq '.' > "match_ma${i}.json" \
&& curl -s "http://sportsapi.sport1.de/match-event/ma${i}" | jq '.' > "match-event_ma${i}.json" \
&& curl -s "http://sport1-xml-old.c.ergebnis-dienst.de/match/ma2309741" > "match_old_ma${i}.xml"; \
done; \
curl -sO http://lb.iph.sp1-tek.de/v8/media/live.xml; \
curl -sO http://mobile.ipnm.sport1.de/v8/media/live.xml; \
for j in 439815 439817 439811; do \
curl -sO "http://mobile.ipnm.sport1.de/v8/soccer/leagues/5/game/${j}.xml" \
&& curl -s http://mobile.ipnm.sport1.de/v8/soccer/leagues/5/conference.xml > conference5.xml; \
done; \
git add . && git commit -m "update"'


# http://mobile.ipnm.sport1.de/v8/media/live.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440534.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440530.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/conference.xml

# http://www.sport1.de/live-ticker/19/2322696
# http://www.sport1.de/live-ticker/19/2322700
