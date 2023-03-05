require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET #show" do
    context "ログインしている場合" do
      before do
        sign_in user
        get user_path(user.id)
      end

      it 'レスポンスは200になること' do
        expect(response).to have_http_status(:ok)
      end

      it 'showページが表示されること' do
        expect(response.body).to match(/<h2>#{user.nickname}<\/h2>/i)
      end
    end

    context "ログインしていない場合" do
      before do
        get user_path(user.id)
      end

      it "レスポンスは302になること" do
        expect(response).to have_http_status(:found)
      end

      it "ログイン画面にリダイレクトすること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET #index" do
    context "ログインしている場合" do
      before do
        sign_in user
        get users_path
      end

      it 'レスポンスは200になること' do
        expect(response).to have_http_status(:ok)
      end

      it 'indexページが表示されること' do
        expect(response.body).to match(/<h1>ユーザー一覧<\/h1>/i)
      end
    end

    context "ログインしていない場合" do
      before do
        get users_path
      end

      it "レスポンスは302になること" do
        expect(response).to have_http_status(:found)
      end

      it "ログイン画面にリダイレクトすること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET #following" do
    context "ログインしている場合" do
      before do
        sign_in user
        get following_user_path(user.id)
      end

      it 'レスポンスは200になること' do
        expect(response).to have_http_status(:ok)
      end

      it 'followingページが表示されること' do
        expect(response.body).to match(/<h1>フォロー一覧<\/h1>/i)
      end    
    end
  
    context "ログインしていない場合" do
      before do
        get following_user_path(user.id)
      end

      it "レスポンスは302になること" do
        expect(response).to have_http_status(:found)
      end

      it "ログイン画面にリダイレクトすること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET #followers" do
    context "ログインしている場合" do
      before do
        sign_in user
        get followers_user_path(user.id)
      end

      it 'レスポンスは200になること' do
        expect(response).to have_http_status(:ok)
      end

      it 'followerページが表示されること' do
        expect(response.body).to match(/<h1>フォロワー一覧<\/h1>/i)
      end    
    end
  
    context "ログインしていない場合" do
      before do
        get followers_user_path(user.id)
      end

      it "レスポンスは302になること" do
        expect(response).to have_http_status(:found)
      end

      it "ログイン画面にリダイレクトすること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET #likes" do
    context "ログインしている場合" do
      before do
        sign_in user
        get "/users/#{user.id}/likes"
      end

      it 'レスポンスは200になること' do
        expect(response).to have_http_status(:ok)
      end   
    end
  
    context "ログインしていない場合" do
      before do
        get "/users/#{user.id}/likes"
      end

      it "レスポンスは302になること" do
        expect(response).to have_http_status(:found)
      end

      it "ログイン画面にリダイレクトすること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
