Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7BA3C9DC0
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 13:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241959AbhGOLbl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 07:31:41 -0400
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:53431 "EHLO
        out28-194.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240876AbhGOLbk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 07:31:40 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1377769|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0168444-0.000132607-0.983023;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047211;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.Ki2gLph_1626348524;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Ki2gLph_1626348524)
          by smtp.aliyun-inc.com(10.147.41.158);
          Thu, 15 Jul 2021 19:28:44 +0800
Subject: Re: [PATCH v6 08/11] dt-bindings: clock: Add JZ4775 clock bindings.
To:     Rob Herring <robh@kernel.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
References: <1624981102-26248-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1624981102-26248-9-git-send-email-zhouyanjie@wanyeetech.com>
 <20210713223442.GA968962@robh.at.kernel.org>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <6b318d1b-37de-c039-a994-3d616e013a9d@wanyeetech.com>
Date:   Thu, 15 Jul 2021 19:28:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210713223442.GA968962@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On 2021/7/14 上午6:34, Rob Herring wrote:
> On Tue, Jun 29, 2021 at 11:38:19PM +0800, 周琰杰 (Zhou Yanjie) wrote:
>> Add the clock bindings for the JZ4775 SoC from Ingenic.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>      v5:
>>      New patch.
>>      
>>      v5->v6:
>>      No change.
>>
>>   include/dt-bindings/clock/jz4775-cgu.h | 59 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/jz4775-cgu.h
>>
>> diff --git a/include/dt-bindings/clock/jz4775-cgu.h b/include/dt-bindings/clock/jz4775-cgu.h
>> new file mode 100644
>> index 00000000..8c2af69
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/jz4775-cgu.h
>> @@ -0,0 +1,59 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
> Dual license please.


Sure, I will change it in v2.


>> +/*
>> + * This header provides clock numbers for the ingenic,jz4775-cgu DT binding.
>> + *
>> + * They are roughly ordered as:
>> + *   - external clocks
>> + *   - PLLs
>> + *   - muxes/dividers in the order they appear in the jz4775 programmers manual
>> + *   - gates in order of their bit in the CLKGR* registers
> Can one convert index to register/bit offset? If you can avoid made up
> numbers and use something that corresponds to the h/w, that's preferred.
>

Unfortunately, only part of these clocks are related to registers or bits,
and the rest are not related to both, so we can't perform the kind of
conversion you mentioned.


Thanks and best regards!


>> + */
>> +
>> +#ifndef __DT_BINDINGS_CLOCK_JZ4775_CGU_H__
>> +#define __DT_BINDINGS_CLOCK_JZ4775_CGU_H__
>> +
>> +#define JZ4775_CLK_EXCLK		0
>> +#define JZ4775_CLK_RTCLK		1
>> +#define JZ4775_CLK_APLL			2
>> +#define JZ4775_CLK_MPLL			3
>> +#define JZ4775_CLK_OTGPHY		4
>> +#define JZ4775_CLK_SCLKA		5
>> +#define JZ4775_CLK_UHC			6
>> +#define JZ4775_CLK_UHCPHY		7
>> +#define JZ4775_CLK_CPUMUX		8
>> +#define JZ4775_CLK_CPU			9
>> +#define JZ4775_CLK_L2CACHE		10
>> +#define JZ4775_CLK_AHB0			11
>> +#define JZ4775_CLK_AHB2PMUX		12
>> +#define JZ4775_CLK_AHB2			13
>> +#define JZ4775_CLK_PCLK			14
>> +#define JZ4775_CLK_DDR			15
>> +#define JZ4775_CLK_VPU			16
>> +#define JZ4775_CLK_OTG			17
>> +#define JZ4775_CLK_EXCLK_DIV2	18
>> +#define JZ4775_CLK_I2S			19
>> +#define JZ4775_CLK_LCD			20
>> +#define JZ4775_CLK_MSCMUX		21
>> +#define JZ4775_CLK_MSC0			22
>> +#define JZ4775_CLK_MSC1			23
>> +#define JZ4775_CLK_MSC2			24
>> +#define JZ4775_CLK_SSI			25
>> +#define JZ4775_CLK_CIM0			26
>> +#define JZ4775_CLK_CIM1			27
>> +#define JZ4775_CLK_PCM			28
>> +#define JZ4775_CLK_BCH			29
>> +#define JZ4775_CLK_EXCLK_DIV512	30
>> +#define JZ4775_CLK_RTC			31
>> +#define JZ4775_CLK_NEMC			32
>> +#define JZ4775_CLK_I2C0			33
>> +#define JZ4775_CLK_I2C1			34
>> +#define JZ4775_CLK_I2C2			35
>> +#define JZ4775_CLK_SADC			36
>> +#define JZ4775_CLK_UART0		37
>> +#define JZ4775_CLK_UART1		38
>> +#define JZ4775_CLK_UART2		39
>> +#define JZ4775_CLK_UART3		40
>> +#define JZ4775_CLK_PDMA			41
>> +#define JZ4775_CLK_MAC			42
>> +
>> +#endif /* __DT_BINDINGS_CLOCK_JZ4775_CGU_H__ */
>> -- 
>> 2.7.4
>>
>>
