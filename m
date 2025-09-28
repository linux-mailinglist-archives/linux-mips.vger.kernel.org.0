Return-Path: <linux-mips+bounces-11565-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555CCBA6F5F
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 12:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0395170790
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 10:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C672D5C9E;
	Sun, 28 Sep 2025 10:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mi76TWNG"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4822D0C9A;
	Sun, 28 Sep 2025 10:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759056858; cv=none; b=SI7+zokSlZttISu18ho1nGQ6FN7GTh542oytnpmWdGBaZtXyxGuTDUSow77cVXmWAl2WUgh+R2uDD4/wjCqkvT2BpOZ18dmkl4Wz8qYKkgrzKI7CmviWb0Jz8bGnr+JG0GxmiQWOaz2Wb13mmAocvBypK2pWAf6imQvj8ztl1dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759056858; c=relaxed/simple;
	bh=P7S8PfmMkN3lCLtx7ABMG78NQs7Q7Zq/Vrda3oeN91k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6MdmYNuQz6rkwWFqBkK9pprLE+RPtCxoNSmG5aeTGnRgnLpYi5rrmxrmK1mMUjBEttDJf8zl46mDU+djcYjo2hRl/sGuzH8hD0qPtRPcm9nz3TTXYXeqAdoI4qviijOtVreSRV1nvBODoXKZxC7GTiRqltlOufrxKRDx8l1hh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mi76TWNG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B2DC4CEF7;
	Sun, 28 Sep 2025 10:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759056858;
	bh=P7S8PfmMkN3lCLtx7ABMG78NQs7Q7Zq/Vrda3oeN91k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mi76TWNG7HtOxJ1wO470x2VvF26PVkc0OUNi1F1RmLvGmfrX5GsbtT4ztSWcWdTni
	 FwYt6EmiA9itKcukLOannrDDB26moF9wBf8RU6TCGr/7cNnSu/FGTcUkvY+esiPpjV
	 oDLLLJl0fuYyVanNuHzmOc5s+1VKasRLE9HsLmVxXaiXt6vgjBky/N71dJAy5Uepir
	 CU4p5RSWXOVizbnnPH00WVYjvJCU/KyNrn5gikLy+JzpNEoKRAxowD/z3vbxg6zA5c
	 Ln0RqRBJAFveWdcmsx7QgSb7xt9/rHKWmyrxxdJkXonjrmbRxHKqYef4JoF7gHahEg
	 9RAEVJXjqdX3A==
Date: Sun, 28 Sep 2025 13:54:13 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical
 address
Message-ID: <20250928105413.GE12165@unreal>
References: <cover.1758219786.git.leon@kernel.org>
 <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal>
 <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com>
 <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
 <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>

On Sun, Sep 28, 2025 at 12:23:48PM +0200, Magnus Lindholm wrote:
> > After reverting the above commits, I'm able to build a working kernel,
> > that is, no filesystem corruption occurs. I'll take a closer look at this
> > after the weekend.
> >
> 
> Short update,  It is enough to revert the following commits, in order to
> have a working kernel on alpha:
> 
> e78a9d72517a88faa6f16dab4d1c6f966ed378ae
> (dma-mapping: remove unused map_page callback)
> 
> d459e3b80ad1c81bf596d63d2e3347cf8c7bb0d9
> (alpha: Convert mapping routine to rely on physical address)

Thanks for the effort.

Can you please check the following change instead of reverting the patches?

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index b62d9937d1d3a..3e4f631a1f27d 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -229,6 +229,7 @@ pci_map_single_1(struct pci_dev *pdev, phys_addr_t paddr, size_t size,
 {
        struct pci_controller *hose = pdev ? pdev->sysdata : pci_isa_hose;
        dma_addr_t max_dma = pdev ? pdev->dma_mask : ISA_DMA_MASK;
+       unsigned long offset = offset_in_page(paddr);
        struct pci_iommu_arena *arena;
        long npages, dma_ofs, i;
        dma_addr_t ret;
@@ -287,7 +288,7 @@ pci_map_single_1(struct pci_dev *pdev, phys_addr_t paddr, size_t size,
                arena->ptes[i + dma_ofs] = mk_iommu_pte(paddr);

        ret = arena->dma_base + dma_ofs * PAGE_SIZE;
-       ret += offset_in_page(paddr);
+       ret += offset;

        DBGA2("pci_map_single: [%pa,%zx] np %ld -> sg %llx from %ps\n",
              &paddr, size, npages, ret, __builtin_return_address(0));
~


> 
> 
> /Magnus

