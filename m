Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F3E3D47B5
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 14:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234297AbhGXMMY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 08:12:24 -0400
Received: from out29-173.mail.aliyun.com ([115.124.29.173]:35569 "EHLO
        out29-173.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbhGXMMX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 08:12:23 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07889097|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.0463647-0.00462302-0.949012;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047205;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KpzR04K_1627131171;
Received: from 192.168.88.130(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KpzR04K_1627131171)
          by smtp.aliyun-inc.com(10.147.41.199);
          Sat, 24 Jul 2021 20:52:52 +0800
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
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <ad64396d-d7ab-b8dd-4086-f565e91edb00@wanyeetech.com>
Date:   Sat, 24 Jul 2021 20:52:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CLWQWQ.DBCX3I00Y95T2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/7/24 下午6:46, Paul Cercueil wrote:
> Hi Zhou,
>
> Le sam., juil. 24 2021 at 16:48:40 +0800, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add the dwc2 bindings for the JZ4775 SoC, the JZ4780 SoC, the X1000 SoC,
>> the X1600 SoC, the X1830 SoC, and the X2000 SoC from Ingenic.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml 
>> b/Documentation/devicetree/bindings/usb/dwc2.yaml
>> index 10c7d9b..e779d33 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
>> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
>> @@ -14,6 +14,12 @@ properties:
>>      oneOf:
>>        - const: brcm,bcm2835-usb
>>        - const: hisilicon,hi6220-usb
>> +      - const: ingenic,jz4775-otg
>> +      - const: ingenic,jz4780-otg
>> +      - const: ingenic,x1000-otg
>> +      - const: ingenic,x1600-otg
>> +      - const: ingenic,x1830-otg
>> +      - const: ingenic,x2000-otg
>
> I don't know if all these IPs are the exact same, but if they are, 
> they all should have "ingenic,jz4775-otg" as the fallback.


I'm not too sure whether they are exactly the same, but comparing the 
code in Ingenics SDK,

the code of the USB part of jz4775, jz4780, and x1000 are the same, the 
code of the USB part

of x1600 and x1830 are the same, and the USB part code of X2000 are 
different from all of them.


Thanks and best regards!


>
> -Paul
>
>>        - items:
>>            - const: rockchip,rk3066-usb
>>            - const: snps,dwc2
>> -- 
>> 2.7.4
>>
>
