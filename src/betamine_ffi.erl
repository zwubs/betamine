-module(now_ffi).

-export([
    now_seconds/0
]).

now_seconds() -> os:system_time(second).
