Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F27C3DB5FF
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jul 2021 11:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238298AbhG3Jdc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jul 2021 05:33:32 -0400
Received: from out28-51.mail.aliyun.com ([115.124.28.51]:60641 "EHLO
        out28-51.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238156AbhG3Jdc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jul 2021 05:33:32 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07529395|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.126289-0.000848962-0.872862;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.Kt0Ea8-_1627637603;
Received: from 192.168.88.131(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Kt0Ea8-_1627637603)
          by smtp.aliyun-inc.com(10.147.41.120);
          Fri, 30 Jul 2021 17:33:25 +0800
Subject: Re: [PATCH 1/2] dt-bindings: dwc2: Add bindings for new Ingenic SoCs.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        hminas@synopsys.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
References: <1627116521-124612-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1627116521-124612-2-git-send-email-zhouyanjie@wanyeetech.com>
 <CLWQWQ.DBCX3I00Y95T2@crapouillou.net>
 <ad64396d-d7ab-b8dd-4086-f565e91edb00@wanyeetech.com>
 <TKQSWQ.K11YHBO0B4FM2@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <0bffb545-212c-2711-43ac-39efc1074c8b@wanyeetech.com>
Date:   Fri, 30 Jul 2021 17:33:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <TKQSWQ.K11YHBO0B4FM2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/7/25 下午6:31, Paul Cercueil wrote:
> Hi Zhou,
>
> Le sam., juil. 24 2021 at 20:52:30 +0800, Zhou Yanjie 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Hi Paul,
>>
>> On 2021/7/24 下午6:46, Paul Cercueil wrote:
>>> Hi Zhou,
>>>
>>> Le sam., juil. 24 2021 at 16:48:40 +0800, 周琰杰 (Zhou Yanjie) 
>>> <zhouyanjie@wanyeetech.com> a écrit :
>>>> Add the dwc2 bindings for the JZ4775 SoC, the JZ4780 SoC, the X1000 
>>>> SoC,
>>>> the X1600 SoC, the X1830 SoC, and the X2000 SoC from Ingenic.
>>>>
>>>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml 
>>>> b/Documentation/devicetree/bindings/usb/dwc2.yaml
>>>> index 10c7d9b..e779d33 100644
>>>> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
>>>> @@ -14,6 +14,12 @@ properties:
>>>>      oneOf:
>>>>        - const: brcm,bcm2835-usb
>>>>        - const: hisilicon,hi6220-usb
>>>> +      - const: ingenic,jz4775-otg
>>>> +      - const: ingenic,jz4780-otg
>>>> +      - const: ingenic,x1000-otg
>>>> +      - const: ingenic,x1600-otg
>>>> +      - const: ingenic,x1830-otg
>>>> +      - const: ingenic,x2000-otg
>>>
>>> I don't know if all these IPs are the exact same, but if they are, 
>>> they all should have "ingenic,jz4775-otg" as the fallback.
>>
>>
>> I'm not too sure whether they are exactly the same, but comparing the 
>> code in Ingenics SDK,
>>
>> the code of the USB part of jz4775, jz4780, and x1000 are the same, 
>> the code of the USB part
>>
>> of x1600 and x1830 are the same, and the USB part code of X2000 are 
>> different from all of them.
>
> In doubt - it's better to keep separate compatible strings, so this is 
> OK.


Sure.


Thanks and best regards!


>
> Cheers,
> -Paul
>
