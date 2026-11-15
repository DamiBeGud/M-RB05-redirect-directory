class AliasesController < ApplicationController
  before_action :authenticate,except:[:resolve]
  def create
    row=RedirectEntry.create!(slug:Input.id(params[:slug]),destination:Input.destination(params[:destination]),lookups:0)
    render json:serialize(row),status: :created
  end
  def show = render(json:serialize(RedirectEntry.find_by!(slug:params[:slug])))
  def resolve
    row=RedirectEntry.find_by!(slug:params[:slug]);row.with_lock {row.increment!(:lookups)}
    render json:serialize(row) # Never fetch or redirect to the destination.
  end
  private
  def serialize(row) = row.as_json(only:[:slug,:destination,:lookups])
end
