Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E40B65B3318
	for <lists+linux-mips@lfdr.de>; Fri,  9 Sep 2022 11:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbiIIJJA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Sep 2022 05:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbiIIJI4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Sep 2022 05:08:56 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB5791086
        for <linux-mips@vger.kernel.org>; Fri,  9 Sep 2022 02:08:54 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id c39-20020a05683034a700b006540d515722so678141otu.5
        for <linux-mips@vger.kernel.org>; Fri, 09 Sep 2022 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=7pqOrIpQy9YHO67fK6h7IZFrC3eaBD05xcspiziwiEA=;
        b=iQZKDcSrPEjQ6qk3HqsWygW8MM6CAizwVnuApQoby9wvK3aCOfUb4DDu79l4EU+YEq
         Kiu35YyyLm+HeqHiX4fRehw3/vj1Y+P+FV99o+nZRGqItDBqBBlO9D8nvOqpNS9MOpKn
         MNiUdwb0pYO1s0xOFDAvkSScrdEGmucCpNlBA9nH8nSL1yS5Y/ntQurCVia+vXZdKHDH
         0x07PR/7QydLDJEWjgv6RBxMFdxcysB/6cCifZeNyn4dF0T4+0EMmNVRyjsQZCl8QBDn
         5hwRScHXIFv+a/21lo8QpOOAh+2bDiOXeze1r7AWuVFlJQdXUiQblJfzPsJRPapao2wH
         EFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7pqOrIpQy9YHO67fK6h7IZFrC3eaBD05xcspiziwiEA=;
        b=4GoSQGU0BhBTai+num5UJok4rzx8ZJXQdt44rF+JYQA1VzQ3ZFw9uDYqEWnB5F+jCW
         OjHhaprK+BBGG+0ZyBEmktnj0D4X19ISf+0OLm9PMq44L9VpuoOwRvueWhrXbnxE+aQ/
         QgIDM3W/jfdgYmr7ewgeBKksqLRssuSC3cZD1F3wdD1IFWCk9hwbwF13M0/HKIdz1SHs
         a2VIyWW/qc8dkDnsdCL4r7KA8/sEnLqNA8uUEoY3nBc2FzAL+RcVrNcQTih7wGPUyTcJ
         Q//H6UG+y5RiPwF1QQPHnko6tyY0FKTb2xP6Ox6+G/e6a4tKvULCuZIqedixNTWvliH7
         7ICA==
X-Gm-Message-State: ACgBeo37IYCjORFnNJ6D77ZdAC7urxpOiLBGHMj4gC5DG/0E/PcJaK0Y
        0UyRc4+VaK3tJNXnKCOVbhU8h8lm27NCFC2sj7ADzCl2yTQ=
X-Google-Smtp-Source: AA6agR5PVQbJzp2jnGHJ0OBr0FLESZifJDhGCu7QQ3YyJxedGqzNa7+7EpSLf3WMbJza8u1U7t9gfMRMBD3OivjUf5k=
X-Received: by 2002:a05:6830:1692:b0:638:3089:b543 with SMTP id
 k18-20020a056830169200b006383089b543mr5114229otr.304.1662714533631; Fri, 09
 Sep 2022 02:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220909051147.1948425-1-sergio.paracuellos@gmail.com> <3eed052a-4446-aff2-5356-0a40ba0d212c@arinc9.com>
In-Reply-To: <3eed052a-4446-aff2-5356-0a40ba0d212c@arinc9.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 9 Sep 2022 11:08:42 +0200
Message-ID: <CAMhs-H9ypfuc2hoz3uH-3PS0QWcs6Lfq5PEdYzKYFCOdcJzT6A@mail.gmail.com>
Subject: Re: [PATCH] mips: ralink: mt7621: add gnubee device trees into the kernel
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Arinc,

On Fri, Sep 9, 2022 at 9:11 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9=
.com> wrote:
>
> On 9.09.2022 08:11, Sergio Paracuellos wrote:
> > Device tree blobs for ralink mt7621 SoCs depends on configuration
> > CONFIG_SOC_MT7621 kernel option. This blobs needs to be properly
> > builtin into the kernel in order to be able to properly boot the
> > Gnubee boards. Hence, we need to define specific DTB config options
> > to know which device tree must be compiled and embeeded into the
> > kernel for every single board to allow the generated kernel to boot
> > properly.
> >
> > Fixes: 7a6ee0bbab25 ("mips: dts: ralink: add MT7621 SoC")
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> My original idea was to upstream DTs of every device using the MT7621
> SoC on OpenWrt.
>
> Currently, there are only 2 DTs on mainline, so giving each of them an
> entry is not a big deal. But doing this for hundreds of devices is not
> viable.
>
> This is why I wanted to move away from giving an entry for each device
> and leave it to the OS builder SDKs to deal with it. We both use Neil's
> gnubee-tools, it should be possible to do this there.
>
> For now, whichever path is taken, I'm fine with it. But I see this more
> as a design choice rather than a fix.

Ack, if you are planning to mainline all of that I agree adding
Kconfig entries for every one is not viable at all.

Ignore this patch, then.

Thanks,
     Sergio Paracuellos
>
> Ar=C4=B1n=C3=A7
>
> > ---
> >   arch/mips/boot/dts/ralink/Makefile |  6 ++----
> >   arch/mips/ralink/Kconfig           | 11 ++++++++++-
> >   2 files changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/mips/boot/dts/ralink/Makefile b/arch/mips/boot/dts/ra=
link/Makefile
> > index 11732b8c8163..b0552bfa555a 100644
> > --- a/arch/mips/boot/dts/ralink/Makefile
> > +++ b/arch/mips/boot/dts/ralink/Makefile
> > @@ -5,9 +5,7 @@ dtb-$(CONFIG_DTB_RT3883_EVAL) +=3D rt3883_eval.dtb
> >   dtb-$(CONFIG_DTB_MT7620A_EVAL)      +=3D mt7620a_eval.dtb
> >   dtb-$(CONFIG_DTB_OMEGA2P)   +=3D omega2p.dtb
> >   dtb-$(CONFIG_DTB_VOCORE2)   +=3D vocore2.dtb
> > -
> > -dtb-$(CONFIG_SOC_MT7621) +=3D \
> > -     mt7621-gnubee-gb-pc1.dtb \
> > -     mt7621-gnubee-gb-pc2.dtb
> > +dtb-$(CONFIG_DTB_GNUBEE1)    +=3D mt7621-gnubee-gb-pc1.dtb
> > +dtb-$(CONFIG_DTB_GNUBEE2)    +=3D mt7621-gnubee-gb-pc2.dtb
> >
> >   obj-$(CONFIG_BUILTIN_DTB)   +=3D $(addsuffix .o, $(dtb-y))
> > diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
> > index f9fe15630abb..cf2f5cccd2b3 100644
> > --- a/arch/mips/ralink/Kconfig
> > +++ b/arch/mips/ralink/Kconfig
> > @@ -62,7 +62,6 @@ endchoice
> >
> >   choice
> >       prompt "Devicetree selection"
> > -     depends on !SOC_MT7621
> >       default DTB_RT_NONE
> >       help
> >         Select the devicetree.
> > @@ -100,6 +99,16 @@ choice
> >               depends on SOC_MT7620
> >               select BUILTIN_DTB
> >
> > +     config DTB_GNUBEE1
> > +             bool "GnuBee1 2.5inch NAS"
> > +             depends on SOC_MT7621
> > +             select BUILTIN_DTB
> > +
> > +     config DTB_GNUBEE2
> > +             bool "GnuBee2 3.5inch NAS"
> > +             depends on SOC_MT7621
> > +             select BUILTIN_DTB
> > +
> >   endchoice
> >
> >   endif
