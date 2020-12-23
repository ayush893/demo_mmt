module Api
  module V1
    class MmtsController < ApplicationController
      include JSONAPI::ActsAsResourceController
      before_action :authenticate_user!
      before_action :authorize_member, only: [:update, :delete]
      before_action :authorize_collection, only: [:create]

      def context
        { user: current_user }
      end

      def authorize_collection
        return render_forbidden if current_user.normal? ##todo create funtion for forbidden
      end

      def authorize_member
        return render_forbidden if current_user.normal?
      end
    end
  end
end