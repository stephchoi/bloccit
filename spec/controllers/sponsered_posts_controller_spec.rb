require 'rails_helper'

RSpec.describe SponseredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsered_post) { my_topic.sponsered_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(5..100)) }

  describe "GET show" do
    it "returns http success" do
      get :show, params: { topic_id: my_topic.id, id: my_sponsered_post.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, params: { topic_id: my_topic.id, id: my_sponsered_post.id }
      expect(response).to render_template :show
    end
    
    it "assigns my_sponsered_post to @sponsered_post" do
      get :show, params: { topic_id: my_topic.id, id: my_sponsered_post.id }
      expect(assigns(:sponsered_post)).to eq(my_sponsered_post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, params: { topic_id: my_topic.id, id: my_sponsered_post.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new, params: { topic_id: my_topic.id, id: my_sponsered_post.id }
      expect(response).to render_template :new
    end
 
    it "instantiates @sponsered_post" do
      get :new, params: { topic_id: my_topic.id, id: my_sponsered_post.id }
      expect(assigns(:sponsered_post)).not_to be_nil
    end
  end
 
  describe "POST create" do
    it "increases the number of Post by 1" do
      expect{ post :create, params: { topic_id: my_topic.id, sponsered_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(5..100) } } }.to change(SponseredPost,:count).by(1)
    end
 
    it "assigns the new sponsered_post to @sponsered_post" do
      post :create, params: { topic_id: my_topic.id, sponsered_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(5..100) } }
      expect(assigns(:sponsered_post)).to eq SponseredPost.last
    end
 
    it "redirects to the new sponsered_post" do
      post :create, params: { topic_id: my_topic.id, sponsered_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(5..100) } }
      expect(response).to redirect_to [my_topic, SponseredPost.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: { topic_id: my_topic.id, id: my_sponsered_post.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, params: { topic_id: my_topic.id, id: my_sponsered_post.id }
      expect(response).to render_template :edit
    end
    
    it "assigns sponsered_post to be updated to @sponsered_post" do
      get :edit, params: { topic_id: my_topic.id, id: my_sponsered_post.id }
      
      sponsered_post_instance = assigns(:sponsered_post)
      
      expect(sponsered_post_instance.id).to eq my_sponsered_post.id
      expect(sponsered_post_instance.title).to eq my_sponsered_post.title
      expect(sponsered_post_instance.body).to eq my_sponsered_post.body
    end
  end
  
end
