#!/bin/bash
watch -n5 '\
for i in 2226958 2226986 2226988 2226996 2227000 2226966; do \
curl -s "http://sportsapi.sport1.de/liveticker/co19/ma${i}" | jq '.' > "liveticker_ma${i}.json" \
&& curl -s "http://sportsapi.sport1.de/match/ma${i}" | jq '.' > "match_ma${i}.json" \
&& curl -s "http://sportsapi.sport1.de/match-event/ma${i}" | jq '.' > "match-event_ma${i}.json" \
&& curl -s "http://sport1-xml-old.c.ergebnis-dienst.de/match/ma${i}/" > "match_old_ma${i}.xml"; \
done; \
curl -sO http://lb.iph.sp1-tek.de/v8/media/live.xml; \
curl -sO http://mobile.ipnm.sport1.de/v8/media/live.xml; \
for j in 407556 407584 407586 407594 407598 407564; do \
curl -sO "http://mobile.ipnm.sport1.de/v8/soccer/leagues/1/game/${j}.xml" \
&& curl -s http://mobile.ipnm.sport1.de/v8/soccer/leagues/1/conference.xml > conference1.xml; \
done; \
curl -sO http://www.kicker.de/news/fussball/bundesliga/spieltag/1-bundesliga/2014-15/26/2407453/livematch_fc-schalke-04-2_bayer-leverkusen-9.html > k_2226966.html;
git add . && git commit -m "update"'


# http://mobile.ipnm.sport1.de/v8/media/live.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440534.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/game/440530.xml
# http://mobile.ipnm.sport1.de/v8/soccer/leagues/4/conference.xml

# http://www.sport1.de/live-ticker/19/2322696
# http://www.sport1.de/live-ticker/19/2322700
