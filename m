Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B66912DAEC1
	for <lists+linux-mips@lfdr.de>; Tue, 15 Dec 2020 15:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgLOOT2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Dec 2020 09:19:28 -0500
Received: from elvis.franken.de ([193.175.24.41]:42342 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727879AbgLOOT1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Dec 2020 09:19:27 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kpBA4-0002PO-00; Tue, 15 Dec 2020 15:18:44 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6A4DEC03B1; Tue, 15 Dec 2020 14:48:36 +0100 (CET)
Date:   Tue, 15 Dec 2020 14:48:36 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Dominique Martinet <asmadeus@codewreck.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/3] kbuild: LD_VERSION redenomination
Message-ID: <20201215134836.GA9946@alpha.franken.de>
References: <20201212165431.150750-1-masahiroy@kernel.org>
 <20201212165431.150750-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212165431.150750-2-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Dec 13, 2020 at 01:54:30AM +0900, Masahiro Yamada wrote:
> Commit ccbef1674a15 ("Kbuild, lto: add ld-version and ld-ifversion
> macros") introduced scripts/ld-version.sh for GCC LTO.
> 
> At that time, this script handled 5 version fields because GCC LTO
> needed the downstream binutils. (https://lkml.org/lkml/2014/4/8/272)
> 
> The code snippet from the submitted patch was as follows:
> 
>     # We need HJ Lu's Linux binutils because mainline binutils does not
>     # support mixing assembler and LTO code in the same ld -r object.
>     # XXX check if the gcc plugin ld is the expected one too
>     # XXX some Fedora binutils should also support it. How to check for that?
>     ifeq ($(call ld-ifversion,-ge,22710001,y),y)
>         ...
> 
> However, GCC LTO was not merged into the mainline after all.
> (https://lkml.org/lkml/2014/4/8/272)
> 
> So, the 4th and 5th fields were never used, and finally removed by
> commit 0d61ed17dd30 ("ld-version: Drop the 4th and 5th version
> components").
> 
> Since then, the last 4-digits returned by this script is always zeros.
> 
> Remove the meaningless last 4-digits. This makes the version format
> consistent with GCC_VERSION, CLANG_VERSION, LLD_VERSION.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/loongson64/Platform | 2 +-
>  arch/mips/vdso/Kconfig        | 2 +-

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
