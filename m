Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFC407B8DB
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jul 2019 06:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbfGaEki (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Jul 2019 00:40:38 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25439 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728477AbfGaEki (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 31 Jul 2019 00:40:38 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564547992; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=m4avGWKs1SABe+PRjhmFRG0Mu+M4XbK/DqFrIpsXVfrLcBfz8jqojT8ZU1nKdlb19v8QOHK3fGZm+0ZHs7L7ZNa+/XTJR4GfLJQWfL0PbTmi+sAzrik+x8q9G+Ch54nhxdqQ8Bf44/5jKLntRonAJsTqy1Cj0xrlSQ+HEh0O7SQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564547992; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=JaAydh1T9WDrn0zFAYMF2wyL7O0jE513KdDgoPdGaaM=; 
        b=PgrUr8ZjzHgyNYHcbyffxSdh/2kfLbgocUl5sToahV1ptYEsvdqhIXuuc9W4JS7y/hkMIwJak6OvBSrJV/y1GnFcfKqgD1ksAQM1BuEExWG7L2F6p1tnS3ZHrZtOBL30dTY1xz6QCe+RaVKadpzDCJ5lpZtrAxJOAiu7ySTdq6o=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=hBwB8uJngsoSXGOZzIxI3JPXAVXxjulZV7UBqljex3k6bK68OfAy1xzF2Ta0h6JTJRPJcHMVwIzO
    x+5SwzOws7mitbJ6qFKRUhpqLMR41aIDd5/6VDcjaZC6cOzu1GbE  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564547992;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2635; bh=JaAydh1T9WDrn0zFAYMF2wyL7O0jE513KdDgoPdGaaM=;
        b=aN40XLtiJhePB+q6NE/cgkpP5DIXGTDAjo9xRe/5Cv1s/807IIf5ErLKK4xj4zK/
        amqEBqhGIkTgaqw6lu2j5dEHpJ7etcH3IVftnXN02b8PM/WbYK/2N2X5Gi/vhvgVCHF
        LeIut5SJpYuokajaQqosmCUhcWbDt4CcOj7LgLM8=
Received: from localhost.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 156454799072489.93408510051506; Tue, 30 Jul 2019 21:39:50 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul@crapouillou.net, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, chenhc@lemote.com, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, jiaxun.yang@flygoat.com
Subject: [PATCH v2] MIPS: Ingenic: Fix bugs when detecting X1000's parameters.
Date:   Wed, 31 Jul 2019 12:39:03 +0800
Message-Id: <1564547943-27505-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564547943-27505-1-git-send-email-zhouyanjie@zoho.com>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
 <1564547943-27505-1-git-send-email-zhouyanjie@zoho.com>
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
 arch/mips/include/asm/mipsregs.h |  1 +
 arch/mips/kernel/cpu-probe.c     |  7 +++++++
 arch/mips/mm/sc-mips.c           | 18 +++++++++++++++---
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 1e6966e..01e0fcb 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -2813,6 +2813,7 @@ __BUILD_SET_C0(status)
 __BUILD_SET_C0(cause)
 __BUILD_SET_C0(config)
 __BUILD_SET_C0(config5)
+__BUILD_SET_C0(config7)
 __BUILD_SET_C0(intcontrol)
 __BUILD_SET_C0(intctl)
 __BUILD_SET_C0(srsmap)
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index eb527a1..547c9a0 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1964,6 +1964,13 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_XBURST;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		__cpu_name[cpu] = "Ingenic XBurst";
+		/*
+		 * config7 bit 4 is used to control a low-power mode in
+		 * XBurst architecture. This mode may cause errors in the
+		 * calculation of bogomips and loops_per_jiffy, set config7
+		 * bit 4 to disable this feature to prevent that.
+		 */
+		set_c0_config7(BIT(4));
 		break;
 	default:
 		panic("Unknown Ingenic Processor ID!");
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


