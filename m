Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C769B3BA02E
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jul 2021 14:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhGBMIb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jul 2021 08:08:31 -0400
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:52946 "EHLO
        out28-74.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbhGBMHV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jul 2021 08:07:21 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07438208|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.257215-0.00260397-0.740181;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047207;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.KbD.WuZ_1625227484;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KbD.WuZ_1625227484)
          by smtp.aliyun-inc.com(10.147.41.231);
          Fri, 02 Jul 2021 20:04:45 +0800
Subject: Re: [PATCH v4 5/5] MIPS: CI20: Add second percpu timer for SMP.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
References: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1624688321-69131-6-git-send-email-zhouyanjie@wanyeetech.com>
 <84LIVQ.EPXA43L4WLUK@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <3b6ffdde-2dcc-4883-f66b-9ca46db636e2@wanyeetech.com>
Date:   Fri, 2 Jul 2021 20:04:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <84LIVQ.EPXA43L4WLUK@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2021/6/30 下午8:24, Paul Cercueil wrote:
> Hi Zhou,
>
> Le sam., juin 26 2021 at 14:18:41 +0800, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> 1.Add a new TCU channel as the percpu timer of core1, this is to
>>   prepare for the subsequent SMP support. The newly added channel
>>   will not adversely affect the current single-core state.
>> 2.Adjust the position of TCU node to make it consistent with the
>>   order in jz4780.dtsi file.
>>
>> Tested-by: Nikolaus Schaller <hns@goldelico.com> # on CI20
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>
> Again, you should avoid moving nodes like that.


Oops, sorry, forgot to fix it, I will be more careful next time.


>
> Not sure it's worth asking for a v5, so:
> Acked-by: Paul Cercueil <paul@crapouillou.net>
>

Thanks!


> Cheers,
> -Paul
>
>> ---
>>
>> Notes:
>>     v2:
>>     New patch.
>>
>>     v2->v3:
>>     No change.
>>
>>     v3->v4:
>>     Improve TCU related notes.
>>
>>  arch/mips/boot/dts/ingenic/ci20.dts | 24 ++++++++++++++----------
>>  1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts 
>> b/arch/mips/boot/dts/ingenic/ci20.dts
>> index 3a4eaf1..61c153b 100644
>> --- a/arch/mips/boot/dts/ingenic/ci20.dts
>> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>> @@ -118,6 +118,20 @@
>>      assigned-clock-rates = <48000000>;
>>  };
>>
>> +&tcu {
>> +    /*
>> +     * 750 kHz for the system timers and clocksource,
>> +     * use channel #0 and #1 for the per cpu system timers,
>> +     * and use channel #2 for the clocksource.
>> +     *
>> +     * 3000 kHz for the OST timer to provide a higher
>> +     * precision clocksource.
>> +     */
>> +    assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
>> +                      <&tcu TCU_CLK_TIMER2>, <&tcu TCU_CLK_OST>;
>> +    assigned-clock-rates = <750000>, <750000>, <750000>, <3000000>;
>> +};
>> +
>>  &mmc0 {
>>      status = "okay";
>>
>> @@ -522,13 +536,3 @@
>>          bias-disable;
>>      };
>>  };
>> -
>> -&tcu {
>> -    /*
>> -     * 750 kHz for the system timer and clocksource,
>> -     * use channel #0 for the system timer, #1 for the clocksource.
>> -     */
>> -    assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
>> -                      <&tcu TCU_CLK_OST>;
>> -    assigned-clock-rates = <750000>, <750000>, <3000000>;
>> -};
>> -- 
>> 2.7.4
>>
>
