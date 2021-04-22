Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4924336881C
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 22:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239318AbhDVUgs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Apr 2021 16:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239298AbhDVUgs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Apr 2021 16:36:48 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7206DC06174A;
        Thu, 22 Apr 2021 13:36:13 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id C1C8E92009E; Thu, 22 Apr 2021 22:36:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id BB91F92009B;
        Thu, 22 Apr 2021 22:36:12 +0200 (CEST)
Date:   Thu, 22 Apr 2021 22:36:12 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: Avoid handcoded DIVU in `__div64_32' altogether
In-Reply-To: <alpine.DEB.2.21.2104222124010.44318@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2104222203130.44318@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2104222124010.44318@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove the inline asm with a DIVU instruction from `__div64_32' and use 
plain C code for the intended DIVMOD calculation instead.  GCC is smart 
enough to know that both the quotient and the remainder are calculated 
with single DIVU, so with ISAs up to R5 the same instruction is actually 
produced with overall similar code.

For R6 compiled code will work, but separate DIVU and MODU instructions 
will be produced, which are also interlocked, so scalar implementations 
will likely not perform as well as older ISAs with their asynchronous MD 
unit.  Likely still faster then the generic algorithm though.

This removes a compilation error for R6 however where the original DIVU 
instruction is not supported anymore and the MDU accumulator registers 
have been removed and consequently GCC complains as to a constraint it 
cannot find a register for:

In file included from ./include/linux/math.h:5,
                 from ./include/linux/kernel.h:13,
                 from mm/page-writeback.c:15:
./include/linux/math64.h: In function 'div_u64_rem':
./arch/mips/include/asm/div64.h:76:17: error: inconsistent operand constraints in an 'asm'
   76 |                 __asm__("divu   $0, %z1, %z2"                           \
      |                 ^~~~~~~
./include/asm-generic/div64.h:245:25: note: in expansion of macro '__div64_32'
  245 |                 __rem = __div64_32(&(n), __base);       \
      |                         ^~~~~~~~~~
./include/linux/math64.h:91:22: note: in expansion of macro 'do_div'
   91 |         *remainder = do_div(dividend, divisor);
      |                      ^~~~~~

This has passed correctness verification with test_div64 and reduced the 
module's average execution time down to 1.0404s from 1.0445s with R3400 
@40MHz.  The module's MIPS I machine code has also shrunk by 12 bytes or 
3 instructions.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/include/asm/div64.h |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

Index: linux-3maxp-div64/arch/mips/include/asm/div64.h
===================================================================
--- linux-3maxp-div64.orig/arch/mips/include/asm/div64.h
+++ linux-3maxp-div64/arch/mips/include/asm/div64.h
@@ -58,7 +58,6 @@
 
 #define __div64_32(n, base) ({						\
 	unsigned long __upper, __low, __high, __radix;			\
-	unsigned long long __modquot;					\
 	unsigned long long __quot;					\
 	unsigned long long __div;					\
 	unsigned long __mod;						\
@@ -73,11 +72,8 @@
 		__upper = __high;					\
 		__high = 0;						\
 	} else {							\
-		__asm__("divu	$0, %z1, %z2"				\
-		: "=x" (__modquot)					\
-		: "Jr" (__high), "Jr" (__radix));			\
-		__upper = __modquot >> 32;				\
-		__high = __modquot;					\
+		__upper = __high % __radix;				\
+		__high /= __radix;					\
 	}								\
 									\
 	__mod = do_div64_32(__low, __upper, __low, __radix);		\
