# language: en
@HealthcareWebsite @RegressionSuite
Feature: Healthcare Research Initiatives and Services Website

  As a user, I want to navigate the website, learn about research initiatives,
  explore services, and find contact information, so that I can understand
  the company's offerings and impact.

  @Navigation @SmokeTest
  Scenario: User accesses the main sections of the site via the header
    Given the user is on any page of the website
    When the user looks at the header
    Then the user sees navigation links for 'Home', 'About', 'Services', and 'Contact' to navigate the site

  @Homepage @Content
  Scenario: User wants to learn about the company's research focus
    Given the user is on the main page
    When the user scrolls to the 'Our Research Initiatives' section
    Then the user can read about the company's goals and key innovation areas like AI, Remote Monitoring, and Personalized Medicine

  @Services @Content
  Scenario: User explores different medical services
    Given the user is viewing the services section
    When the user clicks on a service tab, such as 'Primary Care'
    Then the content below the tabs updates to show detailed information about that specific service

  @PageStructure @Content
  Scenario: User identifies a new section of the page
    Given the user is scrolling down the page
    When the user encounters the text 'Our Stories of Innovation & Impact'
    Then the user understands they are entering a new section detailing case studies or examples

  @InnovationStories @Content
  Scenario Outline: User learns about specific innovation stories
    Given the user is on the 'Stories of Innovation & Impact' section
    When the user views the "<story_block>" block
    Then the user sees a description of its research areas and a relevant "<image_description>"

    Examples:
      | story_block                               | image_description         |
      | Chronic Disease Management & Prevention   | illustrative image        |
      | Genomic Medicine & Personalized Treatment | image of a lab            |
      | Infection Control & Vaccine Impact Studies| image of a vaccine        |

  @Footer @SmokeTest
  Scenario: User needs to find contact information or legal policies in the footer
    Given the user is at the bottom of any page
    When the user views the footer
    Then the user can find the main office address, contact details, and links to privacy and terms of use