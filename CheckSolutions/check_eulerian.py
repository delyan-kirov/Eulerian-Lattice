import re


def parseToSage(edges):
    # Create a dictionary to store the connections for each point
    point_connections = {}

    # Populate the dictionary based on the edges where a > b
    for edge in edges:
        point1, point2 = edge
        if point1 > point2:
            if point1 not in point_connections:
                point_connections[point1] = []
            point_connections[point1].append(point2)

    # Convert the dictionary to the desired representation
    result = [(point, neighbors) for point, neighbors in point_connections.items()]

    print(result)

    point_connections = {point: neighbors for point, neighbors in result}
    poset_str = f"P = Poset({point_connections})"

    return poset_str


# %%

# Read the input file
with open("data.g", "r") as file:
    data = file.read()

# Define a regular expression to match the GraphByEdges definitions
graph_pattern = r"G\d+ := GraphByEdges\(\[\[.*?\]\]\);"

# Find all graph definitions in the file
graph_definitions = re.findall(graph_pattern, data)

# Create a new file for the simplified content
with open("dataT.g", "w") as output_file:
    for graph_definition in graph_definitions:
        # Remove "GraphByEdges(" and ");" from each definition and replace := with =
        simplified_definition = re.sub(r"GraphByEdges\(|\);", "", graph_definition)
        simplified_definition = re.sub(r":=", "=", simplified_definition)
        output_file.write(simplified_definition + "\n")

print("Simplified file created.")

# %%

with open("dataT.g", "r") as file:
    data = file.read()

graphs = []
for line in data.strip().split("\n"):
    _, value = line.split(" = ")
    value = eval(value)  # Use eval to interpret the list data
    graphs.append(value)


for graph in graphs:
    with open("sageGraphs.data", "a") as f:
        f.write(parseToSage(graph) + "\n")
    f.close()
