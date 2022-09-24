Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8BFE5E8BAF
	for <lists+linux-mips@lfdr.de>; Sat, 24 Sep 2022 13:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiIXLJE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Sep 2022 07:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiIXLJD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Sep 2022 07:09:03 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACFBDDD84
        for <linux-mips@vger.kernel.org>; Sat, 24 Sep 2022 04:09:02 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MZR4J54V7z1P6gB;
        Sat, 24 Sep 2022 19:04:48 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 24 Sep 2022 19:08:59 +0800
Subject: Re: [PATCH 2/2] MIPS: IRQ: remove orphan allocate_irqno() declaration
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     <ralf@linux-mips.org>, <paul.burton@mips.com>,
        <linux-mips@vger.kernel.org>
References: <20220920130711.1107018-1-cuigaosheng1@huawei.com>
 <20220920130711.1107018-3-cuigaosheng1@huawei.com>
 <20220924094533.GB10288@alpha.franken.de>
From:   cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <9bac738b-4346-d2da-2b37-30d25ac5bc09@huawei.com>
Date:   Sat, 24 Sep 2022 19:08:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20220924094533.GB10288@alpha.franken.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> applied to mips-next. The patch didn't apply, because you alread removed
> alloc_legacy_irqno/free_irqno in your previous patch. I've fixed that
> while applying, but please you latest mips-next branch for creating
> patches next time.

Thanks for taking the time to review this patch, I checked my patches,you are
right, it is my negligence,Thanks again for reminding me!

On 2022/9/24 17:45, Thomas Bogendoerfer wrote:
> On Tue, Sep 20, 2022 at 09:07:11PM +0800, Gaosheng Cui wrote:
>> All uses of allocate_irqno() have been removed by
>> commit 69a07a41d908 ("MIPS: SGI-IP27: rework HUB interrupts"),
>> so remove the orphan declaration.
>>
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> ---
>>   arch/mips/include/asm/irq.h | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
>> index 57561e0e6e8d..2f47f56fca82 100644
>> --- a/arch/mips/include/asm/irq.h
>> +++ b/arch/mips/include/asm/irq.h
>> @@ -63,7 +63,6 @@ extern void do_domain_IRQ(struct irq_domain *domain, unsigned int irq);
>>   extern void arch_init_irq(void);
>>   extern void spurious_interrupt(void);
>>   
>> -extern int allocate_irqno(void);
>>   extern void alloc_legacy_irqno(void);
>>   extern void free_irqno(unsigned int irq);
>>   
>> -- 
>> 2.25.1
> applied to mips-next. The patch didn't apply, because you alread removed
> alloc_legacy_irqno/free_irqno in your previous patch. I've fixed that
> while applying, but please you latest mips-next branch for creating
> patches next time.
>
> Thomas.
>
