class Category < ActiveRecord::Base
    validates_uniqueness_of :name, message: 'Categoria já existe    '
end
