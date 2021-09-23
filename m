Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523E2415B2F
	for <lists+linux-mips@lfdr.de>; Thu, 23 Sep 2021 11:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240210AbhIWJn6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Sep 2021 05:43:58 -0400
Received: from elvis.franken.de ([193.175.24.41]:39110 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240224AbhIWJn5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Sep 2021 05:43:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mTLFI-00072a-02; Thu, 23 Sep 2021 11:42:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7A2D7C1CE2; Thu, 23 Sep 2021 11:36:28 +0200 (CEST)
Date:   Thu, 23 Sep 2021 11:36:28 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        list@opendingux.net, clang-built-linux@googlegroups.com
Subject: Re: [PATCH v2] MIPS: Avoid macro redefinitions
Message-ID: <20210923093628.GC7289@alpha.franken.de>
References: <20210913213415.527306-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913213415.527306-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 13, 2021 at 10:34:15PM +0100, Paul Cercueil wrote:
> To be able to compile the kernel with LTO, the assembler macros cannot
> be declared in the global scope, or the compiler will complain about
> redefined macros.
> 
> Update the code so that macros are defined then undefined when they are
> used.
> 
> Note that virt support was added in 2.24 and xpa in 2.25. So we still
> need the TOOLCHAIN defines for them.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: Removed commented undef line
> 
>  arch/mips/include/asm/ginvt.h                 |  11 +-
>  .../asm/mach-loongson64/loongson_regs.h       |  12 ++
>  arch/mips/include/asm/mipsregs.h              | 190 +++++++++++-------
>  arch/mips/include/asm/msa.h                   |  34 +++-
>  4 files changed, 155 insertions(+), 92 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
