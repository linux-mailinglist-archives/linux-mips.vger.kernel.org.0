Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35DC7253BDC
	for <lists+linux-mips@lfdr.de>; Thu, 27 Aug 2020 04:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgH0Cb5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Aug 2020 22:31:57 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45328 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726826AbgH0Cb5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 26 Aug 2020 22:31:57 -0400
Received: from [10.130.0.60] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9wFG0dfEnYOAA--.427S3;
        Thu, 27 Aug 2020 10:31:35 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson: Fix complie errors without CONFIG_SMP
To:     Matthew Wilcox <willy@infradead.org>
References: <1598446407-8845-1-git-send-email-hejinyang@loongson.cn>
 <20200826130122.GR17456@casper.infradead.org>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   hejinyang <hejinyang@loongson.cn>
Message-ID: <5394f030-104c-f191-e581-4f1ed23a85a6@loongson.cn>
Date:   Thu, 27 Aug 2020 10:31:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200826130122.GR17456@casper.infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxj9wFG0dfEnYOAA--.427S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw43tr43uF18Ww1kGr47twb_yoW3ZwcEgw
        4Du3W8JF13XFyvgFZFg3y8Zr4qgF4UWasrGw1rur12934Yqr95XayktrZxuFn8u3y5XrZ7
        WF4S9FyFvanavjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbx8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
        AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
        c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
        AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWU
        JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHU
        DUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 08/26/2020 09:01 PM, Matthew Wilcox wrote:
> On Wed, Aug 26, 2020 at 08:53:27PM +0800, Jinyang He wrote:
>> +++ b/arch/mips/include/asm/mach-loongson64/topology.h
>> @@ -4,7 +4,11 @@
>>   
>>   #ifdef CONFIG_NUMA
>>   
>> +#ifdef CONFIG_SMP
>>   #define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
>> +#else
>> +#define cpu_to_node(cpu)	0
>> +#endif
> Are you saying you've enabled NUMA without enabling SMP?  Does that make
> sense?

NUMA option normally work with more than two nodes, though Loongson64 use it
default after patch 6fbde6b492dfc761ad60a68fb2cb32b1eb05b786. Loongson64(3A)'s
each node consists of 4 cpus while it only has 4 cpus. In other words, it has
only one node while open NUMA. I'm confused it if NUMA deponds on SMP.

I'll try fix it with unabling NUMA and SMP later.

Thanks.:-)

