Return-Path: <linux-mips+bounces-5055-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AB495DCC7
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 09:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 461FF1C217F6
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 07:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07591154C04;
	Sat, 24 Aug 2024 07:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H132KVz3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B12E154BFC;
	Sat, 24 Aug 2024 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724486299; cv=none; b=aPHdWO+5ppoUPOWFYcnJfb14X2ZNg/TmlnO1/qGX1NkNl6y3Tjs/URXKVWufVpi4Q5citdu1giIDdNYUmYQgbpMfHbeZ/HAogPx54mcjpEq1Vw8bEwyoaJEuOrDd3cYJaAd/dGMOERLHR5s0eeyvQGbcJpVIkrPNxkR2Ee8JeF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724486299; c=relaxed/simple;
	bh=+MuJabAXZNXC3PzKmb+ctuTHQcVD5uw07JOm0cukiHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWySvhytFi2+aDwpTVnYgDYPKOCxc+f/qtu6Oi3l3B2485PhAEfytvZyCAfWeqKLOw+XPhgbQs1o5rZxIlVnMYPatwOdtZ/o3bc+GIkwKvuypocesqojWEiKObFJ71IJNVjb+qBS/qUpbhh0qX7rxNNTsslrd0m+QwYaoItzw1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H132KVz3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724486297; x=1756022297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+MuJabAXZNXC3PzKmb+ctuTHQcVD5uw07JOm0cukiHM=;
  b=H132KVz304XJPf6ReChbID2w1YHRPvxytq0WbDqu4uhidZZSlva4Y4LE
   pZHl3AGTuAOiweWSGhZDA8IwlbzEoHnXnbMCKukZ/q+5k+rMv9h4gy7Gg
   lrqNpj8eCrMpC8dgLkyHv94gHXIDAlxwso32cgk3S50h615I0K86g9G+X
   XmZ+8gxO+63cIdmweFZi0vKY6B783NQbpEeCRiefFnAOryPtfqs9e+VOq
   tOFi5hsQh2mndrvZc3hgde+agJNmsp977DN6vvWI/rA4Ptt1uBBfTnLlN
   s4+sWi9vLViQhAOyXzNqIWOYRX9YsZ/Oa0iCAQG3P43fJn22Am1fVQk6v
   A==;
X-CSE-ConnectionGUID: vT64KyRhQaW9P0Xy6FbYoQ==
X-CSE-MsgGUID: atC8vKnuQf2trx1B+MFIWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="23126429"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="23126429"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 00:58:17 -0700
X-CSE-ConnectionGUID: xNO1WY6SQfimIDbJMyQklA==
X-CSE-MsgGUID: Re7yuOLNQLu2fGkmVM310w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="99531438"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 00:58:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AF4D411F95D;
	Sat, 24 Aug 2024 10:58:07 +0300 (EEST)
Date: Sat, 24 Aug 2024 07:58:07 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] dma-mapping: clear mark DMA ops as an architecture
 feature
Message-ID: <ZsmSj6ZBZqBtjALU@kekkonen.localdomain>
References: <20240824035817.1163502-1-hch@lst.de>
 <20240824035817.1163502-2-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240824035817.1163502-2-hch@lst.de>

Hi Christoph,

On Sat, Aug 24, 2024 at 05:57:58AM +0200, Christoph Hellwig wrote:
> DMA ops are a helper for architectures and not for drivers to override
> the DMA implementation.  Unfortunately driver authors keep ignoring
> this.  Make this more clear by renaming the symbol to ARCH_DMA_OPS,
> have the three drivers overriding it depend on that.  They should
> probably also be marked broken, but we can give them a bit of a grace
> period for that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com> # for IPU6

We'll address this for IPU6 but I can't give a timeline for that right now.

-- 
Kind regards,

Sakari Ailus

