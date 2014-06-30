require 'spec_helper'

describe "/api/products" do
  include_context "integration"

  it "gets the products collection", :vcr do
    products = api.products.all
    products['1']['name'].should == 'Limited Edition Killer Instinct Furby'
  end

  it "finds a product by id", :vcr do
    product = api.products.find('1')
    product['name'].should == 'Limited Edition Killer Instinct Furby'
  end

  it "deletes a product by id", :vcr do
    response = api.products.delete('1')
    response.should == nil
  end

  it "creates a product", :vcr do
    hash = {
      description: "Test description",
      name: "Test",
      price: 25.5,
      short_description: "Test short description",
      sku: "simple4f5490f31959f",
      status: 1,
      attribute_set_id: 4,
      stock_data: {
        is_in_stock: 0,
        is_qty_decimal: 0,
        manage_stock: 1,
        qty: 1,
      },
      tax_class_id: "2",
      type_id: "simple",
      use_config_gift_message_available: 0,
      visibility: "4",
      weight: 125
    }

    response = api.products.create(hash)
    response.should == nil
  end

  it "updates a product", :vcr do
    hash = {
      id: 5,
      stock_data: {
        qty: 10
      }
    }
    response = api.products.update(hash)
    response.should == nil
  end

end
