package com.google.mock;

/**
 * Created with IntelliJ IDEA.
 * User: gpeev
 * Date: 8/7/12
 * Time: 7:42 PM
 * To change this template use File | Settings | File Templates.
 */
public class MemcacheServiceFactory
{     public static MemcacheService getMemcacheService(String cachename){return new MemcacheService();}
}
