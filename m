Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDFA2E812D
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 17:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgLaQKm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Dec 2020 11:10:42 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:34793 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727094AbgLaQKm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 31 Dec 2020 11:10:42 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 6F1901C9F;
        Thu, 31 Dec 2020 11:09:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 31 Dec 2020 11:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=e
        IUXo03cTQnFInZyvhtEN823h+kgAuKCrDXVIW8Tb1w=; b=qK04lgDAlI0+wzm1Y
        WMjht4PC+clfT7+Whp4cV99RqxodwoQnryajiUmLA4H52g6zTsbel60M+gUtiAqw
        T3iFWkIp76lFc+HeIbeLiPAdkSptGMkXJwimyeqX1VeZkhoKAyNkDa/Dk8HZ6/JW
        CUOKgPicRjXSwyWvqzq6i5ZUBeOV2KXvsbRjPMzTJ7/utf2kjI3ZeREBLhDYeN37
        9pxDWqafC14oQKKxAUZkOa8bOuW/ZoyU+rcKsptyjvOa8E2GzBTTut/DFm8vzAHx
        RbABGNXVW7cRI2RRMl8oixVp+WFPnZIPf0Hfx8LsWs4BxLgpsO3ZEKiQ6fdTjgPT
        0RmRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=eIUXo03cTQnFInZyvhtEN823h+kgAuKCrDXVIW8Tb
        1w=; b=Xy7xWlrZYNGSPTsRQ7K7jzEhqKzdGEk/3Is2GPjuZTeC0SAPp1PlplpAb
        tqwPhu11b9MWbI33oB+1q+mBd+O8lJmNOFDDUxZC3uhlXza0spp6zSQ8Koo1mJu+
        CdumohUpaaaAsIjylB78+poUGdX8zTvfynFaXjiQKoRapgzUtNhhaotN6U8ONaOr
        5MJ6fGufT98AvEjEn8TJqTHF+rZu2bFDgPfQmjtuWwaU5YvvkEYLoVk+q5kc2/fo
        m21ls+4hnablWorq1ymgIugaNbBnG4gwpi8KjZUHYDQjBkEa2J27CokowRNhx6ij
        RXUZSE9oym0l/S/X71o525Krttq6Q==
X-ME-Sender: <xms:zvftX43TRBYVTS94PNaHISxip_a4KIuPIeIz48Hwco2sBbKZe0k_qQ>
    <xme:zvftX61EJYaJYTFLSB8unahyw9Gsch1Z3P2kasBUEujxkmV-YFOBvkAxRpeN56d2c
    PHNGTzNwkhtgjdvomk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvhedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucfkphepiedtrddujeejrddukeelrddujedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:zvftXz8nb1ksWfgLFFpyMHQaaBtxxCiB5_UEc-XBeDOZd7ey4VKxWg>
    <xmx:zvftX_3QO8xusQjfQofTBUohNnexosPoADtqWccM3_39LDATcvMs-A>
    <xmx:zvftX49TSjDok4EYzhCqz-RuN_jEL3zxuZOl5tmnKD22lWfPr9nLkw>
    <xmx:0vftX2ECrhtATn2C_vnGN5tbNmg-xDp1w1GK5CbQlg4se2rSdKvgV_g2D5xgQFTU>
Received: from [192.168.1.203] (unknown [60.177.189.171])
        by mail.messagingengine.com (Postfix) with ESMTPA id 87071108005F;
        Thu, 31 Dec 2020 11:09:43 -0500 (EST)
Subject: Re: [PATCH 3/3] MIPS: cpu-probe: Vulnerabilities for Loongson cores
To:     WANG Xuerui <i@xen0n.name>, linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, Paul Cercueil <paul@crapouillou.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>, YunQiang Su <syq@debian.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20201230032314.10042-1-jiaxun.yang@flygoat.com>
 <20201230032314.10042-3-jiaxun.yang@flygoat.com>
 <d9764581-249f-166d-966b-c1b2997a27a7@xen0n.name>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <81981263-da62-569f-1b47-b258aa5c91e5@flygoat.com>
Date:   Fri, 1 Jan 2021 00:09:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d9764581-249f-166d-966b-c1b2997a27a7@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/12/31 23:43, WANG Xuerui 写道:
> Hi Jiaxun,
>
> On 12/30/20 11:23 AM, Jiaxun Yang wrote:
>> Loongson64C is known to be vulnerable to meltdown according to
>> PoC from Rui Wang <r@hev.cc>.
>>
>> Loongson64G defended these side-channel attack by silicon.
> "Loongson64G mitigated it in hardware"?
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   arch/mips/kernel/cpu-probe.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>> index 2460783dbdb1..24b21f51353c 100644
>> --- a/arch/mips/kernel/cpu-probe.c
>> +++ b/arch/mips/kernel/cpu-probe.c
>> @@ -2092,6 +2092,8 @@ static inline void cpu_probe_loongson(struct 
>> cpuinfo_mips *c, unsigned int cpu)
>>           c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>>               MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
>>           c->ases &= ~MIPS_ASE_VZ; /* VZ of Loongson-3A2000/3000 is 
>> incomplete */
>> +        c->vulnerabilities |= MIPS_VULNBL_MELTDOWN;
>> +        c->vulnerable |= MIPS_VULNBL_MELTDOWN;
>>           break;
>>       case PRID_IMP_LOONGSON_64G:
>>           c->cputype = CPU_LOONGSON64;
>> @@ -2100,6 +2102,8 @@ static inline void cpu_probe_loongson(struct 
>> cpuinfo_mips *c, unsigned int cpu)
>>           set_isa(c, MIPS_CPU_ISA_M64R2);
>>           decode_cpucfg(c);
>>           c->writecombine = _CACHE_UNCACHED_ACCELERATED;
>> +        c->vulnerabilities |= MIPS_VULNBL_MELTDOWN |
>> +                  MIPS_VULNBL_SPECTRE_V1 | MIPS_VULNBL_SPECTRE_V2;
>
> Of course you forgot to set the "mitigated" mask... Oh wait.

Hi Xuerui,

Actually it belongs to not affected category as there is no action
to take in kernel.

>
> It seems the "mitigated" mask in the 1st patch is never used, so 
> either code there or here must be amended.

Yes, it's just a place holder for future kernel mitigations~
Or I should leave it until we find out these mitigations?

Thanks.

- Jiaxun

>
>>           break;
>>       default:
>>           panic("Unknown Loongson Processor ID!");

