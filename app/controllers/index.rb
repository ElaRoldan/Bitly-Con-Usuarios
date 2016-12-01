#Ruta raiz, renderiza index
get '/' do
   erb :index
end

#Dirrecion a la que manda a los ususarios no registrados
get "/unregisted" do 
  @url = Url.last  
  erb :index
end   

#Metodo que asocia la short url con la long url y direcciona a la pagina
get '/long_url/:short_url' do
  @short_url = params[:short_url]
  @long_url = Url.find_by(short_url: @short_url) 
  @long_url.click_count += 1
  @long_url.save 
  redirect to ("http://#{@long_url.original}")
end

#Metodo que toma la direccion del usuario 
post '/urls' do
  @url = params[:user_url]
  #Evita que se manden strings vacios 
  if  @url != ""
    Url.create(original: @url)
    redirect to '/unregisted'
  else 
    redirect to '/'  
  end 
end    


 