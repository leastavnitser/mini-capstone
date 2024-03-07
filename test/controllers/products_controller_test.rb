require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { price: 1.00, description: "how many words is 20 characters" }
      post "/products.json", params: { name: "test product", price: 1.00, description: "test description" }
      assert_response 200
    end
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price.to_s, data["price"]
    assert_equal product.supplier, data["supplier"]
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "is_discounted?", "tax", "total", "images", "description", "quantity", "created_at", "updated_at", "supplier"], data.keys
  end
  # test "the truth" do
  #   assert true
  # end

  # test for a validation that is commented out!
  # assert_difference "Product.count", 0 do
  #   post "/products.json", params: { description: "yo" }
  #   assert_response 422
  # end
end
