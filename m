Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F415D1C0309
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 18:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgD3Qs0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 12:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726396AbgD3Qs0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 12:48:26 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D2CC035494
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 09:48:26 -0700 (PDT)
Received: from localhost.localdomain (unknown [103.125.232.133])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 2C5A020CE8;
        Thu, 30 Apr 2020 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588265304; bh=qsFYWOW1f6+Cp5nDQBjeJyYf5PYH2tcNzIfWS+WY9zk=;
        h=From:To:Cc:Subject:Date:From;
        b=tYZ3EUqglxhZX5KQNsBwCmSH1eUm70HbL5fqJdG7CPZ9gbPZTz6CMRE0sthAmCBHU
         byjysBYxKD78nEpUdE1VvZ9qmbJvCVM+fm3Y6frCfs8WS9MVuvtq3Ug3F6Jk9zDyVQ
         gZH/S7Ip1CQpbYPw/FDDpIuMO3AdJzvbsctxk1TI+KXGpqNwIt1nCLGulLyzX7rPWN
         FkGn/o5eWHu3sbJGgQ89tWaGWpnT9CntgJC1wcBqZ7Z4a9sf1PGhX7wb2SNFjd0zY5
         //HRkf4oUeHWUAyksUfXVljbukPdkG0cZ0+s8ceG826tL8vTLO3vEAYHp/pQnidc2H
         YCicwXhpaQDag==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, tsbogend@alpha.franken.de,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: Loongson64: Correct TLB type for Loongson-3 Classic
Date:   Fri,  1 May 2020 00:48:02 +0800
Message-Id: <20200430164802.2809056-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Huacai just informed me that some early Loongson-3A2000 had wrong
TLB type in Config0 register. That means we have to correct it via
PRID.

It looks like I shoudn't drop MIPS_CPU_FTLB flag in PRID case for
Loongson-3 Classic.

Fixes: da1bd29742b1 ("MIPS: Loongson64: Probe CPU features via CPUCFG")
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reported-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/cpu-probe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 1736c173b242..ca2e6f1af4fe 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1999,8 +1999,11 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		 * Loongson-3 Classic did not implement MIPS standard TLBINV
 		 * but implemented TLBINVF and EHINV. As currently we're only
 		 * using these two features, enable MIPS_CPU_TLBINV as well.
+		 *
+		 * Also some early Loongson-3A2000 had wrong TLB type in Config
+		 * register, we correct it here.
 		 */
-		c->options |= MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
+		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
-- 
2.26.0.rc2

