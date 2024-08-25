Return-Path: <linux-mips+bounces-5073-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F67095E314
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 13:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F631C209FA
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 11:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3A813F01A;
	Sun, 25 Aug 2024 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qn2bhicO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="362fE7OT"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D421D69E;
	Sun, 25 Aug 2024 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724585598; cv=none; b=IKxKAmVgOkfYVL8Gv3/ayqnWZnTXeEoXKn2+bKM+cUan4UqngTM8R6jmyi837P0/SRtdKWFa2etI7I1cAko+KQkbxVJ0i7rG8X9yHsMqyaQjVyOHsLPe29m2vn3vUhe1EH+EKiG0y4k2fqHNITnwzNAq6FwvpMGGszlz3jn2nYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724585598; c=relaxed/simple;
	bh=6XMbpzg/JuSwUOH7P7AO5R4Ugnca4dCXUcfcSqerxdM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jq0hluLOzzU9Q5lXg+q2fUOkUzq8Dxg4+1U/0Twnc/Jp16y7VdnKFHOGBHNM26r9LjHouxVBU2xZyIUKB3ffwuVy7vuaIqGxqB9ERogH9WodZXnQU/p8IGRCXFp3e2xchOUSzDbFi0oPyCp8HlvUDKjlfY43qda7Q+Sd3KvOIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qn2bhicO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=362fE7OT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724585594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=traTpRXPEY3SvX85V4UNHLV9avrLQDajKAbi9KW9Mas=;
	b=qn2bhicOfVHkdU7ck2v9tQF6W6WaJTXtqZEiWMHDfSL0Ev8o4KvGgHaALZgsyIAuFmttgs
	z5VnO+/6JY/fpXdhsiJya6hJDEm92zNzekboN60EFMExyIDu4ptFxzhH4F3Ic/cIAkD5Z3
	eTpykbtlXrP26a2G14buyr1ILLvcF3Fwjw+fU4Ds0yx9zmYL070XfvOjMbFbx0+G7GP/qN
	QWk0cMlQW6lVQzcayW3GOUwF4N5MKvBs+rCVlIVgoMHKGRHCRYdZj9qmfE8WafyxZ6YmSX
	+njM55adqgFTMeTO5hcBsEL9u4XGST4sctn9iwM/3LHcUT2tKJnm1xD+iixu3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724585594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=traTpRXPEY3SvX85V4UNHLV9avrLQDajKAbi9KW9Mas=;
	b=362fE7OT8P33AoXzNCnYkmiiNxEZ9GS9ZEvhn7ufxaWm1AsSruiz/SNKSgf7TwmCNyijB9
	4r4ytqAeRlb3O+Cg==
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
 <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] dma-mapping: clear mark DMA ops as an architecture feature
In-Reply-To: <20240824035817.1163502-2-hch@lst.de>
References: <20240824035817.1163502-1-hch@lst.de>
 <20240824035817.1163502-2-hch@lst.de>
Date: Sun, 25 Aug 2024 13:33:13 +0200
Message-ID: <87ed6cg7ly.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Aug 24 2024 at 05:57, Christoph Hellwig wrote:
> DMA ops are a helper for architectures and not for drivers to override
> the DMA implementation.  Unfortunately driver authors keep ignoring
> this.  Make this more clear by renaming the symbol to ARCH_DMA_OPS,
> have the three drivers overriding it depend on that.  They should
> probably also be marked broken, but we can give them a bit of a grace
> period for that.

One week :)

> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

