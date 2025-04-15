package com.utility;

import com.entity.Contact;
import java.util.List;
import java.util.ArrayList;

public class SortingContact {

    public static void sortByNameAscending(List<Contact> contactList) {
        if (contactList == null || contactList.size() <= 1) return;

        List<Contact> sortedList = mergeSort(contactList);
        contactList.clear();
        contactList.addAll(sortedList);
    }

    private static List<Contact> mergeSort(List<Contact> list) {
        if (list.size() <= 1) return list;

        int mid = list.size() / 2;
        List<Contact> left = mergeSort(new ArrayList<>(list.subList(0, mid)));
        List<Contact> right = mergeSort(new ArrayList<>(list.subList(mid, list.size())));

        return merge(left, right);
    }

    private static List<Contact> merge(List<Contact> left, List<Contact> right) {
        List<Contact> result = new ArrayList<>();
        int i = 0, j = 0;

        while (i < left.size() && j < right.size()) {
            if (left.get(i).getName().compareToIgnoreCase(right.get(j).getName()) <= 0) {
                result.add(left.get(i));
                i++;
            } else {
                result.add(right.get(j));
                j++;
            }
        }

        while (i < left.size()) {
            result.add(left.get(i));
            i++;
        }

        while (j < right.size()) {
            result.add(right.get(j));
            j++;
        }

        return result;
    }
}
