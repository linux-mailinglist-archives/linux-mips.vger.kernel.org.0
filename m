Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C05E12D18B
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 16:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbfL3Pjz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 10:39:55 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:40331 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727549AbfL3Pjz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Dec 2019 10:39:55 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d8bb28b;
        Mon, 30 Dec 2019 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=9flgwsrX1/nkYcte0hox9LfJaiQ=; b=Ok+zhr
        abdJ/E89MHYOIELdRxV37SfhkIa8drsZvxQBsHkeukgkxpKJjZMvHFuJ25xpKfw5
        JJN2IzJRV3hPkntjeVa1TnX0nZFIn3SzCtPHv3lO842PGiTDbEesgG/aW7PmPbLk
        JZCluwQ7f46HW5ckE7scgokneYGB7h4gLwCOmTuIvA5aJijiEFmwcNGivMAag+iT
        pvSMPGaLVpnmHwFLRv8W+cslCh7TDR9B8l3WNCmj3dRtH/wCGWM8PMdFW9TM1Db0
        F7tNOQTi9E25t8o5kEyzcGNglv7g0EaUeYLN2ir8AGah4Jx55qt9Wrrv8y0KZdvC
        IC7LQoGYTPkdbOKg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 87a6a7bd (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Mon, 30 Dec 2019 14:41:45 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id a67so11036405oib.6;
        Mon, 30 Dec 2019 07:39:53 -0800 (PST)
X-Gm-Message-State: APjAAAXMtdq4uF9TF38vUfc/OmhSWq6YVP3XUhpS82DF85eNQefoW+It
        wfJuzZIvbWdhFjkbg/xSBi2DRrpElbaL9uMHVXc=
X-Google-Smtp-Source: APXvYqz00Y5xxUlBRLlVF07uxQyhREY+lSVr2laXmLUWheRJ+IA0sGSQB4Ghj8Hza1chgfztBPH2JBv0kohIYYtph2Q=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr5058827oia.122.1577720392421;
 Mon, 30 Dec 2019 07:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191224135404.389039-1-Jason@zx2c4.com>
 <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
 <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
 <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com>
 <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com> <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
In-Reply-To: <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 30 Dec 2019 16:39:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com>
Message-ID: <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 30, 2019 at 4:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Dec 30, 2019 at 3:37 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On Mon, Dec 30, 2019 at 1:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > - Why does it crash in the first place rather than returning -ENOSYS?
> >
> > There's a bit of speculation about this in the original thread that
> > prompted this patch (you're CC'd).
> >
> > >
> > > - How does it actually work if you run an application built against
> > >   an old musl version on a kernel that tries to make this not work?
> > >   Do you just get a random time (uninitialized user space stack) and
> > >   work with that without checking the error code?
> >
> > Actually, your patch fails here. The ts struct remains as it was
> > before, filled with garbage. No good. My original patch in this
> > thread, though, does result in the correct value being written to ts.
>
> Ok, that is the intended behavior then, clock_gettime() needs
> to fail with -EINVAL or -ENOSYS here (depending on the libc
> implementation), and of course the data is not updated.
>
> Returning success from clock_gettime() on a kernel with only
> time64 support and a libc with only time32 support (or vice
> versa) would be a bug.

Ah, right, hence why the 32-bit compat code is behind a
still-on-by-default-but-not-for-long menu option.
