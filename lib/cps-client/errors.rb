module CPS
  
  class Errors
    
    def self.description(error)
      ERRORS[error.to_s] rescue nil
    end
    
    ERRORS = {
      '1000' => 'Action was successfully completed.',
      '1001' => 'Action was successfully transfered to the sub system. A status update will follow soon.',
      '1002' => 'Change of status received - a further status update will follow soon.',
      '1003' => 'Transaction was started.',
      '5000' => 'The primary DNS answered with an error.',
      '5001' => 'The secondary DNS answered with an error.',
      '5002' => 'Delivery of SMS failed.',
      '5003' => 'The SSL order could not be started.',
      '5004' => 'Registration of domain failed.',
      '5005' => 'Update of domain failed.',
      '5006' => 'Deletion of domain failed.',
      '5007' => 'Status update of Domain failed.',
      '5008' => 'Transfer of domain could not be carried out.',
      '5009' => 'Transfer of domain failed.',
      '5010' => 'Restoration of domain failed.',
      '5011' => 'A handle could not be created by the NIC. The action failed.',
      '5012' => 'A transfer-out-request was refused (NACK) because the domain is in TRANSFER-LOCK.',
      '5013' => 'The migration of the domain/zone failed.',
      '5014' => 'The SSL order was canceled.',
      '5015' => 'Return of payment responsibility (changeover) failed.',
      '5016' => 'A transfer-out-request was denied (NACK) because the assignee has refused it (CLIENT-LOCK).',
      '5017' => 'Registration of hostname failed.',
      '5018' => 'Update of hostname failed.',
      '5019' => 'A transfer-out-request was cancelled (CANCEL).',
      '6000' => 'IP is already in use.',
      '6001' => 'Found an active transaction for the demanded object.',
      '6002' => 'No active transaction found.',
      '6003' => 'No pricing information or active duty found.',
      '6004' => 'No active fees (onhold) found.',
      '6005' => 'Transactions dismatch.',
      '6006' => 'IP is not available.',
      '6007' => 'Demanded User.',
      '6008' => 'Remote command failed.',
      '6009' => 'The execution of the interleaved order CREATE USER caused an error.',
      '6010' => 'Demanded Contact does not exist or the active user does not own the rights to access the handle.',
      '6011' => 'The execution of the interleaved order CREATE CONTACT caused an error.',
      '6012' => 'The contact handle already exists.',
      '6013' => 'The contact handle is in use and cannot be deleted.',
      '6014' => 'The user already exists.',
      '6015' => 'Notification notice-by-recall requires an URL.',
      '6016' => 'Notification notice-by-email requires a target email address.',
      '6017' => 'The user is in use and cannot be deleted.',
      '6018' => 'The application data dismatches the registrary conditions of the responsible registry.',
      '6019' => 'The option chosen for this application is invalid.',
      '6020' => 'The key words are missing in the meta tags of the desired homepage.',
      '6021' => 'The order could not be transfered.',
      '6022' => 'You reached or overstepped your credit limit.',
      '6023' => 'Sending SMS failed.',
      '6024' => 'This zone already exists.',
      '6025' => 'Zone limit reached.',
      '6026' => 'The zone does not exist, the user has no right to access the zone or a wrong product type (attribute) was chosen.',
      '6027' => 'The ACE string seems to be invalid.',
      '6028' => 'The CSR seems to be wrong and could not be parsed.',
      '6029' => 'The common name does not seem to be a correct domain name.',
      '6030' => 'A server for matching data could not be reached (technical or authentication error).',
      '6031' => 'Common name from CSR does not fit the domain in the objectfield.',
      '6032' => 'Wrong certificate type chosen - does not fit to CSR/CN or SAN.',
      '6033' => 'The approver emailaddress does not seem to be usable by CA.',
      '6034' => 'The domain exists and is already managed by the registrar.',
      '6035' => 'The domain already exists.',
      '6036' => 'The domain is not administrated by the demanding user or does not exist.',
      '6037' => 'The domain is not be administrated by the registrar and does not exist.',
      '6038' => 'The domain already exists in the demanding account.',
      '6039' => 'The AUTH-INFO is invalid.',
      '6040' => 'The domain does not exist.',
      '6041' => 'The domain is not administrated by the user or is located in the "Restriction Period".',
      '6042' => 'The host is already subscribed.',
      '6043' => 'The hostname does not base on the root domain.',
      '6044' => 'The host is not be administrated by the demanding user and does not exist.',
      '6045' => 'The check of your nameserver configuration caused an error.',
      '6046' => 'NSENTRY details are missing.',
      '6047' => 'A LATEACK can only be executed together with an UN-LOCK.',
      '6048' => 'The owner-C (values::ownerc) does not match the actual domain holder.',
      '6049' => 'The data of owner-C (values::ownerc) or admin-C (values::adminc) dismatch the registrary conditions of the responsible registry.',
      '6050' => 'No information found for demanded object.',
      '6051' => 'The domain is not administrated by the user or is located in the "Expire Threshold Period" / "Auto Renew Period".',
      '6052' => 'The transaction was denied by the assignee.',
      '6053' => 'Starting authorisation of transaction failed.',
      '6054' => 'Too many active connections to the sub-system.',
      '6055' => 'The query results in too many data records.',
      '6056' => 'The object\'s data could not be synchronized with the order cache.',
      '6057' => 'Domain status prohibits this operation.',
      '6058' => 'Hostname status prohibits this operation.',
      '6059' => 'SSL Certificate status prohibits this operation.',
      '6060' => 'Access to this domain is restricted.',
      '6061' => 'The zone does not exist.',
      '6062' => 'The zone already exists in the demanding account.',
      '6063' => 'The data of the CSR do not meet the requirements of the CA.',
      '7000' => 'The customer number ist invalid.',
      '7001' => 'The username is invalid.',
      '7002' => 'The password is invalid.',
      '7003' => 'The object goup is invalid.',
      '7004' => 'The reference number is invalid.',
      '7005' => 'The chosen action is invalid.',
      '7006' => 'The chosen attribute is invalid.',
      '7007' => 'The insert IP is invalid.',
      '7008' => 'The field request_action is invalid.',
      '7009' => 'The field values::servicepwd is incorrect.',
      '7010' => 'The field values::street is incorrect.',
      '7011' => 'The field values::billc is incorrect.',
      '7012' => 'The field values::techc is incorrect.',
      '7013' => 'The field values::servicepwd is incorrect.',
      '7014' => 'The field values::iso_country is incorrect.',
      '7015' => 'The field values::lang is incorrect.',
      '7016' => 'The field values::adminc is incorrect.',
      '7017' => 'The field values::super_user is incorrect.',
      '7018' => 'The field values::postal is incorrect.',
      '7019' => 'The field values::city is incorrect.',
      '7020' => 'The field first name of admin-c is invalid.',
      '7021' => 'The field last name of admin-c is invalid.',
      '7022' => 'The field first name of bill-c is invalid.',
      '7023' => 'The field first name of tech-c is invalid.',
      '7024' => 'The field last name of bill-c is invalid.',
      '7025' => 'The field last name of tech-c is invalid.',
      '7026' => 'The field values::user is invalid.',
      '7027' => 'The time format of field values::begin is invalid.',
      '7028' => 'The time format of field values::end is invalid.',
      '7029' => 'The field values::firstname is incorrect.',
      '7030' => 'The field values::lastname is incorrect.',
      '7031' => 'The field values::orgname is incorrect.',
      '7032' => 'The field values::street is incorrect.',
      '7033' => 'The field values::postal is incorrect.',
      '7034' => 'The field values::city is incorrect.',
      '7035' => 'The field values::state is incorrect.',
      '7036' => 'The field values::iso_country is incorrect.',
      '7037' => 'The field values::phone is incorrect.',
      '7038' => 'The field values::fax is incorrect.',
      '7039' => 'The field values::email is incorrect.',
      '7040' => 'The chosen user status is invalid.',
      '7041' => 'The chosen password is invalid.',
      '7042' => 'The chosen option for the notification notice-by-poll is invalid.',
      '7043' => 'The chosen option for the notification notice-by-recall is invalid.',
      '7044' => 'The chosen option for the notification notice-by-email is invalid.',
      '7045' => 'The chosen recall URL is invalid.',
      '7046' => 'The sender email address is invalid.',
      '7047' => 'The receiver email address is invalid.',
      '7048' => 'The field values::object is incorrect.',
      '7049' => 'The user rights for the range account are invalid.',
      '7050' => 'The user rights for the range user are invalid.',
      '7051' => 'The user rights for the range contact are invalid.',
      '7052' => 'The user rights for the range domain are invalid.',
      '7053' => 'The user rights for the range DNS are invalid.',
      '7054' => 'The user rights for the range SSL-Cert are invalid.',
      '7055' => 'The user rights for the range SMS are invalid.',
      '7056' => 'The user rights for the range submit are invalid.',
      '7057' => 'The chosen contact is invalid.',
      '7058' => 'Der user name in the object field is invalid.',
      '7059' => 'The chosen domain name is invalid.',
      '7060' => 'The field values::group is invalid.',
      '7061' => 'The field values::account_invoice_num is invalid.',
      '7062' => 'The field values::view is invalid.',
      '7063' => 'The target number in the object field is invalid.',
      '7064' => 'The field enable_flash can only be yes or no.',
      '7065' => 'The field sender_id can only consist of 11 alpha numeric characters or 16 numeric characters.',
      '7066' => 'The field message_text is incorrect.',
      '7067' => 'One of the NS record fiels is invalid.',
      '7068' => 'The domain in the object field is invalid.',
      '7069' => 'One of the MX record fields is invalid.',
      '7070' => 'One of the TXT records is invalid.',
      '7071' => 'One of the CNAME record fields is invalid.',
      '7072' => 'One of the A record fields is incorrect.',
      '7073' => 'The master IP is invalid.',
      '7074' => 'The field values::domain is invalid.',
      '7075' => 'The field vaules::native_domain is invalid.',
      '7076' => 'The CSR is incorrect.',
      '7077' => 'The approver email is invalid.',
      '7078' => 'The certificate type is invalid.',
      '7079' => 'The field values::common_name is invalid.',
      '7080' => 'The field values::status is invalid.',
      '7081' => 'The field values::expire_end is invalid.',
      '7082' => 'The field values::expire_begin is invalid.',
      '7083' => 'The field values::sslcert_type is invalid.',
      '7084' => 'The field values::object_id is invalid.',
      '7085' => 'The desired action / the demanded product are not available.',
      '7086' => 'One of the DNS host names is invalid.',
      '7087' => 'One of the DNS host IPs is invalid.',
      '7088' => 'The field values::ownerc is incorrect.',
      '7089' => 'The field values::ownerc::lastname is incorrect.',
      '7090' => 'The field values::ownerc::firstname is incorrect.',
      '7091' => 'The field values::active is incorrect.',
      '7092' => 'The field values::auth_info is incorrect.',
      '7093' => 'The host name in the Object field is invalid.',
      '7094' => 'The root domain (values::parent_domain) is invalid.',
      '7095' => 'The IP (values::ip) is invalid.',
      '7096' => 'The field values::auto_renew is invalid.',
      '7097' => 'The field values::transfer_lock is invalid.',
      '7098' => 'The field values::hostname is invalid.',
      '7099' => 'One of the NSENTRY fields is invalid.',
      '7100' => 'The option values::denic_lateack is incorrect.',
      '7101' => 'The AUTH-CODE is invalid.',
      '7102' => 'Error in the additional declaration REG-number.',
      '7103' => 'Error the additional declaration REG-type.',
      '7104' => 'Error the additional declaration REG-date.',
      '7105' => 'Error the additional declaration REG-location.',
      '7106' => 'Error the additional declaration REG-AUTH.',
      '7107' => 'The field values::attribute is invalid.',
      '7108' => 'The field values::action is invalid.',
      '7109' => 'The structure of your XML order is incorrect.',
      '7110' => 'The field values::privacy_rule is incorrect.',
      '7111' => 'The field values::publicc is incorrect.',
      '7112' => 'The field last name of public-c is invalid.',
      '7113' => 'The field first name of public-c is invalid.',
      '7114' => 'The field values::contact_type is incorrect.',
      '7115' => 'The chosen report source (object group) is incorrect.',
      '7116' => 'The output format is invalid.',
      '7117' => 'One of the AAAA record fields is incorrect.',
      '7118' => 'The field values::delegation is invalid.',
      '7119' => 'The field values::ttl is invalid.',
      '8000' => 'This IP is not authorised for accessing our system.',
      '8001' => 'The IP could not be auhorised by the used account.',
      '8002' => 'The account could not be found.',
      '8003' => 'The user could not be found.',
      '8004' => 'Authentication failed. Please check the password.',
      '8005' => 'Account is inactive.',
      '8006' => 'User is inactive.',
      '8007' => 'User privileges forbid this action.',
      '8008' => 'Chosen module or duty is under maintenance.',
      '8009' => 'Too many active connections for this resource.',
      '8010' => 'User temporarily blocked.',
      '9000' => 'System temporary not available - System locked.',
      '9001' => 'Critical error by ROLLBACK to DBMS while writing transaction.',
      '9002' => 'Critical error by ROLLBACK after invalid COMMIT to DBMS after a transaction.',
      '9003' => 'RegEx table access violation.',
      '9004' => 'IP table access violation.',
      '9005' => 'Account table access violation.',
      '9006' => 'User table access violation.',
      '9007' => 'Critical Error by ROLLBACK to DBMS while transaction.',
      '9008' => 'Module table access violation.',
      '9009' => 'No active module for machining available or rather error while loading module.',
      '9010' => 'Transaction table access violation.',
      '9011' => 'Pricing table access violation.',
      '9012' => 'Critical Error while reading the auto increment value.',
      '9013' => 'Debug breakpoint. Please try again later.',
      '9014' => 'SQL writing transaction failed.',
      '9015' => 'COMMIT failed. Reverse execution follows.',
      '9016' => 'Error on SQL prepare order.',
      '9017' => 'Active bill table access violation.',
      '9018' => 'Contact table access violation.',
      '9019' => 'Access table access violation.',
      '9020' => 'Bill log table access violation.',
      '9021' => 'Account balance table access violation.',
      '9022' => 'Account billing details table access violation.',
      '9023' => 'Service table access violation',
      '9024' => 'Active transaction table access violation.',
      '9025' => 'DNS zones table access violation.',
      '9026' => 'Service table access violation.',
      '9027' => 'SSL-Certs table access violation.',
      '9028' => 'Domain names table access violation.',
      '9029' => 'Host name table access violation.',
      '9030' => 'Domain additional Value access violation.',
      '9031' => 'Active-Transactions-Approvals table access violation.',
      '9032' => 'Active-Sessions table access violation.',
      '9033' => 'Active-Transactions-Email-Crontab table access violation.',
      '9034' => 'Footnotes access violation.',
      '9035' => 'Object cache access violation.',
      '9036' => 'Contact reference table access violation.',
      '9037' => 'Restricted domains access violation.',
      '9038' => 'Credit data access violation.',
      '9039' => 'Order stack table access violation.',
      '9040' => 'Exchange rates table access violation.'
    }
  end
end