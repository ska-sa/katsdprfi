#!/usr/bin/env python
from setuptools import setup, find_packages

setup (
    name = "katsdprfi",
    description = "Karoo Array Telescope RFI Report",
    author = "MeerKAT SDP team",
    author_email = "sdpdev+katsdprfi@ska.ac.za",
    packages = find_packages(),
    package_data={'': ['html/*']},
    include_package_data = True,
    # scripts = ["scripts/rfi.py"],
    zip_safe = False,
    python_requires=">=3.8",
    install_requires=[
        "h5py",
        "matplotlib",
        "numpy",
        "six",
        "katsdpservices[argparse]",
        "katsdptelstate",
        "katdal",
        "katpoint"],
    use_katversion=True
)
