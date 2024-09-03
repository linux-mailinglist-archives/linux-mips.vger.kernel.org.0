Return-Path: <linux-mips+bounces-5292-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC7D96955D
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 09:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8865E1F2495D
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 07:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EAF1D6C4A;
	Tue,  3 Sep 2024 07:27:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BFE1D6DD5;
	Tue,  3 Sep 2024 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348473; cv=none; b=j/fpkH4jlU7wQsXvFJCZVzuUURWtgHd3SLXvoc9J2I7TiKmNRoPP9FQnuLOVqsRUkwpI5bAKy9jrTqQgPhU1/yrZQ7uR3YRFHS06xN7qem40doyyIoWUtQQ1tgEkyniuEgOVv2JPcq0xoBiDDfoZtBs1YG21+QIlOkZjhwAT7MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348473; c=relaxed/simple;
	bh=aeaA2a5vzKDuxVbiVuifdH1E1Rnyj25ZBVitW+tRHbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XH/7fyvuxvU4XVB703vit/MzIGJ+yCGEejaD8Ge8E75bIhxGjH8hlg9RAminiZuXNxiD//ANoDUqqiV6NU4c3O7VgC6BdMVHSFUoK/g1qQfRdQXtULdO0wLLoaF/IBPdlcK9K9+n4IWfktrEv7k7hD1hCh7/OcDavJ0JH4wUgbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C1D91227A8E; Tue,  3 Sep 2024 09:27:44 +0200 (CEST)
Date: Tue, 3 Sep 2024 09:27:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: clearly mark DMA_OPS support as an architecture feature v2
Message-ID: <20240903072744.GA2082@lst.de>
References: <20240828061104.1925127-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828061104.1925127-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

I've pulled this into the dma-mapping for-next tree, although I'd
love to see one of the vdpa maintainers look over patch 1.  I'm
pretty sure it's correct, but a confirmation would be good.


