class BigCatsController < Sinatra::Base

  configure do
    set :views, "lib/views"
  end

  get '/' do
    redirect '/big_cats'
  end

  get '/big_cats' do
    @big_cats = BigCat.all
    erb :index
  end

  get "/big_cats/:id" do
    @big_cats = BigCat.all.find(params[:id])
    #binding.pry
    erb :show
  end

  get '/new' do
    erb :new
  end

  post '/big_cats' do
    new_cat = BigCat.create({
      breed: params[:breed],
      average_age: params[:average_age],
      length: params[:length],
      weight: params[:length]
    })

    id = new_cat.id

    redirect "/big_cats/{#{id}}"
  end

  get "/big_cats/:id/edit" do
    @big_cat = BigCat.find(params[:id])

    erb :edit
  end

  patch "/big_cats/:id" do
    @big_cat = BigCat.find(params[:id])
    @big_cat.breed = params[:breed]
    @big_cat.average_age = params[:average_age]
    @big_cat.length = params[:length]
    @big_cat.weight = params[:weight]
    redirect "/big_cats"
  end

  delete "/big_cats/:id" do
    @big_cat = BigCat.find(params[:id])
    @big_cat.destroy
    redirect "/big_cats"
  end

end
