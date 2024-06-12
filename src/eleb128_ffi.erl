%%%-------------------------------------------------------------------
%% @doc eleb128 Little-Endian Base 128 (LEB128) impl.
%% The basic impl. of LEB128 (https://en.wikipedia.org/wiki/LEB128)
%% @end
%%%-------------------------------------------------------------------

-module(eleb128_ffi).

%% API
-export([signed_encode/1,
         unsigned_encode/1,
         signed_decode/1,
         unsigned_decode/1]).

%% The maximum value that we can put into 7 bits - 127
-define(UNSIGNED_MAX_VALUE, 128).
%% The maximum value that we can put into 6 bits - 63
-define(SIGNED_MAX_VALUE, 64).

%%====================================================================
%% API functions
%%====================================================================

-spec signed_encode(neg_integer()) -> binary().
signed_encode(Value) ->
    encode(Value, 0, <<>>, ?SIGNED_MAX_VALUE).

-spec unsigned_encode (non_neg_integer()) -> binary().
unsigned_encode(Value) ->
    encode(Value, 0, <<>>, ?UNSIGNED_MAX_VALUE).

-spec signed_decode(binary()) -> {neg_integer(), binary()}.
signed_decode(Binary) ->
    {Size, Bitstring, Tail} = decode(Binary, 0, <<>>),
    <<Value:Size/signed-integer>> = Bitstring,
    {Value, Tail}.

-spec unsigned_decode(binary()) -> {non_neg_integer(), binary()}.
unsigned_decode(Binary) ->
    {Size, Bitstring, Tail} = decode(Binary, 0, <<>>),
    <<Value:Size/unsigned-integer>> = Bitstring,
    {Value, Tail}.

%%====================================================================
%% Internal functions
%%====================================================================

-spec encode(non_neg_integer(), non_neg_integer(), binary(), pos_integer()) -> binary().
encode(Value, Shift, Acc, Max) when -Max =< Value bsr Shift andalso Value bsr Shift < Max ->
    Chunk = Value bsr Shift,
    <<Acc/binary, 0:1, Chunk:7/integer>>;

encode(Value, Shift, Acc, Max) ->
    Chunk = Value bsr Shift,
    encode(Value, Shift + 7, <<Acc/binary, 1:1, Chunk:7/integer>>, Max).

-spec decode(binary(), non_neg_integer(), binary()) -> {non_neg_integer(), binary(), binary()}.
decode(<<0:1, Chunk:7/bitstring, Tail/binary>>, Size, Acc) ->
    {Size + 7, <<Chunk/bitstring, Acc/bitstring>>, Tail};

decode(<<1:1, Chunk:7/bitstring, Tail/binary>>, Size, Acc) ->
    decode(Tail, Size + 7, <<Chunk/bitstring, Acc/bitstring>>).
