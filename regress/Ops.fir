circuit Ops :
  module Ops :
    input sel : UInt<4>
    input is : SInt<8>
    input iu : UInt<8>
    output os : SInt<14>
    output ou : UInt<13>
    output obool : UInt<1>

    os <= SInt(0)
    ou <= UInt(0)
    obool <= UInt(0)
    when eq(sel, UInt(0)) :
      os <= pad(add(is, is), 14)
      ou <= pad(add(iu, iu), 13)
    else :
      when eq(sel, UInt(1)) :
        os <= pad(sub(is, is), 14)
        ou <= pad(sub(iu, iu), 13)
      else :
        when eq(sel, UInt(2)) :
          os <= mux(eq(is, SInt(0)), SInt(1), div(is, is))
          ou <= mux(eq(iu, UInt(0)), UInt(1), div(iu, iu))
        else :
          when eq(sel, UInt(3)) :
            os <= pad(rem(is, is), 14)
            ou <= pad(rem(iu, iu), 13)
          else :
            when eq(sel, UInt(4)) :
              ou <= pad(add(and(is, is), and(iu, iu)), 13)
            else :
              when eq(sel, UInt(5)) :
                ou <= pad(add(or(is, is), or(iu, iu)), 13)
              else :
                when eq(sel, UInt(4)) :
                  ou <= pad(add(xor(is, is), xor(iu, iu)), 13)
                else :
                  when eq(sel, UInt(5)) :
                    ou <= pad(add(eq(is, is), eq(iu, iu)), 13)
                  else :
                    when eq(sel, UInt(4)) :
                      ou <= pad(add(neq(is, is), neq(iu, iu)), 13)
                    else :
                      when eq(sel, UInt(5)) :
                        ou <= pad(add(geq(is, is), geq(iu, iu)), 13)
                      else :
                        when eq(sel, UInt(4)) :
                          ou <= pad(add(leq(is, is), leq(iu, iu)), 13)
                        else :
                          when eq(sel, UInt(5)) :
                            ou <= pad(add(gt(is, is), gt(iu, iu)), 13)
                          else :
                            ou <= pad(add(lt(is, is), lt(iu, iu)), 13)

