# language: en
@about-us-feature
Feature: About Us Page Functionality

  As a potential patient or partner
  I want to learn about the company, its people, and its impact
  So that I can build trust and make an informed decision about their services.

# This Scenario Outline covers the general navigation mentioned in the first part of the story.
# It is data-driven to efficiently test all primary navigation links.
@navigation @smoke
Scenario Outline: User can navigate to key pages from the main navigation
  Given the user is on the homepage
  When the user clicks on the "<LinkName>" navigation link
  Then the user is successfully taken to the "<PageName>" page
  And the page heading should be "<PageHeading>"

  Examples:
    | LinkName  | PageName      | PageHeading                |
    | Home      | Home          | Welcome to Our Company     |
    | About     | About Us      | About Our Healthcare       |
    | Services  | Services      | Our Services               |
    | Contact   | Contact Us    | Contact Us & Locations     |


# The following scenarios all relate to the content of the "About Us" page.
# A Background is used to set the common precondition for these tests.
Background:
  Given the user has successfully navigated to the "About Us" page


@content @regression
Scenario: View company mission and values
  When the user views the top section of the page
  Then the user should see a compelling introductory graphic
  And the user should see text that explains the company's culture and journey


@content @regression
Scenario: View key personnel information
  When the user scrolls down to the "Key People" section
  Then the user should see a table of staff members
  And the table should include columns for "Name", "Role", and "Location"


@statistics @regression
Scenario: View company statistics
  When the user views the company statistics section
  Then the user should see a data card for "Year Started"
  And the user should see a data card for "Number of Patients Served"
  And the user should see a data card for "Number of Locations"
  And the user should see a data card for "Patient Satisfaction Score"


# This scenario covers the footer, which is a site-wide element
# and therefore does not use the Background.
@footer @smoke
Scenario: Verify footer content is available and correct
  Given the user is at the bottom of the page
  When the user views the footer section
  Then the user can see the main office address
  And the user can see the primary contact phone number
  And the user can see the main contact email address
  And the user can see the company's operating hours
  And the user can see links to legal policies like "Privacy Policy" and "Terms of Service"