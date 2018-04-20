class GroupsController < ApplicationController
    def index
        @user = User.find(session[:id])
        @orgs = Org.all
    end

    def create
        @org = Org.new(name: params[:name], desc: params[:desc], user: User.find(session[:id]))
        if @org.save
            Membership.create(user: User.find(session[:id]), org: @org)
            redirect_to '/groups'
        else
            flash[:errors] = @org.errors.full_messages
            redirect_to '/groups'
        end
    end

    def show
        @user = User.find(session[:id])
        @org = Org.find(params[:id])
        @members= @org.users

    end

    def join
        @mem = Membership.new(user: User.find(session[:id]), org: Org.find(params[:id]))
        @mem.save
        redirect_to "/groups/#{params[:id]}"
    end


    def leave
        Membership.find_by(user: User.find(session[:id]), org: Org.find(params[:id])).destroy
        redirect_to "/groups/#{params[:id]}"
    end

    def destroy
        group = Org.find(params[:id]).destroy
        redirect_to "/groups"
    end


end
