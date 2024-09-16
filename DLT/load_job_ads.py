import dlt
import json
import requests
import pandas as pd
from pathlib import Path
import os

def _get_ads(url_for_search, params):
    headers = {'accept': 'application/json'}
    response = requests.get(url_for_search, headers=headers, params=params)
    response.raise_for_status()  # check for http errors
    return json.loads(response.content.decode('utf8'))

@dlt.resource(write_disposition="replace")
def jobsearch_resource(params):
    url = "https://jobsearch.api.jobtechdev.se"
    url_for_search = f"{url}/search"
    for ad in _get_ads(url_for_search=url_for_search,params=params)["hits"]:
        yield ad

def run_pipeline(query, table_name):
    pipeline = dlt.pipeline(
    pipeline_name='data_job_ads',
    destination='snowflake',
    dataset_name='staging',
)

    params = {"q": query, "limit": 100}
    load_info = pipeline.run(jobsearch_resource(params=params), table_name=table_name)
    print(load_info)


if __name__ == "__main__":
    # specify the pipeline name, destination and dataset name when configuring pipeline,
    # otherwise the defaults will be used that are derived from the current script name
    # data science, data engineer, data analyst
    working_directory = Path(__file__).parent
    os.chdir(working_directory)
    query = "data science"
    table_name = "data_field_job_ads"
    run_pipeline(query,table_name)