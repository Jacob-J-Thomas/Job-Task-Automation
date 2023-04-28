# Freshservice Lease Expiration App

Recently my company asked me to develop an addon application for our helpdesk ticketing system, Freshservice. The goal of the app is to gather all of the devices from our asset records, check those devices warrantly/lease expiry status with Dell's API, and then update the asset cataolgue to include the updated information. 

Currently the project is still in development, but I just succesfully made a GET request recieveing a list of all assets, and I will plan on adding the code here once I am able to successfuly place a PUT request as well.

The powershell script, Freshservice Warranty Updater, is an additional powershell script that is designed to do basically the same thing, but rather than being ran nightly, it will be ran as needed by individual colleagues using a CSV file rather than a GET request. It will only return a file containing the lease status information, rather than updating it in one of our databases. Development for the script is currently stuck in limbo until we recieve an API key from Dell.
