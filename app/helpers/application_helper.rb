# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
def pagination_links_remote(paginator)
  page_options = {:window_size => 10}
  pagination_links_each(paginator, page_options) do |n|
    options = {
      :url => {:controller=>"/admin/home",:action => 'index', :params => params.merge({:page => n})},
      :update => 'list',
      :before => "Element.show('spinner')",
      :success => "Element.hide('spinner')"
    }
    html_options = {:href => url_for(:controller=>"/admin/home",:action => 'index', :params => params.merge({:page => n}))}
    link_to_remote("<b>"+n.to_s+"</b>", options, html_options)
  end
end

def sort_td_class_helper(param)
  result = 'class="sortup"' if params[:sort] == param
  result = 'class="sortdown"' if params[:sort] == param + "_reverse"
  return result
end
def sort_link_helper(text, param)
  
  key = param
  key += "_reverse" if params[:sort] == param
  options = {
      :url => {:controller=>"/admin/home",:action => 'index', :params => params.merge({:sort => key, :page => nil})},
      :update => 'list',
      :before => "Element.show('spinner')",
      :success => "Element.hide('spinner')"
  }
  html_options = {
    :title => "Sort by this field",
    :href => url_for(:controller=>"/admin/home",:action => 'index', :params => params.merge({:sort => key, :page => nil}))
  }
  link_to_remote(text, options, html_options)
end



end
