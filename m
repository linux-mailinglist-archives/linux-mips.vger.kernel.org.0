Return-Path: <linux-mips+bounces-848-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B155820AC1
	for <lists+linux-mips@lfdr.de>; Sun, 31 Dec 2023 10:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E09C1F21E31
	for <lists+linux-mips@lfdr.de>; Sun, 31 Dec 2023 09:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02CC17F4;
	Sun, 31 Dec 2023 09:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxpWFs+B"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B5186E;
	Sun, 31 Dec 2023 09:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d4a222818so36002295e9.0;
        Sun, 31 Dec 2023 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704015201; x=1704620001; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xd+Bnx1opc3iAibyYwlUzJrfg5GwcesaHbEFLQImyi0=;
        b=NxpWFs+B1u3M25qYjQdrMFjONbRfUmuHEzqgDxZJXxn/aeIAGhyze7IYrWD7w5B5uO
         94mg0VGPhWEsq1lhIDNJ/QLokmXvfd/A7eUQibsiKj5ckgpsjdZkVEjdgQ/0VW6BpBHq
         BGILgIyAajUlCBHGLTKLEnLx5x1RfPLPRtoI7BhUOLiqc0c0fD3mWCWd9wcQB64eqjDd
         uwP7N52PHun7dqAeSUMtwbvICcT5D9qnxC63yzk/s1qbg/ia1GXwAXChTCA0MMBCl+eB
         FpBqVT2Bc0IpMpl4Yci6t70nc7XQL8xSGj7qY5CJKrdYcPR06g4dFsiEE7ZEHtMJpjB/
         C1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015201; x=1704620001;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xd+Bnx1opc3iAibyYwlUzJrfg5GwcesaHbEFLQImyi0=;
        b=MtMhdnJqBDebE6PAXWJJrof42y2DLOijHDj3x/bi6UWYRLplyoMAUVPD4UIV9FntpM
         bTrdopy+Ec9/ukwdIRf1/w9FN4Xwjta2hOgvs2HUYBo+d6w5JbUNUoR3KVchlJFeWc7B
         ZUhzpR6xRySAxlad/zvwI+r1kwuw9l5OW1IxXfK1gYA95SvskjDP0Un/vnv1BDfD7JFP
         BBt6axkY+W0DU/r3MSCYyNmglf3EM8oRR56oRYmBlfJJ0elabTyl+NcZK9Wsp1JC28Jb
         Y1W4/VUF8QgaW/RgUVJjtjR6g8/eDaPiHpMGH6DU18BcD/eoZrpW8VW/ncmaeg7mNJK3
         q7Fg==
X-Gm-Message-State: AOJu0YzmysOu0B6mOQNwYdv8oxuzXqomF6fdiV7OmGseqTnTTxOhntlk
	Q56Su/LHM+iDQhVV5mq7jbo=
X-Google-Smtp-Source: AGHT+IFqPb0CWvc+oHF4g1xL88gWBlrSCaKzJW3qylcJXPd/RSJXE4gSi5luTIE7NTG0Qb4ckSRlkA==
X-Received: by 2002:a05:600c:22d8:b0:40d:6293:fb4f with SMTP id 24-20020a05600c22d800b0040d6293fb4fmr2963741wmg.140.1704015200953;
        Sun, 31 Dec 2023 01:33:20 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id jg7-20020a05600ca00700b0040c46719966sm44178526wmb.25.2023.12.31.01.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 01:33:20 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id A1913BE2DE0; Sun, 31 Dec 2023 10:33:19 +0100 (CET)
Date: Sun, 31 Dec 2023 10:33:19 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	patches@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Christoph Hellwig <hch@lst.de>, Huacai Chen <chenhuacai@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 5.10 81/97] MIPS: Loongson64: Enable DMA noncoherent
 support
Message-ID: <ZZE1X8m5PXJExffG@eldamar.lan>
References: <20231211182019.802717483@linuxfoundation.org>
 <20231211182023.277870337@linuxfoundation.org>
 <ZZBx01WttA3R1XjI@eldamar.lan>
 <8d70aead-6ed5-4d53-b920-d12167787f0b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d70aead-6ed5-4d53-b920-d12167787f0b@app.fastmail.com>

Hi,

On Sat, Dec 30, 2023 at 11:16:41PM +0000, Jiaxun Yang wrote:
> 
> 
> 在2023年12月30日十二月 下午7:38，Salvatore Bonaccorso写道：
> > Hi,
> >
> > On Mon, Dec 11, 2023 at 07:22:24PM +0100, Greg Kroah-Hartman wrote:
> >> 5.10-stable review patch.  If anyone has any objections, please let me know.
> >> 
> >> ------------------
> >> 
> >> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> 
> >> commit edc0378eee00200a5bedf1bb9f00ad390e0d1bd4 upstream.
> >> 
> >> There are some Loongson64 systems come with broken coherent DMA
> >> support, firmware will set a bit in boot_param and pass nocoherentio
> >> in cmdline.
> >> 
> >> However nonconherent support was missed out when spin off Loongson-2EF
> >> form Loongson64, and that boot_param change never made itself into
> >> upstream.
> >> 
> >> Support DMA noncoherent properly to get those systems working.
> >> 
> >> Cc: stable@vger.kernel.org
> >> Fixes: 71e2f4dd5a65 ("MIPS: Fork loongson2ef from loongson64")
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> ---
> >>  arch/mips/Kconfig                                  |    2 ++
> >>  arch/mips/include/asm/mach-loongson64/boot_param.h |    3 ++-
> >>  arch/mips/loongson64/env.c                         |   10 +++++++++-
> >>  3 files changed, 13 insertions(+), 2 deletions(-)
> >> 
> >> --- a/arch/mips/Kconfig
> >> +++ b/arch/mips/Kconfig
> >> @@ -468,6 +468,7 @@ config MACH_LOONGSON2EF
> >>  
> >>  config MACH_LOONGSON64
> >>  	bool "Loongson 64-bit family of machines"
> >> +	select ARCH_DMA_DEFAULT_COHERENT
> >>  	select ARCH_SPARSEMEM_ENABLE
> >>  	select ARCH_MIGHT_HAVE_PC_PARPORT
> >>  	select ARCH_MIGHT_HAVE_PC_SERIO
> >> @@ -1379,6 +1380,7 @@ config CPU_LOONGSON64
> >>  	select CPU_SUPPORTS_MSA
> >>  	select CPU_DIEI_BROKEN if !LOONGSON3_ENHANCEMENT
> >>  	select CPU_MIPSR2_IRQ_VI
> >> +	select DMA_NONCOHERENT
> >>  	select WEAK_ORDERING
> >>  	select WEAK_REORDERING_BEYOND_LLSC
> >>  	select MIPS_ASID_BITS_VARIABLE
> >> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> >> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> >> @@ -117,7 +117,8 @@ struct irq_source_routing_table {
> >>  	u64 pci_io_start_addr;
> >>  	u64 pci_io_end_addr;
> >>  	u64 pci_config_addr;
> >> -	u32 dma_mask_bits;
> >> +	u16 dma_mask_bits;
> >> +	u16 dma_noncoherent;
> >>  } __packed;
> >>  
> >>  struct interface_info {
> >> --- a/arch/mips/loongson64/env.c
> >> +++ b/arch/mips/loongson64/env.c
> >> @@ -13,6 +13,8 @@
> >>   * Copyright (C) 2009 Lemote Inc.
> >>   * Author: Wu Zhangjin, wuzhangjin@gmail.com
> >>   */
> >> +
> >> +#include <linux/dma-map-ops.h>
> >>  #include <linux/export.h>
> >>  #include <linux/pci_ids.h>
> >>  #include <asm/bootinfo.h>
> >> @@ -131,8 +133,14 @@ void __init prom_init_env(void)
> >>  	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
> >>  	loongson_sysconf.dma_mask_bits = eirq_source->dma_mask_bits;
> >>  	if (loongson_sysconf.dma_mask_bits < 32 ||
> >> -		loongson_sysconf.dma_mask_bits > 64)
> >> +			loongson_sysconf.dma_mask_bits > 64) {
> >>  		loongson_sysconf.dma_mask_bits = 32;
> >> +		dma_default_coherent = true;
> >> +	} else {
> >> +		dma_default_coherent = !eirq_source->dma_noncoherent;
> >> +	}
> >> +
> >> +	pr_info("Firmware: Coherent DMA: %s\n", dma_default_coherent ? "on" : "off");
> >>  
> >>  	loongson_sysconf.restart_addr = boot_p->reset_system.ResetWarm;
> >>  	loongson_sysconf.poweroff_addr = boot_p->reset_system.Shutdown;
> >
> > While preparing an update for Debian and finally building for all
> > supported architecture, the builds for mipsel and mips64el were
> > failing with:
> >
> > /<<PKGBUILDDIR>>/arch/mips/loongson64/env.c: In function 
> > 'prom_init_env':
> > /<<PKGBUILDDIR>>/arch/mips/loongson64/env.c:138:3: error: 
> > 'dma_default_coherent' undeclared (first use in this function); did you 
> > mean 'dma_free_coherent'?
> >   138 |   dma_default_coherent = true;
> >       |   ^~~~~~~~~~~~~~~~~~~~
> >       |   dma_free_coherent
> > /<<PKGBUILDDIR>>/arch/mips/loongson64/env.c:138:3: note: each 
> > undeclared identifier is reported only once for each function it 
> > appears in
> > make[6]: *** [/<<PKGBUILDDIR>>/scripts/Makefile.build:291: 
> > arch/mips/loongson64/env.o] Error 1
> > make[6]: *** Waiting for unfinished jobs....
> >
> > Is here a prerequisite missing for the commit?
> >
> > Backporting though 6d4e9a8efe3d ("driver core: lift dma_default_coherent into
> > common code") which is from 5.12-rc1 though seems too intrusive, correct? Would
> > the alternative be to just revert the 3ee7e2faef87 ("MIPS: Loongson64: Enable
> > DMA noncoherent support") commit which landed in 5.10.204?
> 
> Hi,
> 
> Sorry for not spotting the issue in the first place.
> 
> It actually requires more dependencies such as c00a60d6f4a1 ("of: address: always
> use dma_default_coherent for default coherency").
> 
> I'll try to produce a backport series but better to drop this patch from stable
> for now.

Thanks a lot for your quick reply! 

So I guess it only needs a revert for now from 5.10.y correct?

Greg, possible to already queue up the revert for 5.10.y for the next
upload?

Regards,
Salvatore

