from cohortextractor import (
    StudyDefinition, 
    patients, 
    codelist, 
)

# Import codelists.py script
from codelists import *

study = StudyDefinition(
    default_expectations={
        "date": {"earliest": "1900-01-01", "latest": "today"},
        "rate": "uniform",
        "incidence": 0.5,
    },
    population=patients.registered_with_one_practice_between(
        "2019-02-01", "2020-02-01"
    ),
    age=patients.age_as_of(
        "2019-09-01",
        return_expectations={
            "rate": "universal",
            "int": {"distribution": "population_ages"},
        },
    ),
    asthma_attack=patients.with_these_clinical_events(
        asthma_attack_codes,
        between=["2015-03-01", "2020-02-29"],
        returning="date",
        format="YYYY-MM-DD",
        find_first_match_in_period=True,
        return_expectations={"date": {"earliest": "2015-03-01", "latest": "2020-02-29"}},
    )
)
