class Site::WelcomeController < SiteController
  def index
    @questions = Question.includes(:answers).all.page(params[:page])
  end
end
