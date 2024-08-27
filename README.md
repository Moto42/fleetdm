# FleetDM in Docker

A portainer setup for fleetDM.

This setup assumes that you will be running this through an ssl proxy.  
FleetDM seems to require ssl certs, so the 'certmaker' service will create self-signed certs if none exist.  
The ability to pass in other SSL certs by way of env vars may or may not happen in the future.

## Deployment

- Open the "Stacks" screen, by clicking "stacks" option in Portainer main menu.
- Click " ➕ Add A Stack", in the upper right hand corner.
- Give your FleetDM stack a name
- Click the "Repository" button, under "Build Method"
- Enter the full URL of this repo in "Repository URL"
  - The url will have the shape "https://someGitService.tld/user/repoName
- Ensure that 'Repository reference' is set to the commit you wish to use.
  - Most likely `refs/head/main`
- Ensure that 'Compose Path' is set to `docker-compose.yml'
- Set 'Enable relative path volumes' to true
- Set 'Local filesystem path' to `/mnt`
- If you are making use of environment var options, click "➕ Add and Environment Variable", and fill in the name and value in the form that appears.
  - See "Environment Variables" section for more info
- Click 'Deploy the Stack'; in the bottom left of the form.

If the this is reality and not a simulation, you should now be able to connect 
to the FleetDM service at https://host_IP:some_port.  
If it has failed, then you may panic until I reset the simulation to june 1993 again.

## Environment Variables

### `COMPOSE_FLEET_HOST_PORT`
The port on the host machine that will be forwarded to 8080 on the FleetDM service.

Defaults to 8080
