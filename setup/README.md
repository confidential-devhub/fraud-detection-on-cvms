# Setup (secure environment)
This part of the workflow is supposed to be run in a secure environment.

In this section, we will:

* Develop the fraud-detection model
* Create syntentic datasets. In a real world, these would be not created but actual credit card transactions, but to simulate a workflow we create them here
* Encryp the datasets so they can be safely uploaded in the cloud

Once this step is done, what the user needs to do is:

1. Upload the `artifact` and `setup` folder in a secure repository/registry so that they can be downloaded by the CVM that will deploy the model
2. Upload the encrypted datasets located in `datasets_enc` to the various cloud.