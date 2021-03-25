Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80702348A45
	for <lists+linux-mips@lfdr.de>; Thu, 25 Mar 2021 08:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhCYHjA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 03:39:00 -0400
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:35317 "EHLO
        out28-170.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCYHic (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 03:38:32 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08722985|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.129203-0.000181781-0.870616;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047212;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Jq-HMsz_1616657908;
Received: from 192.168.88.129(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Jq-HMsz_1616657908)
          by smtp.aliyun-inc.com(10.147.40.44);
          Thu, 25 Mar 2021 15:38:29 +0800
Subject: Re: [PATCH v3 02/10] pinctrl: Ingenic: Add support for read the pin
 configuration of X1830.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1615975084-68203-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YXTDQQ.OYIQVLSUOAPB3@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <a278847d-da2d-eeec-98d0-4bbca0b90cee@wanyeetech.com>
Date:   Thu, 25 Mar 2021 15:38:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <YXTDQQ.OYIQVLSUOAPB3@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 2021/3/23 上午1:58, Paul Cercueil wrote:
>
>
> Le mer. 17 mars 2021 à 17:57, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add X1830 support in "ingenic_pinconf_get()", so that it can read the
>> configuration of X1830 SoC correctly.
>>
>> Fixes: d7da2a1e4e08 ("pinctrl: Ingenic: Add pinctrl driver for X1830.")
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v2:
>>     New patch.
>>
>>     v2->v3:
>>     1.Add fixes tag.
>>     2.Adjust the code, simplify the ingenic_pinconf_get() function.
>>
>>  drivers/pinctrl/pinctrl-ingenic.c | 38 
>> ++++++++++++++++++++++++++++++--------
>>  1 file changed, 30 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
>> b/drivers/pinctrl/pinctrl-ingenic.c
>> index 05dfa0a..1d43b98 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -2109,26 +2109,48 @@ static int ingenic_pinconf_get(struct 
>> pinctrl_dev *pctldev,
>>      enum pin_config_param param = pinconf_to_config_param(*config);
>>      unsigned int idx = pin % PINS_PER_GPIO_CHIP;
>>      unsigned int offt = pin / PINS_PER_GPIO_CHIP;
>> -    bool pull;
>> +    unsigned int bias;
>> +    bool pull, pullup, pulldown;
>>
>> -    if (jzpc->info->version >= ID_JZ4770)
>> -        pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
>> -    else
>> -        pull = !ingenic_get_pin_config(jzpc, pin, 
>> JZ4740_GPIO_PULL_DIS);
>> +    if (jzpc->info->version >= ID_X1830) {
>> +        unsigned int half = PINS_PER_GPIO_CHIP / 2;
>> +        unsigned int idxh = pin % half * 2;
>
> I had to look up operator precedence in C, '*' and '%' have the same 
> priority so this reads left-to-right.
>
> I'd suggest adding parentheses around the '%' to make it more obvious.
>

Sure.


> With that:
>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>
> Cheers,
> -Paul
>
>> +
>> +        if (idx < half)
>> +            regmap_read(jzpc->map, offt * jzpc->info->reg_offset +
>> +                    X1830_GPIO_PEL, &bias);
>> +        else
>> +            regmap_read(jzpc->map, offt * jzpc->info->reg_offset +
>> +                    X1830_GPIO_PEH, &bias);
>> +
>> +        bias = (bias >> idxh) & (GPIO_PULL_UP | GPIO_PULL_DOWN);
>> +
>> +        pullup = (bias == GPIO_PULL_UP) && 
>> (jzpc->info->pull_ups[offt] & BIT(idx));
>> +        pulldown = (bias == GPIO_PULL_DOWN) && 
>> (jzpc->info->pull_downs[offt] & BIT(idx));
>> +
>> +    } else {
>> +        if (jzpc->info->version >= ID_JZ4770)
>> +            pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
>> +        else
>> +            pull = !ingenic_get_pin_config(jzpc, pin, 
>> JZ4740_GPIO_PULL_DIS);
>> +
>> +        pullup = pull && (jzpc->info->pull_ups[offt] & BIT(idx));
>> +        pulldown = pull && (jzpc->info->pull_downs[offt] & BIT(idx));
>> +    }
>>
>>      switch (param) {
>>      case PIN_CONFIG_BIAS_DISABLE:
>> -        if (pull)
>> +        if (pullup || pulldown)
>>              return -EINVAL;
>>          break;
>>
>>      case PIN_CONFIG_BIAS_PULL_UP:
>> -        if (!pull || !(jzpc->info->pull_ups[offt] & BIT(idx)))
>> +        if (!pullup)
>>              return -EINVAL;
>>          break;
>>
>>      case PIN_CONFIG_BIAS_PULL_DOWN:
>> -        if (!pull || !(jzpc->info->pull_downs[offt] & BIT(idx)))
>> +        if (!pulldown)
>>              return -EINVAL;
>>          break;
>>
>> -- 
>> 2.7.4
>>
>
