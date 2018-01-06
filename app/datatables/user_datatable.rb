class UserDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      name: { source: "User.name", cond: :like },
      age: { source: "User.age", cond: :eq },
      email: { source: "User.email", cond: :like },
      company: { source: "User.company", cond: :like },
      job: { source: "User.job", cond: :like }
    }
  end

  def data
    records.map do |record|
      u = record
      {
        "name": u.name,
        "age": u.age,
        "email": u.email,
        "company": u.company,
        "job": u.job,
      }
    end
  end

  private

  def get_raw_records
    # insert query here
    User.all
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
