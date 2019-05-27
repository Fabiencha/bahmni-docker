# Bahmni Docker

Docker Compose project to start a Bahmni server locally.

**export the variable beforehand:**
```
${OPENMRS_MODULES_PATH}="/home/romain/repos/bahmni-distro-hsc/target/bahmni-distro-hsc-1.0.0-SNAPSHOT/openmrs_modules/"
```

### Quick Start

**Clone the project:**
```
git clone https://github.com/mekomsolutions/bahmni-docker
cd bahmni-docker
```

<<<<<<< HEAD
=======
**Export the variable beforehand:**
```
export OPENMRS_MODULES_PATH="/path/to/the/openmrs/modules"
export BAHMNI_CONFIG_PATH="/path/to/the/bahmni/config"
```

>>>>>>> 5e0ad19... BAH-786: Add Bahmni Config component (#10)
**Build the components:**

- Bahmni Proxy
```
docker build -t bahmni-proxy ./
```

**Start Bahmni:**
```
cd ..
docker-compose up
```

**Access the servers:**

OpenMRS server is accessible at http://localhost/openmrs

----

### Known limitations

- Only OpenMRS Component is now supported.
