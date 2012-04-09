#coding:utf-8

Feature: Base flow check

  Scenario Outline:  Base folw check
    Given Navigate to home page
    When Add new task with <person>,<threads>,<depth_limit>,<subdomains>,<urls>
    Then Create task


  Examples:
    |person|threads|depth_limit|subdomains|urls|
    |Henry |2      |0          |true      |http://www.sogou.com|