Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD81412D194
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 16:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbfL3Pr4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 10:47:56 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:37727 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbfL3Prz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Dec 2019 10:47:55 -0500
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M58SY-1in3CY0kHk-0017mD; Mon, 30 Dec 2019 16:47:54 +0100
Received: by mail-qt1-f172.google.com with SMTP id e5so29857594qtm.6;
        Mon, 30 Dec 2019 07:47:53 -0800 (PST)
X-Gm-Message-State: APjAAAWxHvcFVLv1Cs8FC/eIa2GG266m8Xis5ID6vHSqXu5Z4p9FpFIa
        c+fl+Dknj+BkC7PFHSeEYqHfKCim6NBrEhAwzfM=
X-Google-Smtp-Source: APXvYqzS9Daau4V6KdFtMzVDpaHEdaxphNfcAOGaF7CR6jf69NGaa3wFFDLjiwkZ+wtx1QS+13hvCMDyUD2ID479i1E=
X-Received: by 2002:ac8:709a:: with SMTP id y26mr49110478qto.304.1577720873024;
 Mon, 30 Dec 2019 07:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191224135404.389039-1-Jason@zx2c4.com>
 <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
 <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
 <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com>
 <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
 <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com> <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com>
In-Reply-To: <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 30 Dec 2019 16:47:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0NBuqDX63+920q7Q+yO2xCoSd0O7xUDJv6BBoco2kVOg@mail.gmail.com>
Message-ID: <CAK8P3a0NBuqDX63+920q7Q+yO2xCoSd0O7xUDJv6BBoco2kVOg@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:evaCvZk8IUe5DvZ2WF2ej/4JZiaCp6VDfXgAASc3StzTy+WWyux
 9q/Fe1VLxcTyurCjEbpHcvcGJiwvUYV582B9WHcgfaGRc/9SPpeqDlQuECyaylFN3lxXK66
 7WGy4AstLRmSndFk78TaiQZfLzQciuyELEZCvMZAr/YBJoZiBljgZYQKSdPWW/W89SY7qSk
 53MuPvPSxgt8bRz8Ium4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/oHvFZngoeg=:Xo2Ww0CgxaMTEALgxQtEFW
 3R2fS9honTvQy9E6Dlg+ok2VaaaCKbHQEagpbNtNX3ramhc+0FFM+MvLAR5hSlqDI3emjV13J
 tnviOrVt9AzEZHayALsgC15Q2GpnPDNZ1CvWSQ8XMwlgACkGBJhYjaMWKGU8aQ+5dGVw3HbJq
 TYyv/urUvyiOObm3Sed+/mCAPZzxemMPLZWw39TWY1oizXiMdXNh/giobItiwwLWSxG3LDZCn
 M8OOCFgaLAJQoAr/BcdZ7HdADXpycgkX2W2mYBv1CwNkDf3Wtv5dcciyFByOQr/rs2kX4T7UW
 UybFKrsmIVDBK8PowVMEZcDlVcrQ27JImyAQehm2CA8yVjgQMg2qdK4EtKSt9zb/kiILhNiZF
 ulCs20ibaCs+qO1XGPcZedqB9TTmQrEA5mvAxj3CyBe60iNQZqzmiZ+2cbmTuJwuzAVfTk6jB
 d5+AQI2EkDUN5VTzeyNpw5+Hjp/YQzczhuBhK9ak2ajOapb3bG+BFTnkJXsYBlposab5kwVKL
 BagpAHwUdIjgcEDvwVrdc+U3YUG0zgn37dKZ7ZO9Ms+/KQLkIqDuZrZYL4pcB/5467IY1arOT
 T5Qn58IMUbjIN98r1tvtxRDDBWe224mSIzXMlIjuukDa3X2WDGJB0CgrJgcms/2h7vMqEWQlr
 mCwdhDAdPJWDr+05gFETuiubBNSrxbrKQafPZ36rVBxbssPCKl1Et6SSJCHbTsGizrVz1kGhM
 e+VAlry16Fn7qRCSz5//EvdB4D6HfcfgTIb+F5LyO8QwfTZmfrEMJC6QcKxIg/ewkvtG4/ynd
 hPqNmsymey24asg8Zft48oBfklJuqoVCTyy0BmEmACsGiXByRRIK8JyMMRwNwNcyvoQPXoUmv
 zmLxS8ZhhSyS0+GDUf7g==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 30, 2019 at 4:39 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, Dec 30, 2019 at 4:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Mon, Dec 30, 2019 at 3:37 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > On Mon, Dec 30, 2019 at 1:34 PM Arnd Bergmann <arnd@arndb.de> wrote:

> > Returning success from clock_gettime() on a kernel with only
> > time64 support and a libc with only time32 support (or vice
> > versa) would be a bug.
>
> Ah, right, hence why the 32-bit compat code is behind a
> still-on-by-default-but-not-for-long menu option.

I expect this to remain on-by-default for a rather long time, as we still
to run old binaries well into 2030s. Making it configurable is done for
two reasons:

- on embedded systems that have all user space built with time64,
  turning this off can make the kernel slightly smaller

- turning it off lets you check that no code relies on calling the old
  interfaces internally, bypassing the C library, in a way that works
  at the moment but may break after 2038.

         Arnd
