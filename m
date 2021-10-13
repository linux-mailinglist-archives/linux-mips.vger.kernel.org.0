Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B0442B82A
	for <lists+linux-mips@lfdr.de>; Wed, 13 Oct 2021 08:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238181AbhJMHBU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Oct 2021 03:01:20 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:46020 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbhJMHBT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Oct 2021 03:01:19 -0400
Received: by mail-ua1-f42.google.com with SMTP id 64so2466055uab.12;
        Tue, 12 Oct 2021 23:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vLmWoWym/1fKiJu7c9gpS1cDGT+57poTvw7kTscrC00=;
        b=Gg+JGh/RyVv0o+fGhBa/WFOeEb2LNvd/qL4Tom37dhPYvviNUEwuLUQtdctYvsC2zO
         dXxTr6BCjLALaPjwKnpYkaMsJEG4PS0aehh9MrByP4nyPyqJu3p81T/w9dqicVwv9yLp
         dN18x6SzUIAsuKay+DiAAObgmB95M0qESd/IMJBkREfjiPfypsXJ+G0Kxg6DK8yLz6xr
         t+zJTsY8hEJg60v2sBuClsciRjfkcXlxfQ/ML2jTqaE6MR7f9/EGOpsPW4sFtwMzSWRw
         oRZew4j7Fk2Fo4n/N+blry6VUeqkJOXy7rC1NuLsBt936oXaxOQM1jLfSFadS4JA7FzP
         CdgA==
X-Gm-Message-State: AOAM5327PtGL95WWpRA6LPgNlrxRV6JY7GWmyYquyUn9e9UJz8ka6TBT
        6JBxFIUJEgVv6akYZmd2u7CeD/PsniKn8S6JxRQ=
X-Google-Smtp-Source: ABdhPJzwsQvQy07KzSSKF36slqOOCBmzhi7G4XFKh+MxO1aqVfgv6UylAsUlKqrZrwFEymqmWaysD4XtAMh8gSFAJlY=
X-Received: by 2002:a67:d583:: with SMTP id m3mr36353545vsj.41.1634108355035;
 Tue, 12 Oct 2021 23:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211013063622.548590-1-masahiroy@kernel.org> <20211013063622.548590-2-masahiroy@kernel.org>
In-Reply-To: <20211013063622.548590-2-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 08:59:03 +0200
Message-ID: <CAMuHMdUQVpvvq=ZqjL97gV6AxS5eGm4mRS=gL4PPwWiBS-v5AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: use more subdir- for visiting subdirectories
 while cleaning
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chris Zankel <chris@zankel.net>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Jonas Bonn <jonas@southpole.se>,
        Jonathan Corbet <corbet@lwn.net>,
        Julien Thierry <jthierry@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Michal Simek <monstr@monstr.eu>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Hu <nickhu@andestech.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rich Felker <dalias@libc.org>,
        Richard Henderson <rth@twiddle.net>,
        Rob Herring <robh@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sami Tolvanen <samitolvanen@google.com>,
        Stafford Horne <shorne@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Will Deacon <will@kernel.org>,
        William Cohen <wcohen@redhat.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Openrisc <openrisc@lists.librecores.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 13, 2021 at 8:43 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Documentation/kbuild/makefiles.rst suggests to use "archclean" for
> cleaning arch/$(SRCARCH)/boot/.
>
> Since commit d92cc4d51643 ("kbuild: require all architectures to have
> arch/$(SRCARCH)/Kbuild"), we can use the "subdir- += boot" trick for
> all architectures. This can take advantage of the parallel option (-j)
> for "make clean".
>
> I also cleaned up the comments. The "archdep" target does not exist.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

>  arch/m68k/Makefile                 |  4 +---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
