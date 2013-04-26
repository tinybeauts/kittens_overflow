require 'spec_helper'

describe "Image Pages" do
  describe "a login user" do
    before :each do
      user = FactoryGirl.create(:user, password:'123', password_confirmation: '123')
      @image = FactoryGirl.create(:image)
      login(user)
    end

    it 'should be able to posts a comment' do
      visit image_path(@image.id)
      story = 'test comment on image.'
      fill_in 'story_body', :with => story
      click_button 'Submit'
      page.should have_content(story)
    end

    it 'a logged in user can vote on an image', :js => true do
      visit image_path(@image.id)
      click_link "/vote/Image/#{@image.id}"
    end
    
  end

  describe 'if not logged in' do
    before :each do
      @image = FactoryGirl.create(:image)
    end

    it 'should not see a story text area' do
      visit image_path(@image.id)
      page.should_not have_content("#story_body")
    end
  end
end
