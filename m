Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFAF71D2E8F
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 13:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgENLmJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 07:42:09 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52152 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726067AbgENLmI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 07:42:08 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9mELr1ehaQ0AA--.10S3;
        Thu, 14 May 2020 19:41:56 +0800 (CST)
Subject: Re: [PATCH] MIPS: update tlb even if pte entry has no change
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>
References: <1589422677-11455-1-git-send-email-maobibo@loongson.cn>
 <b46f4ac1-9738-6037-d60a-faebf2b4365c@cogentembedded.com>
 <f165deac-1a71-dd88-dfe5-c1701f31567b@cogentembedded.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <6ea926de-042b-eb44-0e41-156e2bd64bd8@loongson.cn>
Date:   Thu, 14 May 2020 19:41:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f165deac-1a71-dd88-dfe5-c1701f31567b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxj9mELr1ehaQ0AA--.10S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JF18GrWUAFWfAry5KF45KFg_yoW3WrX_uF
        4j9F95Gw4YqrsxK3ZIyw1SqFZ09w4kCws5JayDGFykWw15K348uF1Uur4xX3Z0qas7Ar1x
        Wr4UWFWYyr13WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbaAYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
        c7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4I
        kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
        WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
        0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW3
        JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
        UvcSsGvfC2KfnxnUUI43ZEXa7IU85GYPUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/14/2020 05:37 PM, Sergei Shtylyov wrote:
> On 14.05.2020 12:35, Sergei Shtylyov wrote:
> 
>>> From: bibo mao <maobibo@loongson.cn>
>>>
>>> If there are two threads reading the same memory and tlb miss happens,
>>> one thread fills pte entry, the other reads new pte value during page fault
>>> handling. PTE value may be updated before page faul, so the process need
>>
>>     Fault.
> 
>    And "needs".
> 
>>> need update tlb still.
> 
>    Oh, and one "need" is enough. :-)

Thank for reviewing my patch, will fix this typo issue in next version.

Best Regards
bibo, mao

> 
>>> Also this patch define flush_tlb_fix_spurious_fault as empty, since it not
>>> necessary to flush the page for all CPUs
>>>
>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> [...]
> 
> MBR, Sergei

