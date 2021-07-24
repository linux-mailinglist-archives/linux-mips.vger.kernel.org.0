Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0D273D47C6
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 15:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234377AbhGXM0B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 08:26:01 -0400
Received: from out29-1.mail.aliyun.com ([115.124.29.1]:48586 "EHLO
        out29-1.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbhGXM0A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 08:26:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436592|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.504641-0.000518222-0.49484;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.KpzUXqf_1627131989;
Received: from 192.168.88.130(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KpzUXqf_1627131989)
          by smtp.aliyun-inc.com(10.147.43.95);
          Sat, 24 Jul 2021 21:06:30 +0800
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add bindings for new Ingenic
 SoCs.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
References: <1627117898-125239-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1627117898-125239-2-git-send-email-zhouyanjie@wanyeetech.com>
 <6CXQWQ.XVALRMYW4LM72@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <cfeef89e-8049-5895-0e18-31f136c46e84@wanyeetech.com>
Date:   Sat, 24 Jul 2021 21:06:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6CXQWQ.XVALRMYW4LM72@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/7/24 下午7:02, Paul Cercueil wrote:
> Hi Zhou,
>
> Le sam., juil. 24 2021 at 17:11:37 +0800, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add the remoteproc bindings for the JZ4760 SoC, the JZ4760B SoC,
>> the JZ4775 SoC, and the JZ4780 SoC from Ingenic.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>  .../bindings/remoteproc/ingenic,vpu.yaml           | 74 
>> ++++++++++++++++------
>>  1 file changed, 56 insertions(+), 18 deletions(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml 
>> b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
>> index d0aa91b..6154596 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
>> @@ -17,31 +17,52 @@ maintainers:
>>
>>  properties:
>>    compatible:
>> -    const: ingenic,jz4770-vpu-rproc
>> +    enum:
>> +      - ingenic,jz4760-vpu-rproc
>> +      - ingenic,jz4760b-vpu-rproc
>> +      - ingenic,jz4770-vpu-rproc
>> +      - ingenic,jz4775-vpu-rproc
>> +      - ingenic,jz4780-vpu-rproc
>>
>>    reg:
>> -    items:
>> -      - description: aux registers
>> -      - description: tcsm0 registers
>> -      - description: tcsm1 registers
>> -      - description: sram registers
>> +    oneOf:
>> +      - items:
>> +          - description: aux registers
>> +          - description: tcsm0 registers
>> +          - description: tcsm1 registers
>> +          - description: sram registers
>> +      - items:
>> +          - description: aux registers
>> +          - description: tcsm registers
>> +          - description: sram registers
>
> Since we have "reg-names" already, we don't really need any 
> description, so you could just have:
>
> reg:
>  minItems: 3
>  maxItems: 4


Sure, I will do it in the next version.


>
>>
>>    reg-names:
>> -    items:
>> -      - const: aux
>> -      - const: tcsm0
>> -      - const: tcsm1
>> -      - const: sram
>> +    oneOf:
>> +      - items:
>> +          - const: aux
>> +          - const: tcsm0
>> +          - const: tcsm1
>> +          - const: sram
>> +      - items:
>> +          - const: aux
>> +          - const: tcsm
>> +          - const: sram
>
> You could just add "tcsm" to the items list, and add:
> minItems: 3
> maxItems: 4


Sure.


>
>>
>>    clocks:
>> -    items:
>> -      - description: aux clock
>> -      - description: vpu clock
>> +    oneOf:
>> +      - items:
>> +          - description: aux clock
>> +          - description: vpu clock
>> +      - items:
>> +          - description: vpu clock
>
> Same as above, since we already have clock-names, the descriptions 
> don't bring much.
>
> You can replace with:
>
> clocks:
>  minItems: 1
>  maxItems: 2


Sure.


>
>>
>>    clock-names:
>> -    items:
>> -      - const: aux
>> -      - const: vpu
>> +    oneOf:
>> +      - items:
>> +          - const: aux
>> +          - const: vpu
>> +      - items:
>> +          - const: vpu
>
> I think you could just add:
> minItems: 1


Sure.


Thanks and best regards!


>
> Cheers,
> -Paul
>
>>
>>    interrupts:
>>      maxItems: 1
>> @@ -60,7 +81,7 @@ examples:
>>    - |
>>      #include <dt-bindings/clock/jz4770-cgu.h>
>>
>> -    vpu: video-decoder@132a0000 {
>> +    video-decoder@132a0000 {
>>        compatible = "ingenic,jz4770-vpu-rproc";
>>
>>        reg = <0x132a0000 0x20>, /* AUX */
>> @@ -75,3 +96,20 @@ examples:
>>        interrupt-parent = <&cpuintc>;
>>        interrupts = <3>;
>>      };
>> +  - |
>> +    #include <dt-bindings/clock/jz4780-cgu.h>
>> +
>> +    video-decoder@132a0000 {
>> +      compatible = "ingenic,jz4780-vpu-rproc";
>> +
>> +      reg = <0x132a0000 0x20>, /* AUX */
>> +            <0x132c0000 0x8000>, /* TCSM */
>> +            <0x132f0000 0x4000>; /* SRAM */
>> +      reg-names = "aux", "tcsm", "sram";
>> +
>> +      clocks = <&cgu JZ4780_CLK_VPU>;
>> +      clock-names = "vpu";
>> +
>> +      interrupt-parent = <&intc>;
>> +      interrupts = <62>;
>> +    };
>> -- 
>> 2.7.4
>>
>
