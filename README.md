

#### LUH2 data compilation and conversion in GIS format
##### Here we trabforme and convertion.....

Raw data available at:  https://luh.umd.edu/data.shtml





User flows
---
```sequence
Alice->Bob: Hello Bob, how are you?
Note right of Bob: Bob thinks
Bob-->Alice: I am good thanks!
Note left of Alice: Alice responds
Alice->Bob: Where have you been?
```

## h2

```mermaid
graph LR
A[LUH2_netCDF] --> B[primf.tif]
    A --> C[primn.tif]
    A --> D[secdf.tif]
    A --> E[secdn.tif]
    A --> F[c3ann.tif]
    A --> G[c4ann.tif]
    A --> H[c3per.tif]
    A --> I[c4per.tif]
    A --> J[c3nfx.tif]
    A --> L[urban.tif]
    A --> M[pastr.tif]
    A --> N[range.tif]
    B --> O[LULC.tif]
    C --> O[LULC.tif]
    D --> O[LULC.tif]
    E --> O[LULC.tif]
    F --> O[LULC.tif]
    G --> O[LULC.tif]
    H --> O[LULC.tif]
    I --> O[LULC.tif]
    J --> O[LULC.tif]
    L --> O[LULC.tif]
    M --> O[LULC.tif]
    N --> O[LULC.tif]
```





```gherkin=
Feature: Shopping Cart
  As a Shopper
  I want to put items in my shopping cart
  Because I want to manage items before I check out

  Scenario: User adds item to cart
    Given I'm a logged-in User
    When I go to the Item page
    And I click "Add item to cart"
    Then the quantity of items in my cart should go up
    And my subtotal should increment
    And the warehouse inventory should decrement
```

> Read more about Gherkin here: https://docs.cucumber.io/gherkin/reference/

User flows
---
```sequence
Alice->Bob: Hello Bob, how are you?
Note right of Bob: Bob thinks
Bob-->Alice: I am good thanks!
Note left of Alice: Alice responds
Alice->Bob: Where have you been?
```

> Read more about sequence-diagrams here: http://bramp.github.io/js-sequence-diagrams/

Project Timeline
---
```mermaid
gantt
    title A Gantt Diagram

    section Section
    A task           :a1, 2014-01-01, 30d
    Another task     :after a1  , 20d
    section Another
    Task in sec      :2014-01-12  , 12d
    anther task      : 24d
```

> Read more about mermaid here: http://mermaid-js.github.io/mermaid/

## Appendix and FAQ

:::info
**Find this document incomplete?** Leave a comment!
:::

###### tags: `Templates` `Documentation`
