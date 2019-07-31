# https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/ec2-example-terminate-instance.html

require 'aws-sdk-ec2'
require 'yaml'

ec2 = Aws::EC2::Resource.new(region: 'us-east-1')

#instance_id = YAML.load_file("ec2.txt")
instance_id = "i-081b6fda010eb2feb"

i = ec2.instance(instance_id)
    
if i.exists?
  case i.state.code
  when 48  # terminated
    puts "#{id} is already terminated"
  else
    i.terminate
  end
else
  puts "instance does not exist."
end
