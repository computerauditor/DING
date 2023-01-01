# DING
A simple bash script that utilize both Dig and Ping commands to find the IP address of a given URL, as a bonus it can also find out possible ASN number using the hackertarget AS-Lookup API.

# Preview 

![capture](https://user-images.githubusercontent.com/117805200/210173855-40f73601-8889-4661-aa03-ab9f5a88f7b1.png)

# Installation

1) Its a simple bash script hence copy paste or clone this repo using the git clone command 

```
git clone https://github.com/computerauditor/DING.git
```

2) Make sure that you have given proper permission to run this script, you can use the following command in linux or debian based systems to make it an executable script:- 

* Moving to the directory 
```
cd DING/
```
* Making it executable 
```
chmod +x ding.sh
```
3) Run the script using ./ding.sh and provide the url 

# Note
Please note that we can only make upto 50 requests using this API thereafter we would need API keys, kindly refer the [hackertarget](https://hackertarget.com/as-ip-lookup/) website for further reference.  

# Credits
* Infosec Community {For so much support and motivation}
* HackerTarget team {For this awesome API}

# Usage: 
```./ding.sh```
or ```bash ding.sh```
