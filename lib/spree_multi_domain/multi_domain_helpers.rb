module SpreeMultiDomain
  module MultiDomainHelpers
    def self.included(receiver)
      receiver.send :helper, 'spree/products'
      receiver.send :helper, 'spree/taxons'

      receiver.send :before_filter, :add_current_store_id_to_params
      receiver.send :helper_method, :current_store
      receiver.send :helper_method, :current_tracker
    end

    def current_tracker
      @current_tracker ||= Spree::Tracker.current(request.env['SERVER_NAME'])
    end

    def get_taxonomies
      @taxonomies ||= has_store_taxonomy? ? get_store_taxonomy : Spree::Taxonomy
      @taxonomies = @taxonomies.includes(:root => :children)
      @taxonomies
    end

    def has_store_taxonomy?
      return false unless current_store.present?
      Spree::Taxonomy.where(["store_id = ?", current_store.id]).count > 0
    end

    def store_taxonomy
      Spree::Taxonomy.where(["store_id = ?", current_store.id])
    end

    def add_current_store_id_to_params
      params[:current_store_id] = current_store.try(:id)
    end
  end
end
