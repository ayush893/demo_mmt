module Api
  module V1
    class MMTResource < JSONAPI::Resource
      attributes :email, :name, :kind, :user_id, :mentor_id, :password
      #before_action :authenticate_user!

      def self.updatable_fields(context)
        if context[:mmt].admin?
          super 
        else
          render_forbidden
      end

      def self.creatable_fields(context)
        if context[:mmt].admin?    #todo: have to add kind of admin in the mmt table
          super 
        else
          render_forbidden

        end
      end

      def fetchable_fields

        if (context[:mmt].normal?)
          super - [:password]
        else
          super
        end
      end


    end
  end
end
