class AddCustomerServiceDetailsToStores < ActiveRecord::Migration
  def change
    add_column :spree_stores, :customer_service_email, :string
    add_column :spree_stores, :customer_service_phone, :string
    add_column :spree_stores, :customer_service_hours, :string
  end
end
