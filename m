Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1543145B0
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 02:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhBIBhO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 20:37:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:53934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229623AbhBIBhK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Feb 2021 20:37:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2781664DF2;
        Tue,  9 Feb 2021 01:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612834589;
        bh=GeneRGHAa6mtWP0C7hDko1vrvp1LSL3adVABNeZ6jD4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qFlJGIRhgAMU7d3IrGb90w8fBAZFnDMzYHoPUQ/yP1HYUTFUxU+4Lw+tmCZu0HuZM
         8JVI2vh1zK/7K3A0xRL/K+Yxm+N8NZK9kpPYcklH2cGmEdhShXfqzT8xo4Ptzf9DOo
         C2c4cKL+dk2yR19trrNMl0DStwPuDuqLBamP9cPPx0DqAVqVRj12hlZETEFXt7eY31
         Ej5GVQAs/xhEUTNqtB3nbOL/+f46wuVA3MXSnLxtKS35gdQXO5qxNCoD+n5bITNoWi
         pFC4bj9GBSNaARq9YG58b8RfAM5ER7WvG/5UgayltQJmVEyfichpmSM5yqeLzPcEsC
         pAT3TK9Pc2WbA==
Received: by mail-io1-f45.google.com with SMTP id n201so17109941iod.12;
        Mon, 08 Feb 2021 17:36:29 -0800 (PST)
X-Gm-Message-State: AOAM530y03JbmV2CwFSD7X1iQ13QNwtH95ILoMA3IQ4HiiEfZ9RnVgQD
        eUBq8DeQ99CbA1Qa/i9Rue4N/y3Zr8XK1ZqD7bo=
X-Google-Smtp-Source: ABdhPJxP5beny0HTZjFbw+i6C1OKgk88+dVSmY8J+hKVb39JSxw+ga6AWtvp798tmky4G/ptrT8Bp8w75IINstnUFS0=
X-Received: by 2002:a05:6638:388e:: with SMTP id b14mr20526766jav.96.1612834588516;
 Mon, 08 Feb 2021 17:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20210208145024.3320420-1-hch@lst.de> <20210208145024.3320420-7-hch@lst.de>
In-Reply-To: <20210208145024.3320420-7-hch@lst.de>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Tue, 9 Feb 2021 09:36:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5POedAyG97956Zb5U1Ry5HFPWN7Xqhk7ZWHHhuXoNymQ@mail.gmail.com>
Message-ID: <CAAhV-H5POedAyG97956Zb5U1Ry5HFPWN7Xqhk7ZWHHhuXoNymQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] MIPS: remove CONFIG_DMA_PERDEV_COHERENT
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

On Mon, Feb 8, 2021 at 10:51 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Just select DMA_NONCOHERENT and ARCH_HAS_SETUP_DMA_OPS from the
> MIPS_GENERIC platform instead.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/mips/Kconfig              | 8 ++------
>  arch/mips/mm/dma-noncoherent.c | 2 +-
>  2 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 1f1603a08a6d2d..fae02b0b9c599a 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -123,6 +123,7 @@ choice
>
>  config MIPS_GENERIC_KERNEL
>         bool "Generic board-agnostic MIPS kernel"
> +       select ARCH_HAS_SETUP_DMA_OPS
>         select MIPS_GENERIC
>         select BOOT_RAW
>         select BUILTIN_DTB
> @@ -132,7 +133,7 @@ config MIPS_GENERIC_KERNEL
>         select CPU_MIPSR2_IRQ_EI
>         select CPU_MIPSR2_IRQ_VI
>         select CSRC_R4K
> -       select DMA_PERDEV_COHERENT
> +       select DMA_NONCOHERENT
>         select HAVE_PCI
>         select IRQ_MIPS_CPU
>         select MIPS_AUTO_PFN_OFFSET
> @@ -1127,11 +1128,6 @@ config FW_CFE
>  config ARCH_SUPPORTS_UPROBES
>         bool
>
> -config DMA_PERDEV_COHERENT
> -       bool
> -       select ARCH_HAS_SETUP_DMA_OPS
> -       select DMA_NONCOHERENT
> -
>  config DMA_NONCOHERENT
>         bool
>         #
> diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
> index 90b562753eb892..212f3ce75a6bd3 100644
> --- a/arch/mips/mm/dma-noncoherent.c
> +++ b/arch/mips/mm/dma-noncoherent.c
> @@ -135,7 +135,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>  }
>  #endif
>
> -#ifdef CONFIG_DMA_PERDEV_COHERENT
> +#ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
>  void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>                 const struct iommu_ops *iommu, bool coherent)
>  {
> --
> 2.29.2
>
