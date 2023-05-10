Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E946FE1A0
	for <lists+linux-mips@lfdr.de>; Wed, 10 May 2023 17:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237217AbjEJPep (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 May 2023 11:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236614AbjEJPeo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 May 2023 11:34:44 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B8930D4
        for <linux-mips@vger.kernel.org>; Wed, 10 May 2023 08:34:41 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-966287b0f72so894025366b.0
        for <linux-mips@vger.kernel.org>; Wed, 10 May 2023 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683732879; x=1686324879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzhn1S4hfKcOd1E/ek0bvXDc8iMvqfYzj4agdzIw7zg=;
        b=Q1Iq6Mvl9euKPlQq9YrLRwqzQDKPrHKEWu71SdDTJSqxaKjPyoa03lk0d1hZqzCZKS
         p11hBeUuXhAt2aVKw1c+E0KBn953DhVFdilX5/Eg5Yt09l9ep2DZwY5T71tNwuOhBMux
         btdGQiPTjpgtmYJESYEzq5/TRDvfD8vAOu+HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683732879; x=1686324879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzhn1S4hfKcOd1E/ek0bvXDc8iMvqfYzj4agdzIw7zg=;
        b=N7uq8ZFz1n8x3hxiQPhctKa8FM2EUknWvQmhQut62UHra6cfviz+SpeENxxwQHlRZe
         fGvoxygITT2SWrdtMiZBTlJ6BApCELOwQiWJFaP/Ke2Pt1FTGNO667gNqfbhayNY10CD
         Sd7k/qfdbus+mljgRRu5aA4nxUcKApBkfSNyjdtwvLdJRCjHkyKteIKXka0aY/gV7fpd
         SBJwK0XyLFsx0jt88OuVZGR9+6wX3DBSuXYgT+rKcFYiaa47m30obyvK5gFUsJQ6J1NP
         PZEJFghzWF0xJRFQBsrKNERu9aSwY7iFdo452I+BKZH2F7I6szr+x8lyI5LyCrKOE0ll
         +UMQ==
X-Gm-Message-State: AC+VfDwK42tS0MdX4RJ5OZibAQ5fh4s8Ou/3e+86cIY8ofZ/oBSRxgO4
        cuQSVw7ZKLheJ50Ue5dRzLOZge3w7VaU/IcW2v0/RQ==
X-Google-Smtp-Source: ACHHUZ74F5SMHC/sCjfqu10oIF2ltYCPpzUCzP++w4F7ezl6CGF5LVXLDEQBH48OVKw27W/O1/+Ftw==
X-Received: by 2002:a17:906:6a22:b0:966:3de0:8998 with SMTP id qw34-20020a1709066a2200b009663de08998mr12467097ejc.73.1683732879439;
        Wed, 10 May 2023 08:34:39 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id d19-20020a1709061f5300b009596e7e0dbasm2771859ejk.162.2023.05.10.08.34.39
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 08:34:39 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f2548256d0so119855e9.1
        for <linux-mips@vger.kernel.org>; Wed, 10 May 2023 08:34:39 -0700 (PDT)
X-Received: by 2002:a05:600c:600f:b0:3f1:6fe9:4a98 with SMTP id
 az15-20020a05600c600f00b003f16fe94a98mr178073wmb.5.1683732511119; Wed, 10 May
 2023 08:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
In-Reply-To: <20230419225604.21204-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 10 May 2023 08:28:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
Message-ID: <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] arm64: Add framework to turn an IPI as NMI
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     ito-yuichi@fujitsu.com, kgdb-bugreport@lists.sourceforge.net,
        Chen-Yu Tsai <wens@csie.org>,
        Masayoshi Mizuma <msys.mizuma@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <swboyd@chromium.org>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-perf-users@vger.kernel.org,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Ben Dooks <ben-linux@fluff.org>,
        Borislav Petkov <bp@alien8.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Darrick J. Wong" <djwong@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jinyang He <hejinyang@loongson.cn>,
        Joey Gouly <joey.gouly@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
        Pierre Gondois <Pierre.Gondois@arm.com>,
        Qing Zhang <zhangqing@loongson.cn>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
        x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Wed, Apr 19, 2023 at 3:57=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> This is an attempt to resurrect Sumit's old patch series [1] that
> allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
> also to round up CPUs in kdb/kgdb. The last post from Sumit that I
> could find was v7, so I called this series v8. I haven't copied all of
> his old changelongs here, but you can find them from the link.
>
> Since v7, I have:
> * Addressed the small amount of feedback that was there for v7.
> * Rebased.
> * Added a new patch that prevents us from spamming the logs with idle
>   tasks.
> * Added an extra patch to gracefully fall back to regular IPIs if
>   pseudo-NMIs aren't there.
>
> Since there appear to be a few different patches series related to
> being able to use NMIs to get stack traces of crashed systems, let me
> try to organize them to the best of my understanding:
>
> a) This series. On its own, a) will (among other things) enable stack
>    traces of all running processes with the soft lockup detector if
>    you've enabled the sysctl "kernel.softlockup_all_cpu_backtrace". On
>    its own, a) doesn't give a hard lockup detector.
>
> b) A different recently-posted series [2] that adds a hard lockup
>    detector based on perf. On its own, b) gives a stack crawl of the
>    locked up CPU but no stack crawls of other CPUs (even if they're
>    locked too). Together with a) + b) we get everything (full lockup
>    detect, full ability to get stack crawls).
>
> c) The old Android "buddy" hard lockup detector [3] that I'm
>    considering trying to upstream. If b) lands then I believe c) would
>    be redundant (at least for arm64). c) on its own is really only
>    useful on arm64 for platforms that can print CPU_DBGPCSR somehow
>    (see [4]). a) + c) is roughly as good as a) + b).
>
> [1] https://lore.kernel.org/linux-arm-kernel/1604317487-14543-1-git-send-=
email-sumit.garg@linaro.org/
> [2] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lecop=
zer.chen@mediatek.com/
> [3] https://issuetracker.google.com/172213097
> [4] https://issuetracker.google.com/172213129
>
> Changes in v8:
> - dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param
> - dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param
> - Add loongarch support, too
> - Removed "#ifdef CONFIG_SMP" since arm64 is always SMP
> - "Tag the arm64 idle functions as __cpuidle" new for v8
> - "Provide a stub kgdb_nmicallback() if !CONFIG_KGDB" new for v8
> - "Fallback to a regular IPI if NMI isn't enabled" new for v8
>
> Douglas Anderson (3):
>   arm64: idle: Tag the arm64 idle functions as __cpuidle
>   kgdb: Provide a stub kgdb_nmicallback() if !CONFIG_KGDB
>   arm64: ipi_nmi: Fallback to a regular IPI if NMI isn't enabled
>
> Sumit Garg (7):
>   arm64: Add framework to turn IPI as NMI
>   irqchip/gic-v3: Enable support for SGIs to act as NMIs
>   arm64: smp: Assign and setup an IPI as NMI
>   nmi: backtrace: Allow runtime arch specific override
>   arm64: ipi_nmi: Add support for NMI backtrace
>   kgdb: Expose default CPUs roundup fallback mechanism
>   arm64: kgdb: Roundup cpus using IPI as NMI
>
>  arch/arm/include/asm/irq.h       |   2 +-
>  arch/arm/kernel/smp.c            |   3 +-
>  arch/arm64/include/asm/irq.h     |   4 ++
>  arch/arm64/include/asm/nmi.h     |  17 +++++
>  arch/arm64/kernel/Makefile       |   2 +-
>  arch/arm64/kernel/idle.c         |   4 +-
>  arch/arm64/kernel/ipi_nmi.c      | 103 +++++++++++++++++++++++++++++++
>  arch/arm64/kernel/kgdb.c         |  18 ++++++
>  arch/arm64/kernel/smp.c          |   8 +++
>  arch/loongarch/include/asm/irq.h |   2 +-
>  arch/loongarch/kernel/process.c  |   3 +-
>  arch/mips/include/asm/irq.h      |   2 +-
>  arch/mips/kernel/process.c       |   3 +-
>  arch/powerpc/include/asm/nmi.h   |   2 +-
>  arch/powerpc/kernel/stacktrace.c |   3 +-
>  arch/sparc/include/asm/irq_64.h  |   2 +-
>  arch/sparc/kernel/process_64.c   |   4 +-
>  arch/x86/include/asm/irq.h       |   2 +-
>  arch/x86/kernel/apic/hw_nmi.c    |   3 +-
>  drivers/irqchip/irq-gic-v3.c     |  29 ++++++---
>  include/linux/kgdb.h             |  13 ++++
>  include/linux/nmi.h              |  12 ++--
>  kernel/debug/debug_core.c        |   8 ++-
>  23 files changed, 217 insertions(+), 32 deletions(-)

It's been 3 weeks and I haven't heard a peep on this series. That
means nobody has any objections and it's all good to land, right?
Right? :-P

Seriously, though, I really think we should figure out how to get this
landed. There's obviously interest from several different parties and
I'm chomping at the bit waiting to spin this series according to your
wishes. I also don't think there's anything super scary/ugly here. IMO
the ideal situation is that folks are OK with the idea presented in
the last patch in the series ("arm64: ipi_nmi: Fallback to a regular
IPI if NMI isn't enabled") and then I can re-spin this series to be
_much_ simpler. That being said, I'm also OK with dropping that patch
and starting the discussion for how to land the rest of the patches in
the series.

Please let me know!

-Doug
