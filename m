Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 798C8192F58
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 18:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbgCYRe0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 13:34:26 -0400
Received: from elvis.franken.de ([193.175.24.41]:34596 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727695AbgCYRe0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 13:34:26 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jH9v6-0008NM-02; Wed, 25 Mar 2020 18:34:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2A90AC0D49; Wed, 25 Mar 2020 18:32:15 +0100 (CET)
Date:   Wed, 25 Mar 2020 18:32:15 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        Alexander Lobakin <alobakin@dlink.ru>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: do not compile generic functions for
 CONFIG_CAVIUM_OCTEON_SOC
Message-ID: <20200325173215.GC17524@alpha.franken.de>
References: <20200325074529.24772-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325074529.24772-1-masahiroy@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 25, 2020 at 04:45:29PM +0900, Masahiro Yamada wrote:
> MIPS provides multiple definitions for the following functions:
> 
>   fw_init_cmdline
>   __delay
>   __udelay
>   __ndelay
>   memmove
>   __rmemcpy
>   memcpy
>   __copy_user
> 
> The generic ones are defined in lib-y objects, which are overridden by
> the Octeon ones when CONFIG_CAVIUM_OCTEON_SOC is enabled.
> 
> The use of EXPORT_SYMBOL in static libraries potentially causes a
> problem for the llvm linker [1]. So, I want to forcibly link lib-y
> objects to vmlinux when CONFIG_MODULES=y.
> 
> As a groundwork, we must fix multiple definitions that have previously
> been hidden by lib-y.
> 
> If you look at lib/string.c, arch can define __HAVE_ARCH_* to opt out
> the generic implementation.
> 
> Similarly, this commit adds CONFIG_HAVE_PLAT_* to allow a platform
> to opt out the MIPS generic code.
> 
> [1]: https://github.com/ClangBuiltLinux/linux/issues/515
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v2:
>   - Use #ifdef instead of __weak. This avoids increasing image size.
> 
>  arch/mips/Kconfig          | 12 ++++++++++++
>  arch/mips/fw/lib/cmdline.c |  2 ++
>  arch/mips/lib/delay.c      |  4 ++++
>  arch/mips/lib/memcpy.S     |  3 +++
>  4 files changed, 21 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
