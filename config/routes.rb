Rails.application.routes.draw do

  #General Comments
  #################################################################################
  # NOTE: Get an overview of all your route at the command line with "$rake routes".

  # There are two basic ways to declare the routes for your application:
  # individually or as a set of actions for a resource.

  # To declare a route individually you must specify an http action, a url name, and an action in a controller

  # the format is:
  # <verb> '<string url>', to: '<controller>#<action>'

  # an example would be
  # get '/photo', to: 'photo#index'

  # The second way is to declare all of the routes for a resource

  # an example would be
  # resources :photo

  # be default this will create 7 routes based around the user resource: index, show, edit, update, new, create, destroy

  # you can also limit a resource if you don't need all the routes. an example would be:

  # resources :photos, only: [:show, :destroy]
  # or
  # resources :photos, except: [:show, :destroy]

  # for more info on resources checkout http://guides.rubyonrails.org/routing.html#crud-verbs-and-actions

  # there is also usually a special route declaration that specifies where the base url '/' routes to

  # Once you have read the instructions, delete the line that says "root 'home#help'" and uncomment the line that says "root 'home#index'" to get started
  # existing code
  ##################################################################################

  root 'home#help'
  # root 'home#index'

  resources :sessions, only: [:create, :new]
  get 'logout' => 'sessions#destroy'
  get 'help' => 'home#help'


# code for completion
###########################################################################################
  #<<<create routes for the user resource. Create all routes except: destroy, edit, index and update >>>

  #<<<create routes for the message resource. Only make a create route >>>

  # after you have created the routes go to the command line and type '$ rake routes to check that you have created the routes correctly'

end
