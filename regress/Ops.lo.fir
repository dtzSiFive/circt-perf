circuit Ops :
  module Ops :
    input sel : UInt<4>
    input is : SInt<8>
    input iu : UInt<8>
    output os : SInt<14>
    output ou : UInt<13>
    output obool : UInt<1>

    skip
    node _GEN_1 = mux(eq(sel, UInt<4>(4)), UInt<2>(2), UInt<2>(0))
    node _GEN_2 = mux(eq(sel, UInt<4>(5)), UInt<2>(2), _GEN_1)
    node _GEN_3 = mux(eq(sel, UInt<4>(4)), UInt<2>(0), _GEN_2)
    node _GEN_4 = mux(eq(sel, UInt<4>(5)), UInt<2>(2), _GEN_3)
    node _GEN_5 = mux(eq(sel, UInt<4>(4)), UInt<9>(0), pad(_GEN_4, 9))
    node _GEN_16 = asUInt(is)
    node _GEN_6 = mux(eq(sel, UInt<4>(5)), add(_GEN_16, iu), _GEN_5)
    skip
    node _GEN_7 = mux(eq(sel, UInt<4>(4)), add(_GEN_16, iu), _GEN_6)
    skip
    node _GEN_9 = mux(eq(sel, UInt<4>(3)), UInt<9>(0), _GEN_7)
    node _GEN_10 = mux(eq(sel, UInt<4>(2)), SInt<9>(1), SInt<9>(0))
    node _GEN_11 = mux(eq(sel, UInt<4>(2)), UInt<9>(1), _GEN_9)
    node _GEN_12 = mux(eq(sel, UInt<4>(1)), SInt<9>(0), _GEN_10)
    node _GEN_13 = mux(eq(sel, UInt<4>(1)), UInt<9>(0), _GEN_11)
    node _GEN_14 = mux(eq(sel, UInt<4>(0)), add(is, is), _GEN_12)
    node _GEN_15 = mux(eq(sel, UInt<4>(0)), add(iu, iu), _GEN_13)
    skip
    os <= pad(_GEN_14, 14)
    skip
    ou <= pad(_GEN_15, 13)
    obool <= UInt<1>(0)

