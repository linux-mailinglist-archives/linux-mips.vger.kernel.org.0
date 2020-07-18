Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0120E224A8D
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jul 2020 12:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgGRKKz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Jul 2020 06:10:55 -0400
Received: from out28-52.mail.aliyun.com ([115.124.28.52]:37594 "EHLO
        out28-52.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgGRKKy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 18 Jul 2020 06:10:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1048682|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00811512-0.00229485-0.98959;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03306;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.I3qN-fY_1595067048;
Received: from 192.168.10.205(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I3qN-fY_1595067048)
          by smtp.aliyun-inc.com(10.147.43.95);
          Sat, 18 Jul 2020 18:10:49 +0800
Subject: Re: [PATCH v7 3/5] MIPS: Ingenic: Let the Kconfig of platform enable
 the clocksource driver.
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        daniel.lezcano@linaro.org, tsbogend@alpha.franken.de,
        robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, paul@crapouillou.net
References: <20200717165947.56158-1-zhouyanjie@wanyeetech.com>
 <20200717165947.56158-4-zhouyanjie@wanyeetech.com>
 <4903f4ba-6ecb-5c38-aa5a-4f20bd473124@cogentembedded.com>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <7e4e55c1-6341-c073-8ace-fd99c03fc464@wanyeetech.com>
Date:   Sat, 18 Jul 2020 18:10:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <4903f4ba-6ecb-5c38-aa5a-4f20bd473124@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sergei,

在 2020/7/18 下午4:39, Sergei Shtylyov 写道:
> Hello!
>
> On 17.07.2020 19:59, 周琰杰 (Zhou Yanjie) wrote:
>
>> The previous clocksource patch in this series ([2/3]) has remove
>
>   Removed.
>
>> "default MACH_INGENIC" and make option silent, so we need to
>
>   Made?
>
>> enable the corresponding driver in the platform's Kconfig.
>>
>> Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>      v7:
>>      New patch.
>>
>>   arch/mips/jz4740/Kconfig | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
>> index 6c065dcaeff8..5ad60998702e 100644
>> --- a/arch/mips/jz4740/Kconfig
>> +++ b/arch/mips/jz4740/Kconfig
>> @@ -36,27 +36,34 @@ endchoice
>>   config MACH_JZ4740
>>       bool
>>       select SYS_HAS_CPU_MIPS32_R1
>> +    select INGENIC_TIMER
>
>    Please use tab instead of spaces here an below.
>

Sure, I will do it in the next version.

Thanks and best regards!


> [...]
>
> MBR, Sergei
