namespace :ec2 do

  desc "Show all information about EC2 instances that match this project"
  task :status do
    ec2_handler.status_table
  end

  desc "Show EC2 server names that match this project"
  task :server_names do
    ec2_handler.server_names
  end

  desc "Show EC2 instance IDs that match this project"
  task :instance_ids do
    ec2_handler.instance_ids
  end

  desc "Show EC2 host_ips that match this project, optional filter for cap role: ec2:host_ips[<role>]"
  task :host_ips, :role do |_t, args|
    roles = args[:role] ? [ args[:role] ] : [:app, :web, :db]
    puts ec2_handler.host_ips(roles)
  end

end


namespace :load do
  task :defaults do

    set :ec2_config, 'config/ec2.yml'

    set :ec2_project_tag, 'Project'
    set :ec2_roles_tag, 'Roles'
    set :ec2_stages_tag, 'Stages'

    set :ec2_access_key_id, nil
    set :ec2_secret_access_key, nil
    set :ec2_region, %w{}

  end
end
