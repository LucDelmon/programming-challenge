Hello, welcome to the software engineering Loco2 programming challenge!

This task involves using test-driven development to write some Ruby code of
your own.

There's no time limit for completing this task. We would expect it to
take a few hours, but we understand that everyone works at their own pace,
so there's no strict deadline. We don't want to be unreasonable and want
to be respectful of your time - so you are not expected to stay up all
night coding away! As with a real project, you may want to take breaks and
your git commits will reflect this. Don't worry, you won't be marked
down for taking breaks.

As you work on your solution, you should make commits to the repository
along the way, just as you would on a real project. This is so we can
see the progression and identify how you came to the solutions you did.

This folder already contains an empty git repository. It has been
initialised to conceal your name and email when you make commits -
please don't change this. Your submission will be assessed
independently of the covering letter / CV you have already sent.

Have fun, and feel free to ask questions if anything is unclear.

## Description ##

In the `search.xml` file is some XML output from a hypothetical rail
search API. The scenario is that we have performed a search from London
to Barcelona, and this is the output which we need to parse and display.

Unfortunately the real rail APIs are nowhere near this simple, but this
example provides more than enough complexity for the challenge!

Some definitions:

* There are 3 *search results*, representing different options for
  making the journey

* A search result has one or more *connections*, representing the
  individual train rides which make up the whole journey

* A *fare* represents the cost of travelling on this train in a given
  class of service (standard class, first class, etc). The currency is
  indicated in the XML, but it's always GBP (British Pounds) in our example.
  Please note that the decimal point (`.`) separates pence/cents from pounds,
  so `25.50` means 25 pounds and 50 pence.

## Your task ##

Your task is to write a program which will parse the XML file and output
information gleaned from the data.

The output should contain the following information for each search
result:

* ID of search result
* Description of each connection, including start/finish and departure/arrival times and train names. (Times in the XML response are in the timezone local to the station and should remain that way in the output)
* Duration of each connection (represented as hours and minutes)
* How many train changes need to be made
* How much time the passenger has for each train change (represented as hours and minutes)
* Duration of the whole journey (represented as hours and minutes)
* Fare names / prices for each connection
* The cheapest search result
* The quickest search result

## What we're looking for ##

Below is a scoring rubric that outlines the five areas for which
you will be marked. If you run out of time that's fine, but we urge you to
concentrate your time on these areas and don't get caught up handling
edge-cases and performance optimisations.

You can assume that program will only ever need to handle the XML input
provided and you don't need to implement error handling.

The formatting of the output of the program is also unimportant, so don't
spend much time on this. There's no need to make it into a web app or
anything - a console program with text output is fine.

However, whilst we don't expect you to implement this, you might want to
consider how open the program is to handling additional types of output
with different formatting.

You are expected to write tests to guide your development, and make
regular commits to the repository so that we can see the progression of
how it developed. We don't expect the tests to provide 100% code coverage.

You may use whichever gems, testing framework or tools you are comfortable with.

Here are some things to think about:

* Appropriate modelling of the domain using objects
* Separation of concerns: parsing, domain modelling and output formatting
* Avoid over-engineering

## Scoring Rubric ##

|                       | D                                                 | C                                                                     | B                                                                                                                                            | A                                                                                                                             |
|------------------------|---------------------------------------------------|-----------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| Ease of use            | No useage instructions or instructions don't work | Usage instructions are partially complete.                            | Useage instructions are complete.                                                                                                            | Dependency management is automated – installing and running the program is very simple.                                      |
| Tests                  | No tests or tests don't work                      | Tests run but some fail or some major parts of the logic are untested | Tests all pass but they're overly complicated and/or testing the wrong thing.                                                                | All key logic is adequately tested. No redundant tests. Not necessarily 100% coverage.                                       |
| Accuracy of output     | There is no output                                | Output is incorrect or large parts are missing                        | Output is all correct but some parts are missing or minor mistakes                                                                           | Output is all present and correct                                                                                            |
| Object oriented design | Extremely poor or no separation of concerns       | Concerns are separated at least to some extent                        | Good separation of concerns but there is some overlap. Some classes may have too much responsibility.                                        | Clean separation of concerns with no overlap. The code would be relatively easy to extend or modify if requirements changed. |
| Coding style           | Code is difficult to read or follow               | Style is inconsistent or not idiomatic Ruby                           | Style is idiomatic but some refactoring would make it easier to follow. May have overly complicated methods, unclear or ambiguous naming conventions. | Code is easy to follow and not overly complicated. Naming conventions are very clear.                                     |
