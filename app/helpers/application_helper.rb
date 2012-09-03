# -*- encoding : utf-8 -*-
module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = 'Żłobek Kubusiowy Raj'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def menu_link_to(controller, action, *args, &block)
    if controller == controller_name && (action.nil? || action == action_name)
      if args.third.nil?
        args.push({:class => 'selected'})
      else
        args.third.merge!({:class => 'selected'})
      end
    end

    link_to *args, &block
  end
end
