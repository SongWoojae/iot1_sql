package com.iot1.sql;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CalTest {

   Cal c;

   @Before
   public void setUpBefore() throws Exception {
      System.out.println(c);
      c = new Cal();
      System.out.println(c);
   }

   @Test
   public void testPlus() {
      int result = c.plus(20, 10);
      assertEquals(30, result);
   }

   @Test
   public void testMinus() {
      int result = c.minus(20, 10);
      assertEquals("20-10=10", 10, result);
   }

   @Test
   public void testDivide() {
      int result = c.divide(20, 10);
      assertEquals("20/10=2", 2, result);
   }

   @Test
   public void testMultiple() {
      int result = c.multiple(20, 10);
      assertEquals("20*10=200", 200, result);
   }
   @After
   public void setUpAfter() throws Exception {
      System.out.println(c);
      c = null;
   }
}