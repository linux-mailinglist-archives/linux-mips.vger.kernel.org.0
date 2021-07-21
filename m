Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE943D06A1
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 04:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhGUBcA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 21:32:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53970 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231392AbhGUBbi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Jul 2021 21:31:38 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [89.187.161.155])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax2uBsgvdgXy0iAA--.23716S2;
        Wed, 21 Jul 2021 10:11:59 +0800 (CST)
Date:   Wed, 21 Jul 2021 10:11:54 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     Linux/MIPS <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [RFC]: Maybe revert 'MIPS: add PMD table accounting into
 MIPS'pmd_alloc_one' from 5.4 LTS?
Message-ID: <20210721021154.dlyrrtljz2hrlqng@ambrosehua-HP-xw6600-Workstation>
References: <370c2578-5032-08d6-9f48-c2f284a9b62d@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <370c2578-5032-08d6-9f48-c2f284a9b62d@gentoo.org>
X-CM-TRANSID: AQAAf9Ax2uBsgvdgXy0iAA--.23716S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr17JFy7XF1kJryDGF47twb_yoW5Ww4kpF
        Z5WFyrtws5J3WvvwsFyrnY9FyUAw4xJayUW3WFy34rZwn8XryktFySqFZ0vayDWwn5X3y2
        qr4xKF1FkrZYvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAF-wCF04k20xvY
        0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
        0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
        cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
        CF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUYPR67UUUUU==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 20, 2021 at 08:45:45PM -0400, Joshua Kinard wrote:
Hi, 
> (resend using the correct list address)
> 
> Hi all,
> 
> I think there may be an issue with upstream commit
> ed914d48b6a1040d1039d371b56273d422c0081e (MIPS: add PMD table accounting
> into MIPS'pmd_alloc_one), which got backported to 5.4 LTS.
> 
> I am running my SGI Octane on the 5.4 LTS kernel series w/ Gentoo's IP30
> patches, since basic IP30 support didn't get fully mainlined until ~5.7 and
> I am just behind on kernels for the time being.  Generally, the 5.4 series
> is stable on this machine, but as of using 5.4.133 yesterday and 5.4.134
> today, I have had three kernel panics, all with completely different stack
> traces, while building a multilib-enabled glibc-2.33 package.
> 
> Since the stack traces are all completely different, I am suspecting an
> issue with memory allocation, which picking through the 5.4.133 changelog,
> got me to look at commit ed914d48b6a1.  My initial thought is it looks like
> this patch should not have been backported to 5.4, because 5.4 is missing
> the asm-generic version of pmd_free(), which means the MIPS-specific version
> is likely used instead, and that function was not updated alongside
> pmd_alloc_one().
> 
> Now, I am not a memory person, but some quick reading indicates there may be
> some other issues with this patch as well:
> 
> - use of 'GFP_KERNEL | __GFP_ACCOUNT' when there is GFP_KERNEL_ACCOUNT
> available.
Yes, this is better
> 
> - the return value of pgtable_pmd_page_ctor(pg); is not checked to make sure
> it succeeded.  Per Documentation/vm/split_page_table_lock, "NOTE:
> pgtable_page_ctor() and pgtable_pmd_page_ctor() can fail -- it must
> be handled properly."

Yes, I missed this one
> 
> - there is no call to pgtable_pmd_page_dtor() in pmd_free() in MIPS'
> pgalloc.  The commit message indicates that pmd_free in asm-generic will
> handle this, but that function doesn't exist in 5.4, leading to mismatched
> implementations.

Yes, my fix is to fix the mismatch. 

I think all stable branches before 5.10 should *not* apply this my patch
> 
> I think the fix is to either revert ed914d48b6a1 on the 5.4 stable series
> (and any earlier series that are missing asm-generic pmd_free), or the MIPS
> pmd_free() needs to be updated to call pgtable_pmd_page_dtor() in a similar
> manner to x86 and arm64.  I'd opt for reverting.
> 
> Currently testing a build of 5.4.134 with this patch reverted running some
> compile jobs.  If it survives building multilib glibc, then I think my
> suspicions may be valid.
> 
> -- 
> Joshua Kinard
> Gentoo/MIPS
> kumba@gentoo.org
> rsa6144/5C63F4E3F5C6C943 2015-04-27
> 177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943
> 
> "The past tempts us, the present confuses us, the future frightens us.  And
> our lives slip away, moment by moment, lost in that vast, terrible in-between."
> 
> --Emperor Turhan, Centauri Republic

