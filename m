Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCEF235702
	for <lists+linux-mips@lfdr.de>; Sun,  2 Aug 2020 15:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgHBNOW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Aug 2020 09:14:22 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39497 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728043AbgHBNOV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 2 Aug 2020 09:14:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKM0z2dLrz9sSG;
        Sun,  2 Aug 2020 23:14:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1596374059;
        bh=l8Vv313rJGqlK2PcaNCVrGcU8SJlDczW2rNrY770DTs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZE71Wyclmt4MQrTZPs6iY6nA2eek+wB/iYUyHxx7nWlyJbBID58C0vJfORjrDD43E
         wNND8mtfpDbimWptgmYv4VddxYAmX0rHolg1XVT+G8s2w1bA+8uHwFHNUayBhafmGn
         U3RDd9O7hEfPsfEFxg1WUJgbZZ35QUi0zip6yzBRdj0KvzX0aIma+XejtIevU686ru
         HM91WecXmsJTqK1azOcV4OJmJvhTYVRaSfqOgAvj1ip20Yb1FPEAys0j9IKpP3z8BI
         XGg3VJKFsWHrW1MkBYjbjQi72gF9zJZpWvDX1DLzzpzZpzoVYn1bqH1kWqIhbU7xhV
         gtswbHEE4eTGQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michal Simek <monstr@monstr.eu>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        clang-built-linux@googlegroups.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org,
        Hari Bathini <hbathini@in.ibm.com>
Subject: Re: [PATCH 06/15] powerpc: fadamp: simplify fadump_reserve_crash_area()
In-Reply-To: <20200801101854.GD534153@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org> <20200728051153.1590-7-rppt@kernel.org> <87d04d5hda.fsf@mpe.ellerman.id.au> <20200801101854.GD534153@kernel.org>
Date:   Sun, 02 Aug 2020 23:14:10 +1000
Message-ID: <87o8nt197h.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Mike Rapoport <rppt@kernel.org> writes:
> On Thu, Jul 30, 2020 at 10:15:13PM +1000, Michael Ellerman wrote:
>> Mike Rapoport <rppt@kernel.org> writes:
>> > From: Mike Rapoport <rppt@linux.ibm.com>
>> >
>> > fadump_reserve_crash_area() reserves memory from a specified base address
>> > till the end of the RAM.
>> >
>> > Replace iteration through the memblock.memory with a single call to
>> > memblock_reserve() with appropriate  that will take care of proper memory
>>                                      ^
>>                                      parameters?
>> > reservation.
>> >
>> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>> > ---
>> >  arch/powerpc/kernel/fadump.c | 20 +-------------------
>> >  1 file changed, 1 insertion(+), 19 deletions(-)
>> 
>> I think this looks OK to me, but I don't have a setup to test it easily.
>> I've added Hari to Cc who might be able to.
>> 
>> But I'll give you an ack in the hope that it works :)
>
> Actually, I did some digging in the git log and the traversal was added
> there on purpose by the commit b71a693d3db3 ("powerpc/fadump: exclude
> memory holes while reserving memory in second kernel")
> Presuming this is still reqruired I'm going to drop this patch and will
> simply replace for_each_memblock() with for_each_mem_range() in v2.

Thanks.

cheers
