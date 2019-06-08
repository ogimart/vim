# psql

## psql tips & tricks

#### save query results as csv

```
\copy (select * from foo) to '/tmp/foo.csv' csv header;
```

#### time query

```
\timing
```

#### show nulls

```
\pset null (null)
```

#### repeatedly execute last query

```
\watch 2
```

#### edit last query with $EDITOR end execute

```
\e
```

#### execute shell

```
\!
```

#### line style

```
\pset linestyle unicode
\pset border 2
```
