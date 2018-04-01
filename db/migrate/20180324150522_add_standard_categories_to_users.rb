class AddStandardCategoriesToUsers < ActiveRecord::Migration[5.1]
  def change
    default_categories =
      %w[Transportation Food House Entertainment Health Other]

    User.find_each do |user|
      default_categories.each do |category|
        user.sub_categories.create(name: category, user: user)
      end
    end
  end
end
