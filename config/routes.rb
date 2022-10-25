Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
 namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
    root to: "homes#top"
 end

   scope module: :public do
   root to: "homes#top"
   get '/about' => 'homes#about', as: 'about'
   resources :items, only: [:index, :show]
   resources :customers, only: [:show, :edit, :update, :withdraw, :unsubscribe]
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
