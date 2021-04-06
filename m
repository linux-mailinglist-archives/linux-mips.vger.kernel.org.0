Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C6A3554D3
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 15:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243641AbhDFNSx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 09:18:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:59104 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243603AbhDFNSu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 09:18:50 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lTlbK-0006qP-01; Tue, 06 Apr 2021 15:18:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CDF68C24D9; Tue,  6 Apr 2021 15:02:04 +0200 (CEST)
Date:   Tue, 6 Apr 2021 15:02:04 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Huacai Chen <chenhuacai@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jinyang He <hejinyang@loongson.cn>,
        Kees Cook <keescook@chromium.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Michel Lespinasse <walken@google.com>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] MIPS: Add support for CONFIG_DEBUG_VIRTUAL
Message-ID: <20210406130204.GC9505@alpha.franken.de>
References: <20210331032228.21251-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331032228.21251-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 30, 2021 at 08:22:07PM -0700, Florian Fainelli wrote:
> Provide hooks to intercept bad usages of virt_to_phys() and
> __pa_symbol() throughout the kernel. To make this possible, we need to
> rename the current implement of virt_to_phys() into
> __virt_to_phys_nodebug() and wrap it around depending on
> CONFIG_DEBUG_VIRTUAL.
> 
> A similar thing is needed for __pa_symbol() which is now aliased to
> __phys_addr_symbol() whose implementation is either the direct return of
> RELOC_HIDE or goes through the debug version.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Changes in v4:
> 
> - properly address sparse warning in arch/mips/kernel/vdso.c and
>   eliminate it entirely
> 
> Changes in v3:
> 
> - added missing SDPX license tag in physaddr.c
> 
> Changes in v2:
> - fixed sparse warning in arch/mips/kernel/vdso.c
> 
>  arch/mips/Kconfig            |  1 +
>  arch/mips/include/asm/io.h   | 14 ++++++++-
>  arch/mips/include/asm/page.h |  9 +++++-
>  arch/mips/kernel/vdso.c      |  5 ++--
>  arch/mips/mm/Makefile        |  2 ++
>  arch/mips/mm/physaddr.c      | 56 ++++++++++++++++++++++++++++++++++++
>  6 files changed, 83 insertions(+), 4 deletions(-)
>  create mode 100644 arch/mips/mm/physaddr.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
