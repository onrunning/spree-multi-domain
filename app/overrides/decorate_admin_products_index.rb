Deface::Override.new(
  :virtual_path => "spree/admin/products/index",
  :name => "multi_domain_admin_products_index_search",
  :insert_top => "[data-hook='admin_products_index_search']",
  :partial => "spree/admin/products/index_search_fields",
  :disabled => false)
