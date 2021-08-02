Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1BD3DDEDF
	for <lists+linux-mips@lfdr.de>; Mon,  2 Aug 2021 20:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhHBSEV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Aug 2021 14:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhHBSEU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Aug 2021 14:04:20 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8A3C06175F;
        Mon,  2 Aug 2021 11:04:10 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id hs10so23585135ejc.0;
        Mon, 02 Aug 2021 11:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KpOmQ9FDFdEDp1DRxCOS4/jNxSUC+b7VQifrd/M4FUE=;
        b=bllfssUh1l3Cfof1I9S9zG5MovjfwF9CypWcpRvDmWpOEx759rPpO8GjtwWqnstMf2
         1QwJGh+kGvZKoMFQKf6FhnPOMkpo3JEJzP0z2jokepgekez40su6FDqDQO76azQW4aaY
         ndpMqrh8QhqQUbO9PB7UVTzGgkGjnuiB8BDrnOUlo6IfpOOOD5wRbVnNH3nzFEb8Jlvv
         f2sHv6d82OwwrINjEhGy7L8YhBy8Uq7x29x9aN5cqnZAFpZ+YseiNvbNJLRthMaSdJt+
         GNYBQGlDLHbH2bDQodG8T6OzjQiYO36wOgJ2MGUlCkSsxnL4jcZpqW+jXXGFabstpv3T
         roTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KpOmQ9FDFdEDp1DRxCOS4/jNxSUC+b7VQifrd/M4FUE=;
        b=PjNcQwlRjxVa2YwO23EZZMXn5H79DHlbuuAWiZ+1YxpF44VSe9lptdak9uFQ6OiL8A
         VoVdsiBq/bJoOjs0xeyf6EuEm9ZgA7Ww5nnCCfmJJt3mBnd3aTt/E6OO8AnvGex9ndtN
         CHEUxRErukckZSef2TzHc2lrnSL4MsK7tkxZmtaNTkVlAAk9d9QIv29MsuOWh4EDuTXi
         rQ/wTnJnrQ01M/OofmC8O0eC9dCE9GA5I3neDjCRxcIOdbBkyW4+FcZseM6r64WGgqT+
         rBVKBgCvhVRWtMgkvUFc4qMyu0a0rxDoEen1EKlvxVnWAuXfHN2mBLm3s8w3iRkeHs+/
         jGOg==
X-Gm-Message-State: AOAM533PYzYdnpnM1+6CVaz8TkKfxInhWHXHPq1WS+kKbQqR/6qDTZpd
        SwOkg9orqEUrAncKP8LQhthxt7p8BNS+/W/Ou4I=
X-Google-Smtp-Source: ABdhPJx4CTYoE1N/7r5r3Yv59NCnUgpiXyVEWPBrQR2H8OPpQmdyOckhCi7flWDeCgEu3pc8T6+GCYt+gQKqcxApyio=
X-Received: by 2002:a17:906:34da:: with SMTP id h26mr16470323ejb.376.1627927449046;
 Mon, 02 Aug 2021 11:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210731052233.4703-1-masahiroy@kernel.org> <20210731052233.4703-2-masahiroy@kernel.org>
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Mon, 2 Aug 2021 11:03:57 -0700
Message-ID: <CAMo8BfLDjw71xiCDo8uk4pQFuOzqAoak0k3R4YJDnRsA2hoCtw@mail.gmail.com>
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
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
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Guo Ren <guoren@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Richard Weinberger <richard@nod.at>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Rich Felker <dalias@libc.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Jeff Dike <jdike@addtoit.com>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
        Jonas Bonn <jonas@southpole.se>,
        "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Colin Ian King <colin.king@canonical.com>,
        "David S. Miller" <davem@davemloft.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Vincent Chen <deanbo422@gmail.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 30, 2021 at 10:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  arch/xtensa/Kconfig           | 4 +---

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
-- 
Thanks.
-- Max
