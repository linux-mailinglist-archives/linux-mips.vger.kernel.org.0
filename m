Return-Path: <linux-mips+bounces-1386-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D50E84FC42
	for <lists+linux-mips@lfdr.de>; Fri,  9 Feb 2024 19:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23BC7B2E7FE
	for <lists+linux-mips@lfdr.de>; Fri,  9 Feb 2024 18:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A067784A48;
	Fri,  9 Feb 2024 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="ZzbK85aj"
X-Original-To: linux-mips@vger.kernel.org
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E801880C0D
	for <linux-mips@vger.kernel.org>; Fri,  9 Feb 2024 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707504048; cv=none; b=Fq/xkBZXdVU5LhWovNGbIkHefdVA9ufHe145njSV2EPndImCZucqvAThDhLCWsQu/CotksxTWeCjTjrjDnePHFwUiHOkfVXzXDiSi+LbzEIWS3HsdvwBEDSvCtQPqK3D6kt0MIDaJk9PakpXMvUQ8tDlWJ7dOc0IIxJrrnVVPqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707504048; c=relaxed/simple;
	bh=cGmHWSGLHz17B8btCc2AE/o8aT7d8KP8VqeDD83SkMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHWc2PpCMxkL1uKahqwBjk0CUbcsCXuwBG67SgL5PLG09quxQrszMJzrMRg/gHEQlAmC1G6rbf7/VhmsK7YGkwVMo/2Tr6rrx57TRd4Vy9nXx19aZadMD+fRpA2BIFyKxFhbq2MQPO3UVb6XmJ5rucyYSuh0f2jGZgZWJ6yphVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=ZzbK85aj; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTPS
	id YTderZjXs80oiYVnjrOxSc; Fri, 09 Feb 2024 18:40:39 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id YVnirYcvuR0A5YVnjrGTXR; Fri, 09 Feb 2024 18:40:39 +0000
X-Authority-Analysis: v=2.4 cv=Ita9c6/g c=1 sm=1 tr=0 ts=65c671a7
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=VhncohosazJxI00KdYJ/5A==:17
 a=IkcTkHD0fZMA:10 a=k7vzHIieQBIA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=7YfXLusrAAAA:8 a=2-LqU1-JSYPvSRI2HFEA:9 a=QEXdDO2ut3YA:10
 a=1F1461vogZIA:10 a=5kKzt1m56AEA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=SLz71HocmBbuEhFRYD3r:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T/Vt6J+2HyI4fL0ju6FlCYXfypaAB0iP+HCsMPfsayQ=; b=ZzbK85aj0S9o6GgRYrUw4Dygwg
	02nvp2ZsW3ANqCKSmh+lr/UBL0ImJqQEd8FCVbZJPbhX0qMw44TdOEB5nhRLXtjD9fTegmHSHhY0Y
	nXOvYHO/u/MB21ma7UjscXZTBK4HirCLr01yDi1SjjCcm6k8XJ+MdGhHnRIGbsDCz8TBYvoSTOE25
	WQWIyAbleG3cGvc/3IADf7U+hSxGJnRVtBiWyaBn84p6pq5CGdzV87PUWcFktiY8n2kktpL6rFk7y
	uyP4naYwuUwjy+0Jra1YqLOL72KkoOhPmODXpzY8G1ok3iyuONFYLTT7ZT8H+TjMA+UyZhloZkeeu
	5g67J31g==;
Received: from [201.172.172.225] (port=40870 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rYVni-004Ebp-0u;
	Fri, 09 Feb 2024 12:40:38 -0600
Message-ID: <b7cd5217-e7dc-4b57-aab2-bef1b78dca7d@embeddedor.com>
Date: Fri, 9 Feb 2024 12:40:36 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/irq-bcm7038-l1: Prefer struct_size over open
 coded arithmetic
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20240209183128.10273-1-erick.archer@gmx.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240209183128.10273-1-erick.archer@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.172.225
X-Source-L: No
X-Exim-ID: 1rYVni-004Ebp-0u
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.10]) [201.172.172.225]:40870
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 13
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMIwf28Q/CIxKlbk6JattefEu4Tn+NWVyser6kMp908n6NV8eO9CpBGINTciSTlVCukp3N6BRmuZNFB3hHngzXdAftG0d665Jwb4JF+8XySr7DEBFM1E
 /PLbOGb71Gf082XojQP809uHiMFgmzsHLCILBOtpr96fyuUEK3swAcT29Kbtfv9S8SPtFQr4DCp5cWMP68zzAsPPXohAE/q0e2SKaf0RvdAsqqkbpT5A/XWV



On 2/9/24 12:31, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> As the cpu variable is a pointer to "struct bcm7038_l1_cpu" and this
> structure ends in a flexible array:
> 
> struct bcm7038_l1_cpu {
> 	void __iomem	*map_base;
> 	u32		mask_cache[];
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the argument "size + count * size" in the
> kzalloc() function.
> 
> This way, the code is more readable and more safer.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/162 [2]
> 
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

LGTM:

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/irqchip/irq-bcm7038-l1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
> index 24ca1d656adc..36e71af054e9 100644
> --- a/drivers/irqchip/irq-bcm7038-l1.c
> +++ b/drivers/irqchip/irq-bcm7038-l1.c
> @@ -249,7 +249,7 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>   		return -EINVAL;
>   	}
> 
> -	cpu = intc->cpus[idx] = kzalloc(sizeof(*cpu) + n_words * sizeof(u32),
> +	cpu = intc->cpus[idx] = kzalloc(struct_size(cpu, mask_cache, n_words),
>   					GFP_KERNEL);
>   	if (!cpu)
>   		return -ENOMEM;
> --
> 2.25.1
> 

