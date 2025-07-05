# JabRef Action

> BibTeX GitHub Action

Currently executing JabRef's consistency check.

## Example Use

Checking [Chocolate.bib#97faf2b6](https://github.com/JabRef/jabref-demo-libraries/blob/97faf2b6ed94fc15c4f6e5645da3a69796d8f6d3/chocolate/Chocolate.bib#L1):

```yaml
name: Check

on:
  pull_request:

jobs:
  test-action:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Run jabref-action
        uses: jabref/jabref-action@main
        with:
          bibfile: Chocolate.bib
```

### Output

| entry type | citation key   | Eprint | File | Number | Pages | URL |
| ---------- | -------------- | ------ | ---- | ------ | ----- | --- |
| Article    | Cooper_2007    | -      | -    | o      | o     | -   |
| Article    | Corti_2009     | -      | -    | o      | o     | -   |
| Article    | Di_Renzo_2012  | -      | -    | o      | o     | -   |
| Article    | Ding_2006      | -      | -    | o      | -     | -   |
| Article    | Fulton_1969    | o      | -    | o      | o     | o   |
| Article    | Garcia_2018    | -      | -    | o      | -     | -   |
| Article    | Hooper_2012    | -      | -    | o      | o     | -   |
| Article    | Katz_2011      | -      | -    | o      | o     | -   |
| Article    | Keen_2001      | -      | -    | o      | o     | -   |
| Article    | LunaOstos_2024 | -      | ?    | o      | o     | -   |
| Article    | Macht_2007     | -      | -    | o      | o     | -   |
| Article    | Parker_2006    | -      | -    | o      | o     | -   |
| Article    | Scholey_2013   | -      | -    | o      | o     | -   |
| Article    | Tan_2021       | -      | -    | o      | o     | -   |
| Article    | Tokede_2011    | -      | -    | o      | o     | -   |

| Symbol | Meaning                   |
| ------ | ------------------------- |
| x      | required field is present |
| o      | optional field is present |
| ?      | unknown field is present  |
| -      | field is absent           |


## Development

This action uses JabRef's jabkit Dockerimage. Contribute to jabkit at [jabkit](https://github.com/JabRef/jabref/tree/main/jabkit).
