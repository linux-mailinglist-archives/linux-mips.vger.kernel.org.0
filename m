Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7182DF984
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 08:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgLUHgz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Dec 2020 02:36:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgLUHgz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Dec 2020 02:36:55 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 002E2C0613D3
        for <linux-mips@vger.kernel.org>; Sun, 20 Dec 2020 23:36:14 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id h19so6016399qtq.13
        for <linux-mips@vger.kernel.org>; Sun, 20 Dec 2020 23:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ghq3g0ocqfsZqXedcmycFR4XsbRF3iRFzZFpZ7VFsJ4=;
        b=NyDcQ4su6Tn1PLFnTqfIf7wz0tUC3ZZIvic/4nZzPVr1gVLr7frGW6ry91suVdcZhR
         uoFkDDnNE7QPc1GL5/tQQlPnKeUZilyedufauh4Kcegogy8dOELQinCPglGRlZ277fQU
         JeXcMKBy6lbFDwevM7whyOr/5OBI8+QwhqR/TcDyC63vJv7sLqmyAEL1SWK+KWbAuqqm
         GgApJyV/X5yPg1mFnG5lRGZPdztqjAVcStXwUhRTb68FFinzjKsHvZ4VZiw6KKvNVULl
         Vp/PE7tmeI49ubgr3FvVAfOobhBriOtLhBaayhLYU0sgM04lySmT7kUaaGQnXraKVLo/
         bKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ghq3g0ocqfsZqXedcmycFR4XsbRF3iRFzZFpZ7VFsJ4=;
        b=QhCAfqnF9ii4CC8o0rLJOHP+t+kFrXv+Q2XtPA25DN5dZLmCE6IQl5jaF3J3PIVAT9
         JmR887g0cyO1VNwNDRMRrTqT4AkBE6APXF6o2h8qO7tB5XoXWZ6npYxH6hKAz5S3LKSl
         ZI0Pu8asHeDrv29Wobpty3AcRbsjLpddAibVl3gwa6IaPUNkXNugmOsh9Hla8tdGpO3b
         fUYNdNbPYtHHC2b85PO1yze/kORYSduymFYYlAsdzFr2vjDO4QfkeaFGVFy5vAcTAq/L
         jvO4RrRTSMCkiUWyTlTOZrhxhAypHdInh5nuw/uPtZKqg0KlglqLAoD3NN4Mm0XNXjFk
         Ntag==
X-Gm-Message-State: AOAM5333dLk6At9kRA6KMQ5JKSR54Mb9nFx3BKzYiewZMJlFHIq8wx6q
        JH47AHrZaRb1zn0249VSSh1nKuYlwWQ1B/sSdO2dlotSPuMfiF7K
X-Google-Smtp-Source: ABdhPJyZZjVotZF0neEpz8fGz3fkSmFAEpNfNu4Hifu+WAm6vmUJyrrxMUepkIr3+WmN3N8q9LmNS9R61IMRH3MiUJw=
X-Received: by 2002:a05:622a:88:: with SMTP id o8mr15036102qtw.241.1608536174197;
 Sun, 20 Dec 2020 23:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20201220193201.GA3184@alpha.franken.de> <d45cb374-f3dc-8c26-6b0f-27bec45854a9@flygoat.com>
 <20201221070434.yom3neoeir43ek2k@mobilestation>
In-Reply-To: <20201221070434.yom3neoeir43ek2k@mobilestation>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Mon, 21 Dec 2020 15:37:08 +0800
Message-ID: <CAKcpw6UsWWfJqnZX00f5CtfR8CPW1nfpgHVcEKgg6odo5BynUg@mail.gmail.com>
Subject: Re: CPUs with EVA support
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Serge Semin <fancer.lancer@gmail.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=8821=
=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=883:05=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Hello Thomas, Jiaxun
>
> On Mon, Dec 21, 2020 at 08:38:00AM +0800, Jiaxun Yang wrote:
> > =E5=9C=A8 2020/12/21 =E4=B8=8A=E5=8D=883:32, Thomas Bogendoerfer =E5=86=
=99=E9=81=93:
> > > Hi;
> > >
> > > I've started looking how to get rid of get_fs/set_fs for MIPS and
> > > my current obstacle is EVA support.
> > >
> > > Looking for CPUs supporting EVA I only found P5600, are there more ?
> >
> > Hi Thomas,
> >
> > It is a optional feature for M14k but nobody enabled it :-(
> >
> > >
> > > Does someone sell boards with an EVA enabled CPU ?
> >
> > Baikal-T1 supports EVA.
>
> Yeap, Baikal-T1 SoC does support EVA since based on P5600 does.
> Moreover the feature is enabled in my CSP code by default, but
> the segments mapping is initialized to fully match the legacy
> MIPS address space layout.
>
> Regarding the boards with Baikal-T1 to purchase. It's available and
> demonstrated on the company site:
> https://www.baikalelectronics.com/products/339/
>
> Currently a single retailer selling the item is Russian-based:
> https://www.chipdip.ru/product/bfk3.1?from=3Dsuggest_product
> (Alas the site doesn't have an English version, so please use the
> Goog-xlate.)
> If for some reason you still won't be able to purchase it from there
> please send me an email directly.
>
> (Today I've got a suspicious message on my corporate inbox from a guy
> - Yunqiang Su with email domain @cipunited.com, who stated that CIP

Yes. It is me.
CIP is holding the business of MIPS in China (including HK, Macao).
And now I have a budget for MIPS eco-system: for team and devices.

> United wants to purchase one or more of them for you and requested to
> give them the company sells contacts. I didn't response, because the
> message structure looked more like a spam, than an official request.
> It was also strange not to see you in CC.)
>
> Regarding the Baikal-T1 boards being finally supported in the kernel.
> I am still working on it. There are several more SoC-device drivers
> to fix and I'll be ready to submit the CSP/BSP code to the MIPS arch
> subsystem.
>
> -Sergey
>
> >
> > >
> > > How good is EVA support in qemu ?
> >
> > EVA is functional in QEMU.
> > I had tested it with P5600 malta system.
> >
> > - Jiaxun
> >
> > >
> > > Thomas.
> > >
> >



--=20
YunQiang Su
