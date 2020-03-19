Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB21C18BB82
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2020 16:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgCSPtO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Mar 2020 11:49:14 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42387 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbgCSPtO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Mar 2020 11:49:14 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 02JFmuqs029340;
        Fri, 20 Mar 2020 00:48:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 02JFmuqs029340
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584632937;
        bh=8ePxFKbmCNPyEVXbZg9bxrLPtjJ0hIQvHoR+u5cuXlk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TWHYuVJqAJHGT2J/QN0ivaoF5RblRJztHn1gOuaI3JETl0zptVkq8T5+IXuCK4qj7
         J89oQxTtEECTesBc5eApZqSSN4GdC62fWYMLAJTkoWV7+IHOEqftqrZ5NcBiwkhwBM
         CxSC3NIpyv2BLiPHF0F6YJ6ea+sb138b1q+pSfQJl8gPsJbsU46roHObS5Zt/EYKoR
         jH/q0j4XKsj4S6mt9Mo3OS5rPK96/XmRnxu5efm0jfFAwaydKqu2eDmic7ZYZjw0Jc
         FeJt19pNG2spVwm5aNFlLXinGseNnLC5Lq40skmNx100yljF3Lzq9kKKlqEW/Ja1xD
         kCiKka1weSc7A==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id m9so1953761vso.2;
        Thu, 19 Mar 2020 08:48:57 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0uhvPfo7XoYRjUcAUEanC2Gx95ToKSplt7/0UBhgFBqtNE6d7A
        o52kYKPOpOZ9Af3Q01wRBBbs6q5pPj7pcvw3PfQ=
X-Google-Smtp-Source: ADFU+vuE+c3n/dpA4yyF3d1WQF2dPe5+qKC0jhqbTt6w2aU3d4Li83bNqcwgm5RvBt3ESyOremdAfr8BAiJJv9QTriU=
X-Received: by 2002:a67:33cb:: with SMTP id z194mr2807732vsz.155.1584632936269;
 Thu, 19 Mar 2020 08:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200311223725.27662-2-masahiroy@kernel.org> <202003121230.lys3M8E8%lkp@intel.com>
 <CAK7LNARwR5X2C_VzK_3RZo+30Cu3uPuiw-rFUut1j8azLhbxAA@mail.gmail.com> <20200312083943.GA7278@alpha.franken.de>
In-Reply-To: <20200312083943.GA7278@alpha.franken.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 20 Mar 2020 00:48:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT8AVh8PawDsUoStjYMsOq-DLJbW30SpX7hDDJHZNCd9g@mail.gmail.com>
Message-ID: <CAK7LNAT8AVh8PawDsUoStjYMsOq-DLJbW30SpX7hDDJHZNCd9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: link lib-y objects to vmlinux forcibly
 when CONFIG_MODULES=y
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        kbuild-all@lists.01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "sparclinux@vger.kernel.org, David S . Miller" <davem@davemloft.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Ilie Halip <ilie.halip@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Thu, Mar 12, 2020 at 5:40 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Mar 12, 2020 at 03:12:28PM +0900, Masahiro Yamada wrote:
> > I got the following report from 0-day bot.
> > Please advise me how to fix it.
> >
> >
> > I am not sure how multi-platform works in MIPS.
> >
> > The cavium-octeon platform has its own implementation
> > of various functions.
> >
> > So, vmlinux links different library routines
> > depending on whether CONFIG_CAVIUM_OCTEON_SOC, correct?
>
> for cavium memcpy is directly linked in via octeon-memcpy.o, while for
> every other platform it's coming from lib/lib.a(memcpy.o).
>
> What have you changed, that this doesn't work anymore ?
>
> Thomas.


I want to change all objects from lib-y
to be linked to vmlinux (exactly like obj-y )
if CONFIG_MODULES is enabled.

https://patchwork.kernel.org/patch/11432969/


EXPORT_SYMBOL in libraries
must be linked to vmlinux all the time,
even if there is no call-site in vmlinux.
I believe this is a good simplification because
EXPORT_SYMBOL is interface to loadable modules.

As it turned out, lib-y is (ab)used to avoid
multiple definition errors.

The 0-day detected a bug of 32-bit sparc:
https://patchwork.kernel.org/patch/11432969/

And, another is this one.

MIPS relies on that
arch/mips/lib/lib.a is weaker than octeon ones.

So, annotating __weak is a good solution
(thanks Nick!).

If I send a patch, is it acceptable?


-- 
Best Regards
Masahiro Yamada
