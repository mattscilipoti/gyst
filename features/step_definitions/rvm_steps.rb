Given /^(?:I'm|I am) using a new gemset$/ do
  use_clean_gemset(CLEAN_GEMSET)
end

Given /^(?:I'm|I am) using a new gemset with these gems:$/ do |table|
  # table is a Cucumber::Ast::Table
  Given "I am using a new gemset"

  table.rows.each do |row|
    gem = row.first
    run_simple("gem install #{gem}", true)
  end
end

