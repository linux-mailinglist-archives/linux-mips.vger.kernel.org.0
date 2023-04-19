Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5035C6E8470
	for <lists+linux-mips@lfdr.de>; Thu, 20 Apr 2023 00:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjDSWPR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Apr 2023 18:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjDSWPP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Apr 2023 18:15:15 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C883E4C06
        for <linux-mips@vger.kernel.org>; Wed, 19 Apr 2023 15:15:13 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ppG52-0007kL-00; Thu, 20 Apr 2023 00:15:12 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D827AC0117; Thu, 20 Apr 2023 00:15:00 +0200 (CEST)
Date:   Thu, 20 Apr 2023 00:15:00 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if
 unsupported
Message-ID: <20230419221500.GA17797@alpha.franken.de>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-7-jiaxun.yang@flygoat.com>
 <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
 <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com>
 <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 19, 2023 at 02:35:02PM -0700, Nick Desaulniers wrote:
> On Wed, Apr 19, 2023 at 9:50 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >
> >
> >
> > > 2023年4月18日 21:07，Nick Desaulniers <ndesaulniers@google.com> 写道：
> > >
> > > On Fri, Apr 14, 2023 at 1:07 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> > >>
> > >> LLVM does not implement some of -march options. However those options
> > >> are not mandatory for kernel to build for those CPUs.
> > >>
> > >> Fallback -march CFLAG to ISA level if unsupported by toolchain so
> > >> we can get those kernel to build with LLVM.
> > >>
> > >> Link: https://github.com/ClangBuiltLinux/linux/issues/1544
> > >> Reported-by: Nathan Chancellor <nathan@kernel.org>
> > >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > >
> > > Thanks for the patch! Maybe it's more obvious to folks who work on
> > > mips, but how did you determine that say `p5600` is `mips32r5` or
> > > `r10000` is `mips4`?
> >
> > Wikipedia [1] should fit the purpose.
> >
> > [1]: https://en.wikipedia.org/wiki/List_of_MIPS_architecture_processors
> 
> Mostly! Though I was not able to verify:
> - p5600

mips32r5

> - r5500

mips4

> - rm5200

mips4

> - sb1

mips64r1

all information taken from datasheets.

> - loongson*

probably depends on the exact type, but as I don't have datasheets
I can't say what it is exactly, probaly mips32r2/mips64r2.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
