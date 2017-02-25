class Owner
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods
  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    name: "TEXT",
  }

  attr_accessor(*self.public_attributes)
  attr_reader :id

  def restaurants
#     this is off.
    sql = <<-SQL
      SELECT * FROM restaurants
      WHERE customer_id = ?
    SQL
    self.class.db.execute(sql, self.id)
  end
end
