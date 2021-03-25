Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64F47348D97
	for <lists+linux-mips@lfdr.de>; Thu, 25 Mar 2021 11:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhCYKBc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 06:01:32 -0400
Received: from elvis.franken.de ([193.175.24.41]:58870 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229617AbhCYKBM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Mar 2021 06:01:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lPMnd-00074f-01; Thu, 25 Mar 2021 11:01:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B26C5C1C81; Thu, 25 Mar 2021 10:57:39 +0100 (CET)
Date:   Thu, 25 Mar 2021 10:57:39 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Jinyang He <hejinyang@loongson.cn>,
        Vlastimil Babka <vbabka@suse.cz>,
        Yousong Zhou <yszhou4tech@gmail.com>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: Add support for CONFIG_DEBUG_VIRTUAL
Message-ID: <20210325095739.GB5775@alpha.franken.de>
References: <20210323222103.34225-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323222103.34225-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 23, 2021 at 03:20:43PM -0700, Florian Fainelli wrote:
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
> Changes in v2:
> - fixed sparse warning in arch/mips/kernel/vdso.c

checkpatch warns about a missing SPDX license in arch/mips/mm/physaddr.c,
can you please add one ?

And as checkpatch is also unhappy about the volatiles, do we really
need them here ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
