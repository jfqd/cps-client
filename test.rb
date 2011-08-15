#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/lib/cps-client.rb'

DELETE_DOMAIN == false

CID = 'your-cid'
UID = 'your-uid'
PWD = 'your-pwd'

server = CPS::Client.new(
            :cid => CID,
            :uid => UID,
            :pwd => PWD,
            :production => false
          )

client_contact = CPS::Contact.new(
            :object      => 'qd1234',
            :firstname   => 'Peter',
            :lastname    => 'Pan',
            :street      => 'Brunnengasse 34',
            :postal      => '60127',
            :city        => 'Frankfurt am Main',
            :state       => 'Hessen',
            :iso_country => 'DE',
            :phone       => '+49 694711',
            :fax         => '+49 694711',
            :email       => 'peter.pan@example.com'
          )

company_contact = CPS::Contact.new(
            :object      => 'qd0001',
            :firstname   => 'Paulär',
            :lastname    => 'Panter',
            :street      => 'Brunnengasse 1',
            :postal      => '60127',
            :city        => 'Frankfurt am Main',
            :state       => 'Hessen',
            :iso_country => 'DE',
            :phone       => '+49 69471123',
            :fax         => '+49 69471124',
            :email       => 'paulaer.panter@example.com'
          )

# cause of a bug in the arpote test system we need to create every time a new domain...
domain_number = (rand() * 10000).to_i.to_s
domain = CPS::Domain.new(
            :domain => "example-domain-#{domain_number}.com",
            :adminc => 'QD1234',
            :techc  => 'QD0001',
            :billc  => 'QD0001',
            :ownerc => 'QD1234',
            :ns1    => 'my1.dns.com',
            :ns2    => 'my2.dns.com'
          )

unless server.query(client_contact.info) # return true if contact handle exists
  # Create client contact handle
  if server.query(client_contact.create)
    puts "Contact created: #{server.result_code}: #{server.result_message}"
  else
    puts "Error: #{server.data}"
    puts "#{server.result_code}: #{server.result_message} #{server.request}"
    exit 1
  end
else
  puts "Client contact handle exists: #{client_contact.object}"
end

unless server.query(company_contact.info) # return true if contact handle exists
  # Create company contact handle
  if server.query(company_contact.create)
    puts "Contact created: #{server.result_code}: #{server.result_message}"
  else
    puts "Error: #{server.data}"
    puts "#{server.result_code}: #{server.result_message} #{server.request}"
    exit 1
  end
else
  puts "Company contact handle exists: #{company_contact.object}"
end

# if server.query(client_contact.info)
#   puts "Contact info: #{server.data}"
#   puts "#{server.result_code}: #{server.result_message}"
# else
#   puts "Error: #{server.data}"
#   puts "#{server.result_code}: #{server.result_message} #{server.request}"
#   exit 1
# end

# create domain
unless server.query(domain.info) # return true if domain is registered
  if server.query(domain.create)
    puts "Domain created: #{server.result_code}: #{server.result_message}"
  else
    puts "Error: #{server.data}"
    puts "#{server.result_code}: #{server.result_message} #{server.request}"
    exit 1
  end
else
  puts "Domain exists: #{domain.domain}"
end

# if server.query(domain.info)
#   puts "Domain info: #{server.data}"
#   puts "#{server.result_code}: #{server.result_message}"
# else
#   puts "Error: #{server.data}"
#   puts "#{server.result_code}: #{server.result_message} #{server.request}"
#   exit 1
# end

# TODO: domain.transfer
# TODO: domain.transfer_lock

if DELETE_DOMAIN == true
  
  if server.query(domain.delete)
    puts "Domain delete: #{server.result_code}: #{server.result_message}"
  else
    puts "Error: #{server.data}"
    puts "#{server.result_code}: #{server.result_message} #{server.request}"
    exit 1
  end

  if server.query(client_contact.delete)
    puts "Contact deleted: #{server.result_code}: #{server.result_message}"
  else
    puts "Error: #{server.data}"
    puts "#{server.result_code}: #{server.result_message}"
    exit 1
  end

  if server.query(company_contact.delete)
    puts "Contact deleted: #{server.result_code}: #{server.result_message}"
  else
    puts "Error: #{server.data}"
    puts "#{server.result_code}: #{server.result_message}"
    exit 1
  end

end

exit 0