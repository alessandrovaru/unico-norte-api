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

  
  def all_pages
    client = Notion::Client.new
    data = client.database_query(database_id: ENV['NOTION_DB_ID'])
    @list_of_pages = data.results
    @page_names = []
    @list_of_pages.each do |page|
      page_content = client.page(page_id: page.id)
      @page_names << page_content.properties.framework.title[0].text.content
    end 
    render json: @page_names
    
  end
  
end
