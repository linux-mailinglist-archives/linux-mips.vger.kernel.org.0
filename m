Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895B4339CBF
	for <lists+linux-mips@lfdr.de>; Sat, 13 Mar 2021 09:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbhCMIHi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Mar 2021 03:07:38 -0500
Received: from out28-5.mail.aliyun.com ([115.124.28.5]:43082 "EHLO
        out28-5.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhCMIHJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Mar 2021 03:07:09 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07466728|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.112501-0.000359083-0.88714;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047187;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.JkQU1yY_1615622823;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JkQU1yY_1615622823)
          by smtp.aliyun-inc.com(10.147.41.137);
          Sat, 13 Mar 2021 16:07:04 +0800
Subject: Re: [PATCH v2 1/6] pinctrl: Ingenic: Add missing pins to the JZ4770
 MAC MII group.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
References: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1615476112-113101-2-git-send-email-zhouyanjie@wanyeetech.com>
 <HOXUPQ.U0CJV6YXUOYX2@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <f9b18c6d-1d56-7ad3-a7e4-4a52d92b4671@wanyeetech.com>
Date:   Sat, 13 Mar 2021 16:07:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <HOXUPQ.U0CJV6YXUOYX2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/3/12 下午9:05, Paul Cercueil wrote:
> Hi,
>
> Le jeu. 11 mars 2021 à 23:21, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> The MII group of JZ4770's MAC should have 7 pins, add missing
>> pins to the MII group.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>
> No Fixes: tag?
> And if the bug wasn't introduced in 5.12-rc1 you'll need to Cc 
> linux-stable as well.
>

Sure, I will add it.


>> ---
>>
>> Notes:
>>     v2:
>>     New patch.
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
>
> Maybe list them in order?
>

I ordered them in the order of rxd3, rxd2, txd3, txd2, rxclk, crs, col.


> And are you sure that's the whole list? The PM (section 12.2 in 
> jz4770_pm_part3.pdf) lists more pins.
>

Here is the way to imitate the MMC. Use only RMII group when using RMII 
function, use both RMII and MII groups when using MII function. If you 
think it is necessary, I can redefine the MII group.


Thanks and best regards!


> Cheers,
> -Paul
>
>> +};
>>
>>  static const struct group_desc jz4770_groups[] = {
>>      INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data, 0),
>> -- 
>> 2.7.4
>>
>
