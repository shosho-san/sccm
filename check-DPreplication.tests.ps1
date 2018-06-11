# this is a Pester test file

#region Further Reading
# http://www.powershellmagazine.com/2014/03/27/testing-your-powershell-scripts-with-pester-assertions-and-more/
#endregion
#region LoadScript
# load the script file into memory
# attention: make sure the script only contains function definitions
# and no active code. The entire script will be executed to load
# all functions into memory
. ($PSCommandPath -replace '\.tests\.ps1$', '.ps1')
#endregion

# describes the function Test-SCCMisAdmin
Describe -Name 'Test-SCCMisAdmin' -Fixture {

  # scenario 1: call the function without arguments
  Context -Name 'Running without arguments'   -Fixture {
    # test 1: it does not throw an exception:
    It -name 'runs without errors' -test {
      # Gotcha: to use the "Should Not Throw" assertion,
      # make sure you place the command in a 
      # scriptblock (braces):
      { Test-SCCMisAdmin } | Should Not Throw
    }
    It -name 'does something' -test {
      # call function Test-SCCMisAdmin and pipe the result to an assertion
      # Example:
      # Test-SCCMisAdmin | Should Be 'Expected Output'
      # Hint: 
      # Once you typed "Should", press CTRL+J to see
      # available code snippets. You can also click anywhere
      # inside a "Should" and press CTRL+J to change assertion.
      # However, make sure the module "Pester" is
      # loaded to see the snippets. If the module is not loaded yet,
      # no snippets will show.
    }
    # test 2: it returns nothing ($null):
    It -name 'does not return anything'     -test {
      Test-SCCMisAdmin | Should BeNullOrEmpty 
    }
  }
}
# describes the function get-FreeSpace
Describe -Name 'get-FreeSpace' -Fixture {

  # scenario 1: call the function without arguments
  Context -Name 'Running without arguments'   -Fixture {
    # test 1: it does not throw an exception:
    It -name 'runs without errors' -test {
      # Gotcha: to use the "Should Not Throw" assertion,
      # make sure you place the command in a 
      # scriptblock (braces):
      { get-FreeSpace } | Should Not Throw
    }
    It -name 'does something' -test {
      # call function get-FreeSpace and pipe the result to an assertion
      # Example:
      # get-FreeSpace | Should Be 'Expected Output'
      # Hint: 
      # Once you typed "Should", press CTRL+J to see
      # available code snippets. You can also click anywhere
      # inside a "Should" and press CTRL+J to change assertion.
      # However, make sure the module "Pester" is
      # loaded to see the snippets. If the module is not loaded yet,
      # no snippets will show.
    }
    # test 2: it returns nothing ($null):
    It -name 'does not return anything'     -test {
      get-FreeSpace | Should BeNullOrEmpty 
    }
  }
}
