Return-Path: <linux-mips+bounces-12373-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A65AC92AEB
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 17:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 28D824E5128
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 16:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8891F32FA38;
	Fri, 28 Nov 2025 16:53:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD1232F765;
	Fri, 28 Nov 2025 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348838; cv=none; b=cS9dxxcSvV2Q97m5nC01GRw64u1WXQli+vxwhoDfb8iwBtCfx0XQq+g3JB+Ylct/vOc/WAeB+2jElQmNfmIgGLmamC04vgRu3H3eanD4bvqNCIIGkQV0PJCOjPltJur0uwD47s80vX7cqlSaxb05ZMaCNUiRB9rFC0OpR+TBNAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348838; c=relaxed/simple;
	bh=hYFL3+yQ+dY6SKqEEwQ8TkfQzkZdMhm/LOF5r5ou/aY=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=dQR7Yesy/PSyv2bHZ7JRonLIzA4imEyyhOq5pbB+sfH4Bl7sVGHx8hFLumbsGxbepVeMY7gQqU8U1yGhCuLb+86tHw1Ttf3dgeH0waiYA/GGyB3JkG+lq8u33PmW/5iSD7e4fAtUMmMOSWErXtEAiAuPjFx9qBmOzErrgGiIUCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2E71092009C; Fri, 28 Nov 2025 17:53:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2B58892009B;
	Fri, 28 Nov 2025 16:53:46 +0000 (GMT)
Date: Fri, 28 Nov 2025 16:53:46 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH v5] MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
Message-ID: <alpine.DEB.2.21.2511281647170.36486@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Owing to Config4.MMUSizeExt and VTLB/FTLB MMU features later MIPSr2+ 
cores can have more than 64 TLB entries.  Therefore allocate an array 
for uniquification instead of placing too small an array on the stack.

Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
Co-developed-by: Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: stable@vger.kernel.org # v6.17+: 9f048fa48740: MIPS: mm: Prevent a TLB shutdown on initial uniquification
Cc: stable@vger.kernel.org # v6.17+
---
 Verified with Malta/74Kf and Malta/interAptiv for initial and secondary 
CPU bootstrap.  The PM path hasn't been covered, but is expected to be 
the same as secondary CPU bootstrap.

 NB Malta/interAptiv has issues later on in SMP boot (boots fine UP) and 
hangs with repeated:

irq 23: nobody cared (try booting with the "irqpoll" option)
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.18.0-rc1-dirty #2 NONE

messages (for the CP0 timer interrupt AFAICT; GIC timer is supposed to 
be used instead).  This will have to be bisected.

Changes from v4:

- Mark `r4k_tlb_uniquify' `__ref' so as to silence `modpost'.

Changes from v3:

- Rearrange tags including stable backport ones so as to pick the original 
  change together with this fix only.

Changes from v2:

- Use the bootmem allocator for early calls (CPU #0 bootstrap).

- Update the change description; mark for stable backporting.
---
 arch/mips/mm/tlb-r4k.c |   18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

linux-mips-tlb-r4k-uniquify-tlbsize.diff
Index: linux-macro/arch/mips/mm/tlb-r4k.c
===================================================================
--- linux-macro.orig/arch/mips/mm/tlb-r4k.c
+++ linux-macro/arch/mips/mm/tlb-r4k.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/sched.h>
 #include <linux/smp.h>
+#include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/hugetlb.h>
 #include <linux/export.h>
@@ -522,17 +523,26 @@ static int r4k_vpn_cmp(const void *a, co
  * Initialise all TLB entries with unique values that do not clash with
  * what we have been handed over and what we'll be using ourselves.
  */
-static void r4k_tlb_uniquify(void)
+static void __ref r4k_tlb_uniquify(void)
 {
-	unsigned long tlb_vpns[1 << MIPS_CONF1_TLBS_SIZE];
 	int tlbsize = current_cpu_data.tlbsize;
+	bool use_slab = slab_is_available();
 	int start = num_wired_entries();
+	phys_addr_t tlb_vpn_size;
+	unsigned long *tlb_vpns;
 	unsigned long vpn_mask;
 	int cnt, ent, idx, i;
 
 	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
 	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
 
+	tlb_vpn_size = tlbsize * sizeof(*tlb_vpns);
+	tlb_vpns = (use_slab ?
+		    kmalloc(tlb_vpn_size, GFP_KERNEL) :
+		    memblock_alloc_raw(tlb_vpn_size, sizeof(*tlb_vpns)));
+	if (WARN_ON(!tlb_vpns))
+		return; /* Pray local_flush_tlb_all() is good enough. */
+
 	htw_stop();
 
 	for (i = start, cnt = 0; i < tlbsize; i++, cnt++) {
@@ -585,6 +595,10 @@ static void r4k_tlb_uniquify(void)
 	tlbw_use_hazard();
 	htw_start();
 	flush_micro_tlb();
+	if (use_slab)
+		kfree(tlb_vpns);
+	else
+		memblock_free(tlb_vpns, tlb_vpn_size);
 }
 
 /*

