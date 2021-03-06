Sequel.migration do
  up do
    extension :pg_json

    create_table(:projects) do
      primary_key :id
      String :name, :null=>false
      String :github_name, :null=>false
      String :rubygems_name, :null=>false
      String :reference, :null=>false
      json :agility_total_data
      json :agility_quarters_data
      json :community_total_data
      json :community_quarters_data
    end

    # WDYT?
    # create_table(:references) do
    #   primary_key :id
    #   references :project
    #   String :type, null: false
    # end
  end

  down do
    drop_table(:projects)
  end
end
