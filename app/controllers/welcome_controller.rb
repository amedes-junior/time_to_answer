class WelcomeController < ApplicationController
  http_basic_authenticate_with name:"amedes", password: "junior"

  def index
  end
end
