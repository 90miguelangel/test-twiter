# frozen_string_literal: true

class TweetSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :author_url, :text, :created_at, :updated_at

  def author_url
    user_path(object.user)
  end
end