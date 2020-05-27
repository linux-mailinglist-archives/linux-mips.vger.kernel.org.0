Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1671E38D3
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 08:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbgE0GLM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 02:11:12 -0400
Received: from out28-100.mail.aliyun.com ([115.124.28.100]:37714 "EHLO
        out28-100.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0GLL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 02:11:11 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07460527|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0449246-0.000685472-0.95439;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03279;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.HeCSSnk_1590559840;
Received: from 192.168.10.205(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HeCSSnk_1590559840)
          by smtp.aliyun-inc.com(10.147.41.187);
          Wed, 27 May 2020 14:10:41 +0800
Subject: Re: [PATCH 1/1] dt-bindings: MIPS: Document Ingenic SoCs binding.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, hns@goldelico.com, paul@boddie.org.uk,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
References: <20200526170722.17206-1-zhouyanjie@wanyeetech.com>
 <20200526170722.17206-2-zhouyanjie@wanyeetech.com>
 <H9DYAQ.4YAB8VVZPLZO@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <c6798ff1-53fa-8b81-e56b-6b28f1c49ab4@wanyeetech.com>
Date:   Wed, 27 May 2020 14:10:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <H9DYAQ.4YAB8VVZPLZO@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

在 2020/5/27 上午3:10, Paul Cercueil 写道:
> Hi Zhou,
>
> Le mer. 27 mai 2020 à 1:07, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Document the available properties for the SoC root node and the
>> CPU nodes of the devicetree for the Ingenic XBurst SoCs.
>>
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Tested-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>  .../bindings/mips/ingenic/ingenic,cpu.yaml         | 57 
>> ++++++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml 
>> b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>> new file mode 100644
>> index 000000000000..afb02071a756
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mips/ingenic/ingenic,cpu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Ingenic XBurst family CPUs
>> +
>> +maintainers:
>> +  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> +
>> +description:
>> +  Ingenic XBurst family CPUs shall have the following properties.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +
>> +      - description: Ingenic XBurst®1 CPU Cores
>> +        items:
>
> Strip the 'items', put the enum directly.
>

Sure, I'll drop it in the next version.


>> +          enum:
>> +            - ingenic,xburst-mxu1.0
>> +            - ingenic,xburst-fpu1.0-mxu1.1
>> +            - ingenic,xburst-fpu2.0-mxu2.0
>> +
>> +      - description: Ingenic XBurst®2 CPU Cores
>> +        items:
>
> Same here.
>

Sure.


>> +          enum:
>> +            - ingenic,xburst2-fpu2.1-mxu2.1-smt
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - device_type
>> +  - compatible
>> +  - reg
>
> device_type is not in the list of your properties.
>
> Also, I think you need a clock in there.
>

Sure, I will add it.


Thanks and best regards!


> -Paul
>
>> +
>> +examples:
>> +  - |
>> +    cpus {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        cpu0: cpu@0 {
>> +            device_type = "cpu";
>> +            compatible = "ingenic,xburst-fpu1.0-mxu1.1";
>> +            reg = <0>;
>> +        };
>> +
>> +        cpu1: cpu@1 {
>> +            device_type = "cpu";
>> +            compatible = "ingenic,xburst-fpu1.0-mxu1.1";
>> +            reg = <1>;
>> +        };
>> +    };
>> +...
>> -- 
>> 2.11.0
>>
>
