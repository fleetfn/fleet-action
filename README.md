# Fleet CLI Github Action

🚀 zero-config Fleet Function application deployment using Fleet CLI and Github Actions.

## Usage

Add `fleet-action` to the workflow for your Serverless Function. The below example will deploy your functions on pushes to the `master` branch:

```yaml
name: Deploy

on:
  push:
    branches:
      - master

jobs:
  deploy:
    runs-on: ubuntu-latest
    name: Deploy
    steps:
      - uses: actions/checkout@v2
      - name: Publish
        uses: fleetfn/fleet-action@0.1.0
        with:
          apiToken: ${{ secrets.FLEET_API_TOKEN }}
          projectId: ${{ secrets.FLEET_PROJECT_ID }}
```

## Configuration

Before you start deploying with Github Actions, you need to configure Fleet CLI using Github's Secrets feature to add the "API Token" and "Project ID".

### Authentication

- Go to "Settings -> Secrets"
- Add your Fleet Personal Access Token (Access the Tokens page on the Fleet console)
- Add your Project ID (You can get the id in the project settings)

Once you have the secret configured you should now be able to pass the secret on to your action in the `with` block of your workflow.

```yaml
jobs:
  deploy:
    name: Deploy
    steps:
      uses: fleetfn/fleet-action@0.1.0
      with:
        apiToken: ${{ secrets.FLEET_API_TOKEN }}
        projectId: ${{ secrets.FLEET_PROJECT_ID }}
```

### Production Deployment

**Optional**

You can also configure the Fleet CLI to deploy to production.

```yaml
jobs:
  deploy:
    steps:
      uses: fleetfn/fleet-action@0.1.0
      with:
        apiToken: ${{ secrets.FLEET_API_TOKEN }}
        prod: true
        projectId: ${{ secrets.FLEET_PROJECT_ID }}
```

### Working Directory

**Optional**

You can also pass a `workingDirectory` key to the action. This will allow you to specify a subdirectory of the repo to run the Fleet CLI command.

```yaml
jobs:
  deploy:
    steps:
      uses: fleetfn/fleet-action@0.1.0
      with:
        apiToken: ${{ secrets.FLEET_API_TOKEN }}
        projectId: ${{ secrets.FLEET_PROJECT_ID }}
        workingDirectory: 'api'
```