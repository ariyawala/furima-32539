crumb :root do
  link "Home", root_path
end

crumb :items_new do
  link "商品出品", new_item_path
  parent :root
end

crumb :items_show do
  if params[:item_id].present?
    item = Item.find(params[:item_id])
    link "商品詳細：#{item.item_name}", item_path(item.id)
  else
    item = Item.find(params[:id])
    link "商品詳細：#{item.item_name}", item_path(item.id)
  end
  parent :root
end

crumb :items_edit do
  link "編集", item_path
  parent :items_show
end

crumb :items_order do
  link "購入", item_orders_path
  parent :items_show
end

crumb :log_in do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :register do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :register2 do
  link "詳細登録", details_path
  parent :register
end

