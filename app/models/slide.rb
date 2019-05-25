class Slide < ApplicationRecord
  
  module Group
    LANDING = "landing"
  end
  
  module Style
    THREE_LINES = "three_lines"
    TWO_LINES_LEFT = "two_lines_left_aligned"
    TWO_LINES_CENTERED = "two_lines_center_aligned"
  end
  
  def self.groups
    [Group::LANDING]
  end
  
  def self.styles
    [Style::THREE_LINES, Style::TWO_LINES_LEFT, Style::TWO_LINES_CENTERED]
  end
  
  def self.groups_hash
    self.groups.inject(Hash.new) do |collection, slide_group|
      collection[slide_group.to_sym] = I18n.t("activerecord.values.slide.groups.#{slide_group}")
      collection
    end
  end
  
  def self.styles_hash
    self.styles.inject(Hash.new) do |collection, style|
      collection[style.to_sym] = I18n.t("activerecord.values.slide.styles.#{style}")
      collection
    end
  end
  
  def self.enabled_for(style)
    self.where(is_enabled: true, group: style).order('index ASC')
  end
  
  def group_localized
    I18n.t('activerecord.values.slide.groups')[self.group.to_sym]
  end
  
  def style_localized
    I18n.t('activerecord.values.slide.styles')[self.style.to_sym]
  end
  
  def is_three_lines_style?
    self.style.eql?(Style::THREE_LINES)
  end
  
  def is_two_lines_center_aligned_style?
    self.style.eql?(Style::TWO_LINES_CENTERED)
  end
  
end
