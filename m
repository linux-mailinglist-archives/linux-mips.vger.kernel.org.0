Return-Path: <linux-mips+bounces-11912-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD707C198B9
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 11:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A0D019C79E2
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 10:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207842D062E;
	Wed, 29 Oct 2025 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Q8nA+g0P"
X-Original-To: linux-mips@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD92BEC20;
	Wed, 29 Oct 2025 10:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761732050; cv=none; b=Eiw9duHs7IIFOGlkscHRhfn2ovI1RHSXdW0bb507yBocr68jYsn8m9ibiV24m5hc8vqPtWS6VQWV4lzxGn+tVf8vonKPJzAHbu/lKQDNmduNSgP1pmksrsuoWm3qqLjVytCTeJBBcSVEL67jl2l6OszOaYhabRbC7QjKuEVumaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761732050; c=relaxed/simple;
	bh=/ejEbpv3YjlaubY6kroqMVNYHccFsSdgdgs6VeRvqfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=AjMmu+pbDDM0Wyg9q5UbfZ1fWQ1DswuT63gNsESfQE1v82hIw7iYEoBSIcEuHELqLhPilEDWl6J9mlW7yVFKQnNLkcjEptELfs5QCJhX6Cb8g9qa33x/ZxTP9hAhuINBHUPfcHM+LuyhL3uKJT2eH7QKDTLDBq/vCNEEc70J+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Q8nA+g0P; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251029100039euoutp022901308f3eab82458d8910c81b526532~y7fTFrdGq2797727977euoutp027;
	Wed, 29 Oct 2025 10:00:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251029100039euoutp022901308f3eab82458d8910c81b526532~y7fTFrdGq2797727977euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761732039;
	bh=Lz0Rir68dfVLNeA+kqLkIpgtVfATL7Zz4GqfoJVdUA8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Q8nA+g0P0Lp8yYsVx23P8MkKmaRp5d92Nf+2imBS2NlZqa8/5ThIee3tXBOiLNt99
	 PjQedQ0JFXgKyV+emfETcayFtfRKIpSeQMZ0pgMqy9Wn3IoNaAw6sZ7VjxwGv7ehjb
	 3V9ekRK8wOTbOvttHwAsGVylPABrI1wC7ZTCqE2c=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251029100038eucas1p2fe4a84df0bc07dc1cd96f49b4f740618~y7fRb9PRk1129911299eucas1p2W;
	Wed, 29 Oct 2025 10:00:38 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251029100034eusmtip1f745a429892e79db9ec765d9fa07cdc8~y7fOJa_AZ2915029150eusmtip1F;
	Wed, 29 Oct 2025 10:00:34 +0000 (GMT)
Message-ID: <5e6eb6f0-fbbb-4359-9c40-075b25231e0d@samsung.com>
Date: Wed, 29 Oct 2025 11:00:33 +0100
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
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251029100038eucas1p2fe4a84df0bc07dc1cd96f49b4f740618
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
X-EPHeader: CA
X-CMS-RootMailID: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
	<20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>

On 15.10.2025 11:12, Leon Romanovsky wrote:
> This series is a combination of previous two steps [1, 2] to reduce
> number of accesses to struct page in the code "below" DMA layer.
>
> In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.
>
> Thanks
>
> [1] https://lore.kernel.org/all/cover.1758203802.git.leon@kernel.org
> [2] https://lore.kernel.org/all/cover.1759071169.git.leon@kernel.org

Applied to dma-mapping-for-next branch.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


