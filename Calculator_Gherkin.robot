*** Settings ***
Documentation     Example test case using the gherkin syntax.
...
...               This test has a workflow similar to the keyword-driven
...               examples. The difference is that the keywords use higher
...               abstraction level and their arguments are embedded into
...               the keyword names.
...
...               This kind of _gherkin_ syntax has been made popular by
...               [http://cukes.info|Cucumber]. It works well especially when
...               tests act as examples that need to be easily understood also
...               by the business people
Library           CalculatorLibrary

*** Test Cases ***
Addition
    Given calculator has been cleared
    When user types "1 + 1"
    and user pushes equals
    Then result is ""
    
Multiplication
    Given Calculator has been cleared
    When user types "5*3"
    and User pushes equals
    Then result is "15"

Division

   Given Calculator has been cleared
   When user types "5/2"
   and User pushes equals
   Then result is "2"

Subtraction

   Given Calculator has been cleared
   When user types "4-5"
   and User pushes equals
   Then result is "-1"

Invalid Key

   Given Calculator has been cleared
   When user types "k+j"
   and User pushes equals

Addition

   Given Calculator has been cleared
   When user types "4+ -5"
   and user pushes equals
   Then result is "1"

Subraction

   Given Calculator has been cleared
   When user types "-3 - 5"
   and User pushes equals
   Then result is "-8"

Division

    Given Calculator has been cleared
    When user types "5/0"
    and User pushes equals
    Then result is "0"

Multiple

    Given Calculator has been cleared
    When user types "5+12/4"
    and User pushes equals
    Then result is "15"

Long integers

    Given Calculator has been cleared
    When user types "15356565595665565*4555541545155"
    and User pushes equals
    Then result is "69957472561952420950726087575"

Non integers

    Given Calculator has been cleared
    When user types "5.3*2.3"
    and User pushes equals
    Then result should be  "12.19"

Multiplication error

    Given Calculator has been cleared
    When user types " 5600 * 0623"
    and User pushes equals
    Then result is "0"

Division error

    Given Calculator has been cleared
    When user types "50 / 02"
    and User pushes equals
    Then result is "25"



*** Keywords ***
Calculator has been cleared
    Push button    C

User types "${expression}"
    Push buttons    ${expression}

User pushes equals
    Push button    =

Result is "${result}"
    Result should be    ${result}
