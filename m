Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F0624AC5F
	for <lists+linux-mips@lfdr.de>; Thu, 20 Aug 2020 02:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHTArg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Aug 2020 20:47:36 -0400
Received: from relay1.mymailcheap.com ([144.217.248.102]:47558 "EHLO
        relay1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgHTArg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Aug 2020 20:47:36 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 0A51C3F157;
        Wed, 19 Aug 2020 20:47:34 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id DFDC92A3B9;
        Wed, 19 Aug 2020 20:47:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1597884453;
        bh=J9JScJSbjxuW0cyxqgEmt85ZvWaBbF7FA9Mv/L55Rqo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BaVr2ND3MXzxRKENbZZcsGKx3TtFz+MjzJaUAi/WBBNexpaRaoDUmmHVvaTvG73a/
         u2KSiV34IOghgG9ViryivcILOWHYATARa+uzVpygCIpBA7GMgLBsfP92XYjBeRNKB5
         n5VK8gz1zgt+C7WjK1sphqkeQp1phHRO/sEXNKoU=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OOeexP1UEHWo; Wed, 19 Aug 2020 20:47:32 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 19 Aug 2020 20:47:32 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id B0B1E41184;
        Thu, 20 Aug 2020 00:47:30 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="urcCyii1";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from localhost.localdomain (unknown [117.136.8.126])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 05DCE4085B;
        Thu, 20 Aug 2020 00:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1597884195;
        bh=J9JScJSbjxuW0cyxqgEmt85ZvWaBbF7FA9Mv/L55Rqo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=urcCyii16Z/YTh/IPIcfqwHQMw/KmAMQ095cPmcVdcoYNT3iTb+kv0iyoWGpNW2RL
         tzzelV0Poxb0xYAqzNAdcBz86ou9fl2h35BtQw5YqoGVPnzZ7NLDDo0TzqiQ0VO++O
         AnoD63WNTyv8qgJOIJmKGJMyvw/ZLHV5ISK9Xytw=
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/2] MIPS: cacheinfo: Add missing VCache
Date:   Thu, 20 Aug 2020 08:42:49 +0800
Message-Id: <20200820004253.3418-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820004253.3418-1-jiaxun.yang@flygoat.com>
References: <20200820004253.3418-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B0B1E41184
X-Spamd-Result: default: False [4.90 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[117.136.8.126:received];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         BROKEN_CONTENT_TYPE(1.50)[];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[7];
         MID_CONTAINS_FROM(1.00)[];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Victim Cache is defined by Loongson as per-core unified
private Cache.
Add this into cacheinfo and make cache levels selfincrement
instead of hardcode levels.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/cacheinfo.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
index 47312c529410..83548331ee94 100644
--- a/arch/mips/kernel/cacheinfo.c
+++ b/arch/mips/kernel/cacheinfo.c
@@ -35,6 +35,11 @@ static int __init_cache_level(unsigned int cpu)
 
 	leaves += (c->icache.waysize) ? 2 : 1;
 
+	if (c->vcache.waysize) {
+		levels++;
+		leaves++;
+	}
+
 	if (c->scache.waysize) {
 		levels++;
 		leaves++;
@@ -74,25 +79,38 @@ static int __populate_cache_leaves(unsigned int cpu)
 	struct cpuinfo_mips *c = &current_cpu_data;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
+	int level = 1;
 
 	if (c->icache.waysize) {
-		/* L1 caches are per core */
+		/* D/I caches are per core */
 		fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
-		populate_cache(dcache, this_leaf, 1, CACHE_TYPE_DATA);
+		populate_cache(dcache, this_leaf, level, CACHE_TYPE_DATA);
 		fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
-		populate_cache(icache, this_leaf, 1, CACHE_TYPE_INST);
+		populate_cache(icache, this_leaf, level, CACHE_TYPE_INST);
+		level++;
 	} else {
-		populate_cache(dcache, this_leaf, 1, CACHE_TYPE_UNIFIED);
+		populate_cache(dcache, this_leaf, level, CACHE_TYPE_UNIFIED);
+		level++;
+	}
+
+	if (c->vcache.waysize) {
+		/* Vcache is per core as well */
+		fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
+		populate_cache(vcache, this_leaf, level, CACHE_TYPE_UNIFIED);
+		level++;
 	}
 
 	if (c->scache.waysize) {
-		/* L2 cache is per cluster */
+		/* Scache is per cluster */
 		fill_cpumask_cluster(cpu, &this_leaf->shared_cpu_map);
-		populate_cache(scache, this_leaf, 2, CACHE_TYPE_UNIFIED);
+		populate_cache(scache, this_leaf, level, CACHE_TYPE_UNIFIED);
+		level++;
 	}
 
-	if (c->tcache.waysize)
-		populate_cache(tcache, this_leaf, 3, CACHE_TYPE_UNIFIED);
+	if (c->tcache.waysize) {
+		populate_cache(tcache, this_leaf, level, CACHE_TYPE_UNIFIED);
+		level++;
+	}
 
 	this_cpu_ci->cpu_map_populated = true;
 
-- 
2.28.0
