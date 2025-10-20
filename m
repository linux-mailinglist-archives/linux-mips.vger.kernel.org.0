Return-Path: <linux-mips+bounces-11805-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B5BF26AA
	for <lists+linux-mips@lfdr.de>; Mon, 20 Oct 2025 18:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 375861881FB7
	for <lists+linux-mips@lfdr.de>; Mon, 20 Oct 2025 16:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD692287505;
	Mon, 20 Oct 2025 16:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KX6ZcktJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81778287507;
	Mon, 20 Oct 2025 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760977661; cv=none; b=Vfo2Y1Fmfz7fOnvVg8rVrYrXoHpdZexXl0TwphoShEQWXdC17L7rpHlQEYG0KSGYXh9Tq1wNhB9AObCb8IfrjikzXHTCrNcKUEf5U/NF2PKzoBaXJ3HEwqUbxVvkK6X7fnaW1sgWc0TWMBjq3fTv8IxnSXYtOiF31upZ3UG0K/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760977661; c=relaxed/simple;
	bh=Vabp+0+S/4DTZ4v4reVqmI30Vzed+Tmcb8OyEwtERHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=eOCJC56yTlk4gvSx/S2H2H15BW7sOpQLrub95K/gCinAZu4g2xwL7hrnz9txWJUAYun9vQ8S0JfjymHXT+g1rkQOZQUUC9sr6mtEXP9U0V06tKfTGfWdOhDkboq8JaJhs1VWmou7RviuUDchmb1pT813T4xQGPYf4UGh35K5g2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KX6ZcktJ; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251020162737euoutp01a7ea5ea3a3593576d6931ec88825e51e~wP9lezYs81013510135euoutp01e;
	Mon, 20 Oct 2025 16:27:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251020162737euoutp01a7ea5ea3a3593576d6931ec88825e51e~wP9lezYs81013510135euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760977657;
	bh=e1+m70MIpIyLz0CgkjVmG+Zs9EMNilUICX9qZOez4wM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=KX6ZcktJJB15hpYlnrrgQKN5QMQizY7xdPAAhwp/El6wk7EM1ZJ6O6Pj837PofyJ0
	 migBg+i6L8vxe8bZ5F9hMcPUSOwsRbNZdnHxT7YLQRx589Age6y9jtnUV7j+rxCbcf
	 lscFl8Zw2Bwk6HlnV8xYW2UgmAXjN9fs/Wr5RS2Y=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251020162736eucas1p1ef138572570fd17f7ba8cf6e6bc78ba6~wP9lIhm7s0044200442eucas1p1L;
	Mon, 20 Oct 2025 16:27:36 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251020162733eusmtip2068f969d861135995e1cd515194afc64~wP9hxNWHW2552125521eusmtip2Y;
	Mon, 20 Oct 2025 16:27:33 +0000 (GMT)
Message-ID: <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>
Date: Mon, 20 Oct 2025 18:27:32 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 00/14] Remove DMA map_page/map_resource and their
 unmap callbacks
To: Leon Romanovsky <leon@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Richard Henderson
	<richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Geoff Levand <geoff@infradead.org>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Thomas
	Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
	Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, Magnus Lindholm <linmag7@gmail.com>, Jason
	Gunthorpe <jgg@ziepe.ca>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251020162736eucas1p1ef138572570fd17f7ba8cf6e6bc78ba6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
X-EPHeader: CA
X-CMS-RootMailID: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
	<20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>

Dear All,

On 15.10.2025 11:12, Leon Romanovsky wrote:
> This series is a combination of previous two steps [1, 2] to reduce
> number of accesses to struct page in the code "below" DMA layer.
>
> In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.

I would like to have some acks from respective arch maintainers before 
applying this patchset.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


