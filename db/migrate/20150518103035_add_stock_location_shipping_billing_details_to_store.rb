class AddStockLocationShippingBillingDetailsToStore < ActiveRecord::Migration
  def change
    add_column :spree_stores, :cards_accepted, :string
    add_column :spree_stores, :delivery_carrier_default, :string
    add_column :spree_stores, :delivery_estimate_default, :integer, default: 3
    add_column :spree_stores, :delivery_free, :boolean, default: true
    add_column :spree_stores, :returns_free, :boolean, default: true
    add_column :spree_stores, :stock_location_id, :integer
    add_index  :spree_stores, :stock_location_id
  end
end

