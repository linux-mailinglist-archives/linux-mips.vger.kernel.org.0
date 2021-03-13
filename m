Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A6B339CC5
	for <lists+linux-mips@lfdr.de>; Sat, 13 Mar 2021 09:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbhCMIHj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Mar 2021 03:07:39 -0500
Received: from out28-5.mail.aliyun.com ([115.124.28.5]:44549 "EHLO
        out28-5.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhCMIHU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Mar 2021 03:07:20 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07513224|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0594387-0.000246833-0.940315;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047211;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.JkQuWRa_1615622835;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JkQuWRa_1615622835)
          by smtp.aliyun-inc.com(10.147.42.241);
          Sat, 13 Mar 2021 16:07:16 +0800
Subject: Re: [PATCH v2 2/6] pinctrl: Ingenic: Add support for read the pin
 configuration of X1830.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
References: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1615476112-113101-3-git-send-email-zhouyanjie@wanyeetech.com>
 <XWYUPQ.9202CFTWWMJ6@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <aad601fb-3266-eb4d-3bfd-11bc35e78ad7@wanyeetech.com>
Date:   Sat, 13 Mar 2021 16:07:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <XWYUPQ.9202CFTWWMJ6@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/3/12 下午9:31, Paul Cercueil wrote:
> Hi Zhou,
>
> Le jeu. 11 mars 2021 à 23:21, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add X1830 support in "ingenic_pinconf_get()", so that it can read the
>> configuration of X1830 SoC correctly.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>
> This is a fix, so it needs a Fixes: tag, and you need to Cc linux-stable.
>

Sure.


>> ---
>>
>> Notes:
>>     v2:
>>     New patch.
>>
>>  drivers/pinctrl/pinctrl-ingenic.c | 76 
>> +++++++++++++++++++++++++++++----------
>>  1 file changed, 57 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
>> b/drivers/pinctrl/pinctrl-ingenic.c
>> index 05dfa0a..0a88aab 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -2109,31 +2109,69 @@ static int ingenic_pinconf_get(struct 
>> pinctrl_dev *pctldev,
>>      enum pin_config_param param = pinconf_to_config_param(*config);
>>      unsigned int idx = pin % PINS_PER_GPIO_CHIP;
>>      unsigned int offt = pin / PINS_PER_GPIO_CHIP;
>> +    unsigned int bias;
>>      bool pull;
>>
>> -    if (jzpc->info->version >= ID_JZ4770)
>> -        pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
>> -    else
>> -        pull = !ingenic_get_pin_config(jzpc, pin, 
>> JZ4740_GPIO_PULL_DIS);
>> +    if (jzpc->info->version >= ID_X1830) {
>> +        unsigned int half = PINS_PER_GPIO_CHIP / 2;
>> +        unsigned int idxh = pin % half * 2;
>>
>> -    switch (param) {
>> -    case PIN_CONFIG_BIAS_DISABLE:
>> -        if (pull)
>> -            return -EINVAL;
>> -        break;
>> +        if (idx < half)
>> +            regmap_read(jzpc->map, offt * jzpc->info->reg_offset +
>> +                    X1830_GPIO_PEL, &bias);
>> +        else
>> +            regmap_read(jzpc->map, offt * jzpc->info->reg_offset +
>> +                    X1830_GPIO_PEH, &bias);
>>
>> -    case PIN_CONFIG_BIAS_PULL_UP:
>> -        if (!pull || !(jzpc->info->pull_ups[offt] & BIT(idx)))
>> -            return -EINVAL;
>> -        break;
>> +        bias = (bias >> idxh) & 3;
>
> You can do:
>
> u32 mask = GENMASK(idxh + 1, idxh);
>
> bias = FIELD_GET(mask, bias);
>
> (macros in <linux/bitfield.h>)
>

Sure.


>>
>> -    case PIN_CONFIG_BIAS_PULL_DOWN:
>> -        if (!pull || !(jzpc->info->pull_downs[offt] & BIT(idx)))
>> -            return -EINVAL;
>> -        break;
>> +        switch (param) {
>> +        case PIN_CONFIG_BIAS_DISABLE:
>> +            if (bias)
>> +                return -EINVAL;
>> +            break;
>>
>> -    default:
>> -        return -ENOTSUPP;
>> +        case PIN_CONFIG_BIAS_PULL_UP:
>> +            if ((bias != PIN_CONFIG_BIAS_PULL_UP) ||
>> +                    !(jzpc->info->pull_ups[offt] & BIT(idx)))
>
> "bias" is a 2-bit value (because of the & 3 mask), and 
> PIN_CONFIG_BIAS_PULL_UP == 5.
>
> So this clearly won't work. You are comparing hardware values with 
> public API enums.


OK, I will fix it in the next version.


>
>> +                return -EINVAL;
>> +            break;
>> +
>> +        case PIN_CONFIG_BIAS_PULL_DOWN:
>> +            if ((bias != PIN_CONFIG_BIAS_PULL_DOWN) ||
>> +                    !(jzpc->info->pull_downs[offt] & BIT(idx)))
>> +                return -EINVAL;
>> +            break;
>> +
>> +        default:
>> +            return -ENOTSUPP;
>> +        }
>> +
>> +    } else {
>> +        if (jzpc->info->version >= ID_JZ4770)
>> +            pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
>> +        else
>> +            pull = !ingenic_get_pin_config(jzpc, pin, 
>> JZ4740_GPIO_PULL_DIS);
>
> I think you can keep the switch outside the if/else block, if you use 
> pullup/pulldown variables.
>
> These can be initialized (in the non-X1830 case) to:
>
> pullup = pull && (jzpc->info->pull_ups[offt] & BIT(idx));
> pulldown = pull && (jzpc->info->pull_downs[offt] & BIT(idx));
>
> In the X1830 case you'd initialize these variables from 'bias'.


Sure, I will do this in the next version.


>
>> +
>> +        switch (param) {
>> +        case PIN_CONFIG_BIAS_DISABLE:
>> +            if (pull)
>
> Here would change to if (pullup || pulldown)
>

OK.


>> +                return -EINVAL;
>> +            break;
>> +
>> +        case PIN_CONFIG_BIAS_PULL_UP:
>> +            if (!pull || !(jzpc->info->pull_ups[offt] & BIT(idx)))
>
> if (!pullup)
>

Sure.


>> +                return -EINVAL;
>> +            break;
>> +
>> +        case PIN_CONFIG_BIAS_PULL_DOWN:
>> +            if (!pull || !(jzpc->info->pull_downs[offt] & BIT(idx)))
>
> if (!pulldown)
>

Sure.


Thanks and best regards!


> Cheers,
> -Paul
>
>> +                return -EINVAL;
>> +            break;
>> +
>> +        default:
>> +            return -ENOTSUPP;
>> +        }
>>      }
>>
>>      *config = pinconf_to_config_packed(param, 1);
>> -- 
>> 2.7.4
>>
>
