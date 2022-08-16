class NotionController < ApplicationController
  def hello
    @message = 'Hello World!'
    
    render json: { message: @message }
  end
end
