
Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'club3/new'
  get 'giaodien/trangchu'
  get 'giaodien/datsan'
  get 'giaodien/tintuc'
  get 'giaodien/doibong'
  get 'giaodien/lienhe'
 get"xacnhan/:id" => "lichdau2#xacnhan"
 get"huy/:id" => "lichdau2#huy1"
  get"club2" => "club2#new"
  post"club2" => "club2#create"
  post"/timdoithu/:id/edit" =>"timdoithu#create1"
  get"taoclub2" => "taoclub2#new"
  resources :theloais , :loaitins, :tintucs  ,:doibongs ,:users , :taoclub1 ,:timdoithu ,:lichdau2

  get 'dang-nhap', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   delete  'logout',to: 'sessions#destroy'
   get '/profile', to: 'users#profile'
   post '/update', to: 'users#editprofile'
   get '/booking_request', to: 'users#booking'
   get '/delete/:id', to: 'users#delete'
   get '/change_password', to: 'users#changepw'

   get '/login_owner', to: 'owner#login_owner'
   post '/login_owner', to: 'owner#login_own'
   get '/chu-san/quan-ly', to: 'owner#manage'
   get '/chu-san/chi-tiet', to: 'owner#editpitch'
   get '/chu-san/thong-tin-ca-nhan', to: 'owner#profile_owner'
   get '/chu-san/them-san', to: 'owner#addpitch'
   get '/chu-san/edit/:id', to: 'owner#edit'
   get '/chu-san/quan-ly-dt', to: 'owner#doanhthu'
   post '/chu-san/edit/:id', to: 'owner#edit_pitch'
   post '/chu-san/addpitch', to: 'owner#add'
   post '/chu-san/update-profile', to: 'owner#update_profile'
   get '/verify/:id', to: 'owner#verify'
   get '/cancel/:id', to: 'owner#cancel'

   get 'tim-san', to: 'all_pitch#index'
   get '/san/:id', to: 'pitch#index'
   get '/dat-san/:id', to: 'pitch#book'
   post '/tickets/:ticket', to: 'pitch#book2'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
