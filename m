Return-Path: <linux-mips+bounces-1385-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 236DF84FC1D
	for <lists+linux-mips@lfdr.de>; Fri,  9 Feb 2024 19:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55C921C20F85
	for <lists+linux-mips@lfdr.de>; Fri,  9 Feb 2024 18:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B799254F85;
	Fri,  9 Feb 2024 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="G5aYQz3d"
X-Original-To: linux-mips@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E72679DC0
	for <linux-mips@vger.kernel.org>; Fri,  9 Feb 2024 18:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707503908; cv=none; b=aGCuaxvV5h4m/EhPNN9jzjz7PdfsrVFlypHiJapLf2QqlLR5qijRo2f/L0hU57RwtesfvRZoyT2G8RFShtnCXRvowiOsn6srlMOK4uEjPdrNsqkrPEbsJ6ee1bu/NJbrk9qi1l0L4mhgJDvaVeeOHGNhHku323VBOjftHzWkNno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707503908; c=relaxed/simple;
	bh=c+rwiItIstRSnL0bCsBeIfiiFeNHQerOKUZIMk9xT0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1y0OAWHFZZv2i2D0Tyw7xfrwiGYyQUfchcVNJ+YB4UdtP0GOQSSCK2CGxVp3K430SKKxZeWheVNkUBYpWt53PeoBvLz0aWqCU7Vccnh74gyKJRn7mdImojnOEVV/u6xyMVZM+KXGVt4oi+89LBBDDY1VfQjSvvvVr+oEzd1CUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=G5aYQz3d; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5002a.ext.cloudfilter.net ([10.0.29.215])
	by cmsmtp with ESMTPS
	id YQA4r7FIECF6GYVlZrG8Ne; Fri, 09 Feb 2024 18:38:25 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id YVlYr8xNeoFgVYVlYrly6o; Fri, 09 Feb 2024 18:38:24 +0000
X-Authority-Analysis: v=2.4 cv=e7ylSrp/ c=1 sm=1 tr=0 ts=65c67120
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
	bh=ubhs5TTJlmjrNVcQ8/d8FvdbYjky0tqln9Hz+0mS83c=; b=G5aYQz3dT7H6nvvIE7oHOiEsj5
	/NWS2+D1C2tHb+hSTOo1Up1YHqlQE4Wt/XzChjeBGvGZdZLXlBrgqYmG2uTmAs8EVX67FCbAUJCST
	FpCEHoHQg1GipLjC3EmProNpo09ShJDCkV8o7ZMbhsSNkE+hJYhIoSHV62yhp+MNWS7n4SchyWzqR
	uuYSfGJkyFEGuJPErIBj8Ksq/lyUqys/fHWcmX+fsexcgLVJngIml623AeNrBtGSRGDYuzzrdtNwA
	5EEAFbrXH9RUvgo4R+FjdZM/W3qDKb22chTmFN3vB++ljI5GxxPK6d5nUcMSSoxn7sWfsanU4qTib
	tTlZhVJQ==;
Received: from [201.172.172.225] (port=33262 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rYVlX-004CdG-2a;
	Fri, 09 Feb 2024 12:38:23 -0600
Message-ID: <3ef9dfc9-3d0f-434d-9836-066265975728@embeddedor.com>
Date: Fri, 9 Feb 2024 12:38:18 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/bcm-6345-l1: Prefer struct_size over open coded
 arithmetic
To: Erick Archer <erick.archer@gmx.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-hardening@vger.kernel.org
References: <20240209181600.9472-1-erick.archer@gmx.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240209181600.9472-1-erick.archer@gmx.com>
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
X-Exim-ID: 1rYVlX-004CdG-2a
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.10]) [201.172.172.225]:33262
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJIqZaImIO+czRkKB6/8fY3llcVCS107G9udnxp8hBDm2B4kmiPBhimjmv49Ud99TfFaC2v5VJywCSWJH9yoiBuDqRbzU/sexj37TXsskbabg6OXsWmt
 8/ipT814oALOXtAR5wXckC1djoPrdAGaEl/IOARsh7MTbA7MNDc57EgrOglCtFerFWn9h29g8oWRdQCRrloj3tVbbHlbQLrny5TPWhtaI2XmLOg/PQ2nXBad



On 2/9/24 12:16, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> As the cpu variable is a pointer to "struct bcm6345_l1_cpu" and this
> structure ends in a flexible array:
> 
> struct bcm6345_l1_cpu {
> 	[...]
> 	u32	enable_cache[];
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
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

LGTM:

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/irqchip/irq-bcm6345-l1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-bcm6345-l1.c b/drivers/irqchip/irq-bcm6345-l1.c
> index 9745a119d0e6..eb02d203c963 100644
> --- a/drivers/irqchip/irq-bcm6345-l1.c
> +++ b/drivers/irqchip/irq-bcm6345-l1.c
> @@ -242,7 +242,7 @@ static int __init bcm6345_l1_init_one(struct device_node *dn,
>   	else if (intc->n_words != n_words)
>   		return -EINVAL;
> 
> -	cpu = intc->cpus[idx] = kzalloc(sizeof(*cpu) + n_words * sizeof(u32),
> +	cpu = intc->cpus[idx] = kzalloc(struct_size(cpu, enable_cache, n_words),
>   					GFP_KERNEL);
>   	if (!cpu)
>   		return -ENOMEM;
> --
> 2.25.1
> 
> 

