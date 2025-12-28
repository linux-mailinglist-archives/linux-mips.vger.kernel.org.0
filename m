Return-Path: <linux-mips+bounces-12605-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C375FCE4AA0
	for <lists+linux-mips@lfdr.de>; Sun, 28 Dec 2025 10:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F1603004CB0
	for <lists+linux-mips@lfdr.de>; Sun, 28 Dec 2025 09:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E5118DB37;
	Sun, 28 Dec 2025 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2ph8a/f"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC717081E
	for <linux-mips@vger.kernel.org>; Sun, 28 Dec 2025 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766915664; cv=none; b=cASjw8UHVGFVGjKbR/qI6jU0zH2ACUwSl/hihKWelN0kuwc81awQmTB1Mldosd/lZJHuK/8mFmLYLJbEhEetnGMwIuFRWCaiY5CNsoAj5EqRMq7RM2ccNwJw+o4ZV3AajK3wR5xvFe2Pt6mCeKaFSdI5HNmH5GUJ/AOiIevNfoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766915664; c=relaxed/simple;
	bh=d1HWZ/gra3XXbf0pSMqW8Xa2iv1be8XgnIpd86Sciu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DR8V2mCFwDVMtJm8it6WBl9BQ9xGM0krvnNutHNuWG4KQq1ZvbEasB9Nwmj5Y8lWvqjqAc6YMWopHYHjEUQKGgaUGuElj1ThDTHalShz4rB3h5IZhFJlOj9dA8f8hqqrCE9GCfRYfTMe0ChDa2Ca4DzcrkbzC4hpiYesk0BYagM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2ph8a/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397ECC4CEFB;
	Sun, 28 Dec 2025 09:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766915663;
	bh=d1HWZ/gra3XXbf0pSMqW8Xa2iv1be8XgnIpd86Sciu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2ph8a/fJAc0B+NhCYlZUvwtKpNEb86xETF+DEYN/ePGkRtbnyFHSSRtsbNuMUpUN
	 mlEmKNBxtFukASa1Gn4h0UHnkv0Fjaf8MraIitOIAF1I7gSNpiBNEzHD9O+Rn5L7+1
	 MwYl18Qfq24Hed1kWmbD8VuQiTqblZcpkIlPtsQWMP+ERZLPmQzlhwy/qCDblJi57J
	 LDqqKw3VdO437xnP+6aixjn/7iL9IyZXq+ho1aL3ffovZO7GTjpvZ0R/ykifDE6Lki
	 Z6danE2z94A4ZabQG6omWIlwQEhU5hGB7VaSCGZ+EXw3bNHYhDrjKhXsfr62tmttbb
	 n4Y/HYbursIxA==
Date: Sun, 28 Dec 2025 11:54:17 +0200
From: Mike Rapoport <rppt@kernel.org>
To: markus.stockhausen@gmx.de
Cc: tglx@linutronix.de, linux-mm@kvack.org, linux-mips@vger.kernel.org,
	jelonek.jonas@gmail.com,
	'Chris Packham' <Chris.Packham@alliedtelesis.co.nz>,
	hauke@hauke-m.de
Subject: Re: HIGHMEM freeing patch breaks Realtek RTL930x builds
Message-ID: <aVD-SaGkj7lG91pT@kernel.org>
References: <00bc01dc718e$b4108af0$1c31a0d0$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00bc01dc718e$b4108af0$1c31a0d0$@gmx.de>

Hi Markus,

On Sat, Dec 20, 2025 at 09:57:40AM +0100, markus.stockhausen@gmx.de wrote:
> Hi,
> 
> sorry for being late on this topic but downstream OpenWrt just started
> kernel
> conversion from 6.12 to 6.18 these days. During preparation of the PR
> https://github.com/openwrt/openwrt/pull/21181 we noticed that Realtek 
> RTL930x soc based devices with more than 256MB (highmem) do not boot 
> any longer. 
> 
> These are MIPS 34k 32bit multithreaded SoC with layout 
> <0x00000000 0x10000000>, /* 256 MiB lowmem */
> <0x20000000 0x10000000>; /* 256 MiB highmem */
> 
> Bisecting the issue gave " arch, mm: streamline HIGHMEM freeing" 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
> ?h=v6.15-rc1&id=6faea3422e3b4e8de44a55aa3e6e843320da66d2
> as the first bad commit. This is back from the 6.15 times.
> 
> I have no real idea why removing mem_init_free_highmem() and letting
> __free_memory_core() work on the whole memory range gives issues.
> 
> We are aligning to upstream very slowly and are still in need of 
> downstream patches so here some additional info.
> 
> - Until now we never cared about FLATMEM/SPARSEMEM configs
> 
> - We are still using dedicated prom.c/setup.c for the devices
> https://git.openwrt.org/?p=openwrt/openwrt.git;a=tree;f=target/linux/
> realtek/files-6.12/arch/mips/rtl838x;hb=HEAD
> 
> Any idea or hint is appreciated.

Can you please send logs from a working kernel and a failing kernel with
"memblock=debug" added to the kernel command line?

Another thing I think worth checking is will the system boot with a partial
revert of 6faea3422e3b ("arch, mm: streamline HIGHMEM freeing") for mips:

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index cd04200d0573..be5985155509 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -419,6 +419,23 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 static struct kcore_list kcore_kseg0;
 #endif
 
+static inline void __init mem_init_free_highmem(void)
+{
+#ifdef CONFIG_HIGHMEM
+	unsigned long tmp;
+
+	if (cpu_has_dc_aliases)
+		return;
+
+	for (tmp = highstart_pfn; tmp < highend_pfn; tmp++) {
+		struct page *page = pfn_to_page(tmp);
+
+		if (!memblock_is_memory(PFN_PHYS(tmp)))
+			SetPageReserved(page);
+	}
+#endif
+}
+
 void __init arch_mm_preinit(void)
 {
 	/*
@@ -429,6 +446,7 @@ void __init arch_mm_preinit(void)
 
 	maar_init();
 	setup_zero_pages();	/* Setup zeroed pages.  */
+	mem_init_free_highmem();
 
 #ifdef CONFIG_64BIT
 	if ((unsigned long) &_text > (unsigned long) CKSEG0)
 
> Thanks in advance.
> Markus

-- 
Sincerely yours,
Mike.

