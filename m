Return-Path: <linux-mips+bounces-12478-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A8CCBF51E
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 18:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 039773000948
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 17:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA950322B8E;
	Mon, 15 Dec 2025 17:55:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B556E3242B4
	for <linux-mips@vger.kernel.org>; Mon, 15 Dec 2025 17:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765821313; cv=none; b=g8Ks5uTSHgVogLTK7JOuFnl1gVnJ0jL0B6D8i5o0ZTZrHCpoNR74gNvQk9wRBm9sX8Dk3xOqPOK7EylTuSTmNX7XXGWwWJDTnITnlONyvmG4yuX6rs/6EhZ8ZC8Ey9TSltJ3E1mrdSFf5NRMG4Yd0zts608tSykcRKOmW+HTxk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765821313; c=relaxed/simple;
	bh=fIfWTO7EZ/tNSzgVoDIbwQCc/akNTQHCJxVpm8Ss1h0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=X0eybIBU54dBE9yzypn4QWRfqPzjF6nnScQve2bm/b4J6sovZ+aUuFrJYxIGEEN1nUqdenWKDNZM0PdDm6waz1pplLFgBE82ssMN7goFzYQDRk2D3/1OrjVrUdyMc8KFqerkGH5sbjiWhzJ/JDSuhXlCISbMK7VyNTVTIvkjWVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id D2FD892009C; Mon, 15 Dec 2025 18:55:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id CB9A992009B;
	Mon, 15 Dec 2025 17:55:01 +0000 (GMT)
Date: Mon, 15 Dec 2025 17:55:01 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Hauke Mehrtens <hauke@hauke-m.de>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: Realtek rtl838x MIPS boot hangs since 6.6.119
In-Reply-To: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de>
Message-ID: <alpine.DEB.2.21.2512151706150.31276@angie.orcam.me.uk>
References: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Dec 2025, Hauke Mehrtens wrote:

> Linux 6.6.119 does not boot on my Zyxel GS1900-8 v1 Switch (rtl838x SoC) any
> more.
> 
> When I revert these two patches the system boots up again:
> 
> MIPS: mm: Prevent a TLB shutdown on initial uniquification
> commit 9f048fa upstream.
> https://github.com/gregkh/linux/commit/135713cd0751bf296e515f5fdec234320f73bbd8
> 
> MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
> commit 841ecc9 upstream.
> https://github.com/gregkh/linux/commit/231ac951fabae2aaed8b2c00b4a097107be49c8c

 Thank you for the report and apologies to cause you trouble.  This area 
seems quite model-specific in a subtle way, as we have both CPU and the 
way firmware has initialised it to take into account.

 Can you please try the debug patch included below (which I used to verify 
the correct operation of the changes referred above) and report the output 
produced?

  Maciej
---
 arch/mips/mm/tlb-r4k.c |   17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

linux-mips-tlb-r4k-uniquify-fix-debug.diff
Index: linux-macro/arch/mips/mm/tlb-r4k.c
===================================================================
--- linux-macro.orig/arch/mips/mm/tlb-r4k.c
+++ linux-macro/arch/mips/mm/tlb-r4k.c
@@ -516,7 +516,10 @@ static int r4k_vpn_cmp(const void *a, co
 {
 	long v = *(unsigned long *)a - *(unsigned long *)b;
 	int s = sizeof(long) > sizeof(int) ? sizeof(long) * 8 - 1: 0;
-	return s ? (v != 0) | v >> s : v;
+	int w = s ? (v != 0) | v >> s : v;
+	printk("a: %08lx, b: %08lx, w: %2d",
+	       *(unsigned long *)a, *(unsigned long *)b, w);
+	return w;
 }
 
 /*
@@ -532,6 +535,7 @@ static void r4k_tlb_uniquify(void)
 	unsigned long vpn_mask;
 	int cnt, ent, idx, i;
 
+	printk("r4k_tlb_uniquify: %d\n", slab_is_available());
 	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
 	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
 
@@ -545,15 +549,17 @@ static void r4k_tlb_uniquify(void)
 	htw_stop();
 
 	for (i = start, cnt = 0; i < tlbsize; i++, cnt++) {
-		unsigned long vpn;
+		unsigned long entryhi, vpn;
 
 		write_c0_index(i);
 		mtc0_tlbr_hazard();
 		tlb_read();
 		tlb_read_hazard();
-		vpn = read_c0_entryhi();
+		entryhi = vpn = read_c0_entryhi();
 		vpn &= vpn_mask & PAGE_MASK;
 		tlb_vpns[cnt] = vpn;
+		printk("[%02x/%02x]: %08lx/%08lx/%08x\n", i, cnt, entryhi, vpn,
+		       read_c0_pagemask());
 
 		/* Prevent any large pages from overlapping regular ones.  */
 		write_c0_pagemask(read_c0_pagemask() & PM_DEFAULT_MASK);
@@ -564,6 +570,9 @@ static void r4k_tlb_uniquify(void)
 
 	sort(tlb_vpns, cnt, sizeof(tlb_vpns[0]), r4k_vpn_cmp, NULL);
 
+	for (idx = 0; idx < cnt; idx++)
+		printk("[%02x]: %08lx\n", idx, tlb_vpns[idx]);
+
 	write_c0_pagemask(PM_DEFAULT_MASK);
 	write_c0_entrylo0(0);
 	write_c0_entrylo1(0);
@@ -577,6 +586,8 @@ static void r4k_tlb_uniquify(void)
 			entryhi = UNIQUE_ENTRYHI(ent);
 			vpn = entryhi & vpn_mask & PAGE_MASK;
 
+			printk("[%02x/%02x/%02x]: %08lx/%08lx\n", i, idx, ent,
+			       vpn, tlb_vpns[idx]);
 			if (idx >= cnt || vpn < tlb_vpns[idx]) {
 				write_c0_entryhi(entryhi);
 				write_c0_index(i);

