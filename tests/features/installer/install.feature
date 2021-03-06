Feature: Install
  Scenario: Install from sources in the current directory
    Given I run "php -n ../../bin/installer"
     Then I should see output matching
        """
        >>> Installed phpswitch master@[a-z0-9]{7}
        >> Updating dependencies\.\.\.
        >> phpswitch sources path : [^\s]*phpswitch
        >> phpswitch bin path : [^\s]*phpswitch\/bin\/phpswitch
        >> phpswitch was successfully installed\. Enjoy!
        """
    Given I run "phpswitch/bin/phpswitch"
     Then The command should exit with success status

  Scenario: Update existing installation
    Given I run "php -n ../../bin/installer"
      And I run "php -n ../../bin/installer"
     Then I should see output matching
        """
        >>> Updated phpswitch to master@[a-z0-9]{7}
        >> Updating dependencies\.\.\.
        >> phpswitch sources path : [^\s]*phpswitch
        >> phpswitch bin path : [^\s]*phpswitch\/bin\/phpswitch
        >> phpswitch was successfully installed\. Enjoy!
        """
