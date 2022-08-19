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

  
  def porfolio_load
    client = Notion::Client.new
    data = client.database_query(database_id: ENV['NOTION_PORFOLIO_DB_ID'])
    @names = data.results
    @page_names = []
    @names.each do |page|
      page_content = client.page(page_id: page.id)
      @page_names << page_content.properties.framework.title[0].text.content
    end 
    render json: @page_names
  end

  def logo_load
    client = Notion::Client.new
    data = client.database_query(database_id: ENV['NOTION_LOGOS_DB_ID'])
    @names = data.results
    @page_names = []
    @names.each do |page|
      page_content = client.page(page_id: page.id)
      @page_names << page_content.properties.image.files[0].file.url
    end 
    render json: @page_names
  end
  
end
