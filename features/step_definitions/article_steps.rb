
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create!(article)
  end
end

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    Comment.create!(comment)
  end
end


Given /the articles '(\d+)' and '(\d+)' were merged/ do |id1,id2|
   article = Article.find(id1)
   article.merge_with(id2)
end

Then /'(.*)' should be author of article with id '(\d+)'/ do |author,id|
   article = Article.find(id)
   author.should == article.author
end

And /'(.*)' should not be author of article with id '(\d+)'/ do |author,id|
   article = Article.find(id)
   author.should_not == article.author
end

