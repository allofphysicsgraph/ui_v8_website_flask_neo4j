import functools
import logging  # Assuming you use Python's built-in logging
import uuid
import contextvars
from typing import Callable, Any

# logger = logging.getLogger(__name__)

# Create a context variable for the trace ID
trace_id_var = contextvars.ContextVar("trace_id", default="")


def trace_execution(func: Callable) -> Callable:
    """
    rather than each function having boilerplate, use decorator to add to every function
    """

    @functools.wraps(func)
    def wrapper(*args, **kwargs) -> Any:
        func_logger = logging.getLogger(func.__module__)

        trace_id = str(uuid.uuid4())
        token = trace_id_var.set(trace_id)  # Set it in the context

        # the function name needs to be logged explicitly since `logger.info` just reports "wrapper"
        func_logger.info(f"[TRACE] start {trace_id} - {func.__name__}")
        try:
            return func(*args, **kwargs)
        finally:
            func_logger.info(f"[TRACE] end {trace_id} - {func.__name__}")
            trace_id_var.reset(token)  # Reset context after execution

    return wrapper


# EOF
