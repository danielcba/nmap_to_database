---

# README

## Purpose of the Script

This script automates the process of scanning a network to identify connected devices and the services they are running, then stores the results in a database for subsequent analysis and querying. It is designed for network administrators and cybersecurity professionals who need to efficiently monitor and manage network infrastructure.

### Key Features of the Script

1. **Network Scanning**:
   - Uses `nmap`, a powerful network scanning tool, to discover all devices on a specified network and detect running services and software versions.
   - Scans a range of IP addresses and employs advanced techniques to identify active services and software versions with high precision.

2. **Result Generation**:
   - Saves scan results in a CSV (comma-separated values) file for organized data storage and analysis.

3. **Database Storage**:
   - Connects to a MariaDB database and loads scan results into a dedicated table.
   - Storing results in a database enables efficient querying and integration with other analysis and reporting tools.

### Benefits of the Script

- **Automation**: Automates the entire process from scanning to data storage, saving time and reducing human error.
- **Continuous Monitoring**: Can be scheduled to run periodically, providing up-to-date visibility of the network and detecting unauthorized changes or potential issues.
- **Security Analysis**: Helps identify vulnerable services and software versions, facilitating patch management and security updates.
- **Network Inventory**: Provides a detailed inventory of all devices and services on the network, aiding in asset management and capacity planning.

### Typical Use Cases

1. **Network Administrators**: Use the script to gain network infrastructure insights, identify devices/services, and maintain an updated inventory.
2. **Security Professionals**: Leverage the data for security assessments, vulnerability identification, and remediation planning.
3. **Auditors**: Utilize the script during network audits to verify compliance with security policies and regulations.

### Security Considerations

- **Credential Management**: Avoid hardcoding credentials. Use environment variables or secure configuration files.
- **Permissions**: Ensure only authorized personnel can execute the script and access stored results.

---

This script is a powerful and versatile tool for network management and security, delivering critical insights in an automated and efficient manner.

---

### `requirements.txt` File

This file specifies the dependencies required to run the Python script.

```
python-nmap
mysql-connector-python
```

### SQL Commands for Database and Table Creation

```sql
CREATE SCHEMA `basenmap`;

CREATE TABLE `basenmap`.`nmap` (
  `host` VARCHAR(15) NULL,
  `hostname` VARCHAR(64) NULL,
  `hostname_type` VARCHAR(16) NULL,
  `protocol` VARCHAR(8) NULL,
  `port` VARCHAR(5) NULL,
  `name` VARCHAR(20) NULL,
  `state` VARCHAR(16) NULL,
  `product` VARCHAR(32) NULL,
  `extrainfo` VARCHAR(64) NULL,
  `reason` VARCHAR(16) NULL,
  `version` VARCHAR(32) NULL,
  `conf` VARCHAR(3) NULL,
  `cpe` VARCHAR(64) NULL
);
```

---

## Dependency Installation

1. Create and activate a virtual environment (optional but recommended):

   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

2. Install required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Database Configuration

1. Connect to your MariaDB/MySQL server and execute the following SQL commands to create the database and table:

   ```sql
   CREATE SCHEMA `basenmap`;

   CREATE TABLE `basenmap`.`nmap` (
     `host` VARCHAR(15) NULL,
     `hostname` VARCHAR(64) NULL,
     `hostname_type` VARCHAR(16) NULL,
     `protocol` VARCHAR(8) NULL,
     `port` VARCHAR(5) NULL,
     `name` VARCHAR(20) NULL,
     `state` VARCHAR(16) NULL,
     `product` VARCHAR(32) NULL,
     `extrainfo` VARCHAR(64) NULL,
     `reason` VARCHAR(16) NULL,
     `version` VARCHAR(32) NULL,
     `conf` VARCHAR(3) NULL,
     `cpe` VARCHAR(64) NULL
   );
   ```

---

## Scheduling the Script Execution

To automate periodic execution, configure the script as a cron job.

### Crontab Configuration

1. Open the crontab editor for the current user:

   ```bash
   crontab -e
   ```

2. Add the following line to schedule the script (adjust the path and frequency as needed):

   ```bash
   */2 * * * * /usr/bin/python3 /home/username/base-nmap/nmap_to_database.py
   ```

   Example frequencies:
   - Every 5 minutes: `*/5 * * * *`
   - Hourly: `0 * * * *`
   - Daily at 3 AM: `0 3 * * *`

3. Save and exit the editor (e.g., in `nano`: `CTRL+O` then `CTRL+X`).

### Verification

- List scheduled tasks to confirm:
  ```bash
  crontab -l
  ```

### Security Note

Ensure the script has execute permissions and the cron user has adequate privileges to run the script and access the database.

### Sample Output

![Screenshot from 2024-10-22 16-54-04](https://github.com/user-attachments/assets/8253cadf-06ec-4870-b242-757756607af1)

### License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

This script is a robust tool for network management and security, delivering critical insights through automation.
