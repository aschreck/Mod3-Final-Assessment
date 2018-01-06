describe "The best buy service" do
  it "returns a json object " do
  service = BestbuyService.new(80911)
  stores = service.stores_by_zip
  
  expect(stores.count).to eq 3
  end
end