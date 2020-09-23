package com.ssm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    //日期转换字符串
    public static String date2String(Date date, String patt){

        SimpleDateFormat simpleDateFormat=new SimpleDateFormat();
        String format = simpleDateFormat.format(date);
        return format;
    }

    //字符串转换成日期
    public static Date string2Date( String str,String patt) throws ParseException {
      SimpleDateFormat simpleDateFormat=new SimpleDateFormat(patt);
        Date parse = simpleDateFormat.parse(str);

        return parse;
    }

}
