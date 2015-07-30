class AmazonPaser

  def initialize
    @request = Vacuum.new('US')
    @request.configure(
    aws_access_key_id: 'AKIAIAJR65JO6EIPQWTA',
    aws_secret_access_key: '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',
    associate_tag: 'microv'
    )

    @request.associate_tag = 'tag'
  end

  def import_product
    (1..10).each do |page|
      get_response(page).each do |item|
        begin
          category = Category.find_or_create_by(name: item["ItemAttributes"]["ProductGroup"])
          product = Product.find_or_create_by(name: item["ItemAttributes"].to_h["Title"]) do |product|
            product.image = item["LargeImage"]["URL"]
            product.category_id = category.id
            product.price = item["ItemAttributes"]["ListPrice"]["Amount"].to_i
            product.description = valid_description(item)
          end
        rescue Exception => e
          puts e
        end
      end
    end
  end

  private

  def valid_description(item)
    if (des = item["EditorialReviews"]) != nil
      if des["EditorialReview"]!= nil
        if des["EditorialReview"]["Content"]!=nil
          return des["EditorialReview"]["Content"]
        end
      elsif des["EditorialReview"][0]["Content"] != nil
        return des["EditorialReview"][0]["Content"]
      end
    end
    des = "Default description"
  end

  def get_response(page)
    response = @request.item_search(
      query: {
        'Keywords' => '*',
        'SearchIndex' => 'Blended',
        'ResponseGroup' => 'Medium',
        'ItemPage' => page,
        }
      )
    response.to_h["ItemSearchResponse"]["Items"]["Item"]
  end

end