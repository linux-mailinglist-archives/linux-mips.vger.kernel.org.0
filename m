Return-Path: <linux-mips+bounces-12346-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0A1C829A2
	for <lists+linux-mips@lfdr.de>; Mon, 24 Nov 2025 22:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B55234E2878
	for <lists+linux-mips@lfdr.de>; Mon, 24 Nov 2025 21:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B893321B1;
	Mon, 24 Nov 2025 21:53:42 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C94A283FE5;
	Mon, 24 Nov 2025 21:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764021222; cv=none; b=iGdlq44xbOkInb+g1EZ1/GZPKF4FqufTqA7LXR+7s8PYygtc1NCF2l1G9B+8YjtvS6jcdF+3d98ZOX7Xd2BGcQRA9E6KRvOX2VcQuLcHeP7YilKheGvl8/+RMpN3ZqlElIIR8XkRdcmNL1TVl2CQLgfF0HL0Zy/8Xs9WTjcvx1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764021222; c=relaxed/simple;
	bh=l1HIKVEmowrpcKHihVHNlEIGIHwP1yHfzbEM1d33l5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOnUltwE9UCeCXFb+yleDTex+PZ8OcI4ey1WyevuhoTfQzbZ22NCJ4VA6kEbHBJBTD+PTs8ZUYBcrhZCaxr9EFQRTZ6FFqQVHg36xqh4etKcYTW47R2LB92DO6iMEset6ikysxvwEQiT3a894f4/Qg92M53X70jjY+H0ejAIq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vNeV5-0002pE-00; Mon, 24 Nov 2025 22:53:35 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 780A3C0256; Mon, 24 Nov 2025 22:53:22 +0100 (CET)
Date: Mon, 24 Nov 2025 22:53:22 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] MIPS fixes for v6.18
Message-ID: <aSTT0gbH-NkDOH8A@alpha.franken.de>
References: <aSIhefXIXrLpMaC5@alpha.franken.de>
 <87wm3f8mcb.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wm3f8mcb.fsf@BLaptop.bootlin.com>

On Mon, Nov 24, 2025 at 04:46:44PM +0100, Gregory CLEMENT wrote:
> Hello Thomas,
> 
> > The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:
> >
> >   Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.18_1
> >
> > for you to fetch changes up to 14b46ba92bf547508b4a49370c99aba76cb53b53:
> >
> >   MIPS: kernel: Fix random segmentation faults (2025-11-21 13:24:05 +0100)
> >
> > ----------------------------------------------------------------
> > - Fix CPU type in DT for econet
> > - Fix for Malta PCI MMIO breakage for SOC-it
> > - Fix TLB shutdown caused by iniital uniquification
> > - Fix random seg faults
> >
> > ----------------------------------------------------------------
> > Aleksander Jan Bajkowski (1):
> >       mips: dts: econet: fix EN751221 core type
> >
> > Maciej W. Rozycki (2):
> >       MIPS: Malta: Fix !EVA SOC-it PCI MMIO
> >       MIPS: mm: Prevent a TLB shutdown on initial uniquification
> 
> Today, the kernel v6.18-rc7 no longer boots on EyeQ5 and EyeQ6H (MIPS
> I6500)-based boards. After a git bisect between v6.18-rc6 and v6.18-rc7,
> we found that the culprit is the commit "MIPS: mm: Prevent a TLB
> shutdown on initial uniquification".
> 
> Here is the log from a vanilla v6.18-rc7:

[..]

I guess your cores have more than 64 TLB entries. The Octeon CPU has
256 entries... Patch below fixes the issue there.

Thomas.

From b74abcb21103519ae48726c715d39a6aa3f57462 Mon Sep 17 00:00:00 2001
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date: Mon, 24 Nov 2025 22:46:43 +0100
Subject: [PATCH] MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow

Latest MIPS cores could have much more than 64 TLB entries, therefore
allocate array for unification instead of placing a too small array
on stack.

Fixes: 9f048fa48740 ("MIPS: mm: Prevent a TLB shutdown on initial uniquification")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/mm/tlb-r4k.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 3facf7cc6c7d..577055b50c41 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -524,15 +524,19 @@ static int r4k_vpn_cmp(const void *a, const void *b)
  */
 static void r4k_tlb_uniquify(void)
 {
-	unsigned long tlb_vpns[1 << MIPS_CONF1_TLBS_SIZE];
 	int tlbsize = current_cpu_data.tlbsize;
 	int start = num_wired_entries();
+	unsigned long *tlb_vpns;
 	unsigned long vpn_mask;
 	int cnt, ent, idx, i;
 
 	vpn_mask = GENMASK(cpu_vmbits - 1, 13);
 	vpn_mask |= IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
 
+	tlb_vpns = kmalloc_array(tlbsize, sizeof(unsigned long), GFP_KERNEL);
+	if (!tlb_vpns)
+		return; /* pray local_flush_tlb_all() is good enough */
+
 	htw_stop();
 
 	for (i = start, cnt = 0; i < tlbsize; i++, cnt++) {
@@ -585,6 +589,7 @@ static void r4k_tlb_uniquify(void)
 	tlbw_use_hazard();
 	htw_start();
 	flush_micro_tlb();
+	kfree(tlb_vpns);
 }
 
 /*
-- 
2.43.0

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

