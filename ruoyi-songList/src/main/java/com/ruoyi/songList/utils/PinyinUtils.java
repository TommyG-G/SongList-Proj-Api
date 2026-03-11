package com.ruoyi.songList.utils;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

/**
 * 中文转拼音工具类（适配歌曲名首字母提取）
 */
public class PinyinUtils {

    // 拼音格式化配置（大写、无声调）
    private static final HanyuPinyinOutputFormat PINYIN_FORMAT;

    static {
        PINYIN_FORMAT = new HanyuPinyinOutputFormat();
        PINYIN_FORMAT.setCaseType(HanyuPinyinCaseType.UPPERCASE); // 大写
        PINYIN_FORMAT.setToneType(HanyuPinyinToneType.WITHOUT_TONE); // 无声调
    }

    /**
     * 提取字符串的首字母（适配歌曲名场景）
     * @param content 待转换的字符串（如：张三的歌、Apple 之歌、123童年）
     * @return 首字母（A-Z/#）：字母返回大写，数字/中文/特殊字符返回#
     */
    public static String getFirstLetter(String content) {
        if (content == null || content.trim().isEmpty()) {
            return "#";
        }
        // 取第一个字符
        char firstChar = content.trim().charAt(0);

        // 1. 字母：直接转大写返回
        if ((firstChar >= 'A' && firstChar <= 'Z') || (firstChar >= 'a' && firstChar <= 'z')) {
            return String.valueOf(firstChar).toUpperCase();
        }

        // 2. 数字：返回#
        if (firstChar >= '0' && firstChar <= '9') {
            return "#";
        }

        // 3. 中文：提取拼音首字母
        try {
            String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(firstChar, PINYIN_FORMAT);
            if (pinyinArray != null && pinyinArray.length > 0) {
                return String.valueOf(pinyinArray[0].charAt(0)); // 取拼音首字母
            }
        } catch (BadHanyuPinyinOutputFormatCombination e) {
            // 转换失败（生僻字等），返回#
            return "#";
        }

        // 4. 特殊字符（标点、空格等）：返回#
        return "#";
    }

    /**
     * 转全拼（可选，备用）
     * @param content 中文内容
     * @return 全拼字符串
     */
    public static String toFullPinyin(String content) {
        if (content == null || content.trim().isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        char[] chars = content.trim().toCharArray();
        for (char c : chars) {
            try {
                String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(c, PINYIN_FORMAT);
                if (pinyinArray != null && pinyinArray.length > 0) {
                    sb.append(pinyinArray[0]);
                } else {
                    sb.append(c); // 非中文直接拼接
                }
            } catch (BadHanyuPinyinOutputFormatCombination e) {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    // 测试示例
    public static void main(String[] args) {
        System.out.println(getFirstLetter("张三的歌")); // 输出 Z
        System.out.println(getFirstLetter("Apple 之歌")); // 输出 A
        System.out.println(getFirstLetter("123童年")); // 输出 #
        System.out.println(getFirstLetter("@测试歌曲")); // 输出 #
        System.out.println(getFirstLetter("古风·明月")); // 输出 G
    }
}