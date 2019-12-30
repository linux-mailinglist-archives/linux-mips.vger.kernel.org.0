Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B370312D184
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 16:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbfL3Phh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 10:37:37 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:46661 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727580AbfL3Phg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Dec 2019 10:37:36 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mwwhv-1jer4f2qL5-00yOtG; Mon, 30 Dec 2019 16:37:34 +0100
Received: by mail-qk1-f174.google.com with SMTP id 21so26520112qky.4;
        Mon, 30 Dec 2019 07:37:34 -0800 (PST)
X-Gm-Message-State: APjAAAVaIaHEIrUNGyN0Y4kEeCou8WO/8gfCFMrcLIQWfy9AqGwgLGEU
        i+jnzqkH0sAWA/6tN96OmqW+TvqAl1XuWgLLiHI=
X-Google-Smtp-Source: APXvYqyf1A0oXcTJolHPkUeu8aYWQuHpcTDGdfaaRYX0lWILnVxBMQORF9cwupX2iff1mtAGNJMl4+s5WYL+/26mvR0=
X-Received: by 2002:a37:84a:: with SMTP id 71mr53785544qki.138.1577720253491;
 Mon, 30 Dec 2019 07:37:33 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191224135404.389039-1-Jason@zx2c4.com>
 <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
 <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
 <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com> <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
In-Reply-To: <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 30 Dec 2019 16:37:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
Message-ID: <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:3VuDkPZFYgFaHU0oIkjMNwrhLMIaLqWAJIXGdTeGYKQqRxF/ows
 4XeV52aq1yGuXIgtVfKMJRLeH7yOSawlHRKO/svup13oRcDTSvy7MIfkxyq7IZ4f+iD4lPd
 /4hgbcFqt0MbTH7LIzsAbyRIMKAhTkF5PUbEv1UCfhUJ8Tx3FJXi3JsBAHQWU986x8nGqHR
 QvfVrFlMVgEI6gn8KapBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Uj1AguZpGKE=:NYlnUlsFB/NY4NAYNNlxQ9
 4VHG1dVqJ3f/WdDfiY8lCQ+iTJEXfLrv8FKuOZMttBpag2pqd6KUhakinmtX4TaH+OoXtAT48
 ynQehu4mScHDVdpr/u/IY8Chk2pSAT1Y5MVf1j0C0FQGKRV6PMSSyKf3GScL7qrJT5rUc0AEQ
 2p0ppsTvCPIoaqOvyqv7PUIvtCuoQqWMpwpbDQCuD2szRHPp/fgWcJj3oeQJRrvlWJ16bCkOR
 SO6jp/sBt5snyGbL4W/oTDIyxLUNk3V75JuFntOoUU235ZAOWQSdl+6jCtDNkuNCZDebqPMW9
 +fg/ADRpNp9OH81cSEtR8AfYGjdnzAJrn/8cNS4p+JB+zl3QTE4Z87163oSBE/6EYrnsH9KAs
 8c0dYm6e7OVLIsx0FnZHiZ8ej0m8o1X/O0Rl/a7EOayGzeCYNElGNAW5e9R8AOK0tnsvZHF/a
 nXueLfsUdoOV0PKOKxSLJL5xIDH7dCAegXiNxfObeSJL57ozVgbKXtPt0I3hPPe8VP3FmwUqb
 UJX4HZ4v+3loBivKnqOgiLTQ4Kb6EP5RK1+UyqtXIXU0mD59/cWV0ujQbdDIxjPI4yaykJXwc
 pg2NqrkiGpXhtZnm7cIksdxPQ0DnqlE9GFS2oMHDy3Ye4MtCNJzkWlW5ztbqEY/4w99kKXCcz
 eK3PosLYgIdu2x1BjLd1Lkvyr3hrAwxKCpd2tZcWt1c15l5UYFAR/Q/QIKWzxFh+hpNm82M6T
 MdWk7GELhVpYF020jrO8rj+wzBtMMoqB5zC5NRJqHhmsWGY8AcoqW++7zYS3P8Q0fglHE9cPG
 QBlUxONzfa746VAUzIY+81Gbdeq2Cqw1Js/pFN88A5f731tak85cWN+7yKLBJ6gUf4WRPN1vq
 TZzHBi2XUerA9IOJ2GQw==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 30, 2019 at 3:37 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, Dec 30, 2019 at 1:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > - Why does it crash in the first place rather than returning -ENOSYS?
>
> There's a bit of speculation about this in the original thread that
> prompted this patch (you're CC'd).
>
> >
> > - How does it actually work if you run an application built against
> >   an old musl version on a kernel that tries to make this not work?
> >   Do you just get a random time (uninitialized user space stack) and
> >   work with that without checking the error code?
>
> Actually, your patch fails here. The ts struct remains as it was
> before, filled with garbage. No good. My original patch in this
> thread, though, does result in the correct value being written to ts.

Ok, that is the intended behavior then, clock_gettime() needs
to fail with -EINVAL or -ENOSYS here (depending on the libc
implementation), and of course the data is not updated.

Returning success from clock_gettime() on a kernel with only
time64 support and a libc with only time32 support (or vice
versa) would be a bug.

    Arnd
