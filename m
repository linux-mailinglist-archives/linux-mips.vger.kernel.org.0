Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C7EDD7A3
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2019 11:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbfJSJNH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Oct 2019 05:13:07 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25408 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728576AbfJSJNH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Oct 2019 05:13:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1571476359; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=m3d0u3qP4oNi3v+fMNa6jESURQm/++vNAIq0yiEVB+2rkYgM6/OqvpeuRQAzkY36K5egtZgXHlEjBkwgR3Y8Dnl+bkg5q4AwpvPmrtojiS2b+8JlUvkv3/OibF5HJaUfXOgwKhDL8DGnAmJlb7kyJCDpbzPhu20VfAu7V6ICq5o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1571476359; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=c1LHMbjebCq/p3Q155rI1KuvyuVAzusZr5to+xYs/3Y=; 
        b=QrXmWfFLUs4BridPXlNzFzLXNd9VvhFO3XJF3lq61ZPTlpTuGfO6IIcyEShePM+2MQqK19yvcl/Ptu5BtsJURziemN3dkDooQ+I1Q6SBBdVC4Jw1yE4Ja02jpk9JN7xIGSXK6grdHVPj5Es90Q0XFAIqPntC4Pomnqsw+1mFDvE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=cELFXnRKTQMsh/d7U6m9uSQj1zZL1r3EQ0Bj+IQ+NQ54Fq//zg5tJTdDx0T1wR0ANa02B0X2CnE7
    z3t5UwGUy5kWt4cH1USKiRjtUOlMyA4yf/DyIupa2PPLskAKqUqA  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1571476359;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=3710; bh=c1LHMbjebCq/p3Q155rI1KuvyuVAzusZr5to+xYs/3Y=;
        b=lBOY46KTxJ0ked4LpLHBvpFqWSIZ+FXjk63gMf8WxKuj+tif6kmawyqa8jZmKjQd
        OTRYBhw0IwRUgCrNN6krcJBQV4PD0Hk0NXu4zWBkLUNxWOJaDoF7+X+pRK9kxTsEksc
        YSOxHMU0FaJMzpzULwnvU8pshbi32oJOUXDBe8MU=
Received: from [192.168.10.218] (171.221.113.199 [171.221.113.199]) by mx.zohomail.com
        with SMTPS id 1571476358155716.0469073276595; Sat, 19 Oct 2019 02:12:38 -0700 (PDT)
Subject: Re: [PATCH 6/6 v2] MMC: JZ4740: Add support for LPM.
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
 <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
 <1570857203-49192-7-git-send-email-zhouyanjie@zoho.com>
 <CAPDyKFo9juNmf6hrcBjzOprS6GwzAPBq8y3ReGu=ry+MdxT9Bg@mail.gmail.com>
Cc:     linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Mark Rutland <mark.rutland@arm.com>, syq@debian.org,
        Linus Walleij <linus.walleij@linaro.org>, armijn@tjaldur.nl,
        Thomas Gleixner <tglx@linutronix.de>,
        YueHaibing <yuehaibing@huawei.com>,
        Mathieu Malaterre <malat@debian.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DA9EE2F.4030603@zoho.com>
Date:   Sat, 19 Oct 2019 00:54:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFo9juNmf6hrcBjzOprS6GwzAPBq8y3ReGu=ry+MdxT9Bg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Uffe,

On 2019=E5=B9=B410=E6=9C=8818=E6=97=A5 16:52, Ulf Hansson wrote:
> On Sat, 12 Oct 2019 at 07:19, Zhou Yanjie <zhouyanjie@zoho.com> wrote:
>> add support for low power mode of Ingenic's MMC/SD Controller.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> I couldn't find a proper coverletter for the series, please provide
> that next time as it really helps review.

I'm sorry, maybe some problems with my git send-email cause cover
later not to be sent out, next time I will pay attention to this problem.

> Additionally, it seems like
> you forgot to change the prefix of the patches to "mmc: jz4740" (or at
> least you chosed upper case letters), but I will take care of that
> this time. So, I have applied the series for next, thanks!

I'm very sorry, I have misunderstood, before I thought jz4740 as a proper
noun needs to be capitalized, I will pay attention to this next time.

>
> I also have a general question. Should we perhaps rename the driver
> from jz4740_mmc.c to ingenic.c (and the file for the DT bindings, the
> Kconfig, etc), as that seems like a more appropriate name? No?

I am very much in favor of this proposal. Now jz4740_mmc.c is not only used
for the JZ4740 processor, it is also used for JZ4725, JZ4760, JZ4770, JZ478=
0
and X1000, and now Ingenic's processor is no longer named after JZ47xx,
it is divided into three product lines: M, T, and X. It is easy to cause=20
some
misunderstandings by using jz4740_mmc.c. At the same time, I think that
some register names also need to be adjusted. For example, the STLPPL
register name has only appeared in JZ4730 and JZ4740, and this register
in all subsequent processors is called CTRL. This time I was confused by
the STLPPL when I added drivers for the JZ4760's and X1000's LPM.

I also can send a patch to rename it if you need.

Best regards!

>
> Kind regards
> Uffe
>
>
>> ---
>>   drivers/mmc/host/jz4740_mmc.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc=
.c
>> index 44a04fe..4cbe7fb 100644
>> --- a/drivers/mmc/host/jz4740_mmc.c
>> +++ b/drivers/mmc/host/jz4740_mmc.c
>> @@ -43,6 +43,7 @@
>>   #define JZ_REG_MMC_RESP_FIFO   0x34
>>   #define JZ_REG_MMC_RXFIFO      0x38
>>   #define JZ_REG_MMC_TXFIFO      0x3C
>> +#define JZ_REG_MMC_LPM         0x40
>>   #define JZ_REG_MMC_DMAC                0x44
>>
>>   #define JZ_MMC_STRPCL_EXIT_MULTIPLE BIT(7)
>> @@ -102,6 +103,12 @@
>>   #define JZ_MMC_DMAC_DMA_SEL BIT(1)
>>   #define JZ_MMC_DMAC_DMA_EN BIT(0)
>>
>> +#define        JZ_MMC_LPM_DRV_RISING BIT(31)
>> +#define        JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY BIT(31)
>> +#define        JZ_MMC_LPM_DRV_RISING_1NS_DLY BIT(30)
>> +#define        JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHASE_DLY BIT(29)
>> +#define        JZ_MMC_LPM_LOW_POWER_MODE_EN BIT(0)
>> +
>>   #define JZ_MMC_CLK_RATE 24000000
>>
>>   enum jz4740_mmc_version {
>> @@ -860,6 +867,22 @@ static int jz4740_mmc_set_clock_rate(struct jz4740_=
mmc_host *host, int rate)
>>          }
>>
>>          writew(div, host->base + JZ_REG_MMC_CLKRT);
>> +
>> +       if (real_rate > 25000000) {
>> +               if (host->version >=3D JZ_MMC_X1000) {
>> +                       writel(JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY |
>> +                                  JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHA=
SE_DLY |
>> +                                  JZ_MMC_LPM_LOW_POWER_MODE_EN,
>> +                                  host->base + JZ_REG_MMC_LPM);
>> +               } else if (host->version >=3D JZ_MMC_JZ4760) {
>> +                       writel(JZ_MMC_LPM_DRV_RISING |
>> +                                  JZ_MMC_LPM_LOW_POWER_MODE_EN,
>> +                                  host->base + JZ_REG_MMC_LPM);
>> +               } else if (host->version >=3D JZ_MMC_JZ4725B)
>> +                       writel(JZ_MMC_LPM_LOW_POWER_MODE_EN,
>> +                                  host->base + JZ_REG_MMC_LPM);
>> +       }
>> +
>>          return real_rate;
>>   }
>>
>> --
>> 2.7.4
>>
>>



