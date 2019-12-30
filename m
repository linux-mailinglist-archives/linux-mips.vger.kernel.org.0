Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09BF112D00C
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 13:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbfL3MeT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 07:34:19 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:46745 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbfL3MeT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Dec 2019 07:34:19 -0500
Received: from mail-qv1-f44.google.com ([209.85.219.44]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N2Ujn-1jkQEQ1z4B-013xVI; Mon, 30 Dec 2019 13:34:17 +0100
Received: by mail-qv1-f44.google.com with SMTP id z3so12315547qvn.0;
        Mon, 30 Dec 2019 04:34:17 -0800 (PST)
X-Gm-Message-State: APjAAAVxg9/Va+7Lxa53J1oJEUS5unQ0od8K+WOzs4vwlTz68xbQRo/f
        UZF0ILfphuBq1xjYh+5pNRI0+5T9Zz6pQcGURCM=
X-Google-Smtp-Source: APXvYqzVAo+ZyEfJF+byazHBzyw1r81fYUkb+lIcfsfvEl5CCNv0HGBgtp71HHEqcuQmiYrP+noYzqN24cAaxpdyDYQ=
X-Received: by 2002:a0c:8e08:: with SMTP id v8mr37832199qvb.4.1577709256287;
 Mon, 30 Dec 2019 04:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191224135404.389039-1-Jason@zx2c4.com>
 <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com> <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
In-Reply-To: <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 30 Dec 2019 13:34:00 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com>
Message-ID: <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Moo4o+r9ZXyOcQLpJBeMNmEX74RKaHhRTEX+rPGRUfwsVxXGuEO
 wqPV8DCbcTF5AGcgUSOaKy3SbeHqkLvg4UnsWUzMB+6ucXrwP+3t9votLoo2cAJiwU4/yA1
 zPLALZCZ3QT3CGJegxuIe70Mu3k6E5tAW2JaDzJuBFCvUs55F3cCq7QYsnOT5zhl4v9RVJ2
 tqyLiPugFvYVYWQCQ5FzQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yNMXuiXTtMY=:LPMAgjEFvqvDIBLQq2+iLz
 tVFPJilUKTV1NBbipEgxDabgGPyrKNPhFbahyWC+c1m+OsqrX6NFo6PnhnjaduLdPRIGyR+Rs
 RLxMhhGBfm/AruwKQXOnSQaV9bDzYEejhqO0vuh/vonmoOJtAo+DJdMv8hibKdDqcgsIIRr0G
 0nJBRHX2iYDt950KG7gMsdI4CEXrKL3muy7y5GvaHTviEx3s6l3fPsp808fhXrIdErdzBx5pF
 vGOoXAc9ZSxWZVR3zTajBEPNIEL4yrov1VzzQtP9qOzOV8aGWy1H3yF/mZoFusEzLsOqFEtNo
 fHexeGXEYV+C9W10T8FHA3Fo+l3U87HXo00tRgN0OZSRok45UIjtR0TDnrWYWgw/g/aIF15gN
 ZRv60bKKw/V07IUmwl066S0dJusTL1xAFSFRtJxh2ahvQ4IkP8LsRrUndX2sU4mTEMXHni4pF
 TuEajA9U87jswJaj3+KUN47zKaiIGbCFp9Vo1Az91XGvEgneAM6DwiLqlLc/ctScK5gGVq2ES
 GtJim8+tb7dVpt3gn/ZLSP1DLmCtrawDgeOZ9tcnHrSlrLD6TscQiWTO+X4RvkOBvi9T0ftJq
 BKKt7Z3O1gxA7Q7WJSEDrMjwBTQIO7Ucxp0rGgp564go8V8kdMCMkfrlZClUki8LbGXR1L6Y2
 fbNMOt5+vE5uL0gamLadYNZw+iZWpHQyLCEUNiBqDyYbPtk85ox4oi64B7lAe8MBMuoYmPFZw
 WJLkQV4q/0jDkaj5kijhew8SslXA9TeCmxc8VPc75vaqxMkGt7iqtOPTHii8UM++fzQjVTNAH
 QTRnnAAQcb7tbckDD6gDuihCVVq3YiZCGQSBgr9buRyDgT6adO9JmH6fe9AIXZJ5+H3HNH7jI
 I+XN9AEENbtOh7gZy70w==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 30, 2019 at 1:27 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, Dec 30, 2019 at 12:58 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > Thanks for the bug report! I'm not completely sure why this fails in
> > this particular
> > way though. I assume you are using musl-1.1.20, not a musl-1.2.0 snapshot
>
> Yes, that's the one, sorry.
>
> > diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
> > index da4627430aba..0bdc6a026be8 100644
> > --- a/arch/mips/vdso/vdso.lds.S
> > +++ b/arch/mips/vdso/vdso.lds.S
> > @@ -93,9 +93,11 @@ VERSION
> >         LINUX_2.6 {
> >  #ifndef DISABLE_MIPS_VDSO
> >         global:
> > +#if (_MIPS_SIM == _MIPS_SIM_ABI64) || defined(CONFIG_COMPAT_32BIT_TIME)
> >                 __vdso_clock_gettime;
> >                 __vdso_gettimeofday;
> >                 __vdso_clock_getres;
> > +#endif
> >  #if _MIPS_SIM != _MIPS_SIM_ABI64
> >                 __vdso_clock_gettime64;
> >  #endif
> >
> > That should ensure that no user space can call the old vdso
> > functions on a kernel that intentionally breaks the actual
> > syscalls.
>
> I can confirm that patch fixes things. Thanks.

Ok, that's good news, but I think we still need to answer two questions:

- Why does it crash in the first place rather than returning -ENOSYS?

- How does it actually work if you run an application built against
  an old musl version on a kernel that tries to make this not work?
  Do you just get a random time (uninitialized user space stack) and
  work with that without checking the error code?

      Arnd
