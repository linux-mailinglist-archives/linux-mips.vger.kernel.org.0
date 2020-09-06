Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2514B25F024
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgIFTaW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:30:22 -0400
Received: from crapouillou.net ([89.234.176.41]:35730 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgIFTaL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420586; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4c+LCRxx2HBnpgIMYwoqUy4TBa7cLihzl0H4Nemqltk=;
        b=giyQ3t1JRUvX771QT7G+MlT3jAEA/uk0AyGH+R0s0KiosY0q7+2avgIgTYZYLbeCiRscR7
        gKCyGY9FlFKaf9Gyrl017Y2TFRE2hwjOQxcmcTUvTfoX9BHUpKFzmFSMr1+HJHA5YgLjfc
        waB+TDewZ+D6oha+3EF7HHo1L+raeDw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 03/15] MIPS: cpu-probe: Mark XBurst CPU as having vtagged caches
Date:   Sun,  6 Sep 2020 21:29:23 +0200
Message-Id: <20200906192935.107086-4-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

XBurst CPUs present in Ingenic SoCs have virtually tagged caches,
according to the <cpu-features-override.h> header.

Add that information to cpu_probe_ingenic().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2-v3: No change

 arch/mips/kernel/cpu-probe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index a18f3611fa5e..a07e66a6e063 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -2125,6 +2125,9 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 	c->options &= ~MIPS_CPU_COUNTER;
 	BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);
 
+	/* XBurst has virtually tagged icache */
+	c->icache.flags |= MIPS_CACHE_VTAG;
+
 	switch (c->processor_id & PRID_IMP_MASK) {
 
 	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA */
-- 
2.28.0

