Rails.application.routes.draw do
  devise_for :users
  # authenticated :user, ->(u) { u.admin? } do
  #   root to: 'admin#index', as: :admin_root
  # end
  # authenticated :user, ->(u) { !u.admin? } do
  #   root to: 'curated_salads#home', as: :user_root
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: redirect('/login')

  get 'saladsfeed', to: 'salads_feed#index', as: 'salads_feed'
  post 'salads_feed/likes', to: 'salads_feed#likes', as: 'salads_feed_likes'
  post 'salads_feed/dislikes', to: 'salads_feed#dislikes', as: 'salads_feed_dislikes'
  post 'saladsfeed/comments', to: 'salads_feed#comments'
  get 'payment', to: 'payment#index', as: 'payment'
  post 'payment', to: 'payment#update', as: 'update_payment'

  get 'user/profile', to: 'user#index', as: 'user_profile'
  post 'user/profile', to: 'user#update', as: 'update_user_profile'
  get 'admin/curated_salads', to: 'admin#index', as: 'admin_curated_salads'
  get 'admin/curated_salads/new', to: 'admin#new', as: 'new'
  post 'admin/curated_salads', to: 'admin#create'
  get 'admin/curated_salads/:id/edit', to: 'admin#edit', as: 'edit'
  post 'admin/curated_salads/:id', to: 'admin#update',  as: 'admin_update_salad'
  delete 'admin/curated_salads/:id/delete', to: 'admin#delete', as: 'delete'
  get 'salads', to: 'curated_salads#home', as: 'curated_salads'
  get 'salads/recommend', to: 'curated_salads#recommend_salads', as: 'recommend_curated_salads'
  post 'salads/add_to_cart/:id', to: 'curated_salads#add_to_cart', as: 'add_to_cart'
  get 'nutritions', to: 'curated_salads#nutritions', as: 'nutritions'
  get 'login', to: 'user#home', as: 'login'
  get 'dashboard', to: 'application#page_routing', as: 'dashboard'
  post 'salads/search', to: 'curated_salads#search', as: 'curated_salads_search'
  get 'makemyownsalad', to: 'make_my_own_salad#index', as: 'make_my_own_salad'
  post 'makemyownsalad', to: 'make_my_own_salad#index_update', as: 'make_my_own_salad_update'
  post 'makemyownsalad/curate', to: 'make_my_own_salad#curate_salad', as: 'make_my_own_salad_curate'
  post 'makemyownsalad/promote/:id', to: 'make_my_own_salad#promote_salad', as: 'make_my_own_salad_promote'
  get 'deliveryprofiles', to: 'delivery_profiles#index', as: 'delivery_profiles'
  delete 'deliveryprofiles/:id', to: 'delivery_profiles#delete', as: 'delete_delivery_profiles'
  post 'deliveryprofiles/:id', to: 'delivery_profiles#add_to_cart', as: 'cart_delivery_profiles'
  get 'cart/items', to: 'cart#index', as: 'cart_items'
  delete 'cart/items/delete/:id', to: 'cart#delete', as: 'cart_items_delete'
  post 'cart/delivery_profile' , to: 'cart#create_delivery_profile', as: 'create_delivery_profile'
end