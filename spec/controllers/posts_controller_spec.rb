require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:valid_attributes) {
    { title: "post1",
      body: "post1 body",
      category: 1
    } 
  }

  let(:invalid_attributes) {
    { title: "post1",
      body: "",
      category: 1
    } 
  }

  let(:view_context) { ActionView::Base.new }

  describe "GET #index" do
    it "assigns all post_presenters as @post_presenters" do
      post = Post.create! valid_attributes
      get :index 
      expect(assigns(:post_presenters)[0].obj).to eq(post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, params: {:post => valid_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to post" do
        post :create, params: {:post => valid_attributes}
        expect(response).to redirect_to(post_path(Post.first))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, params: {:post => invalid_attributes}
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { category: 2 }
      }

      it "updates the requested post" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => new_attributes}
        post.reload
        expect(post.category).to eq "pedestrian"
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => valid_attributes}
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => valid_attributes}
        expect(response).to redirect_to(post_path(post))
      end
    end

    context "with invalid params" do
      it "assigns the post as @post" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => invalid_attributes}
        expect(assigns(:post)).to eq(post)
      end

      it "render edit_post_path" do
        post = Post.create! valid_attributes
        expect( put :update, params: {:id => post.to_param, :post => invalid_attributes} ).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, params: {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete :destroy, params: {:id => post.to_param}
      expect(response).to redirect_to(posts_path)
    end
  end

end
