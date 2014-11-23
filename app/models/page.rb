class Page < ActiveRecord::Base

    belongs_to :subject
    has_many :sections
    has_and_belongs_to_many :editors, :class_name => "User"

    before_validation :add_default_permalink
    after_save :touch_subject

    validates_presence_of :permalink



    acts_as_list :scope => :subject

    private

        def add_default_permalink
          if self.permalink.blank?
            self.permalink = "#{id}-#{name.parameterize}"
          end
        end

        def touch_subject
            #touch is similar to
            #subject.update_attribute(:updated_at, Time.now)
            subject.touch
        end

end
