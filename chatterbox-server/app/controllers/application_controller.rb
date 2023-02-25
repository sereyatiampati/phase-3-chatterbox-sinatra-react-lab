class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
   # Add routes
   # 1. Create
  post '/messages' do
    new_message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    new_message.to_json
  end

   # 2. Read
  get '/messages' do
    Message.all.to_json
  end

   # 3. Update
   patch '/messages/:id' do
    # binding.pry
    message_to_update=Message.find(params[:id])
    message_to_update.update(
      body: params[:body]
    )
    message_to_update.to_json
   end

    # 4. Delete
  delete '/messages/:id' do
    message=Message.find(params[:id])
    message.destroy
    message.to_json
  end
  
end
