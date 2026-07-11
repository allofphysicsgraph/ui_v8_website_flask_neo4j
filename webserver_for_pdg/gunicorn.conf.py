import os
import coverage


def post_fork(server, worker):
    server.log.info("Worker spawned: Starting coverage collection...")
    # Initialize coverage pointing to our config file
    cov = coverage.Coverage(config_file=".coveragerc")
    cov.start()
    # Store the coverage instance on the worker to access it on exit
    worker.cov = cov


def worker_exit(server, worker):
    server.log.info("Worker exiting: Saving coverage collection...")
    if hasattr(worker, "cov"):
        worker.cov.stop()
        worker.cov.save()
