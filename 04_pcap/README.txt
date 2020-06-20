#01, #02, #03
right click on packet > follow > tcp stream

#04
FTP connection of a client retrieving a file in passive mode
change from tcp stream eq 0 to tcp stream eq 1 and follow stream

#05 tcp.port == [PORT NUMBER]
#06 RSH
#07 Rlogin
#08 SMTP + echo [b64 encoded] | base64 -d
#09 didn't understand RCPT TO
#10 eml

vi data   # begin..end (attachment)
uudecode data
file the_key.zip
unzip the_key.zip
cat tmp/attachment

[OR]

save the entire email as .eml file
view the email in any email client

#11 POP3
#12 IMAP
#13 HTTP
#19 JSON web token
#20	gzip
#21 deflate:  printf "\x1f\x8b\x08\x00\x00\x00\x00\x00"  | cat - pcap_21.deflate | gunzip
#22 chunked encoding
#23	connection: keep-alive

