require 'rails_helper'

describe "When I send a request to the api and" do 
  it "is a get request to /api/v1/items, it returns all items" do 
    item_1 = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)
    # When I send a GET request to `/api/v1/items`
    get '/api/v1/items'
    expect(response).to be_success
    
    items = JSON.parse(response.body)
    expect(items[0]["name"]).to eq item_1.name
    expect(items[0]["description"]).to eq item_1.description
    expect(items[0]["id"]).to eq item_1.id
    expect(items[0]["image_url"]).to eq item_1.image_url

    expect(items[1]["name"]).to eq item_2.name
    expect(items[1]["description"]).to eq item_2.description
    expect(items[1]["id"]).to eq item_2.id
    expect(items[1]["image_url"]).to eq item_2.image_url
    #manually tested that createdat and updated at are not present. 
  end
   it "is a get request to /api/v1/items/1, it returns the item" do 
    item = create(:item)

    get '/api/v1/items/1'

    expect(response.status).to eq 200

    items = JSON.parse(response.body)
    
    expect(items["name"]).to eq item.name
    expect(items["description"]).to eq item.description
    expect(items["id"]).to eq item.id
    expect(items["image_url"]).to eq item.image_url
  end

  it "is a delete request to /api/v1/items/1, it deletes the item" do 
    item = create(:item)

    delete "/api/v1/items/#{item.id}"
    
    expect(response.status).to eq 200

    expect(Item.first).to eq nil 
  end

  it "is a post request to /api/v1/items with attributes, it creates the item" do 
    
    post "/api/v1/items?description=cool&image_url=realcoolimage&name=coolthing"

    item = Item.first
    expect(item.name).to eq "coolthing"
    expect(item.description).to eq "cool"
    expect(item.image_url).to eq "realcoolimage"
  end
end

