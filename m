Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4C67FC760
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2019 14:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfKNN0Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Nov 2019 08:26:24 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25854 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbfKNN0Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Nov 2019 08:26:24 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1573737969; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Bx5L7Lah/e3c+eX3EeUsFiMuGQHLvnZunfGCkmZ2krBE7EztyD2/AUHrIum7zo3o6xpa46IJD0bgyKeNIxZg1+EPxsfbne0me21qwrcSMqnV8zd8P/uOhY907Hb11Tyo9jICnJe8Eu/5XAf6XWRBSDRp0PXbF00M2E8ZiwWHSho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1573737969; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=/spMvY4R12FvcM3P4DlAhhuBGYXbyQfBjjePieWC0rs=; 
        b=SzFUY5CtxJ3A8kl2G/P2+WfJYYxfc0B3nnGnB5OFjYBreE1hieXrZUZtj4pLPggJfEthM6zk+bZnCB1VVBgl+U889lI+eBDl2cDf5l7vNAjpC7RVccuWv78oba5dS6QniVwXOVgwrNMMWXSmuj4gwnBpZ8BDkkS2I1uDxoXZoDs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=WvGdLrnCs2GT0t/qCA7IOjND69Uk1WTkciuEl4RHi8NfMzCtcS+iq1gdaa12MPUusDWpgTPNyi9v
    lkJ16Dq0U1I4Y15kWs6+TK9kjtMcGk9L6RKyUukBUXhR/a7aSryv  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1573737969;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=3262; bh=/spMvY4R12FvcM3P4DlAhhuBGYXbyQfBjjePieWC0rs=;
        b=Gf8gGp+1OwqntrmEIh9aDI3U1Uksv8VHIWtuyJY03H4M/OBKD8Yqu1fYq+pBi/WC
        vkB9uGULkQ2Be/Nmi9axGza6nJhfhnr4/s8ZRHc+BjM1bNQM7ECKq2htc4SOL/hVgPo
        vruBAjR5MQKZhlynbjsvOBUtE3tu/UULKfL2gm70=
Received: from [192.168.10.218] (171.221.112.167 [171.221.112.167]) by mx.zohomail.com
        with SMTPS id 1573737968568701.439592202719; Thu, 14 Nov 2019 05:26:08 -0800 (PST)
Subject: Re: [PATCH 1/2 v3] dt-bindings: clock: Add X1000 bindings.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
 <1573378102-72380-1-git-send-email-zhouyanjie@zoho.com>
 <1573378102-72380-2-git-send-email-zhouyanjie@zoho.com>
 <1573434832.3.1@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, paul.burton@mips.com, sboyd@kernel.org,
        robh+dt@kernel.org, syq@debian.org, mark.rutland@arm.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DCD55E7.8080807@zoho.com>
Date:   Thu, 14 Nov 2019 21:25:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1573434832.3.1@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019=E5=B9=B411=E6=9C=8811=E6=97=A5 09:13, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le dim., nov. 10, 2019 at 17:28, Zhou Yanjie <zhouyanjie@zoho.com> a=20
> =C3=A9crit :
>> Add the clock bindings for the X1000 Soc from Ingenic.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>
>> ---
>>  .../devicetree/bindings/clock/ingenic,cgu.txt      |  1 +
>>  include/dt-bindings/clock/x1000-cgu.h              | 44=20
>> ++++++++++++++++++++++
>>  2 files changed, 45 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/x1000-cgu.h
>
> When you send a revised version of a patchset, it's common practice to=20
> have a per-patch changelog right here. Then a cover letter is only=20
> really needed for big patchsets that need extra information.
>

Thank you! I will pay attention to this next time.

>>
>> diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt=20
>> b/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
>> index ba5a442..75598e6 100644
>> --- a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
>> +++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
>> @@ -11,6 +11,7 @@ Required properties:
>>    * ingenic,jz4725b-cgu
>>    * ingenic,jz4770-cgu
>>    * ingenic,jz4780-cgu
>> +  * ingenic,x1000-cgu
>>  - reg : The address & length of the CGU registers.
>>  - clocks : List of phandle & clock specifiers for clocks external to=20
>> the CGU.
>>    Two such external clocks should be specified - first the external=20
>> crystal
>> diff --git a/include/dt-bindings/clock/x1000-cgu.h=20
>> b/include/dt-bindings/clock/x1000-cgu.h
>> new file mode 100644
>> index 00000000..bbaebaf
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/x1000-cgu.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * This header provides clock numbers for the ingenic,x1000-cgu DT=20
>> binding.
>> + *
>> + * They are roughly ordered as:
>> + *   - external clocks
>> + *   - PLLs
>> + *   - muxes/dividers in the order they appear in the x1000=20
>> programmers manual
>> + *   - gates in order of their bit in the CLKGR* registers
>> + */
>> +
>> +#ifndef __DT_BINDINGS_CLOCK_X1000_CGU_H__
>> +#define __DT_BINDINGS_CLOCK_X1000_CGU_H__
>> +
>> +#define X1000_CLK_EXCLK        0
>> +#define X1000_CLK_RTCLK        1
>> +#define X1000_CLK_APLL        2
>> +#define X1000_CLK_MPLL        3
>> +#define X1000_CLK_SCLKA        4
>> +#define X1000_CLK_CPUMUX    5
>> +#define X1000_CLK_CPU        6
>> +#define X1000_CLK_L2CACHE    7
>> +#define X1000_CLK_AHB0        8
>> +#define X1000_CLK_AHB2PMUX    9
>> +#define X1000_CLK_AHB2        10
>> +#define X1000_CLK_PCLK        11
>> +#define X1000_CLK_DDR        12
>> +#define X1000_CLK_MAC        13
>> +#define X1000_CLK_MSCMUX    14
>> +#define X1000_CLK_MSC0        15
>> +#define X1000_CLK_MSC1        16
>> +#define X1000_CLK_SSIPLL    17
>> +#define X1000_CLK_SSIMUX    18
>> +#define X1000_CLK_SFC        19
>> +#define X1000_CLK_I2C0        20
>> +#define X1000_CLK_I2C1        21
>> +#define X1000_CLK_I2C2        22
>> +#define X1000_CLK_UART0        23
>> +#define X1000_CLK_UART1        24
>> +#define X1000_CLK_UART2        25
>> +#define X1000_CLK_SSI        26
>> +#define X1000_CLK_PDMA        27
>> +
>> +#endif /* __DT_BINDINGS_CLOCK_X1000_CGU_H__ */
>> --=20
>> 2.7.4
>>
>>
>
>


