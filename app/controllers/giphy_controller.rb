get '/gifs' do
  erb :'/gifs/search'
end

post '/gifs' do
  @search_string = params[:week_values]

  case @search_string
    when "awesome"
      @translated = "awesome"
    when "meh"
      @translated = "kittens"
    when "ok"
      @translated = "ice cream"
    when "nope"
      @translated = "rick and morty"
    when "terrible"
      @translated = "ryan gosling"
    when "the_worst"
      @translated = "kittens and puppies"
    when "bad_life_choices"
      @translated = "dog wearing a hat"
    else
      @translated = "puppies"
  end

  @results = GiphyAdapter.new.search(@translated)
  erb :'/gifs/results'
end
