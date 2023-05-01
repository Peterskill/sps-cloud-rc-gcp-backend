gsutil -q stat gs://sps-backend/main.py

return_value=$?

if [[ $return_value == 0 ]]
then
    echo "File exist"
    gsutil rsync -d ./Functions gs://sps-backend/
    echo "all file sync done"


else
    echo "creating new bucket"
    gsutil mb -l us -p cloud-resume-challenge-385006 gs://sps-backend
    echo "syncing files"
    gsutil rsync -d ./Functions gs://sps-backend/
    echo "Done Syncing"
fi




