require 'spec_helper'

describe ApplicationController do

  describe "Homepage" do
    it 'loads the homepage' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Welcome")
      expect(last_response.body).to include("Log In")
      page.has_selector?('a')
    end
  end

end
