Return-Path: <linux-mips+bounces-12196-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4EEC4ED2A
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 16:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB3F118899AF
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 15:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A24342C99;
	Tue, 11 Nov 2025 15:41:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1770A34FF7C;
	Tue, 11 Nov 2025 15:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762875714; cv=none; b=fiOM+Xvr+p4M9B3FeP7Eyp0UkglViG+rpy/yW1rrpO52QKr8kqa0eFZSw6eIb3Fzex8885fBG8R0DAndOyvpwxKtBsFxmgosjydmqI5XQXV4Sc7SoiiD9OSuNKFr39AV0rCkRgLqPSEBJOazr/SWK4g8XIrP/5QdCYuj+P0CxxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762875714; c=relaxed/simple;
	bh=4CFipZG9xNGjKhu7PtE3fDf5/dXjNWLSVeKWkYCwnfI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qNvd57zxZP8Czl6/d6DRdUZuAhailXQsq/1qPzi/MB7e/+GX4AN2CGUE1EltRf5hk4Vpn7OBRiwPKwVBLnCM5YOD46lzHnbZ7sAg/M3+ZXsOvKdKLZFMQ6QwiYKwAZlmZV3UMs+S4m5W1xFiQvZJwqzJqR4s58mtK6CUnnJAy/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 4B02492009E; Tue, 11 Nov 2025 16:41:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 43F6792009D;
	Tue, 11 Nov 2025 15:41:50 +0000 (GMT)
Date: Tue, 11 Nov 2025 15:41:50 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Nick Bowler <nbowler@draconx.ca>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
In-Reply-To: <aRMrmjJcLJYR8QO-@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2511111340330.25436@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk> <aRMrmjJcLJYR8QO-@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Nov 2025, Thomas Bogendoerfer wrote:

> >  Can you please give it a try with your systems?
> 
> it's booting on my R4400 SGI Indy, but I see a lot of segmentation
> faults during system start. If I comment out r4k_tlb_uniquify() every-
> thing boots fine, which is kind of strange as there is a local_flush_tlb_all(),
> which should leave the TLB in the same stage.... No idea why, yet.

 Can you try the diagnostic patch below, which is what I used to verify 
this change, and report the entries produced?  Otherwise I wonder whether 
I haven't missed a barrier somewhere.

> > +
> > +	for (i = start, cnt = 0; i < tlbsize; i++, cnt++) {
> 
> shouldn't we read all TLB entries here ? 

 Strictly speaking it won't change anything as we call `write_c0_wired(0)' 
in `r4k_tlb_configure' before getting here and wired entries make no sense 
for KSEG0, so whatever would otherwise be there should not clash with our 
unique entries.  But I guess it won't hurt.  OTOH `ent' ought to be set up 
from `tlbsize' rather than `cnt' should the Wired register setting ever 
change.  I'll have a look, but I we need to know why the current version 
causes troubles with your system first.

 NB I wonder how this is supposed to work with mapped kernels, I thought 
the setup made with MAPPED_KERNEL_SETUP_TLB was meant to be permanent 
through the life of the system, hmm...

  Maciej
---
 arch/mips/mm/tlb-r4k.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

linux-mips-tlb-r4k-uniquify-fix-debug.diff
Index: linux-macro/arch/mips/mm/tlb-r4k.c
===================================================================
--- linux-macro.orig/arch/mips/mm/tlb-r4k.c
+++ linux-macro/arch/mips/mm/tlb-r4k.c
@@ -535,19 +535,23 @@ static void r4k_tlb_uniquify(void)
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
+		printk("[%02x/%02x]: %08lx/%08lx\n", i, cnt, entryhi, vpn);
 	}
 
 	sort(tlb_vpns, cnt, sizeof(tlb_vpns[0]), r4k_vpn_cmp, NULL);
 
+	for (idx = 0; idx < cnt; idx++)
+		printk("[%02x]: %08lx\n", idx, tlb_vpns[idx]);
+
 	write_c0_entrylo0(0);
 	write_c0_entrylo1(0);
 
@@ -560,6 +564,8 @@ static void r4k_tlb_uniquify(void)
 			entryhi = UNIQUE_ENTRYHI(ent);
 			vpn = entryhi & vpn_mask & PAGE_MASK;
 
+			printk("[%02x/%02x/%02x]: %08lx/%08lx\n", i, idx, ent,
+			       vpn, tlb_vpns[idx]);
 			if (idx >= cnt || vpn < tlb_vpns[idx]) {
 				write_c0_entryhi(entryhi);
 				write_c0_index(i);

