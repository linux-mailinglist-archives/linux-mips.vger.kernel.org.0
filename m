Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACDC52E75D8
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 04:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgL3Dk6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 22:40:58 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:54533 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726138AbgL3Dk6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 22:40:58 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 33412700;
        Tue, 29 Dec 2020 22:40:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 29 Dec 2020 22:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=AAVrpDmMadjqROimwI2b/EOt+H
        kVq5eqBpwwbJ/SxYY=; b=oJdCeTqGIbkQ9Qhy12tH6UsyFVh88nphmBbq+6AuE0
        mtBvrx3T7lMv/HQ5G66/+AWd2ql6cUmd1Trel4ariZZMqZqvkX27BY3CCQ2enA3i
        LkpAVr2APzGeAGakScV9c4GmnCxb1pXr5Ays7wkHJ/KBo+XnS3TgaNdFVqsa3wda
        /03MJmJbb/yNejWvgexw3vFbxKLZPv04xANk0bgFF6u/CBmxjrVgj5nxCgJ/UnlK
        rpg58YK14gNLPnQ6vU2CXLIpzptwLRom8yEL6tV/MZ2q+6mJR/30v/mDEYbMncc5
        8e0UL+MylDkzgY06up+0sc5x4EyQ5ZWl7aGDft2odK5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=AAVrpDmMadjqROimw
        I2b/EOt+HkVq5eqBpwwbJ/SxYY=; b=M+KbwuUcnsjIZW5OxTypyR6qkPm1+cYGe
        3PHhC63bbffUdn7kMpF5M0KsmogzgXkxliYLQ28+8jsear+8paze0ixpa2kyKrYY
        HxO0uGCm83YHiKAIIxq2BEpzJ1bM63nHeBFwEJgL/NwEP7Eu0IxHvoY6kJhsem+S
        9dYrnuM3Ovoa0k/O9wNlU8QO9inAxUsW1/YiA/okpGwJmBdIPbVMgoCOrZ269elW
        lovbV8Xl0lRzFBw87I4Dduad0GTiyMQM+a6vBxtaHF74ErC2se2JP/iTPNQM94TD
        xazSlZl7MAi6otFDRNhJq9NnLxuaR4pJMGPlUNjUQQVp1IqUBpkEA==
X-ME-Sender: <xms:mfbrX4K2DVfgtlwh7QUNylkn5ffmv8HMALB0OP_nJIsDsalFZJlKeA>
    <xme:mfbrX4KdnabbL9cGOOZkay4-d6uKAHRHQzzh85vWhztYs7fp1qDbWXxmrg_HDVxWA
    bBXCClFQEl75eAyDEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihunhcu
    jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
    grthhtvghrnhephfejtdektdeuhedtieefteekveffteejteefgeekveegffetvddugfel
    iefhtddunecukfhppeeitddrudejjedrudekledrudejudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhm
X-ME-Proxy: <xmx:mfbrX4s013N-71jbVOWQL-DdM9CZnSwnjoHGAbeFhPHfsPhOCjd6rA>
    <xmx:mfbrX1at3eqVPj24zIP-Mxk4Frc-bUhqCYjfIZm4j4VnAVLsHCgr7A>
    <xmx:mfbrX_bVqcV88G4pMHeawWpEsFTypFOuvZKs5dw3urzmbWvY46BGdA>
    <xmx:m_brX-lrIWrcnVR0iLHdqNlg1XAh-vNbC6U5SRFHe_qeeU4WnChSr3JfsXs>
Received: from strike.202.net.flygoat.com (unknown [60.177.189.171])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9F90124005A;
        Tue, 29 Dec 2020 22:40:05 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/2] MIPS: cacheinfo: Add missing VCache
Date:   Wed, 30 Dec 2020 11:39:48 +0800
Message-Id: <20201230033950.13839-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Victim Cache is defined by Loongson as per-core unified
private Cache.
Add this into cacheinfo and make cache levels selfincrement
instead of hardcode levels.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
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
2.30.0

