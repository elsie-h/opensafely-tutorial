from cohortextractor import codelist_from_csv

asthma_attack_codes = codelist_from_csv(
    "codelists/user-elsie_horne-asthma-attack-example-1.csv",
    system="ctv3",
    column="code",
)