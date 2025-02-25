# Program: Random Tea Generator Microservice
**Author**: Benjamin Fleming

**Institution**: OSU - CS 361

**Date**: 02/24/2025


## REQUESTING DATA
-------------------------------------------
To request tea data, write a comma-separated line of criteria to the "tea_input.txt" file.
The expected format is:
"<"flavor">", "<"type">", "<"caffeine">"

For example, to request a green tea with low caffeine (ignoring type), you would write:
green, none, low

### Example call in Python:
def request_data(flavor, tea_type, caffeine):
    criteria = f"{flavor}, {tea_type}, {caffeine}"
    with open("tea_input.txt", "w") as f:
        f.write(criteria)

request_data("green", "none", "low")




## RECEIVING DATA
-------------------------------------------
After processing, the microservice writes the tea recommendation to "tea_output.txt"
To receive the data, read the contents of this file.

### Example call in Python:
import time

def receive_data():
    result = ""
    while not result:
        with open("tea_output.txt", "r") as f:
            result = f.read().strip()
        time.sleep(1)
    return result

print("Tea Recommendation:", receive_data())
