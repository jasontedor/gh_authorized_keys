A script for keeping your ssh `authorized_keys` up to date with the user's
public keys on GitHub.

This script takes two arguments. The first argument is the local machine
username whose ssh `authorized_keys` will be managed by this script. The second
argument is the GitHub username of the user whose public keys you want to
authorize for the local machine username specified in the first argument.

This script executes by obtaining the specified user's public keys on GitHub,
and replacing the contents of the ssh `authorized_keys` for the specified local
machine username.

This script is best used in conjunction with a system for executing the script
on a periodic schedule (e.g., `cron`, `launchctl`, etc.).
