@ZB_006 @find_transactions
Feature: Find Transactions in Account Activity

  Background:
    Given the user is logged in
    And the user accesses the "Account Activity"
    Then the user accesses the Find Transactions tab

  Scenario: Search date range
    When the user enters date range from "2012-09-01" to "2012-09-06"
    And clicks search
    Then results table should only show transactions dates between "2012-09-01" to "2012-09-06" and should be sorted by most recent date
    Then the user accesses the Find Transactions tab
    When the user enters date range from "2012-09-02" to "2012-09-06"
    And clicks search
    Then results table should only show transactions dates between "2012-09-02" to "2012-09-06" and should be sorted by most recent date
    And the results table should only not contain transactions dated "2012-09-01"


#    @dbKullan
  Scenario: Search description
    When the user enters description "ONLINE"
    And clicks search
    Then results table should only show descriptions containing "ONLINE"
    When the user enters description "OFFICE"
    And clicks search
    Then results table should only show descriptions containing "OFFICE"
    But results table should not show descriptions containing "ONLINE"



  Scenario: Search description case insensitive
    When the user enters description "ONLINE"
    And clicks search
    Then results table should only show descriptions containing "ONLINE"
    When the user enters description "online"
    And clicks search
    Then results table should only show descriptions containing "ONLINE"


  Scenario: Type
    And clicks search
      Then results table should show "at least one" result under "Deposit"
    Then results table should show "at least one" result under "Withdrawal"
    When user selects type "Deposit"
    Then results table should show "at least one" result under "Deposit"
    But results table should show "no" result under "Withdrawal"
    When user selects type "Withdrawal"
    Then results table should show "at least one" result under "Withdrawal"
    But results table should show "no" result under "Deposit"