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
5. Build the Docker image wth your Newrelic license key `docker build --build-arg NEW_RELIC_LICENSE_KEY='abcd1234efgh5678ijkl9012mnop3456qrst7890uvwyz' -t newrelic-admin-rhel73/python-agent .`
6. If you dont use your license key, the build will run succsesfully with the default `NEW_RELIC_LICENSE_KEY=XXXXXXXXXXX`, but no metrics will be sent to Newrelic. So, please build the image with your Newrelic license key, before launching the container.
7. Once the image is built, launch the container:
* `docker run newrelic-admin-rhel73/python-agent`
8. This will launch the container and send 5 test messages to your NewRelic account
