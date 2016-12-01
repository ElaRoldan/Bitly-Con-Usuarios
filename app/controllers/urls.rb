#Metodo que asocia la short url con la long url y direcciona a la pagina
get '/long_url/:short_url' do
  @short_url = params[:short_url]
  @long_url = Url.find_by(short_url: @short_url) 
  @long_url.click_count += 1
  @long_url.save 
  redirect to ("http://#{@long_url.original}")
end


#Metodo que toma la url de un usuario registrado y la asocia con su user id
post '/urls_registered_users/:user_id' do 
  @user_id = params[:user_id]
  @url = params[:user_url]
  #Evita que se manden strings vacios 
  if  @url != ""
    Url.create(user_id: @user_id, original: @url)
    # @user_urls = Url.where(user_id: @user_id)
    redirect to ("/welcome")
  else 
      
  end 

end  





