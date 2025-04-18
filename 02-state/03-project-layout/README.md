# Terraform Project File Layout

## Top-Level Structure

At the top level, there are separate folders for each “environment.” The exact environments differ by project, but the typical ones include:

- **`stage/`**  
  An environment for pre-production workloads (e.g., testing)

- **`prod/`**  
  An environment for production workloads (e.g., user-facing apps)

- **`mgmt/`**  
  An environment for DevOps tooling (e.g., bastion host, CI server)

- **`global/`**  
  A place for resources shared across all environments (e.g., S3 buckets, IAM roles)

---

## Environment-Level Structure

Within each environment, there are separate folders for each “component.” The components vary by project, but common examples include:

- **`vpc/`**  
  Contains the network topology for the environment.

- **`services/`**  
  Contains apps or microservices (e.g., a Ruby on Rails frontend or Scala backend).  
  Each app can be placed in its own subfolder to isolate it from others.

- **`data-storage/`**  
  Contains data stores (e.g., MySQL, Redis).  
  Each data store can also reside in its own subfolder for isolation.

---

## Component-Level Structure

Within each component folder are the Terraform configuration files, using the following naming conventions:

- **`main.tf`**  
  Defines resources and data sources.

- **`variables.tf`**  
  Defines input variables.

- **`outputs.tf`**  
  Defines output variables.

---

## Naming Conventions and File Organization

Using a consistent, predictable naming convention makes your code easier to browse.

### Minimum Naming Conventions to Follow

- **`dependencies.tf`**  
  It's common to put all your data sources in a `dependencies.tf` file to make it easier to see what external things the code depends on.

- **`providers.tf`**  
  You may want to put your provider blocks into a `providers.tf` file so you can see, at a glance, what providers the code interacts with and what authentication is required.

- **`main-xxx.tf`**  
  If your `main.tf` file becomes too long due to a large number of resources, break it down into smaller files grouped logically:
  
  - `main-iam.tf` for IAM resources  
  - `main-s3.tf` for S3 resources  
  - and so on...

  Using the `main-` prefix helps when scanning files alphabetically, as it groups all resource files together.  
  If you're struggling to manage a large number of resources even after breaking them down, it may be a sign that you should split your code into smaller, reusable modules.
