#METODO PARA REGISTRARTE Y CREAR NUEVOS USURIOS 
get '/register' do 
  erb :register
end  

#Metodo que crea al nuevo usuario en la base de datos
post '/register' do 
  @user_mail = params[:user_mail]
  @password = params[:user_password]
  User.create(mail: @user_mail, password: @password)
  redirect to '/user'
end

