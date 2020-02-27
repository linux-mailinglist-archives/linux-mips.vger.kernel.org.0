Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B38901722F5
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 17:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgB0QOG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 11:14:06 -0500
Received: from out28-100.mail.aliyun.com ([115.124.28.100]:48667 "EHLO
        out28-100.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbgB0QOG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 11:14:06 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07442147|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.342885-0.0140584-0.643056;DS=CONTINUE|ham_regular_dialog|0.0309896-0.00151637-0.967494;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03295;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.GtIG5Hb_1582820033;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GtIG5Hb_1582820033)
          by smtp.aliyun-inc.com(10.147.43.95);
          Fri, 28 Feb 2020 00:13:54 +0800
Subject: Re: [PATCH v6 5/7] dt-bindings: MIPS: Document Ingenic SoCs binding.
To:     Rob Herring <robh@kernel.org>
References: <1582215889-113034-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1582215889-113034-7-git-send-email-zhouyanjie@wanyeetech.com>
 <20200226162907.GA13489@bogus>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        tglx@linutronix.de, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, sboyd@kernel.org,
        mturquette@baylibre.com, mark.rutland@arm.com,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        geert+renesas@glider.be, krzk@kernel.org, ebiederm@xmission.com,
        miquel.raynal@bootlin.com, keescook@chromium.org,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E57EAC0.8040806@wanyeetech.com>
Date:   Fri, 28 Feb 2020 00:13:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20200226162907.GA13489@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On 2020年02月27日 00:29, Rob Herring wrote:
> On Fri, Feb 21, 2020 at 12:24:47AM +0800, 周琰杰 (Zhou Yanjie) wrote:
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
>>   .../bindings/mips/ingenic/ingenic,cpu.yaml         | 61 ++++++++++++++++++++++
>>   .../bindings/mips/ingenic/ingenic,soc.yaml         | 34 ++++++++++++
>>   2 files changed, 95 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>>   create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>> new file mode 100644
>> index 00000000..ad1fd86
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>> @@ -0,0 +1,61 @@
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
> Blank line here.
>
>> +description: |
> Drop the '|'.
>
>> +  Ingenic XBurst family CPUs shall have the following properties.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +
>> +      - description: Ingenic XBurst®1 CPU Core
>> +        items:
>> +          - const: ingenic,xburst
>> +
>> +      - description: Ingenic XBurst®2 CPU Core
>> +        items:
>> +          - const: ingenic,xburst2
> enum:
>    - ingenic,xburst  # Ingenic XBurst®1 CPU Core
>    - ingenic,xburst2 # Ingenic XBurst®2 CPU Core
>
> Though I don't find the description really adds much.
>
>> +
>> +  reg:
>> +    description: |
>> +      The number of the CPU.
> Drop this.
>
> Add:
>
> maxItems: 1
>
>> +
>> +required:
>> +  - device_type
>> +  - compatible
>> +  - reg
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/jz4780-cgu.h>
>> +
>> +    cpus {
>> +    	#address-cells = <1>;
>> +    	#size-cells = <0>;
>> +
>> +    	cpu0: cpu@0 {
>> +    		device_type = "cpu";
>> +    		compatible = "ingenic,xburst";
>> +    		reg = <0>;
>> +
>> +    		clocks = <&cgu JZ4780_CLK_CPU>;
>> +    		clock-names = "cpu";
> Not documented.
>
>> +    	};
>> +
>> +    	cpu1: cpu@1 {
>> +    		device_type = "cpu";
>> +    		compatible = "ingenic,xburst";
>> +    		reg = <1>;
>> +
>> +    		clocks = <&cgu JZ4780_CLK_CORE1>;
>> +    		clock-names = "cpu";
>> +    	};
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml b/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml
>> new file mode 100644
>> index 00000000..8943e73
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml
>> @@ -0,0 +1,34 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mips/ingenic/ingenic,soc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Ingenic SoCs with XBurst CPU inside.
>> +
>> +maintainers:
>> +  - 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> Blank line.
>
>> +description: |
>> +  Ingenic SoCs with XBurst CPU inside shall have the following properties.
>> +
>> +properties:
>> +  $nodename:
>> +    const: '/'
>> +  compatible:
>> +    oneOf:
>> +
>> +      - description: Ingenic JZ47 Series Mobile Application Processor
>> +        items:
>> +          - const: ingenic,jz4740
>> +          - const: ingenic,jz4725b
>> +          - const: ingenic,jz4760
>> +          - const: ingenic,jz4760b
>> +          - const: ingenic,jz4770
>> +          - const: ingenic,jz4780
> This is defining the root compatible is 6 strings. You want a enum here
> I think.
>
>> +
>> +      - description: Ingenic X Series IoT Application Processor
>> +        items:
>> +          - const: ingenic,x1000
>> +          - const: ingenic,x1000e
>> +          - const: ingenic,x1500
> Same here.
>
> Did you validate your dts file with this schema using 'make dtbs_check'?

I am very sorry, to be honest, because I was not familiar with yaml before,
the previous versions have not been verified, but when v6, I have set up
the environment and checked it with "make dt_binding_check", but I
don't know why the problems you pointed out above were not prompted
during the check. I will fix these problems in the next version.

Thanks and best regards!

>
> Rob

