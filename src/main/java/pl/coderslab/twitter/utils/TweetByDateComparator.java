package pl.coderslab.twitter.utils;

import pl.coderslab.twitter.entity.Tweet;

import java.util.Comparator;

public class TweetByDateComparator implements Comparator<Tweet> {

    @Override
    public int compare(Tweet o1, Tweet o2) {
        long o1Millis = o1.getCreated().getTime();     // long -> milliseconds from EPOC TIME (1970.1.1 0:00)
        long o2Millis = o2.getCreated().getTime();
        return (int)(o2Millis - o1Millis);
    }
}
