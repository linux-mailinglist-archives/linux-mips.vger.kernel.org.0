Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99D2A162EAF
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2020 19:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgBRShM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Feb 2020 13:37:12 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36420 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgBRShM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Feb 2020 13:37:12 -0500
Received: by mail-pl1-f194.google.com with SMTP id a6so8425794plm.3
        for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2020 10:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ccXZcPHgblgsQ7szhI146C2Fb020S8Uq8EN9Auab0l4=;
        b=WuPXMTeklZQs1oW0RE5IlOhPNzD6lbppOClBV6i0Ns8aeFerqCD3HXxAL6SQmOZv5L
         T1Eztw2uppZlUEDdP+rbVrNRHxUhjrKsSs3AYg+rGVsfuBrs/+X5YDGxx4LHJQzsRqEU
         FBb/sBVAkLgg1I8GCSI03WSVMahh9xEo0IikKesZX34MbFAvkVxQel80aQeoKFjuo339
         hbVA3VFfaCseBdGYbE8pwDZZFc09cCdr7DmcEKrbGhCYfEnjZtWDNRPGSoZ193bniHrY
         Y81NQnOo5edZ5MgDyG67f51BmuzxhIYka3sK4u0x/GkWRGLkrePBhKz8RLGRvUon9yC9
         Yg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ccXZcPHgblgsQ7szhI146C2Fb020S8Uq8EN9Auab0l4=;
        b=If1OoWaHLOqjdixcenkFZcJgoRgvO7Fz+4tWCbDMlvvQthTMxYs3ZxgtKVmmeCTwMy
         xi58ucnuEkTk/LcxgBYT9hG59Ehx8zV+Svs0t1q+sPFzLb5DCN/m5/AnRenyL3POFWCM
         Bnrl6jphCfxd+G/WCvysih+kZORm6V6fLKvfCmZNYshNCs6i5J/F+kp9BICYmjT9FQ12
         NAjGUQP6XTB4bpZ6QDsWoxmRxDipGhctzEJE8x0ykdIVv2rZrxo63HlRpfAHBO6U1M0q
         nHa49/wMVHp7E2RKJjDtRafMcdg5BqP1uveEVpejfuhovRR/Q7bLm7d2uqWA3KniiywU
         xk7g==
X-Gm-Message-State: APjAAAWZQgWaaQWWTnee+rx0ZdtsXa7Nr1Sv7Iwq4pqJYm2CtJZaFbE1
        1YHhZlrBiT1S7LIOqLjFuU3u3xVxctwm1VhZ45mlxQ==
X-Google-Smtp-Source: APXvYqzZgsU+a3pD+9mNeeHD5Yzed7d/Zb2r/b92wg4B+RpYyN4zpLjcE6hVEt6mGDkskCHevectGcMJtuyrWa0g6tU=
X-Received: by 2002:a17:902:760e:: with SMTP id k14mr20968051pll.119.1582051031642;
 Tue, 18 Feb 2020 10:37:11 -0800 (PST)
MIME-Version: 1.0
References: <20200211212455.3307-1-mark.tomlinson@alliedtelesis.co.nz>
 <CAAdtpL5Tf-8O=xMKO33DWDs=2_Hsdk=FQSNO5Gsrx=9hWvENdg@mail.gmail.com>
 <8e852d84c8b0c6b35faa3b3f2a1034d93a6e8967.camel@alliedtelesis.co.nz> <8cb14684e2f774d9573c062f2d82ad5348c5fee7.camel@alliedtelesis.co.nz>
In-Reply-To: <8cb14684e2f774d9573c062f2d82ad5348c5fee7.camel@alliedtelesis.co.nz>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 18 Feb 2020 10:37:00 -0800
Message-ID: <CAKwvOdkaLRE0Ek3PnmqE2P3Urn4+pwfAp-qQdsLurwERcqNXfQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: cavium_octeon: Fix syncw generation.
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>,
        "f4bug@amsat.org" <f4bug@amsat.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>,
        "paulburton@kernel.org" <paulburton@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 17, 2020 at 12:01 PM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
>
> On Mon, 2020-02-17 at 17:58 +1300, Mark Tomlinson wrote:
> > Hi Phil,
> >
> > On Mon, 2020-02-17 at 01:22 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> > > Hi Mark,
> > >
> > > On Tue, Feb 11, 2020 at 10:42 PM Mark Tomlinson
> > > <mark.tomlinson@alliedtelesis.co.nz> wrote:
> > > >
> > > > The Cavium Octeon CPU uses a special sync instruction for implement=
ing
> > > > wmb, and due to a CPU bug, the instruction must appear twice. A mac=
ro
> > > > had been defined to hide this:
> > > >
> > > >  #define __SYNC_rpt(type)     (1 + (type =3D=3D __SYNC_wmb))
> > > >
> > > > which was intended to evaluate to 2 for __SYNC_wmb, and 1 for any o=
ther
> > > > type of sync. However, this expression is evaluated by the assemble=
r,
> > > > and not the compiler, and the result of '=3D=3D' in the assembler i=
s 0 or
> > > > -1, not 0 or 1 as it is in C. The net result was wmb() producing no=
 code
> > > > at all. The simple fix in this patch is to change the '+' to '-'.
> > >
> > > Isn't this particular to the assembler implementation?
> > > Can you explicit the assembler you are using in the commit descriptio=
n?
> > > Assuming we have to look at your commit in 3 years from now, we'll
> > > wonder what assembler you were using.
> > >
> > > Thanks,
> > >
> > > Phil.
> >
> > Yes, it is tied to the assembler. But the Linux kernel is tied to GCC,
> > and GCC (I believe) is tied to GNU as. I can't see the specification of
> > GNU as changing, since that could break anything written for it.
> >
>
> There is an effort underway to build the kernel with clang[1]. I'm not
> sure what that ends up using for an assembler or if it'll even be able
> to target mips64 anytime soon.
>
> For reference the relevant section from the GNU as manual[2] says "A
> true results has a value of -1 whereas a false result has a value of
> 0".
>
> [1] - https://clangbuiltlinux.github.io/
> [2] - https://sourceware.org/binutils/docs/as/Infix-Ops.html#Infix-Ops

Chris, thanks for CC'ing us.

Mark, we're building 32 bit MIPS kernels with Clang under CI (just
added big endian builds this morning).  We're actively looking into
supporting 64b MIPS.

The kernel uses GCC by default, but supports using any compiler via
`make CC=3D<foo>`.  There is extensive support in the kernel for
building with Clang.

GCC and Clang (when doing kernel builds, for clang we set
`-no-integrated-as`) will invoke GAS for inline assembly, but you can
set `AS=3Dclang` for example for the out of line assembly files.  If the
C source files don't contain inline assembly (or `-no-integrated-as`
wasn't set) then Clang will skip invoking the assembler and stream out
an object file.

If you're actively supporting 64b mips, and want to give a Clang build
a try, we'd appreciate the bug reports:
https://github.com/ClangBuiltLinux/linux/issues
--=20
Thanks,
~Nick Desaulniers
