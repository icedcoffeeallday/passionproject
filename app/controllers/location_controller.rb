get '/locations' do
  @what = LocationAdapter.new.request_ish('94115')
  erb :'/location'
end
