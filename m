Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26E3E7B054
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 19:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfG3RlU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jul 2019 13:41:20 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25401 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfG3RlQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Jul 2019 13:41:16 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564508422; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=du1Elyexm7ALYNjVm2ylWhySii8zUx7LoPwc2ifiFchS7A9hsjpQRY5aLGvh62Rk3631ueJ0SvFhJVFBf6f8L5zbev+04v8W/QcSDi4bPHZh+zpL9fjZFDEfdI/Ng9L7w34BGfv1peLKKNWXzK07rPIghSp9/Eewj07WHUP2U/A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564508422; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=728HodtxlQspuSWgc0WI2C4ZB/XnFKgXz7EKp0oAYhw=; 
        b=noUnok43K/jGVu//UsP1+FRgFXEnB3PrwyMwBP173Gc/rOKxUcyGb7Zcstqk6vsdjCUDzuoUDGbnZnfSh33OxlXncQGKIYBAew2qYGdLv4MV73vIegYi9USmxUEQXS7SuAarA7Q/NP7LXK2lAizKvcYnmIoJ9ji8mnoscrTxJSw=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=k9Mkye7d4RBrUeacHCGizzV6cKDVvaXSAs8ErlpQz/n2THTM3gwDa04+Wpzw9rs6OJhhBZKFBrCv
    jK9lNC8xiEGg/8iTAJtCLeYhpBdCh9GX5piwRt2sXnMJzucPgLKO  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564508422;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2231; bh=728HodtxlQspuSWgc0WI2C4ZB/XnFKgXz7EKp0oAYhw=;
        b=PDCa/6/+P25Vb2iXqAfxpxF+ISNuxUF4Da8ly34ghulpmXWh1k8YfpN5OA5tEIKP
        hmFqEOQEvNfG+k4KG8xo/coR26+VJKteF7w+abMPSmQS6tk+az8KeSUMY7A0+cVN/4D
        DorXm91bZgtfFr/XqoF9UAYDPhYJTWk6mqMIRkB8=
Received: from localhost.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 156450842112058.53911824379736; Tue, 30 Jul 2019 10:40:21 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul@crapouillou.net, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, chenhc@lemote.com, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, jiaxun.yang@flygoat.com
Subject: [PATCH] MIPS: Ingenic: Fix bugs when detecting X1000's parameters.
Date:   Tue, 30 Jul 2019 22:55:10 +0800
Message-Id: <1564498510-3751-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.fix bugs when detecting L2 cache sets value.
2.fix bugs when detecting L2 cache ways value.
3.fix bugs when calculate bogoMips and loops_per_jiffy.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/kernel/cpu-probe.c |  7 ++++++-
 arch/mips/mm/sc-mips.c       | 18 +++++++++++++++---
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index eb527a1..a914435 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1960,11 +1960,16 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 	c->options &= ~MIPS_CPU_COUNTER;
 	BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);
 	switch (c->processor_id & PRID_IMP_MASK) {
-	case PRID_IMP_XBURST:
+	case PRID_IMP_XBURST: {
+		unsigned int config7;
 		c->cputype = CPU_XBURST;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		__cpu_name[cpu] = "Ingenic XBurst";
+		config7 = read_c0_config7();
+		config7 |= (1 << 4);
+		write_c0_config7(config7);
 		break;
+	}
 	default:
 		panic("Unknown Ingenic Processor ID!");
 		break;
diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 9385ddb..ed953d4 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -215,6 +215,14 @@ static inline int __init mips_sc_probe(void)
 	else
 		return 0;
 
+	/*
+	 * According to config2 it would be 512-sets, but that is contradicted
+	 * by all documentation.
+	 */
+	if (current_cpu_type() == CPU_XBURST &&
+				mips_machtype == MACH_INGENIC_X1000)
+		c->scache.sets = 256;
+
 	tmp = (config2 >> 0) & 0x0f;
 	if (tmp <= 7)
 		c->scache.ways = tmp + 1;
@@ -225,9 +233,13 @@ static inline int __init mips_sc_probe(void)
 	 * According to config2 it would be 5-ways, but that is contradicted
 	 * by all documentation.
 	 */
-	if (current_cpu_type() == CPU_XBURST &&
-				mips_machtype == MACH_INGENIC_JZ4770)
-		c->scache.ways = 4;
+	if (current_cpu_type() == CPU_XBURST) {
+		switch (mips_machtype) {
+		case MACH_INGENIC_JZ4770:
+		case MACH_INGENIC_X1000:
+			c->scache.ways = 4;
+		}
+	}
 
 	c->scache.waysize = c->scache.sets * c->scache.linesz;
 	c->scache.waybit = __ffs(c->scache.waysize);
-- 
2.7.4


