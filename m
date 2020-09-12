Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0798267827
	for <lists+linux-mips@lfdr.de>; Sat, 12 Sep 2020 08:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgILGRx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Sep 2020 02:17:53 -0400
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:35948 "EHLO
        out28-173.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgILGRw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Sep 2020 02:17:52 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07438655|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0480564-0.00105613-0.950888;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07381;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=20;RT=20;SR=0;TI=SMTPD_---.IW6eS-o_1599891463;
Received: from 192.168.178.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IW6eS-o_1599891463)
          by smtp.aliyun-inc.com(10.147.41.158);
          Sat, 12 Sep 2020 14:17:45 +0800
Subject: Re: [PATCH v8 5/6] MIPS: Ingenic: Add 'cpus' node for Ingenic SoCs.
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tsbogend@alpha.franken.de,
        paulburton@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com,
        tglx@linutronix.de, robh+dt@kernel.org, daniel.lezcano@linaro.org,
        keescook@chromium.org, paul@crapouillou.net, krzk@kernel.org,
        ebiederm@xmission.com, dongsheng.qiu@ingenic.com,
        yanfei.li@ingenic.com, rick.tyliu@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
References: <1589898923-60048-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1589898923-60048-7-git-send-email-zhouyanjie@wanyeetech.com>
 <8EBCE2D3-8683-4E57-912F-41D03C943CC9@goldelico.com>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <d7956124-ef2e-3186-4412-c71c10383502@wanyeetech.com>
Date:   Sat, 12 Sep 2020 14:17:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <8EBCE2D3-8683-4E57-912F-41D03C943CC9@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

This series was temporarily shelved, because now it is necessary to add 
support for the new X2000 SoC, and it will continue to advance after all 
the functions related to X2000 are completed.

Thanks and best regards!

在 2020/9/10 下午3:52, H. Nikolaus Schaller 写道:
> Hi Zhou Yanjie,
> what is the status of this series? It does not seem to have arrived in linux-next for v5.10-rc1.
>
> BR and thanks,
> Nikolaus
>
>
>> Am 19.05.2020 um 16:35 schrieb 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>:
>>
>> Add 'cpus' node to the jz4740.dtsi, jz4770.dtsi, jz4780.dtsi
>> and x1000.dtsi files.
>>
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Tested-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v1->v2:
>>     No change.
>>
>>     v2->v3:
>>     No change.
>>
>>     v3->v4:
>>     Rebase on top of kernel 5.6-rc1.
>>
>>     v4->v5:
>>     No change.
>>
>>     v5->v6:
>>     No change.
>>
>>     v6->v7:
>>     Update compatible strings.
>>
>>     v7->v8:
>>     No change.
>>
>> arch/mips/boot/dts/ingenic/jz4740.dtsi | 14 ++++++++++++++
>> arch/mips/boot/dts/ingenic/jz4770.dtsi | 15 ++++++++++++++-
>> arch/mips/boot/dts/ingenic/jz4780.dtsi | 23 +++++++++++++++++++++++
>> arch/mips/boot/dts/ingenic/x1000.dtsi  | 14 ++++++++++++++
>> 4 files changed, 65 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
>> index a3301ba..1f2f896 100644
>> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
>> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
>> @@ -7,6 +7,20 @@
>> 	#size-cells = <1>;
>> 	compatible = "ingenic,jz4740";
>>
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "ingenic,xburst-mxu1.0";
>> +			reg = <0>;
>> +
>> +			clocks = <&cgu JZ4740_CLK_CCLK>;
>> +			clock-names = "cpu";
>> +		};
>> +	};
>> +
>> 	cpuintc: interrupt-controller {
>> 		#address-cells = <0>;
>> 		#interrupt-cells = <1>;
>> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
>> index 0bfb9ed..12c7101 100644
>> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
>> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
>> @@ -1,5 +1,4 @@
>> // SPDX-License-Identifier: GPL-2.0
>> -
>> #include <dt-bindings/clock/jz4770-cgu.h>
>>
>> / {
>> @@ -7,6 +6,20 @@
>> 	#size-cells = <1>;
>> 	compatible = "ingenic,jz4770";
>>
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "ingenic,xburst-fpu1.0-mxu1.1";
>> +			reg = <0>;
>> +
>> +			clocks = <&cgu JZ4770_CLK_CCLK>;
>> +			clock-names = "cpu";
>> +		};
>> +	};
>> +
>> 	cpuintc: interrupt-controller {
>> 		#address-cells = <0>;
>> 		#interrupt-cells = <1>;
>> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> index bb89653..03aeeff 100644
>> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> @@ -8,6 +8,29 @@
>> 	#size-cells = <1>;
>> 	compatible = "ingenic,jz4780";
>>
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "ingenic,xburst-fpu1.0-mxu1.1";
>> +			reg = <0>;
>> +
>> +			clocks = <&cgu JZ4780_CLK_CPU>;
>> +			clock-names = "cpu";
>> +		};
>> +
>> +		cpu1: cpu@1 {
>> +			device_type = "cpu";
>> +			compatible = "ingenic,xburst-fpu1.0-mxu1.1";
>> +			reg = <1>;
>> +
>> +			clocks = <&cgu JZ4780_CLK_CORE1>;
>> +			clock-names = "cpu";
>> +		};
>> +	};
>> +
>> 	cpuintc: interrupt-controller {
>> 		#address-cells = <0>;
>> 		#interrupt-cells = <1>;
>> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
>> index 147f7d5..2205e1b 100644
>> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
>> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
>> @@ -8,6 +8,20 @@
>> 	#size-cells = <1>;
>> 	compatible = "ingenic,x1000", "ingenic,x1000e";
>>
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "ingenic,xburst-fpu1.0-mxu1.1";
>> +			reg = <0>;
>> +
>> +			clocks = <&cgu X1000_CLK_CPU>;
>> +			clock-names = "cpu";
>> +		};
>> +	};
>> +
>> 	cpuintc: interrupt-controller {
>> 		#address-cells = <0>;
>> 		#interrupt-cells = <1>;
>> -- 
>> 2.7.4
>>
