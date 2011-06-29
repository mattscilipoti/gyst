Then /^the output should report timing$/ do
  Then 'the output should match /real +\d.\d\d/'
  Then 'the output should match /user +\d.\d\d/'
  Then 'the output should match /sys +\d.\d\d/'
end

