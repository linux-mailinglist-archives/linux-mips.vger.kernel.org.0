Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA6C2E811B
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 16:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgLaPwF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Dec 2020 10:52:05 -0500
Received: from [115.28.160.31] ([115.28.160.31]:35126 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726949AbgLaPwE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 31 Dec 2020 10:52:04 -0500
X-Greylist: delayed 458 seconds by postgrey-1.27 at vger.kernel.org; Thu, 31 Dec 2020 10:52:04 EST
Received: from [192.168.9.172] (unknown [101.224.80.228])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 9D7D46055B;
        Thu, 31 Dec 2020 23:43:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1609429432; bh=B3l951PoCELSmDmy9JRHTJi8RD9bCtC5i1o2HvaeKf0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=O6kiwj0u2KBO6lq530bnd+F5T+DzWbY1FEeyneBxcDXv/rQJ/IXT+3IGkLKrVoY87
         6AqONuZW3WkS/qBK9zwhw8xvIt+sO8mYv6WLJSniWB7IGeUFVPtD4aQc2tNSS8NoVT
         rw6LEdAZu9oPloQ4xkVT/dhQ1ITB7lbH5VoEHuVc=
Message-ID: <d9764581-249f-166d-966b-c1b2997a27a7@xen0n.name>
Date:   Thu, 31 Dec 2020 23:43:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0a1
Subject: Re: [PATCH 3/3] MIPS: cpu-probe: Vulnerabilities for Loongson cores
Content-Language: en-US
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
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
From:   WANG Xuerui <i@xen0n.name>
In-Reply-To: <20201230032314.10042-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On 12/30/20 11:23 AM, Jiaxun Yang wrote:
> Loongson64C is known to be vulnerable to meltdown according to
> PoC from Rui Wang <r@hev.cc>.
>
> Loongson64G defended these side-channel attack by silicon.
"Loongson64G mitigated it in hardware"?
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/kernel/cpu-probe.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 2460783dbdb1..24b21f51353c 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -2092,6 +2092,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>   		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>   			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
>   		c->ases &= ~MIPS_ASE_VZ; /* VZ of Loongson-3A2000/3000 is incomplete */
> +		c->vulnerabilities |= MIPS_VULNBL_MELTDOWN;
> +		c->vulnerable |= MIPS_VULNBL_MELTDOWN;
>   		break;
>   	case PRID_IMP_LOONGSON_64G:
>   		c->cputype = CPU_LOONGSON64;
> @@ -2100,6 +2102,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>   		set_isa(c, MIPS_CPU_ISA_M64R2);
>   		decode_cpucfg(c);
>   		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
> +		c->vulnerabilities |= MIPS_VULNBL_MELTDOWN |
> +			      MIPS_VULNBL_SPECTRE_V1 | MIPS_VULNBL_SPECTRE_V2;

Of course you forgot to set the "mitigated" mask... Oh wait.

It seems the "mitigated" mask in the 1st patch is never used, so either 
code there or here must be amended.

>   		break;
>   	default:
>   		panic("Unknown Loongson Processor ID!");
