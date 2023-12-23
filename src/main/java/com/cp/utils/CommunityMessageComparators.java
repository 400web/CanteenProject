package com.cp.utils;

import com.cp.domain.CommunityMessage;

import java.util.Comparator;

public class CommunityMessageComparators {
    public static Comparator<CommunityMessage> getTimestampComparator() {
        return Comparator.comparingLong(CommunityMessage::getPublishTimestamp);
    }

    public static Comparator<CommunityMessage> getHotComparator() {
        return Comparator.comparingDouble(CommunityMessage::getHot).reversed();
    }
}
