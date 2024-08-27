Return-Path: <linux-mips+bounces-5121-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A4960A7B
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2024 14:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63EC6283BB7
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2024 12:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB941C2DC9;
	Tue, 27 Aug 2024 12:32:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA951C2DA7;
	Tue, 27 Aug 2024 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761927; cv=none; b=pVl1xhiiUOe2yHZbysQn0wtsTEIyQE4eiU5wqIpT5186X6Z43EjH2cHrLDpvSVi71/VNsnIkIMpZG9K6D0EhG7XCdH69G8nqk25A8LQVIoLa26plvRRKYb8dRyJfQq8Wa9dAcyTdsJtYLLiXhaMYEgkRwkk4cHOimfVqMlE4M0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761927; c=relaxed/simple;
	bh=Wm/BkMezv2xCJOsSmzbRpJVXjxQ8zUW0dbYK/XHmGEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9cGqXjua0qA0R02k/GpiBer7XV6siTlQW1IBW9VO7FQKkBEClnQp+SXKF4JBCQK+2LDtLzo30qaTg/031jfBH17Y9BJz74tPMpxhJBH8c92pIZs5zj++Z9RR5tTd0seCkqQw/hap9UDyDVOPmaFAo5uxAtgo//HL5CrtroUF3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69B28DA7;
	Tue, 27 Aug 2024 05:32:30 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C67E53F762;
	Tue, 27 Aug 2024 05:32:01 -0700 (PDT)
Message-ID: <91ef4036-6468-4ecc-ac14-0146130d8da4@arm.com>
Date: Tue, 27 Aug 2024 13:31:59 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-mapping: clear mark DMA ops as an architecture
 feature
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
References: <20240824035817.1163502-1-hch@lst.de>
 <20240824035817.1163502-2-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240824035817.1163502-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/08/2024 4:57 am, Christoph Hellwig wrote:
> DMA ops are a helper for architectures and not for drivers to override
> the DMA implementation.  Unfortunately driver authors keep ignoring
> this.  Make this more clear by renaming the symbol to ARCH_DMA_OPS,
> have the three drivers overriding it depend on that.  They should
> probably also be marked broken, but we can give them a bit of a grace
> period for that.

Nit: from a quick survey of "git grep 'select ARCH_'", maybe 
ARCH_HAS_DMA_OPS might be the clearest and most consistent name? 
Otherwise, now that any potential confusion from drivers/iommu is no 
more, I too thoroughly approve of the overall idea.

Acked-by: Robin Murphy <robin.murphy@arm.com>

