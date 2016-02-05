#!/bin/bash
watch -n5 '\
for i in 2415975 2416108 2416115 2416129; do \
curl --compressed -is "http://sportsapi.sport1.de/liveticker/co19/ma${i}" | json > "liveticker_ma${i}.json" \
&& curl --compressed -is "http://sportsapi.sport1.de/match/ma${i}" | json > "match_ma${i}.json" \
&& curl --compressed -is "http://sportsapi.sport1.de/match-event/ma${i}" | json > "match-event_ma${i}.json"; \
done; \
curl --compressed -is "http://sportsapi.sport1.de/matches-by-date/da2016-02-05" | json > "matches-by-date2016-02-05.json"; \
curl --compressed -s http://mobile.ipnm.sport1.de/v8/media/live.xml | xmllint --format - > live.xml; \
git add . && git commit -m "update"'


# http://mobile.ipnm.sport1.de/v8/media/live.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440534.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440530.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/conference.xml

# http://www.sport1.de/live-ticker/19/2322696
# http://www.sport1.de/live-ticker/19/2322700
