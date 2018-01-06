describe "the store model" do
  it "can be initialized with data " do
    store_1 = {"longName" => "Store", 
             "city" => "Denver", 
             "storeType" => "Store", 
             "phone" => "71812345678", 
             "distance" => 2.3 
            }
    store = Store.new(store_1) 

    expect(store.name).to eq "Store"
    expect(store.city).to eq "Denver"
    expect(store.type).to eq "Store"
    expect(store.phone).to eq "71812345678"
    expect(store.distance).to eq 2.3
  end
  
  it " can create stores from parsed json" do
    store_1 = {"longName" => "Store", 
             "city" => "Denver", 
             "storeType" => "Store", 
             "phone" => "71812345678", 
             "distance" => 2.3 
            }

    store_2 = {"longName" => "moreStore", 
             "city" => "Denver", 
             "storeType" => "kiosk", 
             "phone" => "71452345678", 
             "distance" => 2.8 
            }
          
    store_data = [store_1, store_2]        
    stores = Store.create_stores(store_data)

    expect(stores.count).to eq 2
    expect(stores.first.name).to eq "Store"
    expect(stores.first.distance).to eq 2.3

    expect(stores.second.name).to eq "moreStore"
    expect(stores.second.distance).to eq 2.8


  end   
end