Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 093304FF647
	for <lists+linux-mips@lfdr.de>; Wed, 13 Apr 2022 13:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235432AbiDML7z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Apr 2022 07:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234834AbiDML7e (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Apr 2022 07:59:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F755DA35;
        Wed, 13 Apr 2022 04:56:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 257DE61DEF;
        Wed, 13 Apr 2022 11:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5ECC385A3;
        Wed, 13 Apr 2022 11:56:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VDxKufAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1649850965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gMuiTScdp7c+tPntikHvEFRo+YYqSeslWu8YJFI7ND8=;
        b=VDxKufAbcpZHe2UGxTIl2aDRHpkYNyjPH0PxxC+TaXgvtBCQtp10eZ9NvscTR0YI3Mdej/
        Z/6prrXtJi1o2nDPsMXdIm7kQ7cft3qANs6xSlBlIvn4V862uLlz3rSGh6z17OM4oAvG5x
        7bACYuAs17/Ya2d5ga5fVxf+CmmzrZk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c9127ee5 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Wed, 13 Apr 2022 11:56:05 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        tglx@linutronix.de, arnd@arndb.de
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Theodore Ts'o <tytso@mit.edu>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "David S . Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, x86@kernel.org,
        linux-xtensa@linux-xtensa.org
Subject: [PATCH v4 10/11] xtensa: use fallback for random_get_entropy() instead of zero
Date:   Wed, 13 Apr 2022 13:54:10 +0200
Message-Id: <20220413115411.21489-11-Jason@zx2c4.com>
In-Reply-To: <20220413115411.21489-1-Jason@zx2c4.com>
References: <20220413115411.21489-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the event that random_get_entropy() can't access a cycle counter or
similar, falling back to returning 0 is really not the best we can do.
Instead, at least calling random_get_entropy_fallback() would be
preferable, because that always needs to return _something_, even
falling back to jiffies eventually. It's not as though
random_get_entropy_fallback() is super high precision or guaranteed to
be entropic, but basically anything that's not zero all the time is
better than returning zero all the time.

This is accomplished by just including the asm-generic code like on
other architectures, which means we can get rid of the empty stub
function here.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/xtensa/include/asm/timex.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/xtensa/include/asm/timex.h b/arch/xtensa/include/asm/timex.h
index 233ec75e60c6..3f2462f2d027 100644
--- a/arch/xtensa/include/asm/timex.h
+++ b/arch/xtensa/include/asm/timex.h
@@ -29,10 +29,6 @@
 
 extern unsigned long ccount_freq;
 
-typedef unsigned long long cycles_t;
-
-#define get_cycles()	(0)
-
 void local_timer_setup(unsigned cpu);
 
 /*
@@ -59,4 +55,6 @@ static inline void set_linux_timer (unsigned long ccompare)
 	xtensa_set_sr(ccompare, SREG_CCOMPARE + LINUX_TIMER);
 }
 
+#include <asm-generic/timex.h>
+
 #endif	/* _XTENSA_TIMEX_H */
-- 
2.35.1

