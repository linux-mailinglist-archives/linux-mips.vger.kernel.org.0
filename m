Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7705E117D28
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2019 02:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbfLJB2B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Dec 2019 20:28:01 -0500
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:43360 "EHLO
        out28-123.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727221AbfLJB2B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Dec 2019 20:28:01 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07446845|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.232041-0.00467079-0.763289;DS=CONTINUE|ham_system_inform|0.15122-0.000763619-0.848017;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16378;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.GDxG-xB_1575941274;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GDxG-xB_1575941274)
          by smtp.aliyun-inc.com(10.147.42.198);
          Tue, 10 Dec 2019 09:27:55 +0800
Subject: Re: [PATCH v7 5/6] MIPS: X1000: Add missing X1000 nodes.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1575896438-9562-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1575896438-9562-6-git-send-email-zhouyanjie@wanyeetech.com>
 <1575904518.3.3@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mripard@kernel.org, shawnguo@kernel.org, mark.rutland@arm.com,
        ebiederm@xmission.com, ralf@linux-mips.org, heiko@sntech.de,
        icenowy@aosc.io, laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, geert+renesas@glider.be,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
From:   zhouyanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5DEEF49A.50306@wanyeetech.com>
Date:   Tue, 10 Dec 2019 09:27:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1575904518.3.3@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019年12月09日 23:15, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le lun., déc. 9, 2019 at 21:00, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add the appropriate DT node to probe pdma/msc/rtc/watchdog/ethernet
>> driver using the devicetree.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v7:
>>     New patch, merge[05/12],[07/12],[09/12],[11/12] in v6.
>>
>>  arch/mips/boot/dts/ingenic/x1000.dtsi | 96 
>> +++++++++++++++++++++++++++++++++++
>>  1 file changed, 96 insertions(+)
>>
>> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi 
>> b/arch/mips/boot/dts/ingenic/x1000.dtsi
>> index 13a6c9ff..398a756 100644
>> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
>> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
>> @@ -1,5 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  #include <dt-bindings/clock/x1000-cgu.h>
>> +#include <dt-bindings/dma/x1000-dma.h>
>>
>>  / {
>>      #address-cells = <1>;
>> @@ -68,6 +69,25 @@
>>          interrupts = <27 26 25>;
>>      };
>>
>> +    wdt: watchdog@10002000 {
>> +        compatible = "ingenic,x1000-watchdog", 
>> "ingenic,jz4780-watchdog";
>> +        reg = <0x10002000 0x10>;
>> +
>> +        clocks = <&cgu X1000_CLK_RTCLK>;
>> +        clock-names = "rtc";
>> +    };
>
> The watchdog node should be a children of the TCU node, see
> Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>

Sure, I'll check it and change this in v8.

>
>> +
>> +    rtc: rtc@10003000 {
>> +        compatible = "ingenic,x1000-rtc", "ingenic,jz4780-rtc";
>> +        reg = <0x10003000 0x4c>;
>> +
>> +        interrupt-parent = <&intc>;
>> +        interrupts = <32>;
>> +
>> +        clocks = <&cgu X1000_CLK_RTCLK>;
>> +        clock-names = "rtc";
>> +    };
>> +
>>      pinctrl: pin-controller@10010000 {
>>          compatible = "ingenic,x1000-pinctrl";
>>          reg = <0x10010000 0x800>;
>> @@ -173,4 +193,80 @@
>>
>>          status = "disabled";
>>      };
>> +
>> +    pdma: dma-controller@13420000 {
>> +        compatible = "ingenic,x1000-dma";
>> +        reg = <0x13420000 0x400
>> +               0x13421000 0x40>;
>> +        #dma-cells = <2>;
>> +
>> +        interrupt-parent = <&intc>;
>> +        interrupts = <10>;
>> +
>> +        clocks = <&cgu X1000_CLK_PDMA>;
>> +    };
>> +
>> +    mac: mac@134b0000 {
>
> Please name the nodes according to the devicetree specification; this 
> should be 'ethernet@134b0000'.
>

OK, I'll change it in v8.

>
>> +        compatible = "ingenic,x1000-mac", "snps,dwmac";
>> +        reg = <0x134b0000 0x2000>;
>> +
>> +        interrupt-parent = <&intc>;
>> +        interrupts = <55>;
>> +        interrupt-names = "macirq";
>> +
>> +        clocks = <&cgu X1000_CLK_MAC>;
>> +        clock-names = "stmmaceth";
>> +
>> +        status = "disabled";
>> +
>> +        mdio: mdio {
>> +            compatible = "snps,dwmac-mdio";
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            status = "disabled";
>> +        };
>> +    };
>> +
>> +    msc0: msc@13450000 {
>
> This should be 'mmc@13450000'
>

OK, I'll change it in v8.

>
>> +        compatible = "ingenic,x1000-mmc";
>> +        reg = <0x13450000 0x1000>;
>> +
>> +        interrupt-parent = <&intc>;
>> +        interrupts = <37>;
>> +
>> +        clocks = <&cgu X1000_CLK_MSC0>;
>> +        clock-names = "mmc";
>> +
>> +        cap-sd-highspeed;
>> +        cap-mmc-highspeed;
>> +        cap-sdio-irq;
>> +
>> +        dmas = <&pdma X1000_DMA_MSC0_RX 0xffffffff>,
>> +               <&pdma X1000_DMA_MSC0_TX 0xffffffff>;
>> +        dma-names = "rx", "tx";
>> +
>> +        status = "disabled";
>> +    };
>> +
>> +    msc1: msc@13460000 {
>
> This should be 'mmc@13460000'.
>

OK, I'll change it in v8.

Thanks and best regards!

> Cheers,
> -Paul
>
>> +        compatible = "ingenic,x1000-mmc";
>> +        reg = <0x13460000 0x1000>;
>> +
>> +        interrupt-parent = <&intc>;
>> +        interrupts = <36>;
>> +
>> +        clocks = <&cgu X1000_CLK_MSC1>;
>> +        clock-names = "mmc";
>> +
>> +        cap-sd-highspeed;
>> +        cap-mmc-highspeed;
>> +        cap-sdio-irq;
>> +
>> +        dmas = <&pdma X1000_DMA_MSC1_RX 0xffffffff>,
>> +               <&pdma X1000_DMA_MSC1_TX 0xffffffff>;
>> +        dma-names = "rx", "tx";
>> +
>> +        status = "disabled";
>> +    };
>>  };
>> -- 
>> 2.7.4
>>
>

