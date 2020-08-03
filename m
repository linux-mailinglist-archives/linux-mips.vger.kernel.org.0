Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A83DC23AB3C
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 19:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgHCRCK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 13:02:10 -0400
Received: from crapouillou.net ([89.234.176.41]:37440 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgHCRCJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Aug 2020 13:02:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596474106; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2/KDl9yfqV/P7DRInolPKP6hdGlIcTe1nAk+3X+YJcY=;
        b=B82OVOnS7YwwJnughdiz0xg3PsTg7y8EbEU88BrXib6tWq2bAiZsAzEVoEby4qC/3RZrlH
        o+DiFHwB3YceeLaQsNGiS3Q000tNydKcg0l/YU3I0hNIN6hf7n3e1DEEK1aUJiuVWXzE5C
        qLWd8B63aghYktS+ZmaqG8i+4u8WRnY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 03/13] MIPS: cpu-probe: ingenic: Fix broken BUG_ON
Date:   Mon,  3 Aug 2020 19:01:14 +0200
Message-Id: <20200803170124.231110-4-paul@crapouillou.net>
In-Reply-To: <20200803170124.231110-1-paul@crapouillou.net>
References: <20200803170124.231110-1-paul@crapouillou.net>
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
2.27.0

