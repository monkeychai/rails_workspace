# MonkeyChai's Rails Workspace

## Setup

### OSX / Windows

1. Have a reasonably good Internet connection for the first run
2. [Download and install Vagrant](https://www.vagrantup.com/downloads.html)
3. [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
4. Clone this repo: `git clone git@github.com:monkeychai/rails_workspace`
5. `cd rails_workspace`
6. `vagrant up`
7. Wait patiently while `vagrant` downloads the Ubuntu 14.04 image and provisions it. (This part takes a while (like 20mins) on my barely-broadband connection). List of things the bootstrap script does:
    - sets up .gemrc to not install docs
    - rbenv, ruby-build, and their dependencies
    - install rails and bundler
    - install nodejs as a JS runtime
    - install postgresql


## Notes

- This machine uses nodejs as the JS env instead of rubyracer (Heroku claims this is better for performance).
- It's a good idea to replace webrick with thin, for better performance.
- Replace the postgresql password in the Vagrantfile with an actual ENV variable
- Use the `--skip-bundle` flag when you run `rails new`