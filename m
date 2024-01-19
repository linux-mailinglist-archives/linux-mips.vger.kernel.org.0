Return-Path: <linux-mips+bounces-994-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C882832739
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 11:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE08C1F23705
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 10:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E0F3C468;
	Fri, 19 Jan 2024 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="u9TXrfZ5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cetPJUYC"
X-Original-To: linux-mips@vger.kernel.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2803C466
	for <linux-mips@vger.kernel.org>; Fri, 19 Jan 2024 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705658744; cv=none; b=KDzmv1p81Gk5hsvHIqqP0HbwaGioRSWSWJ9KTM0rO0HXiN3qK5zIsZS/DvmZZVordBjWwTKkq1VMqG1xk3HKoX+54RjnG8y2PIulf2uK9q+icjr/ZYZFw0eqqjXBfvPl4GcwBDZQJFhfqSgvBDMsVyA5Odme1VrsagFQNjpku5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705658744; c=relaxed/simple;
	bh=HPRxKmQ512WpYalu7yL0e5hvB8LlQDbD3hhNWljFPGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgGbARhusgdOUpRCiLVuyICJwVuv/FIWFncnEc+UjF7CYbH5UVDLhZVjxOflPk43dF6Az/m/mRuRY8DGp7UZvcMzWvyP70jsSxGkjlXm5vZxUTtCfI1LXzfUCaWTd25bqaZxsAx0GzoMetAp4N97BSI1r3HQT+a3nl2ex0RMwnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=u9TXrfZ5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cetPJUYC; arc=none smtp.client-ip=66.111.4.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 642395C01AA;
	Fri, 19 Jan 2024 05:05:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 19 Jan 2024 05:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1705658742;
	 x=1705745142; bh=PnMLXBUkQbM54FWoWpkcXxxUYGAy5J6y/1amzm4BYec=; b=
	u9TXrfZ5+PGV5HXmkjuUirJMWCeNA1NyQmCAwitZOj4yWRjTPIJRukgBD6Xy+BSd
	091Bk4eQYCL/ghFrvF/twLkX1HFIJvmWot8u8xu8qZiyiFOnVWg+7zDEXkyzHYPM
	BeOOsm4sH9pxgAZFXB8D9GyIsuxvZIRxqyZQp6JT0Q38cnxMd+c/5TXnSrLfMj6w
	NrTLl+kY6ToD8PaAKDtA+4Afl7c13RlPKX3QK3gUvo6HZw0s9yRSqUYtGhzr24KG
	5uG1zdpgQpgpG3HRDHHPPfEA0+9CsWr1d0JXP6Qo2yOgu2rt7dj8gSnql2aEbpxe
	y1LqRXAQq2NPtavryPPt1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1705658742; x=
	1705745142; bh=PnMLXBUkQbM54FWoWpkcXxxUYGAy5J6y/1amzm4BYec=; b=c
	etPJUYCIZNt/uOtkmpBAJQY6gIamytkbeseULRZo2adsF2XIit2ykxRLgXzK35E9
	LAdbNweKGYKF29ZBSAbUhvHKwgq6qC+DkTMb1EvZx4V4EeajuUyRrFumHQ9De6yD
	DKAa3ZKbLa1/48NqzbAMVhvzjP4IRMbT1Xtzu7bm9nHCF+rso8pZKMJMgbEv5pJl
	moKhDfgwoFe7cJUgfKefmPcYuatLU2g0zeRR6g5wqJIqBvsubLvH8WwthDNNPsKW
	0ZSg4L5spVgMTWrXhMrHJRPGzF12CC2LzqyoisnBLJpEMV//8/Om1/tJZ0Ljzfln
	qIO+9gbYH82wcu6Sk88qw==
X-ME-Sender: <xms:dUmqZXmGfBAkNIAm2Aa3nSOVCs0zmm3uwv1E-raWFiygFepRygyo5Q>
    <xme:dUmqZa0TWBN-sHX7F09B-TIYEcoQKRCIYBidWmASbZDsyLV2L1oGclwuAHF7fgLLz
    GHW7fSFi6I3xVULzbU>
X-ME-Received: <xmr:dUmqZdomCn8_XXcmPnntfguNpL73z9BETJ8duUoV9QcRSrFyiTwOwDMKfJEg_RUTYbaWtmlDgeIZBnb90J7KIPpxZah6z4Tst6JCZIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdektddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepleeuffehheegleeuvdelgffhueekjeetueevuefhffdtgfeu
    hfeggfeukefffedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:dUmqZfnSFVjxrIxeQvny3uW_iXUab5GI4sSB5cyRKFbDv0rqyspxUw>
    <xmx:dUmqZV1OpsR3mhOJMKLPDfPpwTW_B556EFxab3PXx_eKv7uD0iAVRw>
    <xmx:dUmqZeuH2YnYMJOkgGPDvjM7VuuVAjIzrchw2qa85ufnxEg3ZtW0bA>
    <xmx:dkmqZSnjUVZ8-ErK3VUJKKi3pB2lgtTPDGlGpNdF7DvUlJlft6JsTg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Jan 2024 05:05:40 -0500 (EST)
Message-ID: <4f1fc736-6e44-4313-acdc-d1c88cda15f6@flygoat.com>
Date: Fri, 19 Jan 2024 10:05:39 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MIPS: loongson64: set nid for reserved memblock
 region
Content-Language: en-US
To: Huang Pei <huangpei@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Li Xuefeng <lixuefeng@loongson.cn>,
 Yang Tiezhu <yangtiezhu@loongson.cn>, Gao Juxin <gaojuxin@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240119040240.392442-1-huangpei@loongson.cn>
 <20240119040240.392442-3-huangpei@loongson.cn>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Autocrypt: addr=jiaxun.yang@flygoat.com;
 keydata= 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
 HVO98ZmbMeg=
In-Reply-To: <20240119040240.392442-3-huangpei@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2024/1/19 04:02, Huang Pei 写道:
> Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()) reveals
> that reserved memblock regions have no valid node id set, just set it
> right since loongson64 firmware makes it clear in memory layout info.
>
> This works around booting failure on 3A1000+ since commit 61167ad5fecd
> ("mm: pass nid to reserve_bootmem_region()) under
> CONFIG_DEFERRED_STRUCT_PAGE_INIT.

This should be done at MIPS arch level I guess.

Thanks
- Jiaxun

>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>   arch/mips/loongson64/init.c | 2 ++
>   arch/mips/loongson64/numa.c | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index f25caa6aa9d3..000ba91c0886 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -103,6 +103,8 @@ void __init szmem(unsigned int node)
>   	if (loongson_sysconf.vgabios_addr)
>   		memblock_reserve(virt_to_phys((void *)loongson_sysconf.vgabios_addr),
>   				SZ_256K);
> +	/* set nid for reserved memory */
> +	memblock_set_node((u64)node << 44, (u64)(node+1) << 44, &memblock.reserved, node);
>   }
>   
>   #ifndef CONFIG_NUMA
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index 8f61e93c0c5b..6345e096c532 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -132,6 +132,8 @@ static void __init node_mem_init(unsigned int node)
>   
>   		/* Reserve pfn range 0~node[0]->node_start_pfn */
>   		memblock_reserve(0, PAGE_SIZE * start_pfn);
> +		/* set nid for reserved memory on node 0 */
> +		memblock_set_node(0, (u64)1 << 44, &memblock.reserved, 1);
>   	}
>   }
>   

-- 
---
Jiaxun Yang


