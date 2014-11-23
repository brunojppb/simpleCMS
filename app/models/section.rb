class Section < ActiveRecord::Base

    belongs_to :page
    has_many :section_edits
    has_many :editors, :through => :section_edits, :class_name => "User"

    acts_as_list :scope => :page

    after_save :touch_page

    private

        def touch_page
            #touch is similar to
            #subject.update_attribute(:updated_at, Time.now)
            page.touch
        end
end
