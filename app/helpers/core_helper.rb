module CoreHelper
  def public_continuum(size = 40)
    public_timeline = []
    
    current_user.received_messages.collect{|m|
      timeline = Timeline.new
      timeline.profile = m.from.profile 
      timeline.action = 'received'
      timeline.item_type = 'Message'
      timeline.item_id = m.id
      timeline.date = m.created_at
        
      public_timeline << timeline
    }
    
    
    Activity.by_user(current_user.id).find(:all, :limit=> size, :order => " created_at DESC").collect{|a|
      timeline = Timeline.new
      timeline.profile = a.user.profile
      timeline.action = a.action
      timeline.item_type = a.item_type
      timeline.item_id = a.item_id
      timeline.date = a.created_at
        
      public_timeline << timeline
    }
    
    public_timeline.sort!{|a,b| b.date <=> a.date}

    public_timeline.collect{|a|
      content_tag :li do 
        profile = content_tag :div, :class => "image" do 
          link_to icon_for_profile(a.profile, 'tiny'), profile_path(a.profile)
        end
        text = content_tag :div, :class => "text" do 
          " #{link_to(a.profile.full_name, profile_path(a.profile))} #{resolve_action(a.action, a.item_type, a.item_id)} <br/><span>#{distance_of_time_in_human a.date}</span>"
        end
        profile + text
      end
    }    
  end

  class Timeline
    attr_accessor :profile, :action, :item_type, :item_id, :date
  end

  def distance_of_time_in_human(date)
    if (Time.now - date) < 1.day
      distance_of_time_in_words_to_now date
    else
      I18n.l date.getlocal, :format => 'long'
    end
  end
    
  private
  
  def resolve_action(action, type, id)
    current_action = action
    action_type = type
    
    if type == 'User'
      current_action = "#{I18n.t('tog_core.interface.join')}"
      action_type = "#{I18n.t('tog_core.interface.social_network')}" 
      
    elsif type == 'Membership'
      current_action = "#{I18n.t('tog_core.interface.create')}"
      membership = Kernel.const_get(type).find id
      action_type = "#{I18n.t('tog_core.interface.group')} #{link_to(membership.group.name, group_path(membership.group))}"
    
    elsif type == 'Group'
      current_action = "#{I18n.t('tog_core.interface.join')}"
      group = Kernel.const_get(type).find id
      action_type = "#{I18n.t('tog_core.interface.group')} #{link_to(group.name, group_path(group))}"
      
    elsif type == 'Message'
      current_action = "#{I18n.t('tog_core.interface.received')}"
      message = Kernel.const_get(type).find id
      action_type = "#{link_to(message.subject, member_message_path(message))}"
    end

    "#{current_action} #{action_type}"
  end
end