Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9608348A3C
	for <lists+linux-mips@lfdr.de>; Thu, 25 Mar 2021 08:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhCYHhx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 03:37:53 -0400
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:46653 "EHLO
        out28-3.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhCYHhg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 03:37:36 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07458173|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.009698-0.000320705-0.989981;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Jq-mq02_1616657847;
Received: from 192.168.88.129(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Jq-mq02_1616657847)
          by smtp.aliyun-inc.com(10.147.41.199);
          Thu, 25 Mar 2021 15:37:28 +0800
Subject: Re: [PATCH v3 01/10] pinctrl: Ingenic: Add missing pins to the JZ4770
 MAC MII group.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1615975084-68203-2-git-send-email-zhouyanjie@wanyeetech.com>
 <JOTDQQ.MOZVXC128CJA2@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <19403957-c1d4-b10d-26b8-bfb6dc6705b8@wanyeetech.com>
Date:   Thu, 25 Mar 2021 15:37:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <JOTDQQ.MOZVXC128CJA2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/3/23 上午1:53, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le mer. 17 mars 2021 à 17:57, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> The MII group of JZ4770's MAC should have 7 pins, add missing
>> pins to the MII group.
>>
>> Fixes: 5de1a73e78ed ("Pinctrl: Ingenic: Add missing parts for JZ4770 
>> and JZ4780.")
>
> This fixes a commit that was introduced in an older kernel (than the 
> one in -rc phase). Therefore you need to Cc linux-stable. Like this:
>
> Cc: <stable@vger.kernel.org> # v5.0
>

Sure, I will add it in the next version.


>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>
> With that said:
>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>
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
>>     Add fixes tag.
>>
>>  drivers/pinctrl/pinctrl-ingenic.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
>> b/drivers/pinctrl/pinctrl-ingenic.c
>> index f274612..05dfa0a 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -667,7 +667,9 @@ static int jz4770_pwm_pwm7_pins[] = { 0x6b, };
>>  static int jz4770_mac_rmii_pins[] = {
>>      0xa9, 0xab, 0xaa, 0xac, 0xa5, 0xa4, 0xad, 0xae, 0xa6, 0xa8,
>>  };
>> -static int jz4770_mac_mii_pins[] = { 0xa7, 0xaf, };
>> +static int jz4770_mac_mii_pins[] = {
>> +    0x7b, 0x7a, 0x7d, 0x7c, 0xa7, 0x24, 0xaf,
>> +};
>>
>>  static const struct group_desc jz4770_groups[] = {
>>      INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data, 0),
>> -- 
>> 2.7.4
>>
>
