Why Your Cache May Degrade Less Gracefully Than You Think
=========================================================

- last time we looked ath access patterns, now lets look at effect of cache size

- monte carlo simulation, explain the first graph

- what do you think how this goes on however? how quickly does the hit rate drop
  and with what shape? second graph (ignore other lines for now)

- explanation: other hits move to the right, so in round robin it's 100% and
  then a sharp drop to 0!

- maths!

- monitoring hit rates is a laggging indicator, what we need is a leading one!

- let's check how old in terms of cache insertions an item is when it is being
  refreshed (on average).

- graphs, discussion of that metric. it's kinda hard to pick a threshold, it
  depends on the access pattern

- coming to perl6-cache-async soon, any ideas welcome
