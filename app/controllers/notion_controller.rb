class NotionController < ApplicationController
  def hello
    @message = 'Hello World!'
    render json: { message: @message }
  end
  
  def query_db
    client = Notion::Client.new
    @data = client.database_query(database_id: ENV['NOTION_DB_ID'])
    render json: @data
  end

end
