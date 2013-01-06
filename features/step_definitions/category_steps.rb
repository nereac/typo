
When /^I follow Edit for '(.*)' category$/ do |name|
  visit "/admin/categories/edit/#{Category.find_by_name(name).id}"
end
