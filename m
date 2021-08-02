Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B953DCECA
	for <lists+linux-mips@lfdr.de>; Mon,  2 Aug 2021 04:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbhHBC4r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Aug 2021 22:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhHBC4q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Aug 2021 22:56:46 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7800CC06175F;
        Sun,  1 Aug 2021 19:56:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GdN1V04FQz9sW5;
        Mon,  2 Aug 2021 12:56:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1627872995;
        bh=lgFF44D+VvUgGNOcyjoWgD9ieIKlVa+1W38G93yYucc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mk/OrQNAgyUtJh9QVu/sq6e2cVKMZEuh5t1elkMY1Gr3oABbY0LNl7+izatEJSZYL
         zGYgU92C+VtRG3i2VpinkrgquF7osc3y3sT0rg1Dkyhhq3uC9pQ9Vyxzu9DIdALkJc
         uVe/31b8NqskHAYnC6qUpRqajmu4XqURQ3LIDSg6AKfjRRV0hOE1uY7cgZepVTdX9e
         8HP4jyVzz75vtA5OgyyRq7pJjgDvTYCj/aQ+sFQ1koQ2SqpBgqVF2xnWntozO8y/pw
         uq0H9be0uwkFpXGGeabu1UoeiTG0mQrIQSbO5Gdvb2ehvStkNDQgftwpI5d9vMxe/C
         vq3iTIN0uJtjQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Nick Hu <nickhu@andestech.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-riscv@lists.infradead.org, YiFei Zhu <yifeifz2@illinois.edu>,
        Greentime Hu <green.hu@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michal Simek <monstr@monstr.eu>, Helge Deller <deller@gmx.de>,
        linux-sh@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Guo Ren <guoren@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Richard Weinberger <richard@nod.at>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Rich Felker <dalias@libc.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Jeff Dike <jdike@addtoit.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-hexagon@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        linux-s390@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-um@lists.infradead.org,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Brian Cain <bcain@codeaurora.org>, linux-csky@vger.kernel.org,
        Stafford Horne <shorne@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Chris Zankel <chris@zankel.net>,
        Vasily Gorbik <gor@linux.ibm.com>,
        linux-snps-arc@lists.infradead.org,
        Jonas Bonn <jonas@southpole.se>, linux-parisc@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Colin Ian King <colin.king@canonical.com>,
        "David S. Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Mackerras <paulus@samba.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
Date:   Mon, 02 Aug 2021 12:56:13 +1000
Message-ID: <87lf5klfle.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/Kconfig                  | 3 +++
>  arch/arc/Kconfig              | 4 +---
>  arch/arm/Kconfig              | 5 +----
>  arch/arm64/Kconfig            | 4 +---
>  arch/csky/Kconfig             | 4 +---
>  arch/hexagon/Kconfig          | 4 +---
>  arch/microblaze/Kconfig       | 1 +
>  arch/microblaze/Kconfig.debug | 5 -----
>  arch/mips/Kconfig             | 1 +
>  arch/mips/Kconfig.debug       | 4 ----
>  arch/nds32/Kconfig            | 4 +---
>  arch/nios2/Kconfig            | 3 ---
>  arch/openrisc/Kconfig         | 4 +---
>  arch/parisc/Kconfig           | 1 +
>  arch/parisc/Kconfig.debug     | 3 ---
>  arch/powerpc/Kconfig          | 5 +----
>  arch/riscv/Kconfig            | 4 +---
>  arch/s390/Kconfig             | 1 +
>  arch/s390/Kconfig.debug       | 3 ---
>  arch/sh/Kconfig               | 1 +
>  arch/sh/Kconfig.debug         | 3 ---
>  arch/sparc/Kconfig            | 1 +
>  arch/sparc/Kconfig.debug      | 4 ----
>  arch/um/Kconfig               | 5 +----
>  arch/x86/Kconfig              | 1 +
>  arch/x86/Kconfig.debug        | 3 ---
>  arch/xtensa/Kconfig           | 4 +---
>  27 files changed, 21 insertions(+), 64 deletions(-)

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d01e3401581d..76a28452c042 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -94,10 +94,6 @@ config STACKTRACE_SUPPORT
>  	bool
>  	default y
>  
> -config TRACE_IRQFLAGS_SUPPORT
> -	bool
> -	default y
> -
>  config LOCKDEP_SUPPORT
>  	bool
>  	default y
> @@ -271,6 +267,7 @@ config PPC
>  	select STRICT_KERNEL_RWX if STRICT_MODULE_RWX
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
> +	select TRACE_IRQFLAGS_SUPPORT
>  	select VIRT_TO_BUS			if !PPC64
>  	#
>  	# Please keep this list sorted alphabetically.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
