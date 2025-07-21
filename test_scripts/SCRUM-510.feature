# language: en
@regression @website-core @patient-experience

Feature: Compassionate, Patient-Centered Care Website
  As a potential or existing patient,
  I want to navigate the website and understand the organization's values, services, and mission,
  So that I can feel confident in choosing them for my healthcare needs.

  # The following scenarios apply to any page and test global elements.
  @navigation @header
  Scenario: User accesses the main sections of the site from the header
    Given the user is on any page of the website
    When the user views the header
    Then the user sees the following navigation links:
      | Link Text |
      | Home      |
      | About     |
      | Services  |
      | Contact   |

  @navigation @footer
  Scenario: User finds contact and legal information in the footer
    Given the user is on any page of the website
    When the user scrolls to the bottom of the page
    Then the user sees the footer section
    And the footer contains the main office address
    And the footer contains a mission statement
    And the footer contains a link to the "Privacy Policy"
    And the footer contains a link to the "Terms of Use"

  # The following scenarios are specific to the homepage content.
  Background: Homepage Context
    Given the user has loaded the homepage

  @hero @content
  Scenario: User views the main promotional message in the hero carousel
    When the user looks at the top of the page content
    Then the user sees a large rotating banner
    And the banner contains the headline "Compassionate, Patient-Centered Care"

  @value-proposition @content
  Scenario: User learns about the core benefits of the service
    When the user scrolls down to the two-column value proposition section
    Then the user sees an image of a doctor and patient
    And the user sees a list of key benefits including:
      | Benefit                    |
      | Patient-First Philosophy   |
      | Quick, Easy Access to Care |

  @services @content
  Scenario: User understands the key areas of service
    When the user scrolls to the three-column core services section
    Then the user sees the following service pillar cards:
      | Pillar Title              |
      | Innovation & Technology   |
      | Experienced Medical Team  |
      | Multiple Locations        |

  @media @interaction
  Scenario: User plays the featured video
    When the user clicks the play icon on the image of hands holding a heart
    Then a video player should open
    And the associated video should start playing

  @content
  Scenario: User reads the featured inspirational quote
    When the user scrolls to the quote section
    Then the user can read an inspirational message
    And the message has an attribution

  @key-highlights @content
  Scenario: User reviews the company's core values in the Key Highlights section
    When the user scrolls to the key highlights area
    Then the user sees the section heading "Key Highlights?"
    And the user sees four cards detailing the following values:
      | Value       |
      | Compassion  |
      | Partnership |
      | Innovation  |
      | Teamwork    |

  @company-story @content
  Scenario: User reads about the company's history and mission
    When the user scrolls to the company story section
    Then the user sees the heading "Your health. Your voice. Your life."
    And the user can read the detailed company story on the left
    And the user sees a relevant graphic on the right