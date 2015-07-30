Spree::Admin::ProductsController.class_eval do
  before_filter :set_stores, only: [:update]

  private
  def set_stores
  end
end
