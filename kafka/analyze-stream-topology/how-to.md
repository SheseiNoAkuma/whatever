- add this code to you stream and print the output: 
```scala 
builder.build().describe()
```
- copy the output that should be something like this:
```
Topologies:
   Sub-topology: 0
    Source: KSTREAM-SOURCE-0000000000 (topics: [LOCAL_UserProfile_PrincipalTenantEvents])
      --> KSTREAM-FLATMAP-0000000001
    Processor: KSTREAM-FLATMAP-0000000001 (stores: [])
      --> KSTREAM-PEEK-0000000002
      <-- KSTREAM-SOURCE-0000000000
    Processor: KSTREAM-PEEK-0000000002 (stores: [])
      --> KSTREAM-FILTER-0000000005
      <-- KSTREAM-FLATMAP-0000000001
    Processor: KSTREAM-FILTER-0000000005 (stores: [])
      --> KSTREAM-SINK-0000000004
      <-- KSTREAM-PEEK-0000000002
    Sink: KSTREAM-SINK-0000000004 (topic: KSTREAM-REPARTITION-0000000003-repartition)
      <-- KSTREAM-FILTER-0000000005

  Sub-topology: 1
    Source: KSTREAM-SOURCE-0000000006 (topics: [KSTREAM-REPARTITION-0000000003-repartition])
      --> KSTREAM-TRANSFORM-0000000007
    Processor: KSTREAM-TRANSFORM-0000000007 (stores: [TenantPrincipalStateStore])
      --> KSTREAM-SINK-0000000008
      <-- KSTREAM-SOURCE-0000000006
    Sink: KSTREAM-SINK-0000000008 (topic: LOCAL_Notification_PRIVATE_TenantPrincipalsState)
      <-- KSTREAM-TRANSFORM-0000000007
```

- go to this website and paste the output: https://zz85.github.io/kafka-streams-viz/
