Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1683B6F7A
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jun 2021 10:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232463AbhF2IgB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Jun 2021 04:36:01 -0400
Received: from elvis.franken.de ([193.175.24.41]:57427 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232405AbhF2IgA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Jun 2021 04:36:00 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ly9BU-0004qC-02; Tue, 29 Jun 2021 10:33:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F13CFC073D; Tue, 29 Jun 2021 10:33:19 +0200 (CEST)
Date:   Tue, 29 Jun 2021 10:33:19 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Dmitry Golovin <dima@golovin.in>,
        Nathan Chancellor <nathan@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] MIPS: set mips32r5 for virt extensions
Message-ID: <20210629083319.GC4650@alpha.franken.de>
References: <20210628215029.2722537-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628215029.2722537-1-ndesaulniers@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 28, 2021 at 02:50:26PM -0700, Nick Desaulniers wrote:
> Clang's integrated assembler only accepts these instructions when the
> cpu is set to mips32r5. With this change, we can assemble
> malta_defconfig with Clang via `make LLVM_IAS=1`.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/763
> Reported-by: Dmitry Golovin <dima@golovin.in>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/mips/include/asm/mipsregs.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
