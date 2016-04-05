Rails.application.routes.draw do
  resources :assaigments
  resources :employments
  resources :professionals
  resources :clinics do
    resources :appointments
  end

##############################################
##############################################
  # resources :clinics, shallow: true  do
  #    member do
  #      get :delete
  #    end

#############################################
#############################################
  #     resources :appointments do
  #       member do
  #        get :delete
  #      end
  #     end
  # #end
end
