class LineCommand < ApplicationRecord
  belongs_to :command
  def product
    Product.find(product_id)
  end
end
