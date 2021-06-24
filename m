Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B613B2476
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jun 2021 03:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhFXBVI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Jun 2021 21:21:08 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:57955 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhFXBVI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Jun 2021 21:21:08 -0400
Date:   Thu, 24 Jun 2021 01:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1624497527;
        bh=RGt/SZ7rsPnZriKfMgqdbp4T6cZKygkDrxIRpjJso4I=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=R6/7Y0vtxuqi5OZV7xoHHpTyZwZQIUP/fUObX0v00mowhIlmppSEVq3J3Fe4eVERR
         7OKx2U91RT0L9DJSEKDhwP0aL88/j2oolalWoMg9U49uKdspTvGeFpX9xACC9Z1kgB
         Z+TP406yiISmc0uJZ0ZwCBJkYmhxPgJ+m2Lqen0U=
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
From:   Ryan Burns <rtburns@protonmail.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Reply-To: Ryan Burns <rtburns@protonmail.com>
Subject: Re: [PATCH] MIPS: tools: fix build on macOS
Message-ID: <13KBlFGGTVSVxlF3yaEYdAZ9V8Z_1M9cYFiSF9GpRvGH0wSfWxTFM9_h7wu4ivosMS7kZRzF8-0_xf7CYDcSuQvWZkhgsw441ngJDdTqKIM=@protonmail.com>
In-Reply-To: <5C87F67C-B1EE-4881-BADB-7AAE3EE96F65@goldelico.com>
References: <z_0h2JVlIGgyiySXEyOmFhJ5_rl_EmuXR7beRMunMZRivpcO0H7LqsGa6ePHdSTkF521jUnXMM9TZb5N9mM4fduiHAxpshUkCBd7Owo43tM=@protonmail.com> <5C87F67C-B1EE-4881-BADB-7AAE3EE96F65@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Thanks for the response, I haven't gotten any other feedback on the patch. =
As far as I'm aware this is still an issue. Maybe this hasn't gotten much a=
ttention due to cross-compiling from macOS not being a common use case.

Ryan

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90

On Monday, June 21st, 2021 at 7:59 AM, H. Nikolaus Schaller <hns@goldelico.=
com> wrote:

> Hi Ryan,
>
> what happened to that patch? I haven't found a discussion or that it was =
merged.
>
> I have used it and it seems solve a cross-compilation issue (have to cros=
s-chek if it is still the case with 5.13-rc7).
>
> Maybe the maintainers did not become aware of?
>
> BR and thanks,
>
> Nikolaus Schaller
>
> https://patchwork.kernel.org/project/linux-mips/patch/z_0h2JVlIGgyiySXEyO=
mFhJ5_rl_EmuXR7beRMunMZRivpcO0H7LqsGa6ePHdSTkF521jUnXMM9TZb5N9mM4fduiHAxpsh=
UkCBd7Owo43tM=3D@protonmail.com/
>
> > Am 14.02.2021 um 06:01 schrieb Ryan Burns rtburns@protonmail.com:
> >
> > macOS does not have byteswap.h, but we can use Apple's libkern/OSByteOr=
der.h instead.
> >
> > This issue is encountered during cross-compilation from macOS to MIPS i=
n nixpkgs.
> >
> > You can view a log of the build failure here:
> >
> > https://hydra.nixos.org/build/136015790/nixlog/1
> >
> > Signed-off-by: Ryan Burns rtburns@protonmail.com
> > ------------------------------------------------
> >
> > arch/mips/boot/tools/relocs.h | 11 +++++++++--
> >
> > arch/mips/boot/tools/relocs_main.c | 1 -
> >
> > arch/mips/tools/elf-entry.c | 11 +++++++++--
> >
> > 3 files changed, 18 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/mips/boot/tools/relocs.h b/arch/mips/boot/tools/reloc=
s.h
> >
> > index 607ff0103064..5de9bb7a7e09 100644
> >
> > --- a/arch/mips/boot/tools/relocs.h
> >
> > +++ b/arch/mips/boot/tools/relocs.h
> >
> > @@ -11,9 +11,16 @@
> >
> > #include <errno.h>
> >
> > #include <unistd.h>
> >
> > #include <elf.h>
> >
> > -#include <byteswap.h>
> >
> > #define USE_BSD
> >
> > -#include <endian.h>
> >
> > +#if defined(APPLE)
> >
> > +# include <libkern/OSByteOrder.h>
> >
> > +# define bswap_16 OSSwapInt16
> >
> > +# define bswap_32 OSSwapInt32
> >
> > +# define bswap_64 OSSwapInt64
> >
> > +#else
> >
> > +# include <byteswap.h>
> >
> > +# include <endian.h>
> >
> > +#endif
> >
> > #include <regex.h>
> >
> > void die(char *fmt, ...);
> >
> > diff --git a/arch/mips/boot/tools/relocs_main.c b/arch/mips/boot/tools/=
relocs_main.c
> >
> > index e2453a564b11..4ef51d1e6d0d 100644
> >
> > --- a/arch/mips/boot/tools/relocs_main.c
> >
> > +++ b/arch/mips/boot/tools/relocs_main.c
> >
> > @@ -6,7 +6,6 @@
> >
> > #include <stdlib.h>
> >
> > #include <string.h>
> >
> > #include <errno.h>
> >
> > -#include <endian.h>
> >
> > #include <elf.h>
> >
> > #include "relocs.h"
> >
> > diff --git a/arch/mips/tools/elf-entry.c b/arch/mips/tools/elf-entry.c
> >
> > index dbd14ff05b4c..5d2e2ab4b3b0 100644
> >
> > --- a/arch/mips/tools/elf-entry.c
> >
> > +++ b/arch/mips/tools/elf-entry.c
> >
> > @@ -1,7 +1,14 @@
> >
> > // SPDX-License-Identifier: GPL-2.0
> >
> > -#include <byteswap.h>
> >
> > +#if defined(APPLE)
> >
> > +# include <libkern/OSByteOrder.h>
> >
> > +# define bswap_16 OSSwapInt16
> >
> > +# define bswap_32 OSSwapInt32
> >
> > +# define bswap_64 OSSwapInt64
> >
> > +#else
> >
> > +# include <byteswap.h>
> >
> > +# include <endian.h>
> >
> > +#endif
> >
> > #include <elf.h>
> >
> > -#include <endian.h>
> >
> > #include <inttypes.h>
> >
> > #include <stdint.h>
> >
> > #include <stdio.h>
