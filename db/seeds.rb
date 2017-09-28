require 'random_data'

# Create Posts
50.times do
   Post.create!(

        title:  RandomData.random_sentence,
        body:   RandomData.random_paragraph
    )
end
posts = Post.all
 
 # Create Comments
100.times do
   Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
   )
end

Post.find_or_create_by!(title: "Titles are hard to make") do |post|
    post.body = "They really are so difficult to make. It's so rough."
end
 
puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"