class HomeController < ApplicationController
  def index
    @github_link = "https://github.com/jbox-web/ajax-datatables-rails"
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(params) }
    end
  end
end