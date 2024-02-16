1. ```cd``` into the ```terraform``` directory.

2. Download ```cf-terraforming``` from here https://github.com/cloudflare/cf-terraforming (this file is set in ```.gitignore``` so will not be comitted)

3. ```export CLOUDFLARE_API_TOKEN=<read_token>```

4. ```export CLOUDFLARE_ZONE_ID=<zone_id>``` (this can be found using the terraform ```cloudflare_zone``` data resource - I have hardcoded ```digital.hogarth.com``` in ```data.tf``` so use the zone ID of this).

5. ```./terra-import```.  This will NOT import - it will just generate the tfvars file ready for import.

6. Output is in ```terraform.auto.tfvars```.

7. You can now ```plan``` and ```apply``` this.   The plan/apply may show that it wants to alter ```allow_overwrite``` to ```false```.  This is expected.

8. Once applied you can remove the ```resource``` lines from ```$CLOUDFLARE_ZONE_NAME``` as they are only used during the import.  Our actual process at work will do this for us.
