# fraud-detection-on-cvms

Jupyter notebook to build and deploy fraud detection on CoCo.

`setup_secure_env` contains all the scripts to download fraud detection and to create an "input" dataset to then upload to Azure.

Then the remaining notebooks take care of downloading the data from Azure, decrypting by doing attestation with a remote server, and running the model by feeding the provided data.

# Workflow

The goal of this demo is to securely provide credit card transactions to a fraud detection model running on the public cloud to perform offline fraud detection inspection of the given transactions.

The idea is that after developing the model (and create a synthetic encrypted dataset), they are all uploaded on the cloud.

In this example, there is 1 encrypted dataset and is uploaded as Azure blob storage.

After, the model runs in a Confidential Container on the public cloud and fetches the encrypted dataset. The model then proceeds to decrypt the dataset by doing first attestation (connect with Trustee) and then fetch the required key to decrypt it.

Once the data is decrypted, feed it to the model that then prints out which credit card transaction is a fraud and with which likelyhood.

# Data security

In this example, we showcase all 3 kinds of data security:

* Data at rest: in `0_intro.ipynb` we show the disk is encrypted
* Data in transit: in `1_download_data.ipynb` we show the data is encrypted and travels securely from the cloud to our CVM
* Data in use: in `2_decrypt_data.ipynb` we ensure the right hardware and software are in use to guarantee memory encryption and that the software has not been tampered with.