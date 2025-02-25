# Program: Random Tea Generator Micoservice
# Benjamin Fleming
# OSU - CS 361
# 02/24/2025

import time
import mysql.connector

def get_tea(criteria):
    """
    Connects to the local MySQL Tea database and returns one random tea
    matching the given criteria. If a criteria is 'none' (or not provided),
    it is ignored.
    """
    try:
        conn = mysql.connector.connect(
            host="localhost",     # Local MySQL server
            user="root",          # Default user (update if needed)
            password="",          # No password (update if needed)
            database="Tea"        # Database name as imported from tea.sql
        )
        cursor = conn.cursor()

        # Build the query with LEFT JOIN to include flavor data.
        query = """
        SELECT `teas`.`tea_id`, `teas`.`tea_name`, `teas`.`type`, `teas`.`caffeine`,
            `teas`.`flavor_id`, `flavors`.`flavor_name`
        FROM `teas`
        LEFT JOIN `flavors` ON `teas`.`flavor_id` = `flavors`.`flavor_id`
        """

        conditions = []
        params = []

        # only add a condition if user specified a preference.
        if criteria.get("flavor") and criteria["flavor"].lower() != "none":
            conditions.append("LOWER(`flavors`.`flavor_name`) = LOWER(%s)")
            params.append(criteria["flavor"])
        if criteria.get("type") and criteria["type"].lower() != "none":
            conditions.append("LOWER(`teas`.`type`) = LOWER(%s)")
            params.append(criteria["type"])
        if criteria.get("caffeine") and criteria["caffeine"].lower() != "none":
            conditions.append("LOWER(`teas`.`caffeine`) = LOWER(%s)")
            params.append(criteria["caffeine"])

        # append the conditions if any were specified.
        if conditions:
            query += " WHERE " + " AND ".join(conditions)

        # order by random & limit to one result.
        query += " ORDER BY RAND() LIMIT 1"

        print("Executing query:")
        print(query)
        print("With parameters:", params)

        cursor.execute(query, params)
        result = cursor.fetchone()
        cursor.close()
        conn.close()
        return result
    except mysql.connector.Error as err:
        print("MySQL Error:", err)
        return None

def microservice_loop():
    """
    Continuously monitors the 'tea_input.txt' file. When the file contains criteria,
    it queries the database, writes the result to 'tea_output.txt', and clears the input.
    Expected input format: a comma-separated line "flavor, type, caffeine".
    Enter "none" (or leave blank) to ignore a criteria.
    """
    input_file = "tea_input.txt"
    output_file = "tea_output.txt"

    print("Tea microservice started. Monitoring '{}' for tea requests...".format(input_file))

    while True:
        with open(input_file, "r") as f:
            data = f.read().strip()

        if data:
            # Expect a comma-separated line: flavor, type, caffeine.
            parts = [part.strip() for part in data.split(",")]
            criteria = {
                "flavor": parts[0] if len(parts) > 0 and parts[0] else "none",
                "type": parts[1] if len(parts) > 1 and parts[1] else "none",
                "caffeine": parts[2] if len(parts) > 2 and parts[2] else "none"
            }

            print("Received criteria:", criteria)  # Debug output

            tea = get_tea(criteria)
            if tea:
                tea_output = (
                    f"ID: {tea[0]}, Name: {tea[1]}, Type: {tea[2]}, "
                    f"Caffeine: {tea[3]}, Flavor ID: {tea[4]}, Flavor Name: {tea[5]}"
                )
            else:
                tea_output = "No tea found matching criteria."

            print("Result:", tea_output)  # debug output

            with open(output_file, "w") as f:
                f.write(tea_output)

            # clear input file after processing.
            open(input_file, "w").close()

        time.sleep(1)

if __name__ == "__main__":
    microservice_loop()