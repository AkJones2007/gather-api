class GatheringsSerializer < ActiveModel::Serializer

  attributes :id, :user, :title, :date, :location, :description

end
