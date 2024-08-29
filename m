Return-Path: <linux-mips+bounces-5175-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C332963962
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 06:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B473B1F243C5
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 04:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FD7145323;
	Thu, 29 Aug 2024 04:30:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB4C3E47B;
	Thu, 29 Aug 2024 04:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724905834; cv=none; b=eW3POzf946VZCefLBX1GNYFW4TKKsw0EiIWuH5ZcD8zasqjR7gZ0I8NDUELdZY5n5t0ZwdmHLtzva3qLeTRYu7bZ2QHKUBlpx3kf0938y7FKUxM8N9yO8cFcM2DQxQVq3rzN8q63hc/VY+qSI5krZoWrtuG7zz07bgK8CE3rrBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724905834; c=relaxed/simple;
	bh=AueP26reiFrOsaP7RP3v0TdYvlPXeawPYgnyDDU+yWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/QEqf9BEUUU9ppwEYDPPQn4m7MtPQVynvaoAy4X6byETRQFaOtHMwEPmfmcrIZJ6EebcXRPvXCyo80MDwHbwFSc8yiD6ITiS2y5XLQDhpt4OMdhKOfFn1FKaIPGHfDBIFfmHPBDKOKyotmJTTncJU1qYScI15E8M7o7Uc5fXyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id F39EA68AFE; Thu, 29 Aug 2024 06:30:27 +0200 (CEST)
Date: Thu, 29 Aug 2024 06:30:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Larsson <andreas@gaisler.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/2] dma-mapping: clearly mark DMA ops as an
 architecture feature
Message-ID: <20240829043027.GA4707@lst.de>
References: <20240828061104.1925127-1-hch@lst.de> <20240828061104.1925127-3-hch@lst.de> <12a0f286-3114-4dac-8b75-3a638d9c8635@gaisler.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12a0f286-3114-4dac-8b75-3a638d9c8635@gaisler.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Aug 28, 2024 at 08:21:14AM +0200, Andreas Larsson wrote:
> On 2024-08-28 08:10, Christoph Hellwig wrote:
> > --- a/drivers/xen/Kconfig
> > +++ b/drivers/xen/Kconfig
> > @@ -177,8 +177,8 @@ config XEN_GRANT_DMA_ALLOC
> >  
> >  config SWIOTLB_XEN
> >  	def_bool y
> > +	depends on ARCH_DMA_OPS
> 
> Rename to ARCH_HAS_DMA_OPS in v2 is missing here

Thanks,

I've fixed this up locally now.

