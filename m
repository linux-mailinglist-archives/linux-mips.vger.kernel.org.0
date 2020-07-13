Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD08021D487
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2020 13:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbgGMLHw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jul 2020 07:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729308AbgGMLHw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jul 2020 07:07:52 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55CAC061755;
        Mon, 13 Jul 2020 04:07:51 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id e90so9229187ote.1;
        Mon, 13 Jul 2020 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zbE6aUVQMvTasdkVN/Sbe6vqfPkp8zLZWOLMKjPaQUE=;
        b=nKVlRNTfx7gN5hVs1Kvu8TODCYIAJzXLIVEtyJ95yJU1a7TZANbn8/pegHh77qhNzr
         rVZqQL3Gvq0bprOwYZlSpzOHaylAnX92Rf8CssLNRJFwZqt/xfxEoEHObJfR98iYoQ7w
         R4iQSGjXA3Pzz2Oj7IIVTgpKrO6y+wnXEaJe+Y0NHaYCRUbkBnFm83ult+UwWPCMpR2B
         8TE7Vv0PvmA4jHxUWf6E2LoON+AUvE9qJhdJ/0elx0LmbhPHQkxhRhZ4QpgZnNkKNPr7
         VrM7L8gvOTdv1ZMfZNqOzvOf17RdVt2UToL3klImeLk82JfZstaWxdjCBsMI2qcjdWKL
         1pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zbE6aUVQMvTasdkVN/Sbe6vqfPkp8zLZWOLMKjPaQUE=;
        b=G+1BkmgbCghobK/20mrTiB8jsozVIfn2Y+4hT9uaIuD6cF9mPzDoSeHX905l5Ptsqw
         Xa/GRoqyjbLIc2GrQEHg/kueLGyVrPr/tuMKRrOp4H8Nk3JrPlMPe+qOdIBUu74V2a0G
         CQoXKJpz+78h9/kI/MO78smlLu0m4T778yh2x5Kc+PDKtjbsq7h/WSZT95Rm3VBPcGiz
         lN8chKNT3smUkTiti7S28y1NbugROPNeSM/b6g0cKQbzK+kou+oOrbMmkUYGyWjk4joC
         acePNGpdqotdKT/08E+MwXU4NxA00X8L1eyd4U7JVT2+Pdpgcy2if7WO3O/cuVrV2J4K
         UWlw==
X-Gm-Message-State: AOAM532CtNmf54GIb9WPlgU44WthfEUy+/bjqrU86IArmjJrZfgRnY34
        BnAJGLQOYV6cIzFLieO87bPyqsqiUUc9EQNBnUwm6GL9
X-Google-Smtp-Source: ABdhPJyg1UWj3E6l+7ROOE7OLLnMKlktobccgnMTi+/TvzwQyXRHnw6G+U2LZpN+CNSUIsjni5K+h59PpM9+LjRloxc=
X-Received: by 2002:a9d:5e3:: with SMTP id 90mr27231908otd.186.1594638470441;
 Mon, 13 Jul 2020 04:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <202007121804.QJogPzGx%lkp@intel.com> <45336876-6739-e23d-5c02-81d14ee7fb54@flygoat.com>
In-Reply-To: <45336876-6739-e23d-5c02-81d14ee7fb54@flygoat.com>
From:   Manuel Lauss <manuel.lauss@gmail.com>
Date:   Mon, 13 Jul 2020 13:07:14 +0200
Message-ID: <CAOLZvyEFSfYqry2N2wGMzLg36BZRXgnsnQaZPytWmvMUy=ZYtQ@mail.gmail.com>
Subject: Re: arch/mips/alchemy/devboards/db1300.c:(.text.db1300_wm97xx_probe+0x2c):
 undefined reference to `wm97xx_config_gpio'
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Linux-MIPS <linux-mips@vger.kernel.org>, kbuild-all@lists.01.org,
        LKML <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello all,

On Mon, Jul 13, 2020 at 3:29 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
>
> =E5=9C=A8 2020/7/12 18:01, kernel test robot =E5=86=99=E9=81=93:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   0aea6d5c5be33ce94c16f9ab2f64de1f481f424b
> > commit: ff487d41036035376e47972c7c522490b839ab37 MIPS: Truncate link ad=
dress into 32bit for 32bit kernel
> > date:   9 weeks ago
> > config: mips-randconfig-c023-20200712 (attached as .config)
> > compiler: mipsel-linux-gcc (GCC) 9.3.0
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >     mipsel-linux-ld: arch/mips/alchemy/devboards/db1300.o: in function =
`db1300_wm97xx_probe':
>
> Well this seems unrelated with my changes.

Yes,

> Just wonder if alchemy still alive?

My test hardware still works

> Should I fix it or just drop alchemy support?

Something like this should fix it.  I never tested randconfig because I fin=
d
it kind of pointless for these kinds of specialized boards/systems.

diff --git a/arch/mips/alchemy/devboards/db1300.c
b/arch/mips/alchemy/devboards/db1300.c
index 8ac1f56ee57d..9c7736d88bce 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -746,6 +746,7 @@ static struct wm97xx_mach_ops db1300_wm97xx_ops =3D {

 static int db1300_wm97xx_probe(struct platform_device *pdev)
 {
+#if IS_ENABLED(CONFIG_TOUCHSCREEN_WM97XX)
        struct wm97xx *wm =3D platform_get_drvdata(pdev);

        /* external pendown indicator */
@@ -761,6 +762,9 @@ static int db1300_wm97xx_probe(struct platform_device *=
pdev)
        wm->pen_irq =3D DB1300_AC97_PEN_INT;

        return wm97xx_register_mach_ops(wm, &db1300_wm97xx_ops);
+#else
+       return -ENODEV;
+#endif
 }


Manuel
