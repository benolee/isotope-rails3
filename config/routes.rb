IsotopeRails3::Application.routes.draw do
  root :to => 'home#index'

  devise_for :users, :path => '/', :path_names => { :sign_in => 'login', :sign_out => 'logout' }

  match '/about' => 'users#index', :as => :about
  match '/about/:id' => 'users#show', :as => :about
  match '/blog' => 'posts#index', :as => :blogs
  match '/blog/:id' => 'posts#show', :as => :blog
  resources :users
  resources :posts

  match '/work' => 'work#index'
  match '/work/acolleague' => 'work#acolleague'
  match '/work/aidt' => 'work#aidt'
  match '/work/aiua' => 'work#aiua'
  match '/work/creative_catering' => 'work#creative_catering'
  match '/work/deep_south_fibers' => 'work#deep_south_fibers'
  match '/work/financial' => 'work#financial'
  match '/work/insight' => 'work#insight'
  match '/work/in_the_making' => 'work#in_the_making'
  match '/work/luvnotes' => 'work#luvnotes'
  match '/work/maralyn_wilson' => 'work#maralyn_wilson'
  match '/work/political_inquirer' => 'work#political_inquirer'
  match '/work/sportgraphics' => 'work#sportgraphics'

  match '/home/services' => 'home#services'
  match '/home/contact' => 'home#contact'
  match '/home/payments' => 'home#payments'
  match '/home/careers' => 'home#careers'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
