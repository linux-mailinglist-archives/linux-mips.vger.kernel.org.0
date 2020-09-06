Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899A125F026
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgIFTaa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:30:30 -0400
Received: from crapouillou.net ([89.234.176.41]:35806 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgIFTa3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420588; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AyGUD/j8DvKbTVq8zvcMLRaB6iYfy1kwUhVCXGle+00=;
        b=VUmf7L24ZSer5mF5iF3s0d2OSHpShS6bXAIAK4IGK/iuZI07+UL4D3a57SvnwxdWQXFDus
        JToRAl+ui7DR5rjDLN3ZX0S3Af8bmljXqVplaCJj55QHbveUwsEY67gUax2uoz1bcmcw4t
        jqoAfnTkLEofb3Z2wsu1zr6phWmQfe8=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 04/15] MIPS: cpu-probe: ingenic: Fix broken BUG_ON
Date:   Sun,  6 Sep 2020 21:29:24 +0200
Message-Id: <20200906192935.107086-5-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The previous code was doing:
BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);

This only worked as the "cpu_has_counter" macro was overridden in
<cpu-feature-overrides.h>. The default "cpu_has_counter" macro is
non-constant, which triggered the BUG_ON() independently of the value
returned by the macro.

What we want to check here, is that *if* the macro was overridden to a
compile-time constant, then must be defined to zero, otherwise it's a
bug.

So the correct check is:
BUG_ON(__builtin_constant_p(cpu_has_counter) && cpu_has_counter);

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2-v3: No change

 arch/mips/kernel/cpu-probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index a07e66a6e063..6be23f205e74 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -2123,7 +2123,7 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 
 	/* XBurst does not implement the CP0 counter. */
 	c->options &= ~MIPS_CPU_COUNTER;
-	BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);
+	BUG_ON(__builtin_constant_p(cpu_has_counter) && cpu_has_counter);
 
 	/* XBurst has virtually tagged icache */
 	c->icache.flags |= MIPS_CACHE_VTAG;
-- 
2.28.0

