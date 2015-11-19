require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  	let(:valid_attributes) {
  		{:title => 'My title',
  			:content => 'My content'}}
  	

  	let(:valid_session) { {} }


	context '#index' do
		it "assigns all posts as @posts" do
	      	post = Post.create! valid_attributes
	      	get :index, {}, valid_session
	      	expect(assigns(:posts)).to eq([post])

	    end

	    it "renders the index page" do
	    	get :index
    		expect(response).to render_template(:index)
    	end
	end

	context '#new' do
		it "assigns a new post as @post" do
      		get :new, {}, valid_session
      		expect(assigns(:post)).to be_a_new(Post)
    	end

    	it "renders the new template" do
    		get :new
    		expect(assigns(:post)).to render_template(:new)
    	end
	end

	context '#create' do
		it "creates a new Post" do
	        expect {
	          post :create, {:post => valid_attributes}, valid_session
	        }.to change(Post, :count).by(1)
	    end

	    it "assigns a newly created post as @post" do
	        post :create, {:post => valid_attributes}, valid_session
	        expect(assigns(:post)).to be_a(Post)
	        expect(assigns(:post)).to be_persisted
	    end

	    it "redirects to the created post" do
	        post :create, {:post => valid_attributes}, valid_session
	        expect(response).to redirect_to(Post.last)
	    end
	end

	context '#destroy' do
		it "deletes the requested post" do
	      	post = Post.create! valid_attributes
	      	expect {
	        	delete :destroy, {:id => post.to_param}, valid_session
	      	}.to change(Post, :count).by(-1)
	    end

	    it "redirects to the posts list" do
	      	post = Post.create! valid_attributes
	      	delete :destroy, {:id => post.to_param}, valid_session
	      	expect(response).to redirect_to(posts_path)
	    end
	end
end 


