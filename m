Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A1E1EDA46
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2020 03:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgFDBK1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jun 2020 21:10:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52210 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725983AbgFDBK0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Jun 2020 21:10:26 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axb+j8Sdhenks9AA--.3394S3;
        Thu, 04 Jun 2020 09:10:21 +0800 (CST)
Subject: Re: [GIT PULL] MIPS changes for v5.8-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20200602125445.GA12527@alpha.franken.de>
 <CAHk-=whtew82tj8_QLPU-xqT702vmB0pGgQSuQkK_Javnz6PPw@mail.gmail.com>
Cc:     linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   maobibo <maobibo@loongson.cn>
Message-ID: <b37df9de-adca-3639-bd11-b114ad2f1e76@loongson.cn>
Date:   Thu, 4 Jun 2020 09:10:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=whtew82tj8_QLPU-xqT702vmB0pGgQSuQkK_Javnz6PPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Axb+j8Sdhenks9AA--.3394S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1fGF4DuF1xXFyDtw4fXwb_yoW8Xw4xpF
        WSkF1Y9FsIva4xJF12qa97X3ZYk3s5KF43W3sYyry5u39xur1ftr4UJ3yaywn8Krs7C3W5
        tFWUW34DWFyDA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcVWlDUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 06/04/2020 05:00 AM, Linus Torvalds wrote:
> On Tue, Jun 2, 2020 at 5:55 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
>>
>> Bibo Mao (4):
>>       mm/memory.c: Add memory read privilege on page fault handling
> 
> Hmm. That's a horribly named commit, but can you clarify why this
> didn't just use the existing pte_mkyoung?
> 
> These are all paths that set the dirty bit early if it's a write, I
> don't see why they wouldn't set the accessed bit too.
> 
> Even on architectures that manage the accessed bit in hardware, this
> might be a (tiny) performance advantage because it avoids a page table
> walker microfault to set the bit when it's accessed.
On architectures that manage the access bit in hardware, access bit is
set at the beginning even if there is no memory access. On MIPS system
access bit is not set at the beginning, it is set in page fault handling.

There are two ways to solve this, one way is to set access bit in page
fault stage like mk_dirty for write accessing, this will bring out
one/two cycle performance penalty for other architectures. The other way
is to set access bit in the beginning like other architectures
even if there is no memory access.

I am ok with the former method, only that it will influence other arches
just one or two cycles. For the latter I am investigating why access bit
is not set at the beginning in MIPS system.

regards
bibo, mao

> 
> We already do the pte_mkyoung() in paths like cow_user_page(), so the
> others may have been just oversights?
> 
> Or was there possibly some reason we didn't want to do it here?
> 
>                 Linus
> 

