gsutil -q stat gs://sps-backend

return_value=$?

if [[ $return_value == 0 ]]
then
    echo "File exist"
    gsutil rsync -d ./Functions sps-backend/
    echo "all file sync done"


else
    echo "creating new bucket"
    gsutil mb -l us gs://sps-backend -p cloud-resume-challenge-385006
    echo "syncing files"
    gsutil rsync -d ./Functions sps-backend/
    echo "Done Syncing"
fi




