Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC9829F8F7
	for <lists+linux-mips@lfdr.de>; Fri, 30 Oct 2020 00:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgJ2XRk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Oct 2020 19:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgJ2XRi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Oct 2020 19:17:38 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE7CC0613CF
        for <linux-mips@vger.kernel.org>; Thu, 29 Oct 2020 16:17:37 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id k3so6079657ejj.10
        for <linux-mips@vger.kernel.org>; Thu, 29 Oct 2020 16:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OAaBl/U7PBG+TlUp0N4qfJ0eDW1D/8YEA2bXCC674us=;
        b=SyS4SffxYsNmj61H9VhYyfV30AKVcQI02I05R1QJ0WmBmFSO+bnQWo+8WU1Xmtdngw
         /WCUakc82ksJGHGKm7uLpuzRi56V0rh71ThvreQzsj4AGwhIaWOkntvIB7PKONmne7aI
         RS+5JSoq7Rynp7XqZeCI4Lh5y/aQJhenniqh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OAaBl/U7PBG+TlUp0N4qfJ0eDW1D/8YEA2bXCC674us=;
        b=Ac6VlIrSpKYyFEQ1GU0Vna9lspH4GOBz8mhC3xnQ08pB/S90vyY05gU7J9K4CXC5RU
         njFAGkv506N4Y7dOUhIsEDf8HlGDcOJ46HYHCr5DFUwOA29wbsoQ/WRMk2ikx/5uyD4A
         3sOmNtj+54vXIk0RuFr1m2BC43T7sHXNt5eKvPiP5hePp7wVjDtgPpF6TP3MnSMwXPR/
         FhZnFurhHF50w17Rto1/j5hFrKX56H2trQmdba4B4zdMCU6p/t9c4cbuuKGupX3jY9kA
         7sKei1PkzYFpFPOnN6YuszkMtY35l++PCBp5uB+XReYVNRrF2+g0SEOOQn4WvUqxtke1
         d8PA==
X-Gm-Message-State: AOAM5315XLLGbNjTfJEW4U4bHwYh/RkZSIjWC+/UkQ48xqcpdKjsF3KD
        yqU0PEumlGy3jt6cwxDO3GpZuoxXw5ZZkg==
X-Google-Smtp-Source: ABdhPJyvosE0Vxzf2nIIK1cqNn7KCC9EI/ZPs/JhHsqNV+oQVAHZz2LiNsNTgZ3spfZ6cuLd5sqvMQ==
X-Received: by 2002:a17:906:f185:: with SMTP id gs5mr6327678ejb.107.1604013456215;
        Thu, 29 Oct 2020 16:17:36 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id m11sm2264766edv.14.2020.10.29.16.17.35
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 16:17:36 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id oq3so4243910ejb.7
        for <linux-mips@vger.kernel.org>; Thu, 29 Oct 2020 16:17:35 -0700 (PDT)
X-Received: by 2002:a2e:8815:: with SMTP id x21mr3018764ljh.312.1604013088281;
 Thu, 29 Oct 2020 16:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de>
In-Reply-To: <20201029221806.189523375@linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 29 Oct 2020 16:11:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
Message-ID: <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic & friends
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Paul McKenney <paulmck@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Christoph Hellwig <hch@lst.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-sparc <sparclinux@vger.kernel.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 29, 2020 at 3:32 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
>
> Though I wanted to share the current state of affairs before investigating
> that further. If there is consensus in going forward with this, I'll have a
> deeper look into this issue.

Me likee. I think this looks like the right thing to do.

I didn't actually apply the patches, but just from reading them it
_looks_ to me like you do the migrate_disable() unconditionally, even
if it's not a highmem page..

That sounds like it might be a good thing for debugging, but not
necessarily great in general.

Or am I misreading things?

                Linus
