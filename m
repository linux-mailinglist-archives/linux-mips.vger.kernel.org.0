Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27873EE91E
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 11:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235129AbhHQJFw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Aug 2021 05:05:52 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:58974 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235050AbhHQJFv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Aug 2021 05:05:51 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1629191116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=h4rDVKC+Cig7m3xrIRgqVLj8IdJaOZ1ObGCJVkGcNt4=;
        b=odLfgZuMLpVW4wOCEZ0qU4A6XKBQ6JX+YLyVpIniKQG0GHNBwBrPMNlnPBeG+Bu0tWHVqO
        1nxE6f5F5yZDAhceJsET44lC3nv6xV8735K2OPXWZDgllmghguHeGtAQpDXXUsqJVWmVLF
        y79Uno4fHN5dqr1sehR0n0BVUJT6Gxh1ZSPJ9KiMbgsCaCGxgfLKeLiCqaER8UNo1CbPmd
        tQ6kMjxBbKRNagSTBtx5yoEPdSqsSwxwnM2BjX216VBCYwfx7P7JIuPZZm0EWCRDhc0Rdo
        4mTXf2RhmKzzAqIOYP1NtKBJUDxQKRe1+ze7xiWKCdnUgytOd+H5Dfy8RWjN4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1629191116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=h4rDVKC+Cig7m3xrIRgqVLj8IdJaOZ1ObGCJVkGcNt4=;
        b=H7DFK2bcDGTY3IjixorH7UfN4jbCuDL72oWwf7ybZEHRzBOik358rcbpV7G60GI7ivAZVY
        8gM6PKfptYwnhICQ==
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     Davidlohr Bueso <dave@stgolabs.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hongchen Zhang <zhanghongchen@loongson.cn>
Subject: Re: [PATCH] futex: Fix fault_in_user_writeable()
In-Reply-To: <CAAhV-H6=MbBFwgxT75Bqr5SY0e5E6gtpCUCZhrVgFE_h1A0q2A@mail.gmail.com>
References: <20210816065417.3987596-1-chenhuacai@loongson.cn>
 <20210816182750.26i535ilc6nef5k6@offworld> <874kbpp5zd.ffs@tglx>
 <CAAhV-H5TKLMi0GSQmh9RFK_k5eNRwx8AE8MjMKjJfbnyVYP-+w@mail.gmail.com>
 <871r6spn0r.ffs@tglx>
 <CAAhV-H6=MbBFwgxT75Bqr5SY0e5E6gtpCUCZhrVgFE_h1A0q2A@mail.gmail.com>
Date:   Tue, 17 Aug 2021 11:05:15 +0200
Message-ID: <87y290o304.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Huacai,

On Tue, Aug 17 2021 at 15:38, Huacai Chen wrote:
> On Tue, Aug 17, 2021 at 3:07 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> On X86, it returns 0; on MIPS64 without patch, it hangs in kernel; on
> MIPS64 with this patch, it returns -1.

As expected.

> Then, I want to know, on "W implies R" archs (such as X86), should it
> return 0? Maybe return -1 is more reasonable? (because the VMA is
> marked as write-only). If this program should return -1, then I don't
> think this is a MIPS-specific problem.

No. mmap(.., PROT_WRITE...) is simply impossible on x86 and implies
PROT_READ as documented in mmap(2).

So why should this fail and only fail in the fault case, but succeed
when the PTE is already established?

Thanks,

        tglx
