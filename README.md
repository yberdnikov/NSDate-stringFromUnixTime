NSDate-stringFromUnixTime
=========================

This is a NSDate category that makes it easy to support automatically updating fuzzy timestamps (e.g. "4 minutes ago" or "about 1 day ago") from UNIX timestamp.
The main goal is that this implementaion use correct localisation, for example while on English there is no difference between - 2 minutes ago, 5 minutes ago, 21 minutes ago, on Ukrainian spelling would be different depending of number value - 1 хвилину тому, 2 хвилини тому, 25 хвилин тому.

The implementation is similar to jQuery plugin timeago.
