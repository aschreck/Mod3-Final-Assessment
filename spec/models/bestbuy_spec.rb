describe "The best buy service" do
  it "returns a json object " do
  service = BestbuyService.new
  stores = service.stores_by_zip(80911)
  
  expect(stores.count).to eq 3
  end
end