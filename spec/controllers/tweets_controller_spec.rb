require 'rails_helper'

describe TweetsController do
  describe 'Get #index' do
    before do
      @tweet = create(:tweet)
      @tweet2 = create(:tweet_2)
      get 'index'
    end
    it 'returns http status 200' do
      expect(response.status).to eq(200)
    end
    it 'renders the :index template' do
      expect(response).to render_template :index
    end
    it 'assigns the requested tweets to @tweets' do
      expect(assigns(:tweets)).to match_array([@tweet, @tweet2])
    end
  end

  describe 'Get #show' do
    before do
      @tweet = create(:tweet)
    end
    context 'when the requested tweet exists' do
      before do
        get 'show', permalink: @tweet.permalink
      end
      it 'returns http status 200' do
        expect(response.status).to eq(200)
      end
      it 'renders the :show template' do
        expect(response).to render_template :show
      end
      it 'assigns the requested tweet to @tweet' do
        expect(assigns(:tweet)).to eq @tweet
      end
    end

    context 'when the requested tweet does not exist' do
      it 'returns RecordNotFound'
    end
  end

  describe 'Get #new' do
    context 'when the user is logged in' do
      login_user
      it 'returns http status 200' do
        expect(response.status).to eq(200)
      end
      it 'renders the :new template'
      it 'assigns the requested tweet to @tweet'
    end

    context 'when the user is not logged in' do
      it 'redirects to users/sessions#new'
    end
  end

  describe 'Post #create' do
    context 'when the user is logged in' do
      login_user
      context 'when the parameter is valid' do
        it 'returns http status 302' do
          expect(response.status).to eq(302)
        end
        it 'increases tweet model by 1'
        it 'redirects to tweets#index'
      end

      context 'when the parameter is invalid' do
        it 'returns http status 200' do
          expect(response.status).to eq(200)
        end
        it 'does not register new tweet to db'
        it 'renders the :new template again'
      end
    end

    context 'when the user is not logged in' do
      it 'redirects to users/sessions#new'
    end
  end

  describe 'Get #edit' do
    context 'when the user is logged in' do
      login_user
      it 'returns http status 200' do
        expect(response.status).to eq(200)
      end
      it 'renders the :edit template'
      it 'assigns the requested tweet to @tweet'
    end

    context 'when the user is not logged in' do
      it 'redirects to users/sessions#new'
    end
  end

  describe 'Patch #update' do
    context 'when the user is logged in' do
      login_user
      context 'when the requested tweet exists' do
        context 'when the parameter is valid' do
          it 'returns http status 302' do
            expect(response.status).to eq(302)
          end
          it 'updates the tweet in db'
          it 'redirects to tweets#show'
        end
        context 'when the parameter is invalid' do
          it 'returns http status 200' do
            expect(response.status).to eq(200)
          end
          it 'does not update the tweet in db'
          it 'renders the :edit template again'
        end
      end

      context 'when the requested tweet does not exist' do
        it 'returns RecordNotFound'
      end
    end

    context 'when the user is not logged in' do
      it 'redirects to users/sessions#new'
    end
  end

  describe 'Delete #destroy' do
    context 'when the user is logged in' do
      login_user
      context 'when the requested tweet exists' do
        it 'returns http status 302' do
          expect(response.status).to eq(302)
        end
        it 'deletes the tweet from db'
        it 'redirects to tweets#index'
      end

      context 'when the requested tweet does not exist' do
        it 'returns RecordNotFound'
      end
    end

    context 'when the user is not logged in' do
      it 'redirects to users/sessions#new'
    end
  end
end
