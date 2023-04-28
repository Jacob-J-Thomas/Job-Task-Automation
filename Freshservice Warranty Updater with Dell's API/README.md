# Freshservice Lease Expiration App

Recently my company asked me to develop an addon application for our helpdesk ticketing system, Freshservice. The goal of the app is to gather all of the devices from our asset records, check those devices warrantly/lease expiry status with Dell's API, and then update the asset cataolgue to include the updated information. 

Currently the project is still in development, which is why this repository is mostly empty, but once I figure out the Freshworks requests, I will plan on adding a WIP version of the app here. I just successfully made an authenticated GET request earlier today, so hopefully it won't be long before I feel I have enough to add the rest of the files.

The powershell script, DellWarrantyChecker.ps1, is an additional program that is designed to do basically the same thing, but rather than being ran nightly, it will be ran as needed by individual colleagues using a CSV file rather than through an API. It will only return a file containing the lease status information, rather than updating it in one of our databases. Development for the script is currently stuck in limbo until we recieve an API key from Dell.
