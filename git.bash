gitupdate(){
git add .
mesdate="update from $(hostname) at $(date)"
git commit -m "update from $(hostname) at $(date)" -a
git push origin $1
}
