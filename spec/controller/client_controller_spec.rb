require 'rails_helper'

RSpec.describe ClientsController, :type => :controller do
	describe "GET new" do
		it "renders callback form template" do
			get :new
			expect(response).to render_template("new")
		end
	end
end