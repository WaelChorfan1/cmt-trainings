create scratch org 
deploy code to your scratch org


sfdx force:org:create -a scratch_org -d <days> -u <devhubusername>

---- deploy components --- 

sfdx force:source:deploy -u scratch_test -p force-app/main/default/objects/

    OR

sfdx force:source:push -u scratch_curabox


