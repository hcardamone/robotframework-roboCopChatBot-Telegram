import json
import jsondiff
from deepdiff import DeepDiff
# from deepdiff import DeepSearch, grep
from pprint import pprint
from robot.api import logger

def dictionaries_should_be_equal(response, expectation):
        union = jsondiff.patch(response, expectation)
        difference = jsondiff.diff(response, union)
        if difference:
            raise ValueError("Diff found: {}".format(difference))
        else:
            return True

# https://dig.codes/example/compare-two-json-responses-on-robot-framework
# https://stackoverflow.com/questions/36916304/comparing-json-result-from-a-function-in-robot-framework
