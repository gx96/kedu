package com.gaoxuan.kedu.test;

public class add {
    public static void main(String[] args) {
        sss();
    }

    public static void sss() {
        System.out.println(11);
    }

    public static int[] twoSum(int[] nums, int target) {
        int[] result = new int[2];
        label:
        for (int i = 0; i < nums.length - 1; i++) {
            for (int j = i + 1; j < nums.length - 1; j++) {
                if (nums[i] + nums[j] == target) {
                    result[0] = i;
                    result[1] = j;
                    break label;
                }
            }
        }
        return result;
    }
}