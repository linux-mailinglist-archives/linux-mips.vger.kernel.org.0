Return-Path: <linux-mips+bounces-11580-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9DBA7401
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 17:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AD84177DCF
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 15:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF13B22B8B6;
	Sun, 28 Sep 2025 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1YhjVPK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD8410957;
	Sun, 28 Sep 2025 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759073315; cv=none; b=u7SMzf4OnTozPr686ofc85bS4adH6STTrUren1JiBS56xHEr9PS97m9LTmjEcOC3p4yVIbMyDsiH3ULyA1nhKE93fyONEeP8pqd1Wwa97yD8SRkb6zUVMYz8MwbESsfes+3ihUY7EgYnQrJWxPKrRfOTqD2x+/OoYGyyJxZSvm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759073315; c=relaxed/simple;
	bh=j3dJ7dm9Jex7hj7zDSOs/rnehFATrVSGsSj9oi0KREM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ym+C0iJ2TLmAVnSuNzYu0ONJId0MvrZSgCa4x6YuSg4Kr+WqD1LXhfzcGdeHCqyXs98pBAMIW4pZ5Bcs/f+fjJzzb0BFTeT/OZes35JrCtS1qE0YbiGeQLINiNhZdBHFCpy3G7+opCBw8C4IhD6EErUVRhfHilKxpRpCFkdXXzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1YhjVPK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D567C4CEF0;
	Sun, 28 Sep 2025 15:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759073315;
	bh=j3dJ7dm9Jex7hj7zDSOs/rnehFATrVSGsSj9oi0KREM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1YhjVPKUf7C/0/LxXAZBncp5RteetEhwJWXFm/vEFPUulFmvL8IxH077S1rMLJtr
	 d2ZgZgVpCx6rd1totAk5q+h7xqPmOOTtzW5w30YaKisVYvwJq5gRqIDGRHY5T/f4gQ
	 O0PYgjbB/cH7oJ1jFPBNLr3rGkOI2qMk/87YL11RjncJuK6Qjt9VPe0h+TqS18yZyA
	 BZqpYFUKRf23DvC6/+sd1BLnzDDD/hXAh8aUEZqIXh4WqdIZHr4zt3c9wvIaaQFzw4
	 UZD9hcw+AzQFsbXJe27so0nVBzGtUu2qhqiGBcZy6B5qFDuhtL/1hVaC8gTpWufr4a
	 sdkGg8+AkSuEw==
Date: Sun, 28 Sep 2025 18:28:30 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
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
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 9/9] dma-mapping: remove unused map_page callback
Message-ID: <20250928152830.GA324804@unreal>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
 <20250928151725.GA135708@ravnborg.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928151725.GA135708@ravnborg.org>

On Sun, Sep 28, 2025 at 05:17:25PM +0200, Sam Ravnborg wrote:
> Hi Leon.
> 
> On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > After conversion of arch code to use physical address mapping,
> > there are no users of .map_page() and .unmap_page() callbacks,
> > so let's remove them.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  include/linux/dma-map-ops.h |  7 -------
> >  kernel/dma/mapping.c        | 12 ------------
> >  kernel/dma/ops_helpers.c    |  8 +-------
> >  3 files changed, 1 insertion(+), 26 deletions(-)
> 
> It looks like you missed a few sparc32 bits:
> mm/iommu.c:
> static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
> #ifdef CONFIG_SBUS
>         .alloc                  = sbus_iommu_alloc,
>         .free                   = sbus_iommu_free,
> #endif
>         .map_page               = sbus_iommu_map_page_gflush,
>         .unmap_page             = sbus_iommu_unmap_page,
>         .map_sg                 = sbus_iommu_map_sg_gflush,
> 
> mm/io-unit.c:
> static const struct dma_map_ops iounit_dma_ops = {
> #ifdef CONFIG_SBUS
>         .alloc                  = iounit_alloc,
>         .free                   = iounit_free,
> #endif
>         .map_page               = iounit_map_page,
>         .unmap_page             = iounit_unmap_page,
>         .map_sg                 = iounit_map_sg,
> 
> I did not compile test, but from a quick look they need to be updated.

There were updated, see patch #5.
https://lore.kernel.org/all/bac909dab3c82fc6a7a4f5a31f22bac9a69f7f07.1759071169.git.leon@kernel.org/T/#u

arch/sparc/mm/iommu.c:
  426 static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
  427 #ifdef CONFIG_SBUS
  428         .alloc                  = sbus_iommu_alloc,
  429         .free                   = sbus_iommu_free,
  430 #endif
  431         .map_phys               = sbus_iommu_map_phys_gflush,
  432         .unmap_phys             = sbus_iommu_unmap_phys,
  433         .map_sg                 = sbus_iommu_map_sg_gflush,
  434         .unmap_sg               = sbus_iommu_unmap_sg,
  435 };

arch/sparc/mm/io-unit.c:
  276 static const struct dma_map_ops iounit_dma_ops = {
  277 #ifdef CONFIG_SBUS
  278         .alloc                  = iounit_alloc,
  279         .free                   = iounit_free,
  280 #endif
  281         .map_phys               = iounit_map_phys,
  282         .unmap_phys             = iounit_unmap_phys,
  283         .map_sg                 = iounit_map_sg,
  284         .unmap_sg               = iounit_unmap_sg,
  285 };

Thanks

> 
> 	Sam
> 

