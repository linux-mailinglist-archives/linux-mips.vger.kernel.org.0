Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE05A327626
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 03:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbhCACrK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Feb 2021 21:47:10 -0500
Received: from mail.loongson.cn ([114.242.206.163]:45814 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231833AbhCACrG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 28 Feb 2021 21:47:06 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj_F1VTxg4AoSAA--.6613S3;
        Mon, 01 Mar 2021 10:46:14 +0800 (CST)
Subject: Re: [Question] How to save_stack_trace_tsk_reliable() on mips?
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
References: <a0823990-420f-8091-7866-8ad588ef542d@loongson.cn>
 <alpine.DEB.2.21.2103010043260.44210@angie.orcam.me.uk>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <b0b701ce-5a24-64c6-1124-3af69fb07a08@loongson.cn>
Date:   Mon, 1 Mar 2021 10:46:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2103010043260.44210@angie.orcam.me.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxj_F1VTxg4AoSAA--.6613S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4Dur4xtF18uFy5WFyUWrg_yoW5GrW7pr
        s0kFnIywnFq34IvF1rXw4xJFyrZ395Gry3GF1Ut347uwn8GryIvr4SkFWjvas8ur1kXa12
        gr1Yv3s8WFZ0y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr
        0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
        IFyTuYvjxUy5x6UUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/01/2021 08:10 AM, Maciej W. Rozycki wrote:

> On Thu, 4 Feb 2021, Jinyang He wrote:
>
>> Excuse me. Here is a question mail. How to get a reliable stack
>> of tasks on mips?
>   You need stack unwinding information.  High-level programming language
> exception handling uses that too.  The information is in the DWARF format,
> also used for debugging, and stored in a separate section within the ELF
> module in question (for debugging it can be stored separately, but for
> exception handling obviously it cannot, as the runtime needs to have it
> mapped in memory and accessible without referring to other files).
>
>> First, why save_stack_trace_tsk() to get stack is unreliable? Is it
>> because the asm code does not obey with gcc's stack rules, or others?
>   The stack frame as specified by the MIPS psABI does not have a fixed
> format, so it is not possible to interpret its contents by just examining
> them without additional information.
>
>> Secondly, can we use some methods to make the task stack reliable? For
>> example, use the fp register, can this method work? But it seems make
>> no sense for asm code unless each asm code do some fp work.
>   The use of a hard frame pointer register does not change anything,
> because the variable stack frame format does not provide the information
> as to where exactly the previous frame pointer or the return address have
> been stored.  You still need additional information.
>
>> I found that the powerpc implemented save_stack_trace_tsk_reliable(),
>> and the x86 and s390 implemented the arch_stack_walk_reliable(). x86
>> implemented it through ORC unwind. For powerpc, it may implement it
>> through its ABI (I guess, I'm not familiar with them). Do we have a
>> chance to implement it in some way?
>   I worked with the Power psABI and it has a fixed stack frame format where
> you can figure out the location of the previous frame pointer and the link
> register from the current frame pointer.  This is enough information to be
> able to backtrace.  ISTR x86 has a similar stack frame design, though I'm
> not sure offhand how the case of `-fomit-frame-pointer' code is handled.
> No idea as to the S/390, but I guess it follows the pattern.
>
>> Finally, I found that some emails related to ORC unwind on ARM from the
>> livepatch mail list. It is difficult for me to understand. Is anyone
>> interested in ORC unwind on MIPS and have researched it?
>   I can't comment on this part, I don't know what ORC is.
>
>   HTH,
>
>    Maciej

Thank you for answering patiently. You are always so enthusiastic.
These are very helpful to me. :-)

Thanks,
Jinyang

