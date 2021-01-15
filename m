Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414872F859F
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 20:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbhAOTgh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 14:36:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388680AbhAOTgY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Jan 2021 14:36:24 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7C8C061757
        for <linux-mips@vger.kernel.org>; Fri, 15 Jan 2021 11:35:43 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id u25so14831738lfc.2
        for <linux-mips@vger.kernel.org>; Fri, 15 Jan 2021 11:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tgVsYmSCdgmeuL9qYmhROq6jdCnyLmcDJlct14eS4/U=;
        b=T4ZP2fit5hD7OMKVpQmKducPUz6KHQC5Sm7FPYbm11nfGkvIq2pZ44EDsML2HNDvSd
         CClAfue4Y4DZ1S+KfNvk//2nKGQhvrtUbr7AkN34pbwZljJLJt0SbKmJTgx9UjIYE73A
         51oS9BzN9T5zvLV49js4998Gj0+DfoVJkPdcyIlmo+eZDGieIaj4aj9OFMviHWBn3otR
         CfTsNTqCe2utFSdrZ/mOws/Z8mFRi3xNPeQqAScH6Aef5es6vvNiQiK1HG7F60GfJ15D
         S4ZFwQ/tnAgwlrYeR2PgE+Vfnzg+z3/kvgOj3wStKS7Ct4ygPBVY5Hucalr3otLPJ2U6
         mxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tgVsYmSCdgmeuL9qYmhROq6jdCnyLmcDJlct14eS4/U=;
        b=odb0rTufo4jsVY0ydqoguZzBauGB05/Ft4qWZBOBfbCDUFbmbodHtW/50Mm8qdph9e
         H+7AZTwg4EKgpnOe3Gk2nWYvGp1RZeunfKHi8hzcE4BeuYeHREtMuCmjS5pOoCM5dNLO
         7bY+Xta50RG3utu/+aMGYj7vEXIyF2SZJLoxbNsZLFtQsS7oXnmvjDDUgWetTeCquMzB
         bFQvwSxh+Bb7ue/FAGkWG7czp0cTaSZWLJWx4gd1lkTTVOsCOWwmA/VGE9TIB53hci7/
         U/ScpDHQHsNbsAmLid+tmu0MxpTINpV3DSl14HtppWQhAueqRtnmK/8eskKdaDDbvii8
         tz1g==
X-Gm-Message-State: AOAM530Z2DZcXyQY1Bo4tq55Q47Z46S0VkRwjzDo9MXzIQfjpU4K9Qc1
        mZ3bpwUzZ7G/wjsXPoTli57B79V5I0XmC1O8FQ2xag==
X-Google-Smtp-Source: ABdhPJyhFoOTxylP4e5FGRGV+lMzUT21G2lSnhLCVro7NYTd7z4lQkUiESOjEHgsHZPDk3VnIgjOUDur68g+NZeothk=
X-Received: by 2002:a19:4107:: with SMTP id o7mr5912867lfa.512.1610739342289;
 Fri, 15 Jan 2021 11:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20210115191330.2319352-1-anders.roxell@linaro.org> <20210115192803.GA3828660@ubuntu-m3-large-x86>
In-Reply-To: <20210115192803.GA3828660@ubuntu-m3-large-x86>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Fri, 15 Jan 2021 20:35:31 +0100
Message-ID: <CADYN=9Kt597LsfW=Aq6v+kWr+ja+55_+Z3s5mFaJULa+9J4EfA@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: fix DWARF2 warning
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 15 Jan 2021 at 20:28, Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Fri, Jan 15, 2021 at 08:13:30PM +0100, Anders Roxell wrote:
> > When building mips tinyconifg the following warning show up
> >
> > make --silent --keep-going --jobs=8 O=/home/anders/src/kernel/next/out/builddir ARCH=mips CROSS_COMPILE=mips-linux-gnu- HOSTCC=clang CC=clang
> > /srv/src/kernel/next/arch/mips/vdso/elf.S:14:1: warning: DWARF2 only supports one section per compilation unit
> > .pushsection .note.Linux, "a",@note ; .balign 4 ; .long 2f - 1f ; .long 4484f - 3f ; .long 0 ; 1:.asciz "Linux" ; 2:.balign 4 ; 3:
> > ^
> > /srv/src/kernel/next/arch/mips/vdso/elf.S:34:2: warning: DWARF2 only supports one section per compilation unit
> >  .section .mips_abiflags, "a"
> >  ^
> >
> > Rework so the mips vdso Makefile adds flag '-no-integrated-as' unless
> > LLVM_IAS is defined.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1256
> > Cc: stable@vger.kernel.org # v4.19+
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>
> I believe this is the better solution:
>
> https://lore.kernel.org/r/20210115192622.3828545-1-natechancellor@gmail.com/

Yes, I agree.

Cheers,
Anders
