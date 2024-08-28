Return-Path: <linux-mips+bounces-5148-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51431961FB2
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 08:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05B9D1F25A8E
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 06:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF201553BC;
	Wed, 28 Aug 2024 06:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="H9fF3GHs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229D914D43D;
	Wed, 28 Aug 2024 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724826394; cv=none; b=R/fGls2Vo0/IdFaphQgaZetaQNoKmlKEmf2zsyQcDBI/ItF7tML6XxuvccSeJ9gAUVD8JpCnPTxYR8RDa25xD2eMvQGE8lZSFXnEbD8dfaG6QKbf2VB3L9QmZJ/b0BGVfiw6/L/4US8WJaCdI0FR2puWeMsLmJORy1pRregaK3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724826394; c=relaxed/simple;
	bh=MJRKJbSOVk7d7dB2I76yTOVq5DldaOqtebinMXA5JHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFwGk7oP7TXm4XLC5ckXxatcDUYawlKm5L8vdQ3VscV30XFqCVtmexSGUmAQqUD0vuHG/MwF1JaQrOjU6lth4ZM3qBJvkFMoT9OkF1Z+5QW5cdUtn1YP3POcoYt2d8ljPeRpZtvHqUXDVKAa0DBhPLvYfd8m/7Hl+cd0TleOShk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=H9fF3GHs; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4WtvSD4CTtz1FXRy;
	Wed, 28 Aug 2024 08:21:16 +0200 (CEST)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4WtvSC6CZ0z1DPkN;
	Wed, 28 Aug 2024 08:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1724826076;
	bh=MZjaRsFFki5Bx5B5FHnglUd9d4H7fBDSxyu2jHiKATQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=H9fF3GHsObx42DQlccYjWkCaI8H7IjrygcJqC6jNaK4z0Z18apld5cXSgQVOUCs01
	 KKScBf0M+KhxqxD5GBoovtvU90uovoSytFCOkAnhgzKqOSnS+qVrnNytVlHc49wNmn
	 MMSVwYK7ONDpeF3VHN8cIXWAeIenPfu7ecQ0hXO8=
Message-ID: <12a0f286-3114-4dac-8b75-3a638d9c8635@gaisler.com>
Date: Wed, 28 Aug 2024 08:21:14 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-mapping: clearly mark DMA ops as an architecture
 feature
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>
References: <20240828061104.1925127-1-hch@lst.de>
 <20240828061104.1925127-3-hch@lst.de>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20240828061104.1925127-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-08-28 08:10, Christoph Hellwig wrote:
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -177,8 +177,8 @@ config XEN_GRANT_DMA_ALLOC
>  
>  config SWIOTLB_XEN
>  	def_bool y
> +	depends on ARCH_DMA_OPS

Rename to ARCH_HAS_DMA_OPS in v2 is missing here

>  	depends on XEN_PV || ARM || ARM64
> -	select DMA_OPS
>  	select SWIOTLB
>  
>  config XEN_PCI_STUB
> @@ -348,10 +348,10 @@ config XEN_GRANT_DMA_IOMMU
>  
>  config XEN_GRANT_DMA_OPS
>  	bool
> -	select DMA_OPS
>  
>  config XEN_VIRTIO
>  	bool "Xen virtio support"
> +	depends on ARCH_DMA_OPS

and here.

Cheers,
Andreas


