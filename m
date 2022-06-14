Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE3354AEE2
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jun 2022 12:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243103AbiFNK4d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jun 2022 06:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355992AbiFNK4X (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jun 2022 06:56:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81B13B3EC;
        Tue, 14 Jun 2022 03:56:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 840C361243;
        Tue, 14 Jun 2022 10:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684A4C3411B;
        Tue, 14 Jun 2022 10:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655204181;
        bh=00Prm+cUcZ84XpftD1dN/FsJdtVgLrlVbBRu1vY0N5M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GJ95osrVTc29XfAfsEoUU7WX2toadBvY3p7QFX5tpiu1BguwysX9r9TxGtw8aYY9n
         7dlCDWef80SO6YKztD5/KX6n7Y63tLpHsHD4tZLe39NPNprDEuYJ4QV3OB37cZGvAj
         IaIu2GguR8oHWbINnEHCM3cx9QcpbJSvuqjzsrMfDYUfocAyaRNr0Pt1A51rT53dh9
         rDPotEBWirI+Y2P11VJvRfmmoENEdUlYds3MF8ovi7JJoImaYhf0YnPNPIDSD1X1Qu
         u+E1S/fX8sdfiEnKYnQt3gWGX8HCuLdUK3Dn9KpHAkPUmWIlOW27FtAzM7KU1xfWdH
         fGJYQOPmMLlqw==
Date:   Tue, 14 Jun 2022 13:54:18 +0300
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Song Liu <song@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
        Guo Ren <guoren@kernel.org>,
        Jarkko Sakkinen <jarkko@profian.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathaniel McCallum <nathaniel@profian.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        the arch/x86 maintainers <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Marco Elver <elver@google.com>,
        Dan Li <ashimida@linux.alibaba.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen Zhongjin <chenzhongjin@huawei.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Mark Brown <broonie@kernel.org>,
        Luis Machado <luis.machado@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        Guenter Roeck <linux@roeck-us.net>,
        Dave Anglin <dave.anglin@bell.net>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Alexei Starovoitov <ast@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Daniel Axtens <dja@axtens.net>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Jordan Niethe <jniethe5@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Changbin Du <changbin.du@intel.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Liao Chang <liaochang1@huawei.com>,
        Philipp Tomsich <philipp.tomsich@vrull.eu>,
        Wu Caize <zepan@sipeed.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Alexander Egorenkov <egorenar@linux.ibm.com>,
        Thomas Richter <tmricht@linux.ibm.com>,
        Tobias Huschle <huschle@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Michael Roth <michael.roth@amd.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Miroslav Benes <mbenes@suse.cz>,
        =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Aaron Tomlin <atomlin@redhat.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-modules@vger.kernel.org
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <Yqho2hu5q/n10D7g@iki.fi>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi>
 <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
 <YqHx1d+MwRLLzGQe@iki.fi>
 <CAMj1kXGGyO-DL9hjKYKR2sp87s4KExiQybES8pp4JgqJcHkfLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGGyO-DL9hjKYKR2sp87s4KExiQybES8pp4JgqJcHkfLA@mail.gmail.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 09, 2022 at 03:23:16PM +0200, Ard Biesheuvel wrote:
> On Thu, 9 Jun 2022 at 15:14, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > On Wed, Jun 08, 2022 at 09:12:34AM -0700, Song Liu wrote:
> > > On Wed, Jun 8, 2022 at 7:21 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
> > > >
> > > > Hi Jarkko,
> > > >
> > > > On Wed, 8 Jun 2022 08:25:38 +0300
> > > > Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > >
> > > > > On Wed, Jun 08, 2022 at 10:35:42AM +0800, Guo Ren wrote:
> > > > > > .
> > > > > >
> > > > > > On Wed, Jun 8, 2022 at 8:02 AM Jarkko Sakkinen <jarkko@profian.com> wrote:
> > > > > > >
> > > > > > > Tracing with kprobes while running a monolithic kernel is currently
> > > > > > > impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> > > > > > > dependency is a result of kprobes code using the module allocator for the
> > > > > > > trampoline code.
> > > > > > >
> > > > > > > Detaching kprobes from modules helps to squeeze down the user space,
> > > > > > > e.g. when developing new core kernel features, while still having all
> > > > > > > the nice tracing capabilities.
> > > > > > >
> > > > > > > For kernel/ and arch/*, move module_alloc() and module_memfree() to
> > > > > > > module_alloc.c, and compile as part of vmlinux when either CONFIG_MODULES
> > > > > > > or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> > > > > > > code with CONFIG_MODULES.
> > > > > > >
> > > > > > > As the result, kprobes can be used with a monolithic kernel.
> > > > > > It's strange when MODULES is n, but vmlinux still obtains module_alloc.
> > > > > >
> > > > > > Maybe we need a kprobe_alloc, right?
> > > > >
> > > > > Perhaps not the best name but at least it documents the fact that
> > > > > they use the same allocator.
> > > > >
> > > > > Few years ago I carved up something "half-way there" for kprobes,
> > > > > and I used the name text_alloc() [*].
> > > > >
> > > > > [*] https://lore.kernel.org/all/20200724050553.1724168-1-jarkko.sakkinen@linux.intel.com/
> > > >
> > > > Yeah, I remember that. Thank you for updating your patch!
> > > > I think the idea (split module_alloc() from CONFIG_MODULE) is good to me.
> > > > If module support maintainers think this name is not good, you may be
> > > > able to rename it as text_alloc() and make the module_alloc() as a
> > > > wrapper of it.
> > >
> > > IIUC, most users of module_alloc() use it to allocate memory for text, except
> > > that module code uses it for both text and data. Therefore, I guess calling it
> > > text_alloc() is not 100% accurate until we change the module code (to use
> > > a different API to allocate memory for data).
> >
> > After reading the feedback, I'd stay on using module_alloc() because
> > it has arch-specific quirks baked in. Easier to deal with them in one
> > place.
> >
> 
> In that case, please ensure that you enable this only on architectures
> where it is needed. arm64 implements alloc_insn_page() without relying
> on module_alloc() so I would not expect to see any changes there.

Right, got it, thanks for remark.

BR, Jarkko
