# https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/welcome.html

require 'aws-sdk-ec2'
require 'base64'

# User code that's executed when the instance starts.
script = '/home/matthews/aws-tools/script.sh'
encoded_script = Base64.encode64(script)

ec2 = Aws::EC2::Resource.new(region: 'us-east-1')

instance = ec2.create_instances({
  image_id: 'ami-0b898040803850657',
  min_count: 1,
  max_count: 1,
  key_name: 'Mojave',
  security_group_ids: ['sg-3fa9bc49'],
  instance_type: 't2.micro',
})

# Wait for the instance to be created, running, and passed status checks
ec2.client.wait_until(:instance_status_ok, {instance_ids: [instance.first.id]})
 
# Name the instance and give it a Group tag 
instance.batch_create_tags({ tags: [{ key: 'Bob', value: 'Your_Uncle' }, { key: 'this', value: 'that' }]})
 
puts "Created #{instance.first.id}"
#ec2 = File.open("ec2.txt", "w")
#ec2.puts instance.first.id
#ec2.close
#
#puts "now ruby ec2_show_instances.rb"
