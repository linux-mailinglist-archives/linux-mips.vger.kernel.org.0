Return-Path: <linux-mips+bounces-846-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF52F820849
	for <lists+linux-mips@lfdr.de>; Sat, 30 Dec 2023 20:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 764EF283701
	for <lists+linux-mips@lfdr.de>; Sat, 30 Dec 2023 19:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB68BE62;
	Sat, 30 Dec 2023 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XH+KVExN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C387BE4E;
	Sat, 30 Dec 2023 19:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d5336986cso68334735e9.1;
        Sat, 30 Dec 2023 11:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703965141; x=1704569941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7JHhM7jbOB+wY2wLgwyx4XsHrIJ0CwMn7xqcJQu5ww=;
        b=XH+KVExNERAG51oqaoaPz3RDolJyu0ZK7D9b5MeJEzk6L5lNCAiyw1bBjPMqUax3Z+
         Qd3FkqdJGWcpNsNacQ5sPIvtHFOpX9sfL/GypOmiZr0qDwWirNHqu0Qu1rKU3C0iKeiM
         DffhzhypheTuAkd4yKVlIpcfmbucXFTOrC0tcBrOgl5/mj1hjerwdyMtuMhNwvhstcke
         mfOGnKfAYAVJo2mcVq6M2jl/0BPvmbki64A0CGumrR2jXSEWcz/AHJ1z8DF30OoErzE7
         FfEY/tlsiiYWOhCVmlZ6vpEi5OejEHNpk2T/3I+imIMhO3gxClsLS0MNqPfLBEJ5IRh8
         NJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703965141; x=1704569941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7JHhM7jbOB+wY2wLgwyx4XsHrIJ0CwMn7xqcJQu5ww=;
        b=q36tmjcCgtYrHYf5M/D8cFnFMBNfgNCw6GXEBrz+Z2gX7YPK3Cy/jZo73xoDaq92xy
         TpHG7rmpo9MJXwIqHODOiB7+Obo+bfZlp83azZcTrfAZHhS/J7/aBdZcZPWORCG2auJU
         MDHw3YsbRzgr7QsR76XnKo7+Icxn7ccoxqNPyeR1Zwo92bsyN75NF2MeeUZF161z4KNj
         D2AHflQC1UsYJJgixL0OHyMe14yBpLJ+daee2QF+7qUPRMlJD5YVdBgniKroameF0qfG
         F6obDlYxzdaG07texodOal30FgdtZ6I+AcjmUGMnuEmkPtE4tpzO4oVf4mZW3/1fIrOn
         AN0Q==
X-Gm-Message-State: AOJu0Ywrjg+NxALK9RDD3DXs7H7syv4HmLO7njHRwaC2uEJ2yst30cxN
	GMSGV3svTC4VKHXZTYtjnLY=
X-Google-Smtp-Source: AGHT+IFEGA0A7r9OvarUZi116HsIRUFLLyo3Djefw7VCB6dNZsNsbGiwrCgq9zTnsB00AIPHlJLJUA==
X-Received: by 2002:a05:600c:4506:b0:40d:6c77:8570 with SMTP id t6-20020a05600c450600b0040d6c778570mr2047305wmo.72.1703965141079;
        Sat, 30 Dec 2023 11:39:01 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c3b9200b0040d8632cb60sm435361wms.34.2023.12.30.11.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 11:39:00 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id B3B03BE2DE0; Sat, 30 Dec 2023 20:38:59 +0100 (CET)
Date: Sat, 30 Dec 2023 20:38:59 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Christoph Hellwig <hch@lst.de>, Huacai Chen <chenhuacai@kernel.org>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 5.10 81/97] MIPS: Loongson64: Enable DMA noncoherent
 support
Message-ID: <ZZBx01WttA3R1XjI@eldamar.lan>
References: <20231211182019.802717483@linuxfoundation.org>
 <20231211182023.277870337@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211182023.277870337@linuxfoundation.org>

Hi,

On Mon, Dec 11, 2023 at 07:22:24PM +0100, Greg Kroah-Hartman wrote:
> 5.10-stable review patch.  If anyone has any objections, please let me know.
> 
> ------------------
> 
> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> commit edc0378eee00200a5bedf1bb9f00ad390e0d1bd4 upstream.
> 
> There are some Loongson64 systems come with broken coherent DMA
> support, firmware will set a bit in boot_param and pass nocoherentio
> in cmdline.
> 
> However nonconherent support was missed out when spin off Loongson-2EF
> form Loongson64, and that boot_param change never made itself into
> upstream.
> 
> Support DMA noncoherent properly to get those systems working.
> 
> Cc: stable@vger.kernel.org
> Fixes: 71e2f4dd5a65 ("MIPS: Fork loongson2ef from loongson64")
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  arch/mips/Kconfig                                  |    2 ++
>  arch/mips/include/asm/mach-loongson64/boot_param.h |    3 ++-
>  arch/mips/loongson64/env.c                         |   10 +++++++++-
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -468,6 +468,7 @@ config MACH_LOONGSON2EF
>  
>  config MACH_LOONGSON64
>  	bool "Loongson 64-bit family of machines"
> +	select ARCH_DMA_DEFAULT_COHERENT
>  	select ARCH_SPARSEMEM_ENABLE
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
>  	select ARCH_MIGHT_HAVE_PC_SERIO
> @@ -1379,6 +1380,7 @@ config CPU_LOONGSON64
>  	select CPU_SUPPORTS_MSA
>  	select CPU_DIEI_BROKEN if !LOONGSON3_ENHANCEMENT
>  	select CPU_MIPSR2_IRQ_VI
> +	select DMA_NONCOHERENT
>  	select WEAK_ORDERING
>  	select WEAK_REORDERING_BEYOND_LLSC
>  	select MIPS_ASID_BITS_VARIABLE
> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> @@ -117,7 +117,8 @@ struct irq_source_routing_table {
>  	u64 pci_io_start_addr;
>  	u64 pci_io_end_addr;
>  	u64 pci_config_addr;
> -	u32 dma_mask_bits;
> +	u16 dma_mask_bits;
> +	u16 dma_noncoherent;
>  } __packed;
>  
>  struct interface_info {
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -13,6 +13,8 @@
>   * Copyright (C) 2009 Lemote Inc.
>   * Author: Wu Zhangjin, wuzhangjin@gmail.com
>   */
> +
> +#include <linux/dma-map-ops.h>
>  #include <linux/export.h>
>  #include <linux/pci_ids.h>
>  #include <asm/bootinfo.h>
> @@ -131,8 +133,14 @@ void __init prom_init_env(void)
>  	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
>  	loongson_sysconf.dma_mask_bits = eirq_source->dma_mask_bits;
>  	if (loongson_sysconf.dma_mask_bits < 32 ||
> -		loongson_sysconf.dma_mask_bits > 64)
> +			loongson_sysconf.dma_mask_bits > 64) {
>  		loongson_sysconf.dma_mask_bits = 32;
> +		dma_default_coherent = true;
> +	} else {
> +		dma_default_coherent = !eirq_source->dma_noncoherent;
> +	}
> +
> +	pr_info("Firmware: Coherent DMA: %s\n", dma_default_coherent ? "on" : "off");
>  
>  	loongson_sysconf.restart_addr = boot_p->reset_system.ResetWarm;
>  	loongson_sysconf.poweroff_addr = boot_p->reset_system.Shutdown;

While preparing an update for Debian and finally building for all
supported architecture, the builds for mipsel and mips64el were
failing with:

/<<PKGBUILDDIR>>/arch/mips/loongson64/env.c: In function 'prom_init_env':
/<<PKGBUILDDIR>>/arch/mips/loongson64/env.c:138:3: error: 'dma_default_coherent' undeclared (first use in this function); did you mean 'dma_free_coherent'?
  138 |   dma_default_coherent = true;
      |   ^~~~~~~~~~~~~~~~~~~~
      |   dma_free_coherent
/<<PKGBUILDDIR>>/arch/mips/loongson64/env.c:138:3: note: each undeclared identifier is reported only once for each function it appears in
make[6]: *** [/<<PKGBUILDDIR>>/scripts/Makefile.build:291: arch/mips/loongson64/env.o] Error 1
make[6]: *** Waiting for unfinished jobs....

Is here a prerequisite missing for the commit?

Backporting though 6d4e9a8efe3d ("driver core: lift dma_default_coherent into
common code") which is from 5.12-rc1 though seems too intrusive, correct? Would
the alternative be to just revert the 3ee7e2faef87 ("MIPS: Loongson64: Enable
DMA noncoherent support") commit which landed in 5.10.204?

Regards,
Salvatore

