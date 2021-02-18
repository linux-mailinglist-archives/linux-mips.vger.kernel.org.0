Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C81831E45D
	for <lists+linux-mips@lfdr.de>; Thu, 18 Feb 2021 03:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBRCo4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Feb 2021 21:44:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:36144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229553AbhBRCo4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Feb 2021 21:44:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2261564DE0;
        Thu, 18 Feb 2021 02:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613616255;
        bh=sy8iwMXSGDS2c4e5QxmwRLlBenOB+zXEq/e8dETRyzg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g/Kr2Fzyuee3+iP5ggZmEmwlj4ttvKXK1fyFZYXDb5BUHpEp7V9zY+MKwJ9mq2WHw
         a90PJDKAmMjp13RidKhhvX8AHwoBlRpGp17QhsSFWXtW5KzwQ384P80M36mIHqR1dp
         w8tp+fI0/W+O22CWWyxaPNTF9hoZDW7kxGRn61xAmE5MdMdDVf5M02CGjy/hs1mQs/
         +vsq1ePu13m7NJbv1lAEYVzRnEsB8aOds+aqvpH5Njwm3JuiqTK8cj1B+kGGce+tmd
         weNXoaKjUmbw2Pun1O20kDsF8RwruJZbnsBfbP3POkBhHRBcHcvPvEbEIdaqFiZf1M
         HHUi33L0wpsvg==
Received: by mail-io1-f42.google.com with SMTP id u8so503087ior.13;
        Wed, 17 Feb 2021 18:44:15 -0800 (PST)
X-Gm-Message-State: AOAM531agjwAP6P5BLHV4S3VYdxgIeffI47YdsPWkudPG/xsKmA03zGl
        a7f0qkIslP0w+XE2Q0dofIl5KAS54VyupfTzzb8=
X-Google-Smtp-Source: ABdhPJz7XjKIp6zYI6MQB/vAQmLnv0OLQF/zoMf/GQc2JEzoi69wCw8l6Fwgo8FbpsTKdcZrvMov8bTvMN9eHAfjtmY=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr1808999ioq.13.1613616254599;
 Wed, 17 Feb 2021 18:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20210210095641.23856-1-hch@lst.de> <20210210095641.23856-6-hch@lst.de>
In-Reply-To: <20210210095641.23856-6-hch@lst.de>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Thu, 18 Feb 2021 10:44:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4kxyOygLg4_nEqjmO8qS8aW2M5WXn_ia7jO0hLY3_waw@mail.gmail.com>
Message-ID: <CAAhV-H4kxyOygLg4_nEqjmO8qS8aW2M5WXn_ia7jO0hLY3_waw@mail.gmail.com>
Subject: Re: [PATCH 5/6] MIPS: remove CONFIG_DMA_MAYBE_COHERENT
To:     Christoph Hellwig <hch@lst.de>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Wed, Feb 10, 2021 at 6:04 PM Christoph Hellwig <hch@lst.de> wrote:
>
> CONFIG_DMA_MAYBE_COHERENT just guards two early init options now.  Just
> enable them unconditionally for CONFIG_DMA_NONCOHERENT.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/mips/Kconfig        | 8 ++------
>  arch/mips/kernel/setup.c | 2 +-
>  2 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 0e86162df65541..1f1603a08a6d2d 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -181,7 +181,7 @@ config MIPS_ALCHEMY
>         select CEVT_R4K
>         select CSRC_R4K
>         select IRQ_MIPS_CPU
> -       select DMA_MAYBE_COHERENT       # Au1000,1500,1100 aren't, rest is
> +       select DMA_NONCOHERENT          # Au1000,1500,1100 aren't, rest is
>         select MIPS_FIXUP_BIGPHYS_ADDR if PCI
>         select SYS_HAS_CPU_MIPS32_R1
>         select SYS_SUPPORTS_32BIT_KERNEL
> @@ -546,7 +546,7 @@ config MIPS_MALTA
>         select CLKSRC_MIPS_GIC
>         select COMMON_CLK
>         select CSRC_R4K
> -       select DMA_MAYBE_COHERENT
> +       select DMA_NONCOHERENT
>         select GENERIC_ISA_DMA
>         select HAVE_PCSPKR_PLATFORM
>         select HAVE_PCI
> @@ -1127,10 +1127,6 @@ config FW_CFE
>  config ARCH_SUPPORTS_UPROBES
>         bool
>
> -config DMA_MAYBE_COHERENT
> -       select DMA_NONCOHERENT
> -       bool
> -
>  config DMA_PERDEV_COHERENT
>         bool
>         select ARCH_HAS_SETUP_DMA_OPS
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index d6b2ba527f5b81..b25d07675b1ee1 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -805,7 +805,7 @@ static int __init debugfs_mips(void)
>  arch_initcall(debugfs_mips);
>  #endif
>
> -#ifdef CONFIG_DMA_MAYBE_COHERENT
> +#ifdef CONFIG_DMA_NONCOHERENT
>  static int __init setcoherentio(char *str)
>  {
>         dma_default_coherent = true;
> --
> 2.29.2
>
