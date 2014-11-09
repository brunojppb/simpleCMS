class User < ActiveRecord::Base
    
    #configure security
    has_secure_password


    has_and_belongs_to_many :pages
    has_many :section_edits
    has_many :sections, :through => :section_edits
    #to configure a different table name:
    #self.table_name = "admin_users"

    def name
        return "#{first_name} #{last_name}"
    end

end
