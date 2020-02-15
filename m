Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C2B15FEC2
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2020 15:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgBOOGf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Feb 2020 09:06:35 -0500
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:53781 "EHLO
        out28-2.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbgBOOGe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Feb 2020 09:06:34 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07568603|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.224951-0.00677463-0.768274;DS=CONTINUE|ham_system_inform|0.380064-0.00362332-0.616312;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03311;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.GoPpsvG_1581775516;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GoPpsvG_1581775516)
          by smtp.aliyun-inc.com(10.147.40.200);
          Sat, 15 Feb 2020 22:05:18 +0800
Subject: Re: [PATCH v4 5/6] MIPS: CI20: Modify DTS to support high resolution
 timer for SMP.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1581703360-112557-7-git-send-email-zhouyanjie@wanyeetech.com>
 <1581705458.3.2@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, allison@lohutok.net,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mips-creator-ci20-dev@googlegroups.com,
        1326991897@qq.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E47FA9C.504@wanyeetech.com>
Date:   Sat, 15 Feb 2020 22:05:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1581705458.3.2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2020年02月15日 02:37, Paul Cercueil wrote:
> Hi Zhou,
>
> I think you can move this patch before the clocksource one - it will 
> work with the old clocksource code and in generally it's a good idea 
> to ensure (if possible) that you can git-bisect without ending up with 
> a broken kernel.

OK, I will do it in v5.

>
> -Paul
>
>
> Le sam., févr. 15, 2020 at 02:02, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Modify DTS, change tcu channel from 2 to 3, channel #0 and #1 for
>> per core local timer, #2 for clocksource.
>>
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Tested-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v1->v2:
>>     No change.
>>
>>     v2->v3:
>>     No change.
>>
>>     v3->v4:
>>     Rebase on top of kernel 5.6-rc1.
>>
>>  arch/mips/boot/dts/ingenic/ci20.dts | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts 
>> b/arch/mips/boot/dts/ingenic/ci20.dts
>> index 37b9316..98c4c42 100644
>> --- a/arch/mips/boot/dts/ingenic/ci20.dts
>> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>> @@ -456,6 +456,13 @@
>>
>>  &tcu {
>>      /* 3 MHz for the system timer and clocksource */
>> -    assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>;
>> -    assigned-clock-rates = <3000000>, <3000000>;
>> +    assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
>> +                      <&tcu TCU_CLK_TIMER2>;
>> +    assigned-clock-rates = <3000000>, <3000000>, <750000>;
>> +
>> +    /*
>> +     * Use channel #0 and #1 for the per core system timer,
>> +     * and use channel #2 for the clocksource.
>> +     */
>> +    ingenic,pwm-channels-mask = <0xF8>;
>>  };
>> -- 
>> 2.7.4
>>
>

