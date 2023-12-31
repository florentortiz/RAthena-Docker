# RAthena Docker - Version 20190605
This repository has been utilized as a practical learning environment for the automation of Docker instance deployment, as well as the integration and automation of Continuous Integration (CI) processes with Git. </br>

Included within the container setup are essential components such as a Ragnarok Online server, FluxCP, MySQL, PHPMyAdmin, and a web client, which integrates RoBrowser and WSProxy.

# Using This Repository
To use this repository, first ensure you have Docker and Docker Compose installed on your system. Then, follow these steps:

1. Download the [latest release version](https://github.com/florentortiz/RAthena-Docker/releases) from the repository.

## With Custom Parameters
1. Rename the file `manuel-docker-compose.yml` to `docker-compose.yml`.
2. Modify the config files located in `/server/config/Server`.
3. Execute the command `docker-compose up -d` in your terminal to start the services.

## With Default Parameters
1. Log into Docker by entering `docker login` in your terminal.
2. Navigate to the directory containing the `docker-compose.yml` file.
3. Execute `docker-compose up -d` in your terminal to initiate the services.

This will start the services defined in the Docker Compose configuration in detached mode, running them in the background.

### Access Points
- **RoBrowser:** [http://localhost:22000](http://localhost:22000)
- **PHPMyAdmin:** [http://localhost:8080](http://localhost:8080)
- **FluxCP:** [http://localhost:8081](http://localhost:8081)

## Access Credentials
Secure access credentials are provided below for database and application management.

### Database Access
- **Database Name:** ragnarok
- **Username:** ragnarok
- **Password:** ragnarok

### FluxCP Installation
- **Installation Password:** secretpassword

## Contributing to the Project
We highly value and encourage contributions from the community! If you are interested in contributing to this project, whether it be through proposing new ideas or enhancing existing features, here are a few ways to get involved:

### Sharing Ideas
If you have ideas or suggestions that could improve the project, please feel free to share them with us. You can do this by opening an issue in our GitHub repository with a detailed description of your proposal.

### Making a Pull Request
If you're ready to dive in and make direct contributions to the code, here’s how you can submit a pull request:

1. Fork the repository.
2. Create a new branch in your forked repository for your feature or fix.
3. Commit your changes with clear and concise commit messages.
4. Push your changes to your branch.
5. Submit a pull request to our repository, providing details about the enhancements or fixes you've made.

We welcome all contributions and look forward to seeing your innovative ideas and improvements. Together, we can make this project even better!