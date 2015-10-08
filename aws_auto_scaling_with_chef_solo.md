## AWS auto scaling with chef-solo

#### Problem
I want to use Chef to provision my servers, but don't want to use a chef server because that becomes a single point of failure.

#### Solution
Auto Scaling with chef-solo. Duh! That's the name of this document.  
But how do I do this? I'll tell you!

#### Prerequisites
Pre-baked AMI (I go over this in a document about using Packer) which includes:
* chef-client installed
* chef-client run with the role to configure the instance to 90%

If you read some of my other stuff on the web, you will see that I like having things on separate mount points. In this case we're going to use a separate EBS volume which will be mounted to /chef (/dev/sdk). Here is the basic flow of how things will work. Details of each step will be outlined later.

* Commit code to chef-repo in GitHub.
* A post commit hook will trigger a Jenkins job that will perform these steps.
  * Mount the disk to /code/chef
  * Checkout the chef-repo
  * Unmount the disk
  * Snapshot the volume
* When launching a new EC2 instance, attach a volume from this snapshot to /dev/sdk.
  * The ami launched should have an entry in /etc/fstab to mount /dev/sdk to /chef. This is required for further steps.
* Provide a user-data script to run chef-client and choose the role for your desired server type.
* Drink Beer.

#### Commit code to chef-repo in GitHub
This part is pretty self explanatory. I may elaborate on this in the future.

#### Jenkins Builds EBS Snapshot
I have a disk where I checkout the chef-repo on my Jenkins server, but you can do this on any EC2 instance with a disk attached. To keep it consistent, because I love consistency, I'll attach this disk to /dev/sdk and I'm going to mount it to /code/chef (I mount all my volumes on my Jenkins server to /code/name_of_thing).

#### Attach the volume using the snapshot
Since we're autoscaling these instances, we need to add this to our Launch Configuration. This is called the block device mapping. Most of my scripts when interacting with AWS is in python using the boto library. So the example configuration is using that.

I first define the bdm (block device mapping) variable.
``` python
bdm = boto.ec2.blockdevicemapping.BlockDeviceMapping()
dev_sdk = ec2bdm.EBSBlockDeviceType(
    snapshot_id=chef_snapshot_id,
    delete_on_termination=True)
bdm['/dev/sdk'] = dev_sdk
```

I then use the bdm variable and pass it into the definition of my launch configuration.
``` python
def create_demand_launch_config(lc_name, ami, key, sg, i_type, bdm, iam):
    lc = LaunchConfiguration(
        name=lc_name,
        image_id=ami,
        key_name=key,
        security_groups=sg,
        user_data=None,
        instance_type=i_type,
        kernel_id=None,
        ramdisk_id=None,
        instance_monitoring=False,
        block_device_mappings=[bdm],
        instance_profile_name=iam)
    conn_as.create_launch_configuration(lc)
    return lc
```

#### Provide user-data script to run chef-client

``` bash
code
code
code
```

``` bash
code
code
code
```

``` bash
code
code
code
```
