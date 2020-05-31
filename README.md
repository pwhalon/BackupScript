# BackupScript
I have been meaning to backup important files and such on my pc and now I have an automatic script to do so
By using AWS S3 and a few small commands I create a compressed file and upload that object to S3 for safe keeping.
## Notes
A couple notes if you want to use this. I used a rubygem aws-sdk-s3 so you would also have to install that.
I chose to have a local place for keeping my aws credentials so its very important to add the aws file to the gitignore so as to not add it to the repo.
You can also just keep it in another folder which maybe where I end up putting it.
As this is a first step, some things I may want to do would be to have error handling or adding a lifecycle policy to my objects so they dont just stack up.
Lastly I added this script to a crontab line so that it should execute every month on the first.
0 0 1 1-12 * /home/patrick/Documents/projects/backupScript/BackupScript/backup_script.rb >> /home/patrick/Documents/projects/backupScript/BackupScript/backup.log 2>&1
