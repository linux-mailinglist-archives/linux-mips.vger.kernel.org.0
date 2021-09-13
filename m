Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADBF408333
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 05:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238540AbhIMDrj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Sep 2021 23:47:39 -0400
Received: from out1.migadu.com ([91.121.223.63]:11649 "EHLO out1.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238536AbhIMDrj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Sep 2021 23:47:39 -0400
Subject: Re: [PATCH] MIPS: loongson64: make LOONGSON64 depends on
 MIPS_FP_SUPPORT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1631504783;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lI6oiOgTdYWak8dP+dv9SQa+f3mNuTiqf65TGV2VnXA=;
        b=aPC3+uR38wieERgI7WQNNP3SIcntXtsyoZGXM5Gpi9h7q3GEXIGDbdtgoIbGFkjD6vA+Xw
        +EJ0zTjLTRVFNaxnjS25ugBOfZ0leToZs9qQx4gwBEetk4T6NRS5MfDIj5VVALgfezQ1b7
        uuYoWicwAkBbpF7FeunzwEGMcCngT9w=
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20210913024113.220893-1-liu.yun@linux.dev>
 <CAAhV-H4=JGWencuHrYmFTC1Dh1KFapawW-UZdhZGM0gu-h3Akw@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Jackie Liu <liu.yun@linux.dev>
Message-ID: <ce0ab59f-2fc8-6ec0-3cdf-a11ff235990f@linux.dev>
Date:   Mon, 13 Sep 2021 11:46:14 +0800
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4=JGWencuHrYmFTC1Dh1KFapawW-UZdhZGM0gu-h3Akw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Huacai.

在 2021/9/13 上午10:59, Huacai Chen 写道:
> Hi, Jackie,
> 
> On Mon, Sep 13, 2021 at 10:42 AM Jackie Liu <liu.yun@linux.dev> wrote:
>>
>> From: Jackie Liu <liuyun01@kylinos.cn>
>>
>> mach/loongson64 fails to build when the FPU support is disabled:
>>
>> arch/mips/loongson64/cop2-ex.c:45:15: error: implicit declaration of function ‘__is_fpu_owner’; did you mean ‘is_fpu_owner’? [-Werror=implicit-function-declaration]
>> arch/mips/loongson64/cop2-ex.c:98:30: error: ‘struct thread_struct’ has no member named ‘fpu’
>> arch/mips/loongson64/cop2-ex.c:99:30: error: ‘struct thread_struct’ has no member named ‘fpu’
>> arch/mips/loongson64/cop2-ex.c:131:43: error: ‘struct thread_struct’ has no member named ‘fpu’
>> arch/mips/loongson64/cop2-ex.c:137:38: error: ‘struct thread_struct’ has no member named ‘fpu’
>> arch/mips/loongson64/cop2-ex.c:203:30: error: ‘struct thread_struct’ has no member named ‘fpu’
>> arch/mips/loongson64/cop2-ex.c:219:30: error: ‘struct thread_struct’ has no member named ‘fpu’
>> arch/mips/loongson64/cop2-ex.c:283:38: error: ‘struct thread_struct’ has no member named ‘fpu’
>> arch/mips/loongson64/cop2-ex.c:301:38: error: ‘struct thread_struct’ has no member named ‘fpu’
>>
>> Fixes: ef2f826c8f2f ("MIPS: Loongson-3: Enable the COP2 usage")
> I suggest moving this config option to CPU_LOONGSON64.

Looks correct, thanks for the suggestion.

--
Jackie Liu

> 
> Huacai
> 
>> Reported-by: k2ci robot <kernel-bot@kylinos.cn>
>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>> ---
>>   arch/mips/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 24e374266fdc..1164c32fd87b 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -487,6 +487,7 @@ config MACH_LOONGSON64
>>          select ISA
>>          select I8259
>>          select IRQ_MIPS_CPU
>> +       select MIPS_FP_SUPPORT
>>          select NO_EXCEPT_FILL
>>          select NR_CPUS_DEFAULT_64
>>          select USE_GENERIC_EARLY_PRINTK_8250
>> --
>> 2.25.1
>>
