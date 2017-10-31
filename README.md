# RedHat OpenShift image with Newrelic's Python agent

This is a test application for the New Relic Python plugin
Instructions for building and running:

**NOTE - this Docker container requires two things:**

1. An ISV / partner account with Red Hat as you need to run the container on a RHEL7 host
2. An account / license key from Newrelic - https://newrelic.com/signup

After getting the above, then proceed with the below
1. Install a RHEL7 host
2. Install Docker on that host
3. Download/clone this git repo
4. Go to https://www.newrelic.com and obtain a license key.
5. Edit the newrelic.ini file - find the following:
* `license_key = XXXXXXXXXXX` <-- replace this with your license key
6. Save the file
7. Build the Docker image `docker build -t newrelic-admin-rhel73/python-agent .`
8. Once the image is built, launch the container:
* `docker run newrelic-admin-rhel73/python-agent`
9. This will launch the container and send 5 test messages to your NewRelic account
