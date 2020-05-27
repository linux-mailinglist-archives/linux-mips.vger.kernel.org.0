Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB0C1E38B3
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 08:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgE0GAH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 02:00:07 -0400
Received: from out28-219.mail.aliyun.com ([115.124.28.219]:46416 "EHLO
        out28-219.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgE0GAG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 02:00:06 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07629988|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.102456-0.000676535-0.896868;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03312;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=21;RT=21;SR=0;TI=SMTPD_---.HeD3p8j_1590559199;
Received: from 192.168.10.205(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HeD3p8j_1590559199)
          by smtp.aliyun-inc.com(10.147.42.16);
          Wed, 27 May 2020 14:00:00 +0800
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Subject: Re: [PATCH v8 4/6] dt-bindings: MIPS: Document Ingenic SoCs binding.
To:     Rob Herring <robh@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tsbogend@alpha.franken.de,
        paulburton@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        keescook@chromium.org, paul@crapouillou.net, krzk@kernel.org,
        hns@goldelico.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, yanfei.li@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, aric.pzqi@ingenic.com
References: <1589898923-60048-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1589898923-60048-6-git-send-email-zhouyanjie@wanyeetech.com>
 <20200526192947.GA140311@bogus>
Message-ID: <b41dc785-c514-de69-4546-5c4ff3833f04@wanyeetech.com>
Date:   Wed, 27 May 2020 13:59:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20200526192947.GA140311@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2020/5/27 上午3:29, Rob Herring 写道:
> On Tue, May 19, 2020 at 10:35:21PM +0800, 周琰杰 (Zhou Yanjie) wrote:
>> Document the available properties for the SoC root node and the
>> CPU nodes of the devicetree for the Ingenic XBurst SoCs.
>>
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Tested-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>      v1->v2:
>>      Change the two Document from txt to yaml.
>>      
>>      v2->v3:
>>      Fix formatting errors.
>>      
>>      v3->v4:
>>      Fix bugs in the two yaml files.
>>      
>>      v4->v5:
>>      No change.
>>      
>>      v5->v6:
>>      Rewrite the two yaml files.
>>      
>>      v6->v7:
>>      1.Update compatible strings in "ingenic,cpu.yaml".
>>      2.Fix formatting errors, and enum for compatible strings.
>>      3.Remove unnecessary "ingenic,soc.yaml".
>>      
>>      v7->v8:
>>      No change.
>>
>>   .../bindings/mips/ingenic/ingenic,cpu.yaml         | 57 ++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>> new file mode 100644
>> index 00000000..afb0207
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
>> +  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> +
>> +description:
>> +  Ingenic XBurst family CPUs shall have the following properties.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +
>> +      - description: Ingenic XBurst®1 CPU Cores
>> +        items:
> This is a single compatible string, right? If so, drop items.


Sure, I'll drop it. And because the SMP driver has some other work that 
can't be completed in a short time, so I will send this patch separately.


>> +          enum:
>> +            - ingenic,xburst-mxu1.0
>> +            - ingenic,xburst-fpu1.0-mxu1.1
>> +            - ingenic,xburst-fpu2.0-mxu2.0
>> +
>> +      - description: Ingenic XBurst®2 CPU Cores
>> +        items:
>> +          enum:
>> +            - ingenic,xburst2-fpu2.1-mxu2.1-smt
> Just: const: ingenic,xburst2-fpu2.1-mxu2.1-smt
>
> Continuing to append CPU features isn't going to scale well. Does
> 'xburst2' imply certain features? If so, not really any need to have
> them be explicit.


XBurst (XBurst1) is the first generation CPU core of Ingenic, its basic 
property is single-issue in-order execution, XBurst2 is the second 
generation CPU core of Ingenic, its basic property is daul-issue limited 
out-of-order execution, and both CPU cores can cooperate with some 
extended propeties,  such as different versions of FPU, different 
versions of MXU instruction set, with or without simultaneous 
multi-threading.

Currently there is only one processor entity based on XBurst2 is 
produced, so there is  only one string for now.


Thanks and best regards!


>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - device_type
>> +  - compatible
>> +  - reg
>> +
>> +examples:
>> +  - |
>> +    cpus {
>> +    	#address-cells = <1>;
>> +    	#size-cells = <0>;
>> +
>> +    	cpu0: cpu@0 {
>> +    		device_type = "cpu";
>> +    		compatible = "ingenic,xburst-fpu1.0-mxu1.1";
>> +    		reg = <0>;
>> +    	};
>> +
>> +    	cpu1: cpu@1 {
>> +    		device_type = "cpu";
>> +    		compatible = "ingenic,xburst-fpu1.0-mxu1.1";
>> +    		reg = <1>;
>> +    	};
>> +    };
>> +...
>> -- 
>> 2.7.4
>>
