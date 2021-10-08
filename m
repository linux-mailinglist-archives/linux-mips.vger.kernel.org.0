Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013C3426D6C
	for <lists+linux-mips@lfdr.de>; Fri,  8 Oct 2021 17:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242883AbhJHPYe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 11:24:34 -0400
Received: from foss.arm.com ([217.140.110.172]:58598 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242780AbhJHPYd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 Oct 2021 11:24:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF3811063;
        Fri,  8 Oct 2021 08:22:37 -0700 (PDT)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B44F3F66F;
        Fri,  8 Oct 2021 08:22:29 -0700 (PDT)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Barry Song <21cnbao@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Aubrey Li <aubrey.li@linux.intel.com>,
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
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
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
Subject: Re: [PATCH 2/2] sched: Centralize SCHED_{SMT, MC, CLUSTER} definitions
In-Reply-To: <CAGsJ_4wqtcOdsFDzR98PFbjxRyTqzf7P3p3erup84SXESYonYw@mail.gmail.com>
References: <20211008115347.425234-1-valentin.schneider@arm.com> <20211008115347.425234-3-valentin.schneider@arm.com> <CAGsJ_4wqtcOdsFDzR98PFbjxRyTqzf7P3p3erup84SXESYonYw@mail.gmail.com>
Date:   Fri, 08 Oct 2021 16:22:27 +0100
Message-ID: <87bl3zlex8.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/10/21 01:37, Barry Song wrote:
> On Sat, Oct 9, 2021 at 12:54 AM Valentin Schneider
> <valentin.schneider@arm.com> wrote:
>>
>> Barry recently introduced a new CONFIG_SCHED_CLUSTER, and discussions
>> around that highlighted that every architecture redefines its own help text
>> and dependencies for CONFIG_SCHED_SMT and CONFIG_SCHED_MC.
>>
>> Move the definition of those to scheduler's Kconfig to centralize help text
>> and generic dependencies (i.e. SMP). Make them depend on a matching
>> ARCH_SUPPORTS_SCHED_* which the architectures can select with the relevant
>> architecture-specific dependency.
>>
>> s390 uses its own topology table (set_sched_topology()) and doesn't seem to
>> cope without SCHED_MC or SCHED_SMT, so those remain untogglable.
>>
>
> Hi Valentin,
> Thanks!
> I believe this is a cleaner way for Kconfig itself. But I am not quite sure this
> is always beneficial of all platforms. It would be perfect if the patch has no
> side effects and doesn't change the existing behaviour. But it has side effects
> by changing the default N to Y on a couple of platforms.
>

So x86 has it default yes, and a lot of others (e.g. arm64) have it default
no.

IMO you don't gain much by disabling them. SCHED_MC and SCHED_CLUSTER only
control the presence of a sched_domain_topology_level - if it's useless it
gets degenerated at domain build time. Some valid reasons for not using
them is if the architecture defines its own topology table (e.g. powerpc
has CACHE and MC levels which are not gated behind any CONFIG).

SCHED_SMT has an impact on code generated in sched/core.c, but that is also
gated by a static key.

So I'd say having them default yes is sensible. I'd even say we should
change the "If unsure say N here." to "Y".
