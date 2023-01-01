#!/bin/bash
#DING => abbreviation of DIG and PING

# Ask the user for a URL
echo "Enter the URL: "
read url
echo ""

# Find the IP addresses of the URL using the dig command, with a time limit of 10 seconds
ip_addresses_dig=($(timeout 10s dig $url +short))

# Find the IP address of the URL using the ping command, with a time limit of 10 seconds
ip_address_ping=$(timeout 10s ping -c 1 $url | grep PING | cut -d "(" -f 2 | cut -d ")" -f 1)

unique_ip_addresses=()

for ip_address_dig in "${ip_addresses_dig[@]}"; do
  unique_ip_addresses+=("$ip_address_dig")
done

# If we get IP address from the ping command then we will check that if the IP address returned by the ping command is not already in the array
if [[ -n "$ip_address_ping" ]]; then
  if ! [[ " ${unique_ip_addresses[@]} " =~ " ${ip_address_ping} " ]]; then
    # If the IP address is not already in the array, we will add it to the array
    unique_ip_addresses+=("$ip_address_ping")
  fi
fi

# If the array is not empty, we will make a curl request for each unique IP address
if [[ ${#unique_ip_addresses[@]} -gt 0 ]]; then
  echo "The unique IP addresses & possible ASN for $url are:"
  echo ""
  for unique_ip_address in "${unique_ip_addresses[@]}"; do
    echo "IP Address: $unique_ip_address"
    response=$(curl -s "https://api.hackertarget.com/aslookup/?q=$unique_ip_address")
    # Use jq to parse the response and extract the ASN
    asn=$(echo "$response")
    echo "ASN: $asn"
    echo ""
  done
else
  echo "No IP addresses were found for $url"
fi
