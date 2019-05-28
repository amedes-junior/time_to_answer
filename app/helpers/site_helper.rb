module SiteHelper
  def msg_jumbotron
    puts params[:action]
   case params[:action]
    when 'index'
      "Ultimas Perguntas Cadastradas"
    when 'questions'
      "Resultados para o termo \"#{params[:term]}\"..."
    when 'subject'
      "Resultados para o assunto \"#{params[:subject]}\"..."
   end
  end
end
