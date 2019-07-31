require 'aws-sdk-ec2'
require 'json'

ec2 = Aws::EC2::Resource.new(region: 'us-east-1')
      
ec2.instances.each do |i|
  puts "#{i.id} #{i.state.name}"

  case i.state.name
  when 'running'
    this = {"#{i.data.instance_id}" => "#{i.data.public_ip_address}"}
    puts this
  else
  end

end
