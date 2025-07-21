# language: en
@regression @contact @ui
Feature: Healthcare Provider - Support and Contact

  As a potential or existing patient
  I want to easily find support information and contact the healthcare provider
  So that I can get my questions answered and schedule appointments efficiently.

  Background:
    Given the user is on the "Support and Contact" page

  @smoke
  Scenario: Clicking the hero section button scrolls to the contact form
    Given the user is viewing the hero section
    When the user clicks the "Let's connect" button
    Then the page should scroll to the "Let's Connect!" contact form

  @smoke
  Scenario: Expanding an FAQ item to see the answer
    Given the answer for the question "Do you offer telemedicine or virtual visits?" is not visible
    When the user clicks on the question "Do you offer telemedicine or virtual visits?"
    Then the corresponding answer content is revealed below the question
    And the answer content is visible

  @smoke
  Scenario: Verifying the contact email in the website footer
    When the user scrolls to the footer section of the page
    Then the user can see the email address "contact@yourhealthcare.org" in the first column

  @regression
  Scenario Outline: User submits the contact form
    Given the user is at the "Let's Connect!" contact form
    And the user fills in "Full Name" with "<Full Name>"
    And the user fills in "Email Address" with "<Email>"
    And the user fills in "Message" with "<Message>"
    When the user clicks the "Submit" button
    Then the user should see the "<Expected Result>"

    Examples:
      | Full Name      | Email                     | Message                                               | Expected Result                                                              |
      | John Doe       | john.doe@example.com      | I would like to inquire about new patient appointments. | success message "Thank you for your message! We will get back to you shortly." |
      | Jane Smith     | jane.smith@example.com    |                                                       | error message "Message is a required field."                                 |
      |                | missing.name@example.com  | This is a test message.                               | error message "Full Name is a required field."                               |
      | Invalid Email  | invalid-email             | This is another test message.                         | error message "Please enter a valid email address."                          |

```

#### File 2: `website_navigation.feature`

This scenario is more about general site navigation than the specific "Support and Contact" functionality, so it's best placed in its own feature file.

```gherkin
# language: en
@smoke @regression @navigation
Feature: Website Header Navigation

  As a website user
  I want to use the main navigation links in the header
  So that I can easily move between key sections of the site.

  Scenario: User accesses the Services page from the header
    Given the user is on the "Home" page
    When the user clicks on the "Services" link in the header
    Then the user is successfully navigated to the "Services" page
    And the page title is "Our Services"