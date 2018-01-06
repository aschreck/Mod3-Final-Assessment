describe "The best buy service" do
  it "can be initialized" do
    service = BestbuyService.new(80911)  
    expect(service).to be_an_instance_of BestbuyService
  end
  
  it "returns a json object " do
  service = BestbuyService.new(80911)
  stores = service.stores_by_zip
  
  expect(stores.count).to eq 3
  end
end