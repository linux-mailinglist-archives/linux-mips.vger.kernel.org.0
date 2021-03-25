Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 314A1348A52
	for <lists+linux-mips@lfdr.de>; Thu, 25 Mar 2021 08:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhCYHnu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 03:43:50 -0400
Received: from out28-53.mail.aliyun.com ([115.124.28.53]:55698 "EHLO
        out28-53.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhCYHn0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 03:43:26 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07471792|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.153235-0.00715125-0.839614;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Jq-fhNh_1616658201;
Received: from 192.168.88.129(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Jq-fhNh_1616658201)
          by smtp.aliyun-inc.com(10.147.43.230);
          Thu, 25 Mar 2021 15:43:23 +0800
Subject: Re: [PATCH v3 05/10] dt-bindings: pinctrl: Add bindings for new
 Ingenic SoCs.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1615975084-68203-6-git-send-email-zhouyanjie@wanyeetech.com>
 <S1UDQQ.OKUWFQAJJIVA2@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <89818aa4-c3f8-9aea-1caf-6280e7842b91@wanyeetech.com>
Date:   Thu, 25 Mar 2021 15:43:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <S1UDQQ.OKUWFQAJJIVA2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2021/3/23 上午2:01, Paul Cercueil wrote:
>
>
> Le mer. 17 mars 2021 à 17:57, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add the pinctrl bindings for the JZ4730 SoC, the JZ4750 SoC,
>> the JZ4755 SoC, the JZ4775 SoC and the X2000 SoC from Ingenic.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v2:
>>     New patch.
>>
>>     v2->v3:
>>     No change.
>>
>>  .../bindings/pinctrl/ingenic,pinctrl.yaml          | 23 
>> ++++++++++++++++++----
>>  1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml 
>> b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
>> index 44c04d1..60604fc 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
>> @@ -17,10 +17,12 @@ description: >
>>    naming scheme "PxN" where x is a character identifying the GPIO 
>> port with
>>    which the pin is associated and N is an integer from 0 to 31 
>> identifying the
>>    pin within that GPIO port. For example PA0 is the first pin in 
>> GPIO port A,
>> -  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000 and 
>> the X1830
>> -  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The 
>> JZ4760, the
>> -  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a total 
>> of 192
>> -  pins.
>> +  and PB31 is the last pin in GPIO port B. The JZ4730, the JZ4740, 
>> the X1000
>> +  and the X1830 contains 4 GPIO ports, PA to PD, for a total of 128 
>> pins. The
>> +  X2000 contains 5 GPIO ports, PA to PE, for a total of 160 pins. 
>> The JZ4750,
>> +  the JZ4755 the JZ4760, the JZ4770 and the JZ4780 contains 6 GPIO 
>> ports, PA
>> +  to PF, for a total of 192 pins. The JZ4775 contains 7 GPIO ports, 
>> PA to PG,
>> +  for a total of 224 pins.
>
> While we're at it, the JZ4725B has also 4 GPIO ports.
>

OK, I will add it.


>>
>>  maintainers:
>>    - Paul Cercueil <paul@crapouillou.net>
>> @@ -32,20 +34,28 @@ properties:
>>    compatible:
>>      oneOf:
>>        - enum:
>> +          - ingenic,jz4730-pinctrl
>>            - ingenic,jz4740-pinctrl
>>            - ingenic,jz4725b-pinctrl
>> +          - ingenic,jz4750-pinctrl
>> +          - ingenic,jz4755-pinctrl
>>            - ingenic,jz4760-pinctrl
>>            - ingenic,jz4770-pinctrl
>> +          - ingenic,jz4775-pinctrl
>>            - ingenic,jz4780-pinctrl
>>            - ingenic,x1000-pinctrl
>>            - ingenic,x1500-pinctrl
>>            - ingenic,x1830-pinctrl
>> +          - ingenic,x2000-pinctrl
>>        - items:
>>            - const: ingenic,jz4760b-pinctrl
>>            - const: ingenic,jz4760-pinctrl
>>        - items:
>>            - const: ingenic,x1000e-pinctrl
>>            - const: ingenic,x1000-pinctrl
>> +      - items:
>> +          - const: ingenic,x2000e-pinctrl
>> +          - const: ingenic,x2000-pinctrl
>>
>>    reg:
>>      maxItems: 1
>> @@ -62,14 +72,19 @@ patternProperties:
>>      properties:
>>        compatible:
>>          enum:
>> +          - ingenic,jz4730-gpio
>>            - ingenic,jz4740-gpio
>>            - ingenic,jz4725b-gpio
>> +          - ingenic,jz4750-gpio
>> +          - ingenic,jz4755-gpio
>>            - ingenic,jz4760-gpio
>>            - ingenic,jz4770-gpio
>> +          - ingenic,jz4775-gpio
>>            - ingenic,jz4780-gpio
>>            - ingenic,x1000-gpio
>>            - ingenic,x1500-gpio
>>            - ingenic,x1830-gpio
>> +          - ingenic,x2000-gpio
>>
>>        reg:
>>          items:
>> -- 
>> 2.7.4
>>
>
