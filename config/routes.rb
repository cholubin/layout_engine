ActionController::Routing::Routes.draw do |map|
  map.resources :mypdfs
  map.resources :myadmins
  map.resources :adminsessions  

  map.resources :temps
  map.resources :myimages


  map.resources :sessions, :only => [:new, :create, :destory]
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  map.login '/admin/login', :controller => 'adminsessions', :action => 'new'
  map.login '/admin', :controller => 'adminsessions', :action => 'new'
  map.logout '/admin/logout', :controller => 'adminsessions', :action => 'destroy'

  
  map.root :controller => 'Temps', :action => 'index'
  
  # map.resources :pages
  map.resources :subcategories, :categories
  map.resources :categories, :has_many => :subcategories
  map.resources :users

  map.resources :mytemplates

  map.namespace :admin do |admin|
      admin.resources :mypdfs, :users, :temps, :categories, :myadmins, :mytemplates, :myimages
  end 
  
  
  # cappuccino
  map.filelist '/filelist' , :controller => "Cappuccino", :action => 'filelist'    
  map.request_mlayout '/request_mlayout' , :controller => "Cappuccino", :action => 'request_mlayout'  
  map.post_mlayout '/post_mlayout', :controller => "Cappuccino", :action => 'post_mlayout' #, :member => { :prepare => [:post] }
  map.publish '/publish/:id', :controller => "mytemplates", :action => "publish"
  map.refresh '/refresh/:id', :controller => "mytemplates", :action => "refresh"
           
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
