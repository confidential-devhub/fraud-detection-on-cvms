# Setup (secure environment)
This part of the workflow is supposed to be run in a secure environment.

In this section, we will:

* Create syntentic datasets. In a real world, these would be not created but actual credit card transactions, but to simulate a workflow we create them here
* Encryp the datasets so they can be safely uploaded in the cloud
* Download the fraud-detection model

Once this step is done, what the user needs to do is upload the encrypted datasets located in `datasets_enc` to the various cloud.