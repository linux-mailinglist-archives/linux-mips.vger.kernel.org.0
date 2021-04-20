Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF6C364FAE
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 03:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhDTBFn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Apr 2021 21:05:43 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:47895 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229936AbhDTBFm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Apr 2021 21:05:42 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id E45712985;
        Mon, 19 Apr 2021 21:05:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 19 Apr 2021 21:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=m
        lDNUFTdljTuo1j+3cYYINuiqgbp1NrIIwQpWn3MBNc=; b=Ipn3WzyED2LdkvZOB
        wQ37BFZzgO3FjwOC0NY4Nn597HQEtpbI9FecaNqAfOR4yBnjWlkB38vDtugjcaGD
        /oXSiRQqAXuEFSZj1kdaRl3G59DbU/qsNlt7xrHuhdJjl1/ObPY++1zYa+Z1PtOm
        OvAWyV8Gwhlm8xvqFVb5GNf08gQUqlxrBZ/XwJlN+cHmxgLi3yTT1Nr48lLuYtBP
        /u3Qr2qhPvGDHA7sJW+73W/q0f0u6F4u7y1isMhORe9y6KVOw9piV9sX0x1hUtZD
        Dbl/OOiF48m6m/newK/LKSxSdofcyXMPLIY7jLpzlbD1UdOYpMJad5vuAmA/DgTQ
        UVkCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=mlDNUFTdljTuo1j+3cYYINuiqgbp1NrIIwQpWn3MB
        Nc=; b=JUvJk1bct7smH54sq0HpQ73mC0wV7aPeKzwpqqY/XEPfnjqdvaioala9x
        4BW90bjJLs2CYohUDllveNqcw6Zs8oPrQxa8uhim8TtOP+Uy2yQ9pRCi+mff5ZXZ
        eLePEHBjPOKAm77CTX7OnJmzEBLtM8vzg/JYWFYnoo0IHBmNfHd6hUOBkaYQaVYe
        n5qR1rmWCcvcYC2RZtXCHKSB+GIqr2WHAVURXAV99YO86VqdT4rw8+qDsR56qt8F
        9burQyuamn6cG7MgZo5C5Rrx5R/olyf+xFy8LGExz21Wi/bLci+gYN0s7woqffiP
        BOqTkie/9Rn6pMjZxZSCjx8n5fZqA==
X-ME-Sender: <xms:xSh-YPkJiCPlA0W35mi-EjGzafOF0MA8OVugE1VZQ16Ap5vLQ1utBA>
    <xme:xSh-YC0RZMH9K8k-mnLIZ5BkX8B3ZfbT7T1IeTtljt6ZBMBn58pHtVH4CFpI2nCda
    eEhKiSegTpHOPVH8_E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddthedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucfkphepudduiedrvddvgedrvdegjedrgedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:xSh-YFoW5hEl-91yKpXE01kzAUp4hOr_5UtxK5b92LZ2Sv40Cc60Hw>
    <xmx:xSh-YHnM50Jmmqf1ZUeeq5455LbrrFNSN2oXf8WE2R50BOxMGf-VOg>
    <xmx:xSh-YN2JNmiP2uhaEn63ooFVGhRZJLJ0O-7BDGao2lk9MG0iZsGQPw>
    <xmx:xih-YLAVZDu85IHI8IpBJE0JxXbUwo4gksddas3xZAgQm40k7CHz6Q>
Received: from [10.20.195.140] (unknown [116.224.247.41])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2BBA624005E;
        Mon, 19 Apr 2021 21:05:06 -0400 (EDT)
Subject: Re: [PATCH] MIPS: Fix cmdline "mem=" parameter parsing
To:     Youling Tang <tangyouling@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jinyang He <hejinyang@loongson.cn>
References: <1618829425-11873-1-git-send-email-tangyouling@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <5d4d31aa-7fe5-bf8d-1d77-a1605f0c2793@flygoat.com>
Date:   Tue, 20 Apr 2021 09:05:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1618829425-11873-1-git-send-email-tangyouling@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2021/4/19 18:50, Youling Tang 写道:
> This problem may only occur on NUMA platforms. When machine start with the
> "mem=" parameter on Loongson64, it cannot boot. When parsing the "mem="
> parameter, first remove all RAM, and then add memory through memblock_add(),
> which causes the newly added memory to be located on MAX_NUMNODES.
>
> The solution is to add the current "mem=" parameter range to the memory area
> of the corresponding node, instead of adding all of it to the MAX_NUMNODES
> node area. Get the node number corresponding to the "mem=" parameter range
> through pa_to_nid(), and then add it to the corresponding node through
> memblock_add_node().
>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>   arch/mips/kernel/setup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 279be01..b86e241 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -359,7 +359,7 @@ static int __init early_parse_mem(char *p)
>   	if (*p == '@')
>   		start = memparse(p + 1, &p);
>   
> -	memblock_add(start, size);
> +	memblock_add_node(start, size, pa_to_nid(start));

pa_to_nid is not available for all platforms.


Thanks.

- Jiaxun

>   
>   	return 0;
>   }
