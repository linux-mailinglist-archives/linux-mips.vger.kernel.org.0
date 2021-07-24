Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041EA3D485E
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 17:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhGXO6D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 10:58:03 -0400
Received: from out29-1.mail.aliyun.com ([115.124.29.1]:45713 "EHLO
        out29-1.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhGXO6C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 10:58:02 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07438685|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.253308-0.00639627-0.740296;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.Kq2NXC2_1627141111;
Received: from 192.168.88.130(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Kq2NXC2_1627141111)
          by smtp.aliyun-inc.com(10.147.40.7);
          Sat, 24 Jul 2021 23:38:32 +0800
Subject: Re: [PATCH] clocksource: Ingenic: Improve the code.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
References: <1627121407-131028-1-git-send-email-zhouyanjie@wanyeetech.com>
 <OQZQWQ.MUGEDOGBXJW12@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <ac16a2ef-2532-acb0-7599-7d6a4ac1b95f@wanyeetech.com>
Date:   Sat, 24 Jul 2021 23:38:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <OQZQWQ.MUGEDOGBXJW12@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/7/24 下午7:54, Paul Cercueil wrote:
> Hi Zhou,
>
> Thanks! I actually had a similar patch locally that I was eventually 
> going to send.
>
>
> Le sam., juil. 24 2021 at 18:10:07 +0800, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Use "FIELD_GET()" and "FIELD_PREP()" to simplify the code.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>  drivers/clocksource/ingenic-sysost.c | 11 +++++------
>>  1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/clocksource/ingenic-sysost.c 
>> b/drivers/clocksource/ingenic-sysost.c
>> index a129840..1fbea59 100644
>> --- a/drivers/clocksource/ingenic-sysost.c
>> +++ b/drivers/clocksource/ingenic-sysost.c
>> @@ -4,6 +4,7 @@
>>   * Copyright (c) 2020 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>   */
>>
>> +#include <linux/bitfield.h>
>>  #include <linux/bitops.h>
>>  #include <linux/clk.h>
>>  #include <linux/clk-provider.h>
>> @@ -34,8 +35,6 @@
>>  /* bits within the OSTCCR register */
>>  #define OSTCCR_PRESCALE1_MASK    0x3
>>  #define OSTCCR_PRESCALE2_MASK    0xc
>> -#define OSTCCR_PRESCALE1_LSB    0
>> -#define OSTCCR_PRESCALE2_LSB    2
>>
>>  /* bits within the OSTCR register */
>>  #define OSTCR_OST1CLR            BIT(0)
>> @@ -98,7 +97,7 @@ static unsigned long 
>> ingenic_ost_percpu_timer_recalc_rate(struct clk_hw *hw,
>>
>>      prescale = readl(ost_clk->ost->base + info->ostccr_reg);
>>
>> -    prescale = (prescale & OSTCCR_PRESCALE1_MASK) >> 
>> OSTCCR_PRESCALE1_LSB;
>> +    prescale = FIELD_GET(OSTCCR_PRESCALE1_MASK, prescale);
>>
>>      return parent_rate >> (prescale * 2);
>>  }
>> @@ -112,7 +111,7 @@ static unsigned long 
>> ingenic_ost_global_timer_recalc_rate(struct clk_hw *hw,
>>
>>      prescale = readl(ost_clk->ost->base + info->ostccr_reg);
>>
>> -    prescale = (prescale & OSTCCR_PRESCALE2_MASK) >> 
>> OSTCCR_PRESCALE2_LSB;
>> +    prescale = FIELD_GET(OSTCCR_PRESCALE2_MASK, prescale);
>>
>>      return parent_rate >> (prescale * 2);
>>  }
>> @@ -151,7 +150,7 @@ static int 
>> ingenic_ost_percpu_timer_set_rate(struct clk_hw *hw, unsigned long re
>>      int val;
>>
>>      val = readl(ost_clk->ost->base + info->ostccr_reg);
>> -    val = (val & ~OSTCCR_PRESCALE1_MASK) | (prescale << 
>> OSTCCR_PRESCALE1_LSB);
>> +    val = (val & ~OSTCCR_PRESCALE1_MASK) | 
>> FIELD_PREP(OSTCCR_PRESCALE1_MASK, prescale);
>
> Just one nitpick, I'd prefer this:
>
> val ~= &OSTCCR_PRESCALE1_MASK;
> val |= FIELD_PREP(OSTCCR_PRESCALE1_MASK, prescale);


Sure, I will change it in the next version.


>
>>      writel(val, ost_clk->ost->base + info->ostccr_reg);
>>
>>      return 0;
>> @@ -166,7 +165,7 @@ static int 
>> ingenic_ost_global_timer_set_rate(struct clk_hw *hw, unsigned long re
>>      int val;
>>
>>      val = readl(ost_clk->ost->base + info->ostccr_reg);
>> -    val = (val & ~OSTCCR_PRESCALE2_MASK) | (prescale << 
>> OSTCCR_PRESCALE2_LSB);
>> +    val = (val & ~OSTCCR_PRESCALE2_MASK) | 
>> FIELD_PREP(OSTCCR_PRESCALE2_MASK, prescale);
>
> Same here.


Sure.


Thanks and  best regards!


>
> Cheers,
> -Paul
>
>>      writel(val, ost_clk->ost->base + info->ostccr_reg);
>>
>>      return 0;
>> -- 
>> 2.7.4
>>
>
