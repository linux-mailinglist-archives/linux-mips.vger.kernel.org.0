Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752EF2049E2
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 08:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730774AbgFWG1s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 02:27:48 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40904 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730447AbgFWG1r (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Jun 2020 02:27:47 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axlum8oPFe+6JIAA--.11077S3;
        Tue, 23 Jun 2020 14:27:08 +0800 (CST)
Subject: Re: [PATCH] MIPS: Do not flush tlb when setting pmd entry
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1591177333-17833-1-git-send-email-maobibo@loongson.cn>
 <20200615101443.GA10075@alpha.franken.de>
 <4bef403d-baba-ddf8-c25c-3d6968897a53@loongson.cn>
 <20200617111403.GC9940@alpha.franken.de>
 <ea914a82-70c1-b9a3-f6f0-f92a6d6c6e7f@loongson.cn>
 <20200622154855.GC17294@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <a121b9c0-2c35-a895-6874-bdea3a6b0452@loongson.cn>
Date:   Tue, 23 Jun 2020 14:27:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200622154855.GC17294@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Axlum8oPFe+6JIAA--.11077S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CryrXFykuF4rGw1rZFWfAFb_yoW8AFy7pa
        sFka1vyF1DJw40yr1Ivw1rtr1aq34UtrW3Wr98GrW5Aas0grn7Kr43Kw4YkasrurWfCw42
        va10gFya934DA3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWU
        AwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AK
        xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
        xUcVWlDUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 06/22/2020 11:48 PM, Thomas Bogendoerfer wrote:
> On Sat, Jun 20, 2020 at 11:47:35AM +0800, maobibo wrote:
>>
>>
>> On 06/17/2020 07:14 PM, Thomas Bogendoerfer wrote:
>>> On Tue, Jun 16, 2020 at 06:34:21PM +0800, maobibo wrote:
>>>>
>>>>
>>>> On 06/15/2020 06:14 PM, Thomas Bogendoerfer wrote:
>>>>> On Wed, Jun 03, 2020 at 05:42:13PM +0800, Bibo Mao wrote:
>>>>>> Function set_pmd_at is to set pmd entry, if tlb entry need to
>>>>>> be flushed, there exists pmdp_huge_clear_flush alike function
>>>>>> before set_pmd_at is called. So it is not necessary to call
>>>>>> flush_tlb_all in this function.
>>>>>
>>>>> have you checked all set_pmd_at() calls ? I found a few case where
>>>>> it's not clear to me, if tlb flushing is done... If you think this
>>>>> is still the right thing to do, please change arch/mips/mm/pgtable-32.c
>>>>> as well.
>>>> well, I will double check this and do more testing about thp and hugepage.
>>>
>>> I was more concerned about
>>>
>>> fs/dax.c
>>> fs/proc/task_mmu.c
>>> mm/rmap.c
>>
>> I think that flush_tlb_all should not be called in function set_pmd_at
>> on mips platform. However update_mmu_cache_pmd() should be called __after__
>> set_pmd_at() function to update tlb entry at some places, it is another issue.
>> Here is my analysis in the three files where set_pmd_at is called.
>> [..]
> 
> thank you for confirming that we are good with removing flush_tlb_all().
Sorry, there is something wrong if remove flush_tlb_all(). If pmd_none is true,
pmd points to invalid_pte_table, maybe there exists pte entry with normal page size
for fault address. And we need invalidate this pte entry like it is done in function build_huge_handler_tail in file arch/mips/mm/tlbex.c

I will send another patch.
> 
> Thomas.
> 

