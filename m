Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C5C21E66C
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 05:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgGNDkZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jul 2020 23:40:25 -0400
Received: from out28-220.mail.aliyun.com ([115.124.28.220]:33093 "EHLO
        out28-220.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgGNDkZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jul 2020 23:40:25 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08019729|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0150631-0.00417496-0.980762;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03294;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.I1OFFep_1594698019;
Received: from 192.168.10.205(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I1OFFep_1594698019)
          by smtp.aliyun-inc.com(10.147.40.7);
          Tue, 14 Jul 2020 11:40:20 +0800
Subject: Re: [PATCH v2 2/3] dt-bindings: MIPS: Add Ingenic X1830 based boards.
To:     Rob Herring <robh@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul.burton@mips.com,
        paul@crapouillou.net, tsbogend@alpha.franken.de,
        ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
References: <20200625173716.56146-1-zhouyanjie@wanyeetech.com>
 <20200625173716.56146-3-zhouyanjie@wanyeetech.com>
 <20200714023212.GA1162143@bogus>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <2ef2d552-1e7d-0855-87fb-37bc848a4dc4@wanyeetech.com>
Date:   Tue, 14 Jul 2020 11:40:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20200714023212.GA1162143@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

在 2020/7/14 上午10:32, Rob Herring 写道:
> On Fri, Jun 26, 2020 at 01:37:15AM +0800, 周琰杰 (Zhou Yanjie) wrote:
>> Add bindings for Ingenic X1830 based board, prepare for later dts.
>>
>> Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>      v1->v2:
>>      No change.
>>
>>   Documentation/devicetree/bindings/mips/ingenic/devices.yaml | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
>> index d1175030781a..feb695be9f66 100644
>> --- a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
>> +++ b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
>> @@ -8,7 +8,8 @@ title: Ingenic XBurst based Platforms Device Tree Bindings
>>   
>>   maintainers:
>>     - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> -description: |
>> +
>> +description:
>>     Devices with a Ingenic XBurst CPU shall have the following properties.
>>   
>>   properties:
>> @@ -32,8 +33,13 @@ properties:
>>             - const: img,ci20
>>             - const: ingenic,jz4780
>>   
>> -      - description: YSH & ATIL General Board CU Neo
>> +      - description: YSH & ATIL General Board, CU1000 Module with Neo Backplane
>>           items:
>>             - const: yna,cu1000-neo
>> -          - const: ingenic,x1000
>> +          - const: ingenic,x1000e
> What's this change? You can't just change bindings.


This is my fault, I will add the modification of the corresponding dts 
file in the next version.

Thanks and best regards!

>> +
>> +      - description: YSH & ATIL General Board, CU1830 Module with Neo Backplane
>> +        items:
>> +          - const: yna,cu1830-neo
>> +          - const: ingenic,x1830
>>   ...
>> -- 
>> 2.11.0
>>
