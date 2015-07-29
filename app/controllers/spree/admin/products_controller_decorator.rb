Spree::Admin::ProductsController.class_eval do
  update.before :set_stores

  private
  def set_stores
    if user_comes_from_product_details? && no_stores_selected?
      @product.store_ids = nil
    end
  end

  def user_comes_from_product_details?
    params = Spree::Core::Engine.routes.recognize_path(request.referer)
    params[:controller] == "spree/admin/products" && params[:action] == "edit"
  end

  def no_stores_selected?
    params[:product][:store_ids].blank?
  end

end
