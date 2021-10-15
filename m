Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818D842F1AF
	for <lists+linux-mips@lfdr.de>; Fri, 15 Oct 2021 15:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235765AbhJONJB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Oct 2021 09:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235689AbhJONJB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Oct 2021 09:09:01 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E09EC061570;
        Fri, 15 Oct 2021 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=GcG/LD4wXLRkh+mkTSYxktAgp6NtEFjg5wt7NUrIBQ8=; b=uayJR1a282ytfFfr7pGkZzKhEI
        IluB/YpfG7Onwx7r1QjKfC1tsftLKfxav3VC38k67GpIyk/1ybeAGQUxvDR+zHqr8EKJVPlRZBA9/
        /wpTA2a/mIgs+KwDypwHUlt5exYlO5YauSTxiForL6Zk2ddG+l9BfoSzKxtnDQxKPvn5PwybVyKMr
        2sXVB6PGJ0CaomGm5OmpmwcYJjrxCbBh03Lz6TD+0UpZALAbk0Ks+Tm2EO0gwNMexvTrd+iVHfAOl
        L1EzBGZvN5/X+htNwR68fjDLwpfpBBFno+c1d7bIoN6mV3eoharT65WSKmRRs2o1NAkDG7hXrV1hK
        6PnwqnJg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mbMtI-0091pf-5y; Fri, 15 Oct 2021 13:05:05 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1918F300577;
        Fri, 15 Oct 2021 15:04:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C9DB5212B43C0; Fri, 15 Oct 2021 15:04:50 +0200 (CEST)
Date:   Fri, 15 Oct 2021 15:04:50 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Valentin Schneider <valentin.schneider@arm.com>
Cc:     Barry Song <21cnbao@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, Aubrey Li <aubrey.li@linux.intel.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        YiFei Zhu <yifeifz2@illinois.edu>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Sergei Trofimovich <slyfox@gentoo.org>,
        David Hildenbrand <david@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Chris Down <chris@chrisdown.name>,
        Vipin Sharma <vipinsh@google.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Frederic Weisbecker <frederic@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/2] sched: Centralize SCHED_{SMT, MC, CLUSTER}
 definitions
Message-ID: <YWl8cogsS2Lah1mk@hirez.programming.kicks-ass.net>
References: <20211008115347.425234-1-valentin.schneider@arm.com>
 <20211008115347.425234-3-valentin.schneider@arm.com>
 <CAGsJ_4wqtcOdsFDzR98PFbjxRyTqzf7P3p3erup84SXESYonYw@mail.gmail.com>
 <87bl3zlex8.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bl3zlex8.mognet@arm.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 08, 2021 at 04:22:27PM +0100, Valentin Schneider wrote:

> So x86 has it default yes, and a lot of others (e.g. arm64) have it default
> no.
> 
> IMO you don't gain much by disabling them. SCHED_MC and SCHED_CLUSTER only
> control the presence of a sched_domain_topology_level - if it's useless it
> gets degenerated at domain build time. Some valid reasons for not using
> them is if the architecture defines its own topology table (e.g. powerpc
> has CACHE and MC levels which are not gated behind any CONFIG).
> 
> SCHED_SMT has an impact on code generated in sched/core.c, but that is also
> gated by a static key.
> 
> So I'd say having them default yes is sensible. I'd even say we should
> change the "If unsure say N here." to "Y".

Right, so I tend to agree (and also that we should fix that Kconfig help
text). But it would be very nice to have feedback from the affected arch
maintainers.

