Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E672ED453
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 17:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbhAGQ3q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jan 2021 11:29:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:34735 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726780AbhAGQ3q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Jan 2021 11:29:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kxY9o-0000Mi-02; Thu, 07 Jan 2021 17:29:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4A2ECC080E; Thu,  7 Jan 2021 17:26:58 +0100 (CET)
Date:   Thu, 7 Jan 2021 17:26:58 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        John Crispin <john@phrozen.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] MIPS: Use address-of operator on section symbols
Message-ID: <20210107162658.GC11882@alpha.franken.de>
References: <20210105201827.51766-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105201827.51766-1-natechancellor@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 05, 2021 at 01:18:27PM -0700, Nathan Chancellor wrote:
> When building xway_defconfig with clang:
> 
> arch/mips/lantiq/prom.c:82:23: error: array comparison always evaluates
> to true [-Werror,-Wtautological-compare]
>         else if (__dtb_start != __dtb_end)
>                              ^
> 1 error generated.
> 
> These are not true arrays, they are linker defined symbols, which are
> just addresses. Using the address of operator silences the warning
> and does not change the resulting assembly with either clang/ld.lld
> or gcc/ld (tested with diff + objdump -Dr). Do the same thing across
> the entire MIPS subsystem to ensure there are no more warnings around
> this type of comparison.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1232
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/mips/bmips/setup.c          | 2 +-
>  arch/mips/lantiq/prom.c          | 2 +-
>  arch/mips/pic32/pic32mzda/init.c | 2 +-
>  arch/mips/ralink/of.c            | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
