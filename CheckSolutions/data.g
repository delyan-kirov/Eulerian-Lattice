G000001 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 3], [7, 1], [7, 5], [8, 2], [8, 3], [9, 2], [9, 4], [10, 4], [10, 5], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
G000002 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 4], [7, 1], [7, 5], [8, 2], [8, 3], [9, 2], [9, 4], [10, 3], [10, 5], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
G000003 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 4], [7, 1], [7, 5], [8, 2], [8, 3], [9, 2], [9, 5], [10, 3], [10, 4], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
G000004 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 3], [7, 1], [7, 4], [8, 2], [8, 3], [9, 2], [9, 5], [10, 4], [10, 5], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
G000005 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 3], [7, 1], [7, 4], [8, 2], [8, 4], [9, 2], [9, 5], [10, 3], [10, 5], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
G000006 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 3], [7, 1], [7, 5], [8, 2], [8, 4], [9, 2], [9, 5], [10, 3], [10, 4], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
G000007 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 2], [7, 1], [7, 5], [8, 2], [8, 3], [9, 3], [9, 4], [10, 4], [10, 5], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
G000008 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 2], [7, 1], [7, 4], [8, 2], [8, 3], [9, 3], [9, 5], [10, 4], [10, 5], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
G000009 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 2], [7, 1], [7, 3], [8, 2], [8, 4], [9, 3], [9, 5], [10, 4], [10, 5], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
G000010 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 2], [7, 1], [7, 3], [8, 2], [8, 5], [9, 3], [9, 4], [10, 4], [10, 5], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
G000011 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 2], [7, 1], [7, 4], [8, 2], [8, 5], [9, 3], [9, 4], [10, 3], [10, 5], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
G000012 := GraphByEdges([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 1], [6, 2], [7, 1], [7, 5], [8, 2], [8, 4], [9, 3], [9, 4], [10, 3], [10, 5], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10]]);
Lattices := [G000001, G000002, G000003, G000004, G000005, G000006, G000007, G000008, G000009, G000010, G000011, G000012];
LoadPackage("yags");
IsoFreeGraphs := [];

while Length(Lattices) > 0 do 
  Add(IsoFreeGraphs, Lattices[1]);
  Lattices := Filtered(Lattices, x -> not IsIsomorphicGraph(x, Lattices[1]));
od;

GraphAutGps := [];
GraphAutSize := [];

for elements in IsoFreeGraphs do
Add(GraphAutGps, AutomorphismGroup(elements));
Add(GraphAutSize, Size(AutomorphismGroup(elements)));
od;

Print("Graph group sizes: ");
Print(GraphAutSize);
SaveWorkspace("workspace.g");
PrintTo("result.g", IsoFreeGraphs);
quit;
