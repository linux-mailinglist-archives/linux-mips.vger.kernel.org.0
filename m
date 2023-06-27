Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58F5740590
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jun 2023 23:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjF0V2o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Jun 2023 17:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjF0V2n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Jun 2023 17:28:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AECBF5;
        Tue, 27 Jun 2023 14:28:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BDA3061233;
        Tue, 27 Jun 2023 21:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A61C433CC;
        Tue, 27 Jun 2023 21:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687901321;
        bh=OafCvthRtEiRdBBCDx7oq4YlYCXLBNwqs0QHZRTmIb8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WNHnNPwyINedj0Xi/GK/WRVtr+QPUA7zgH7xzT1SFoagTucmdMlTvsqCW6fqS0J+t
         C+GmRxWpRP9iyvzeA11fYrpBqRbOujdmp9Oyj34AsMyV6uuFVB0YFvVsKymL78/d6R
         a5/2PISHZv6bFkuZvwUh7GQZ+GheCZoTPl22bq1V/rhGNfMV4UgLhawCtDOcXjxnFx
         Y5EDw4ySZ+iYmXyrhGxi+YtrlW+sCQA1uTCiwCoGa0ArdJ+IUsJET7rEDhRZsJvqZ9
         kDhte2YL4t2YHYg+7KVdYD2+UG/wTNu3rj2zym/vhdDOGHKb41d2I6y7xeecZBlaql
         NTp6PFrId9O5A==
Date:   Tue, 27 Jun 2023 14:28:39 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Huacai Chen <chenhuacai@kernel.org>
Cc:     Huacai Chen <chenhuacai@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        stable@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] MIPS: Loongson: Fix build error when make modules_install
Message-ID: <20230627212839.GA1806408@dev-arch.thelio-3990X>
References: <20230626075047.1872818-1-chenhuacai@loongson.cn>
 <20230626160720.GA2174263@dev-arch.thelio-3990X>
 <CAAhV-H6nyXa+wG-J50d=FrHX=4saVNAePW8HHQ2hm+EsGR9Umw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H6nyXa+wG-J50d=FrHX=4saVNAePW8HHQ2hm+EsGR9Umw@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Huacai,

+ Masahiro

On Tue, Jun 27, 2023 at 11:11:27AM +0800, Huacai Chen wrote:
> Hi, Nathan,
> 
> On Tue, Jun 27, 2023 at 12:07 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Mon, Jun 26, 2023 at 03:50:47PM +0800, Huacai Chen wrote:
> > > After commit 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of
> > > cc-ifversion") we get a build error when make modules_install:
> > >
> > > cc1: error: '-mloongson-mmi' must be used with '-mhard-float'
> > >
> > > The reason is when make modules_install, 'call cc-option' doesn't work
> > > in $(KBUILD_CFLAGS) of 'CHECKFLAGS'. Then there is no -mno-loongson-mmi
> > > applied and -march=loongson3a enable MMI instructions.
> >
> > The first sentence does not make much sense to me, specifically "in
> > $(KBUILD_CFLAGS) of 'CHECKFLAGS'". What configuration and build command
> > reproduces this? I do not see how '-mno-loongson-mmi' would fail to get
> > added to cflags-y after 0e96ea5c3eb5, which should have had no
> > functional change... I don't want to hang this change up since there is
> > real breakage but I want to make sure we fully understand why
> > 0e96ea5c3eb5 broke things and why this patch resolves it.
> Please use loongson3_defconfig to build a loongson kernel with
> toolchains from here [1]:
> 'make' will succeed, but there is a build error when 'make
> modules_install'. And you should be careful because 'make
> modules_install' doesn't stop when the error occurs.

Excellent, thank you! I understand what is going on here and your patch
should work to resolve it (although I think the commit message should be
flushed out a little more with the following details) but I am curious
if Masahiro has any thoughts around this.

As you note, the error message comes from the CHECKFLAGS invocation of
$(CC) but it has no impact on the final result of modules_install, it is
purely a cosmetic issue from what I can tell. The error occurs because
cc-option is defined in scripts/Makefile.compiler, which is not included
in Makefile when running modules_install, as install targets are not
supposed to require the compiler; see commit 805b2e1d427a ("kbuild:
include Makefile.compiler only when compiler is needed"). As a result,
the call to check for '-mno-loongson-mmi' just never happens.

It would nice if '-mno-loongson-mmi' could be added unconditionally when
using GCC but I can see that the flag has only existed since 9.x, so we
do need to keep the cc-option call.

I am fine with your change as long as it includes some of the above
information (basically noting that while the original change should have
been equivalent, the requirement of '-mno-loongson-mmi' when using
certain Loongson '-march=' values with '-msoft-float' means that those
Loongson '-march=' values need to be called with cc-option as well),
even if clang will incur two more cc-option calls as a result (not the
end of the world).

Additionally, it seems like the same issue will occur when running
modules_install when CONFIG_CPU_LOONGSON2E or CONFIG_CPU_LOONGSON2F are
enabled, which I guess I also broke in commit 13ceb48bc19c ("MIPS:
Loongson2ef: Remove unnecessary {as,cc}-option calls") :/

Sorry again for the breakage and thanks for the fix!

Cheers,
Nathan

> > > Fix this by partially reverting to the old logic, use 'call cc-option'
> > > to conditionally apply -march=loongson3a and -march=mips64r2.
> > >
> > > Fixes: 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of cc-ifversion")
> > > Cc: stable@vger.kernel.org
> > > Cc: Nathan Chancellor <nathan@kernel.org>
> > > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > ---
> > >  arch/mips/Makefile | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > >
> > > diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> > > index a7a4ee66a9d3..7fb76d12829e 100644
> > > --- a/arch/mips/Makefile
> > > +++ b/arch/mips/Makefile
> > > @@ -186,11 +186,8 @@ cflags-$(CONFIG_CPU_LOONGSON2F) += -march=loongson2f -Wa,--trap
> > >  # Some -march= flags enable MMI instructions, and GCC complains about that
> > >  # support being enabled alongside -msoft-float. Thus explicitly disable MMI.
> > >  cflags-$(CONFIG_CPU_LOONGSON2EF) += $(call cc-option,-mno-loongson-mmi)
> > > -ifdef CONFIG_CPU_LOONGSON64
> > >  cflags-$(CONFIG_CPU_LOONGSON64)      += -Wa,--trap
> > > -cflags-$(CONFIG_CC_IS_GCC) += -march=loongson3a
> > > -cflags-$(CONFIG_CC_IS_CLANG) += -march=mips64r2
> > > -endif
> > > +cflags-$(CONFIG_CPU_LOONGSON64) += $(call cc-option,-march=loongson3a,-march=mips64r2)
> > >  cflags-$(CONFIG_CPU_LOONGSON64) += $(call cc-option,-mno-loongson-mmi)
> > >
> > >  cflags-$(CONFIG_CPU_R4000_WORKAROUNDS)       += $(call cc-option,-mfix-r4000,)
> > > --
> > > 2.39.3
> > >
