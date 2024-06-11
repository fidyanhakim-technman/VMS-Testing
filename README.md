Here's the updated README file with the added instruction about having the project running on your local machine at port 3000:

```markdown
# VMS UI Testing Framework

## Description

VMS UI Testing Framework is a user interface testing framework built using Robot Framework and Selenium Library. It is designed to facilitate automated testing of the Vendor Management System (VMS) application.

## Installation Instructions

1. **Clone the Repository**

   ```bash
   git clone <repository-url>
   ```

2. **Install Dependencies**

   Navigate to the project directory and install the required libraries.

   ```bash
   cd <project-directory>
   pip install robotframework
   pip install robotframework-seleniumlibrary
   pip install selenium
   ```

## Usage Instructions

1. **Ensure the Project is Running**

   Make sure the VMS project is running on your local machine at port 3000.

2. **Navigate to the Tests Directory**

   ```bash
   cd <project-directory>/tests
   ```

3. **Run Tests**

   Execute the desired test suite using the `robot` command followed by the path to the test suite.

   ```bash
   robot <test-suite-directory>
   ```

## Contribution Guidelines

Contributions are welcome! Please fork the repository, create a feature branch, and submit a pull request with your changes.
