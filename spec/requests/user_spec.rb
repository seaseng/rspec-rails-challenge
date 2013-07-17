require 'spec_helper'

describe 'User' do
  # let(:user) {User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')}
  # let(:post1) {Post.create(title: 'title1', content: 'content1')}
  # let(:post2) {Post.create(title: 'title2', content: 'content2')}

  let(:user)   {FactoryGirl.create(:user)}
  let(:post1)  {FactoryGirl.create(:post)}
  let(:post2)  {FactoryGirl.create(:post)}
  context "on homepage" do
    it "sees a list of recent posts titles" do

      user.posts << post1
      user.posts << post2
      # given a user and a list of posts
      # user visits the homepage
      # user can see the posts titles
      visit root_path
      # save_and_open_page
      expect(page).to have_content post1.title
      expect(page).to have_content post2.title

    end
    it "can not see bodies of the recent posts" do
      user.posts << post1
      user.posts << post2
      # given a user and a list of posts
      # user visits the homepage
      # user should not see the posts bodies
      visit root_path
      # save_and_open_page
      expect(page).to_not have_content post1.content
      expect(page).to_not have_content post2.content
    end
    it "can click on titles of recent posts and should be on the post show page" do
      user.posts << post1
      user.posts << post2
      visit root_path
      # save_and_open_page
      click_link post1.title
      current_path.should == post_path(post1)
      # given a user and a list of posts
      # user visits the homepage
      # when a user can clicks on a post title they should be on the post show page
    end
    it "can not see the edit link" do
      user.posts << post1
      user.posts << post2
      visit root_path
      expect(page).to_not have_content 'Edit'
      # given a user and a list of posts
      # user visits the homepage
      # user should not see any edit links
    end
    it "can not see the delete link" do
      user.posts << post1
      user.posts << post2
      visit root_path
      expect(page).to_not have_content 'Delete'
      # given a user and a list of posts
      # user visits the homepage
      # user should not see any delete links
    end
  end

  context "post show page" do
    it "sees title and body of the post" do
      visit post_path(post1)
      expect(page).to have_content post1.title
      expect(page).to have_content post1.content
      # given a user and post(s)
      # user visits the post show page
      # user should see the post title
      # user should see the post body
    end
    it "can not see the edit link" do
      visit post_path(post1)
      expect(page).to_not have_content "Edit post"
      # given a user and post(s)
      # user visits the post show page
      # user should not see the post edit link
    end
    it "can not see the published flag" do
      visit post_path(post1)
      # save_and_open_page
      expect(page).to_not have_content "Publish"
      # given a user and post(s)
      # user visits the post show page
      # user should not see the published flag content
    end
    it "can not see the Admin homepage link" do
      visit post_path(post1)
      expect(page).to_not have_content "Admin welcome page"
      # given a user and post(s)
      # user visits the post show page
      # user should not see the the admin homepage link
    end
  end
end
