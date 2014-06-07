
data NestedList a = Elem a | List [NestedList a]

myFlatten :: NestedList t -> [t]
myFlatten (Elem x) = [x]
myFlatten (List x) = concatMap myFlatten x


-- *Main> myFlatten (List [])
-- []
-- *Main> myFlatten (Elem 5)
-- [5]
-- *Main>
