Return-Path: <linux-mips+bounces-856-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6585C822B7F
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jan 2024 11:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 613382853C9
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jan 2024 10:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F99718C20;
	Wed,  3 Jan 2024 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R3QEiHnk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE8118C1B;
	Wed,  3 Jan 2024 10:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165B3C433C7;
	Wed,  3 Jan 2024 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704278434;
	bh=fheAqMatwRrISyd1ahn+yz1ZsaJahqjgwDAxLoGQ3vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3QEiHnkFQTZ+BvEoS69ILpjNOsaRB7putWeAs8yJe0IcM4SOl9ODLyMlQVgXrBWw
	 FbHKU7850bDXT1/32WYjTI1mfy4A6NPNVTPklhnUgnXHfQYCSYJJI99Pals52B8f2U
	 ASNOGt8KCwb2GtQVI2E54ppQdfEup8RzwxZxlIb4=
Date: Wed, 3 Jan 2024 11:40:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	patches@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Christoph Hellwig <hch@lst.de>, Huacai Chen <chenhuacai@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 5.10 81/97] MIPS: Loongson64: Enable DMA noncoherent
 support
Message-ID: <2024010325-frisk-patchwork-b450@gregkh>
References: <20231211182019.802717483@linuxfoundation.org>
 <20231211182023.277870337@linuxfoundation.org>
 <ZZBx01WttA3R1XjI@eldamar.lan>
 <8d70aead-6ed5-4d53-b920-d12167787f0b@app.fastmail.com>
 <ZZE1X8m5PXJExffG@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZZE1X8m5PXJExffG@eldamar.lan>

On Sun, Dec 31, 2023 at 10:33:19AM +0100, Salvatore Bonaccorso wrote:
> Hi,
> 
> On Sat, Dec 30, 2023 at 11:16:41PM +0000, Jiaxun Yang wrote:
> > 
> > 
> > 在2023年12月30日十二月 下午7:38，Salvatore Bonaccorso写道：
> > > Hi,
> > >
> > > On Mon, Dec 11, 2023 at 07:22:24PM +0100, Greg Kroah-Hartman wrote:
> > >> 5.10-stable review patch.  If anyone has any objections, please let me know.
> > >> 
> > >> ------------------
> > >> 
> > >> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > >> 
> > >> commit edc0378eee00200a5bedf1bb9f00ad390e0d1bd4 upstream.
> > >> 
> > >> There are some Loongson64 systems come with broken coherent DMA
> > >> support, firmware will set a bit in boot_param and pass nocoherentio
> > >> in cmdline.
> > >> 
> > >> However nonconherent support was missed out when spin off Loongson-2EF
> > >> form Loongson64, and that boot_param change never made itself into
> > >> upstream.
> > >> 
> > >> Support DMA noncoherent properly to get those systems working.
> > >> 
> > >> Cc: stable@vger.kernel.org
> > >> Fixes: 71e2f4dd5a65 ("MIPS: Fork loongson2ef from loongson64")
> > >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > >> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >> ---
> > >>  arch/mips/Kconfig                                  |    2 ++
> > >>  arch/mips/include/asm/mach-loongson64/boot_param.h |    3 ++-
> > >>  arch/mips/loongson64/env.c                         |   10 +++++++++-
> > >>  3 files changed, 13 insertions(+), 2 deletions(-)
> > >> 
> > >> --- a/arch/mips/Kconfig
> > >> +++ b/arch/mips/Kconfig
> > >> @@ -468,6 +468,7 @@ config MACH_LOONGSON2EF
> > >>  
> > >>  config MACH_LOONGSON64
> > >>  	bool "Loongson 64-bit family of machines"
> > >> +	select ARCH_DMA_DEFAULT_COHERENT
> > >>  	select ARCH_SPARSEMEM_ENABLE
> > >>  	select ARCH_MIGHT_HAVE_PC_PARPORT
> > >>  	select ARCH_MIGHT_HAVE_PC_SERIO
> > >> @@ -1379,6 +1380,7 @@ config CPU_LOONGSON64
> > >>  	select CPU_SUPPORTS_MSA
> > >>  	select CPU_DIEI_BROKEN if !LOONGSON3_ENHANCEMENT
> > >>  	select CPU_MIPSR2_IRQ_VI
> > >> +	select DMA_NONCOHERENT
> > >>  	select WEAK_ORDERING
> > >>  	select WEAK_REORDERING_BEYOND_LLSC
> > >>  	select MIPS_ASID_BITS_VARIABLE
> > >> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> > >> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> > >> @@ -117,7 +117,8 @@ struct irq_source_routing_table {
> > >>  	u64 pci_io_start_addr;
> > >>  	u64 pci_io_end_addr;
> > >>  	u64 pci_config_addr;
> > >> -	u32 dma_mask_bits;
> > >> +	u16 dma_mask_bits;
> > >> +	u16 dma_noncoherent;
> > >>  } __packed;
> > >>  
> > >>  struct interface_info {
> > >> --- a/arch/mips/loongson64/env.c
> > >> +++ b/arch/mips/loongson64/env.c
> > >> @@ -13,6 +13,8 @@
> > >>   * Copyright (C) 2009 Lemote Inc.
> > >>   * Author: Wu Zhangjin, wuzhangjin@gmail.com
> > >>   */
> > >> +
> > >> +#include <linux/dma-map-ops.h>
> > >>  #include <linux/export.h>
> > >>  #include <linux/pci_ids.h>
> > >>  #include <asm/bootinfo.h>
> > >> @@ -131,8 +133,14 @@ void __init prom_init_env(void)
> > >>  	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
> > >>  	loongson_sysconf.dma_mask_bits = eirq_source->dma_mask_bits;
> > >>  	if (loongson_sysconf.dma_mask_bits < 32 ||
> > >> -		loongson_sysconf.dma_mask_bits > 64)
> > >> +			loongson_sysconf.dma_mask_bits > 64) {
> > >>  		loongson_sysconf.dma_mask_bits = 32;
> > >> +		dma_default_coherent = true;
> > >> +	} else {
> > >> +		dma_default_coherent = !eirq_source->dma_noncoherent;
> > >> +	}
> > >> +
> > >> +	pr_info("Firmware: Coherent DMA: %s\n", dma_default_coherent ? "on" : "off");
> > >>  
> > >>  	loongson_sysconf.restart_addr = boot_p->reset_system.ResetWarm;
> > >>  	loongson_sysconf.poweroff_addr = boot_p->reset_system.Shutdown;
> > >
> > > While preparing an update for Debian and finally building for all
> > > supported architecture, the builds for mipsel and mips64el were
> > > failing with:
> > >
> > > /<<PKGBUILDDIR>>/arch/mips/loongson64/env.c: In function 
> > > 'prom_init_env':
> > > /<<PKGBUILDDIR>>/arch/mips/loongson64/env.c:138:3: error: 
> > > 'dma_default_coherent' undeclared (first use in this function); did you 
> > > mean 'dma_free_coherent'?
> > >   138 |   dma_default_coherent = true;
> > >       |   ^~~~~~~~~~~~~~~~~~~~
> > >       |   dma_free_coherent
> > > /<<PKGBUILDDIR>>/arch/mips/loongson64/env.c:138:3: note: each 
> > > undeclared identifier is reported only once for each function it 
> > > appears in
> > > make[6]: *** [/<<PKGBUILDDIR>>/scripts/Makefile.build:291: 
> > > arch/mips/loongson64/env.o] Error 1
> > > make[6]: *** Waiting for unfinished jobs....
> > >
> > > Is here a prerequisite missing for the commit?
> > >
> > > Backporting though 6d4e9a8efe3d ("driver core: lift dma_default_coherent into
> > > common code") which is from 5.12-rc1 though seems too intrusive, correct? Would
> > > the alternative be to just revert the 3ee7e2faef87 ("MIPS: Loongson64: Enable
> > > DMA noncoherent support") commit which landed in 5.10.204?
> > 
> > Hi,
> > 
> > Sorry for not spotting the issue in the first place.
> > 
> > It actually requires more dependencies such as c00a60d6f4a1 ("of: address: always
> > use dma_default_coherent for default coherency").
> > 
> > I'll try to produce a backport series but better to drop this patch from stable
> > for now.
> 
> Thanks a lot for your quick reply! 
> 
> So I guess it only needs a revert for now from 5.10.y correct?
> 
> Greg, possible to already queue up the revert for 5.10.y for the next
> upload?

Now reverted, thanks.

greg k-h

