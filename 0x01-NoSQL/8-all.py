#!/usr/bin/env python3
"""script to list documents"""


def list_all(mongo_collection):
    """lists documents in a collection"""
    result = list(mongo_collection.find({}))
    return result
