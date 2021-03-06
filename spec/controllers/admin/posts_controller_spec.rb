require 'spec_helper'

describe Admin::PostsController do
  describe "admin panel" do
    it "welcome page requires http authentication" do
      get :index
      response.status.should eq 200
    end

    it "non-welcome pages do not require http auth" do
      get :new
      response.status.should eq 200
    end
  end
end


