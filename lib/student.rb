class Student
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id=nil)
    if id == nil
      @id = id
      @name = name
      @grade = grade
    else
      sql = "UPDATE students SET name = ?, grade = ? WHERE id = ?;"
      DB[:conn].execute(sql, self.name,self.grade, self.id)
    end
  end

  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade INTEGER
    )"
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE students"
    DB[:conn].execute(sql)
  end

  def save
    sql = "INSERT INTO students (name, grade) VALUES (?,?)"
    DB[:conn].execute(sql, self.name, self.grade)
  end
end
