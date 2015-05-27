Rails.application.routes.draw do

  # Get an overview of all your route at the command line with "$rake routes".

  # There are two basic ways to declare the routes for your application: individually or a set of actions for a resource.

  # To declare a route individually you must specify an http action, a url name, and an action in a controller
  # the format is:
  # <verb> '<string url>', to: '<controlle>#<action>'
  # an example would be
  # get '/photo', to: 'photo#index'

  # The second way is to declare all of the routes for a resource
  # an example would be
  # resources :photo
  # be default this will create 7 routes based around the user resource: index, show, edit, update, new, create, destroy
  # you can also limit a resource if you don't need all the routes. an example would be:
  # resources :photos, only: [:show, :sdestroy]
  # or
  # resources :photos, except: [:show, :destroy]
  # for more info on resources checkout http://guides.rubyonrails.org/routing.html#crud-verbs-and-actions

  # there is also usually a special route declaration that specifies where the base url '/' routes to
  root to: 'users#index'

  #<<<create routes for the user resource. Only create a show, create, update, and destroy action >>>
  #<<<create routes for the message resource. Only create a show, create, update, and destroy action >>>
  # after you have created the routes go to the command line and type '$ rake routes to check that you have created the routes correctly'

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # <<< route '/logout' to the users#logout (the logout action of the users controller)>>>
end
