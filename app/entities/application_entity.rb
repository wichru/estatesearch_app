class ApplicationEntity < Dry::Struct
  extend ::ActiveModel::Naming

  include ::ActiveModel::Serialization

  transform_keys(&:to_sym)
end
