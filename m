Return-Path: <linux-mips+bounces-5084-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33AD95E8E9
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 08:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6BE31C21AA7
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 06:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8216312C549;
	Mon, 26 Aug 2024 06:30:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E70945A;
	Mon, 26 Aug 2024 06:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724653818; cv=none; b=d41riXuBYhCeiyoS5M1fUCe5xdD/ZUr2Vxkz9QFwkHNyi+TwrH/S5s6+mtjyh41moWmLcv2OLCItskuarHgjRYYXrVUFg+Nk8LtjoWfTYta0w7Mj0OCpQ3xWFXGVrMGi4hjj2jbVOty1Lf6eAgfXElRU+Zlo4rYLCqWZtDoYBK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724653818; c=relaxed/simple;
	bh=I5vPQa5B0qSf1a0XhjsHqZRzzkETp0uhy9XwdCafnAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG38GKBRLoAPk9m0yNvuPfVUaeF0U7U7UL9GYYEDqfJ0bi7+dXXUD/YvWSUuLFy7n77cnv24yLk5OK/ypACv3vyvcAtfrr0hRs9mjIrG2bq5W7gdbghz3o46Dadh+DIU9LNZutBL/wTNxnZ13vuop+KeXpg9MjqcnLHsNt+4s3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8552E68AA6; Mon, 26 Aug 2024 08:30:03 +0200 (CEST)
Date: Mon, 26 Aug 2024 08:30:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Wang <jasowang@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, "Michael S . Tsirkin" <mst@redhat.com>,
	iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
Message-ID: <20240826063002.GA30266@lst.de>
References: <20240824035817.1163502-1-hch@lst.de> <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com> <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Aug 26, 2024 at 02:27:27PM +0800, Jason Wang wrote:
> Actually I meant, we can extend the virtio_config_ops to allow mapping
> ops there, then simulator and VDUSE can hook the map ops there.

From a quick glance that feels like the right layer of abstraction,
although the config part of the name feels wrong at that point.


