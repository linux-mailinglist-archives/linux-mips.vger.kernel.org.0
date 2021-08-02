Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EA63DCEB6
	for <lists+linux-mips@lfdr.de>; Mon,  2 Aug 2021 04:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhHBCgf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Aug 2021 22:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhHBCgc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Aug 2021 22:36:32 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135CAC0613D3;
        Sun,  1 Aug 2021 19:36:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GdMZP2s0Lz9sT6;
        Mon,  2 Aug 2021 12:36:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1627871780;
        bh=3h+pDmgdaEzjLhKsKsWflOl3eTtWNpO0qlqcc3HN5gw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=a1WosJ0KTXjCRMYjN+wSNFc6ThlMWt6oNtTvbiU08VVh18S12fqbdg7dtDkTBwLa5
         mW8V1Rs4z1BYZuL+pODWPRcD9vbuP8wr01nokBcoTqy49p0SZolAkJwet6ROF0SgEd
         HIz4pn3qWuGGanDbWuW4js0/5hgiIlpoNRE/cyUZxz2eu0jNe7yDYVqAQscP9GPFnE
         qSf68THatsIhId+0A9UWQp8CymuJZBASivoSVD4ldWSNoXSko1yGGp69QbvPTzYUiQ
         G0ZV6Ba/iniZMiL5MNvLUDtAPk+yDPaeM5eVp48+0XyP3sN+LVB9D69GzgsiEom2l/
         2x/ybfb3/4spg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Guo Ren <guoren@kernel.org>, linux-mips@vger.kernel.org,
        Paul Mackerras <paulus@samba.org>, linux-csky@vger.kernel.org,
        linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
        linuxppc-dev@lists.ozlabs.org,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2] arch: vdso: remove if-conditionals of
 $(c-gettimeofday-y)
In-Reply-To: <20210731060020.12913-1-masahiroy@kernel.org>
References: <20210731060020.12913-1-masahiroy@kernel.org>
Date:   Mon, 02 Aug 2021 12:36:08 +1000
Message-ID: <87v94ozi7b.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:
> arm, arm64, csky, mips, powerpc always select GENERIC_GETTIMEOFDAY,
> hence $(gettimeofday-y) never becomes empty.
>
> riscv conditionally selects GENERIC_GETTIMEOFDAY when MMU=y && 64BIT=y,
> but arch/riscv/kernel/vdso/vgettimeofday.o is built only under that
> condition. So, you can always define CFLAGS_vgettimeofday.o
>
> Remove all the meaningless conditionals.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Fix csky as well
>
>  arch/arm/vdso/Makefile              |  4 ----
>  arch/arm64/kernel/vdso/Makefile     |  5 +----
>  arch/arm64/kernel/vdso32/Makefile   |  3 ---
>  arch/csky/kernel/vdso/Makefile      |  4 +---
>  arch/mips/vdso/Makefile             |  2 --
>  arch/powerpc/kernel/vdso32/Makefile | 14 ++++++--------
>  arch/powerpc/kernel/vdso64/Makefile | 14 ++++++--------

I noticed this the other day and was puzzled why we still needed
the conditional, thanks for cleaning it up.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
