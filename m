Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8EB32DCFE
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 23:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCDW3X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 17:29:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:55866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229580AbhCDW3X (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 17:29:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A024164FF4;
        Thu,  4 Mar 2021 22:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614896962;
        bh=ANwgarss26fhnHtMQx6kZPDetgPDjR7bGCtYWahlg/Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XQfwlPeoowQ9soQkxXtQOpFfuiwnfosGn+xFjVB8aJ/JGgfx5BhuMvaCj9VfRg9d2
         iIHF4gmkfIG2J0MEi1JhYjHQOFzqUadDKl40wvUBLfo+p1yFeDd1hNee5c4YdBd3Jf
         pUgDk65LdRHx5tP6CKcQOKReQMH2xqLWjqYKhBNl/sw786tXNG3BJIqTWHgMPtcxtx
         4XfF3xGUlx36SoifC5FZVxJscC7ODiBgtiHz9mT8mJelMlrf3tQOybZDB6tjRk94dl
         V5wjlX3EttoInTx779Z/h59tyjyz3ulpQMJrbghFayktiBRMFkW9h225/BFgt5sqZp
         ipSzxlBDS4eKQ==
Received: by mail-qt1-f178.google.com with SMTP id w6so245706qti.6;
        Thu, 04 Mar 2021 14:29:22 -0800 (PST)
X-Gm-Message-State: AOAM531sI7O7JMoLUGjnRyat6aqdhS2B7DB2xcL4r4HeZx68cOFBOP7t
        DMHEEISGC9TcfmS7MXX4fF0+3BxGZlbnYxG4kA==
X-Google-Smtp-Source: ABdhPJwx4d2wXbZtiOIhYLW9N+mjHTb19kz32s7JL6vHEGvP1Uq0fZcqmIA0CUEdGaXWw2o4QMKiAj+2ULAXXb0oCsE=
X-Received: by 2002:ac8:70d1:: with SMTP id g17mr4802329qtp.380.1614896961860;
 Thu, 04 Mar 2021 14:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20210304044803.812204-2-danielwa@cisco.com> <2b0081aa-52af-a4ab-7481-6e125bd103d6@csgroup.eu>
 <20210304212448.GK109100@zorba>
In-Reply-To: <20210304212448.GK109100@zorba>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 4 Mar 2021 16:29:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJphExyTqEejMnM07NOgPyZ5hGLJunY6yXYm16WT+PGCQ@mail.gmail.com>
Message-ID: <CAL_JsqJphExyTqEejMnM07NOgPyZ5hGLJunY6yXYm16WT+PGCQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] CMDLINE: drivers: of: ifdef out cmdline section
To:     Daniel Walker <danielwa@cisco.com>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Will Deacon <will@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        X86 ML <x86@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Frank Rowand <frowand.list@gmail.com>,
        xe-linux-external@cisco.com,
        Ruslan Ruslichenko <rruslich@cisco.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 4, 2021 at 3:24 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> On Thu, Mar 04, 2021 at 08:09:52AM +0100, Christophe Leroy wrote:
> >
> >
> > Le 04/03/2021 =C3=A0 05:47, Daniel Walker a =C3=A9crit :
> > > It looks like there's some seepage of cmdline stuff into
> > > the generic device tree code. This conflicts with the
> > > generic cmdline implementation so I remove it in the case
> > > when that's enabled.
> > >
> > > Cc: xe-linux-external@cisco.com
> > > Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> > > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > > ---
> > >   drivers/of/fdt.c | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > >
> > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > index feb0f2d67fc5..cfe4f8d3c9f5 100644
> > > --- a/drivers/of/fdt.c
> > > +++ b/drivers/of/fdt.c
> > > @@ -25,6 +25,7 @@
> > >   #include <linux/serial_core.h>
> > >   #include <linux/sysfs.h>
> > >   #include <linux/random.h>
> > > +#include <linux/cmdline.h>
> > >   #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
> > >   #include <asm/page.h>
> > > @@ -1048,8 +1049,18 @@ int __init early_init_dt_scan_chosen(unsigned =
long node, const char *uname,
> > >     early_init_dt_check_for_initrd(node);
> > > +#ifdef CONFIG_GENERIC_CMDLINE
> > >     /* Retrieve command line */
> > >     p =3D of_get_flat_dt_prop(node, "bootargs", &l);
> > > +
> > > +   /*
> > > +    * The builtin command line will be added here, or it can overrid=
e
> > > +    * with the DT bootargs.
> > > +    */
> > > +   cmdline_add_builtin(data,
> > > +                       ((p !=3D NULL && l > 0) ? p : NULL), /* This =
is sanity checking */
> >
> > Can we do more simple ? If p is NULL, p is already NULL, so (l > 0 ? p =
: NULL) should be enough.
>
>
> I believe Rob gave me this line. Maybe he can comment on it.

It's an obvious improvement and LGTM.
