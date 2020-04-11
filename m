Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1D31A4E91
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2020 09:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgDKHhj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Apr 2020 03:37:39 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36653 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgDKHhi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 11 Apr 2020 03:37:38 -0400
Received: by mail-qk1-f194.google.com with SMTP id l25so4413053qkk.3;
        Sat, 11 Apr 2020 00:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=34SXotHCFig2XW0ZT/0v7PT2JbF8G1bKxwbaFq/YqAQ=;
        b=g/weE0LkjlpFsKMBKmX7qwvx/jDIL5lJ2WQyIXEhvcDHopKETqPVuFAS6a/zxrWzrr
         Qq7VnjI4B8KFyFIP2HJqtHkeCmYwRy/btGBDYzGNMCgzII2eJQb7f94XOORaAba03HqI
         V0M/BAWYWXdNHKfDLaFGcpzPUYoAioUQceBLocZofdJkJWfCm71NrsMFfq9B3E0pCE8o
         t6wcqyNDiN04bBD0pralL3tEmVdR4VYt+egNMgVXckcjI71tz25DzgKk7Af+3hPATmFy
         whky3H4LCOtcqW6c8m+eF81XzQBZt1+WrQuW7nkxUcVl+x0fhPjMRpB5rjG9teEybIxj
         jnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=34SXotHCFig2XW0ZT/0v7PT2JbF8G1bKxwbaFq/YqAQ=;
        b=T8x1lVS+75/NyQ/5pr2TTrDVqsX89aB4Uo0Cb4Q5hq7rYGp8/xCoTfjBREs1RauqHZ
         cg7Y0yzlHSy99jrfDjwhKEIw+dUEsoiCop3yMeYsyACWYBa03e9ewsqRqT6YlQqyUelM
         344MSMkeFZhccPH5nC8SYq3khTdqxtYgSMSzbs8/AGwBEM7Th37CwvghTM4wq3/O+9T8
         ngEjun7zfTH6Yyq8N4wpe2ve9MkMoR5JUCfk2ttU9OWelcaDr1keRPOTnJEMULSwPOHS
         sdjRSCESASNmGpjztwJnDY27btipX7dSJi+oHQWII0rPRy1vAt5yMOmL/P9Sx07+ryHo
         DQVg==
X-Gm-Message-State: AGi0Publr3xOWCGTziCY+wIo2ACdcMUK8XVwjRBhv6xDvzp58lreV0KQ
        sXBMO3IoNmkkoujwKn6IOFyP1XiV7EW+//zoxW7zRw==
X-Google-Smtp-Source: APiQypKElt8bZ5XyFAjlDmMCD2pAfkCb45r/Mib5vH182COutzFcyLr40lTWSXh14XH6dEFiHoXFZ9bcJEZbCBrx8rE=
X-Received: by 2002:a37:702:: with SMTP id 2mr7472285qkh.134.1586590656249;
 Sat, 11 Apr 2020 00:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <1586401829-22242-1-git-send-email-yangtiezhu@loongson.cn>
 <CAKcpw6XywbOs-rh5ko0uz9vLz9nkgrJ0LiRTSkQQaU9dZbg7oQ@mail.gmail.com>
 <20200409150923.5b224361@flygoat-x1e> <alpine.LFD.2.21.2004091540450.596385@eddie.linux-mips.org>
 <7A98E39B-EDCF-496D-9525-0160A368361B@flygoat.com>
In-Reply-To: <7A98E39B-EDCF-496D-9525-0160A368361B@flygoat.com>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Sat, 11 Apr 2020 15:37:24 +0800
Message-ID: <CAKcpw6XU=vwGMwMBJk-Rsg--8CqEis39DEAJRMboP=2aYd5r8g@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Limit check_bugs32() under CONFIG_32BIT
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Jiaxun Yang <jiaxun.yang@flygoat.com> =E4=BA=8E2020=E5=B9=B44=E6=9C=889=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8811:47=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> =E4=BA=8E 2020=E5=B9=B44=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
1:07:46, "Maciej W. Rozycki" <macro@linux-mips.org> =E5=86=99=E5=88=B0:
> >On Thu, 9 Apr 2020, Jiaxun Yang wrote:
> >
> >> > > There is no need to build and call check_bugs32() under
> >> > > CONFIG_64BIT, just limit it under CONFIG_32BIT.
> >> >
> >> > Since 32bit is subset of 64bit, and due to the code, I think that
> >the
> >> > initial purpose
> >> > of check_bugs32() is also willing to run even with CONFIG_64BIT.
> >> >
> >> > For example, if we have a CPU which is 64bit, and work well on
> >64bit
> >> > mode, while has a bug only on 32bit mode, check_bugs32 should be
> >used
> >> > here.
> >> >
> >> > Loongson's 3A 1000 is the example, I cannot support FP32 mode well.
> >>
> >> In this case bugs32 only contains a workaround for MIPS34K, which is
> >a
> >> MIPS32 processor. It's safe to do so.
> >
> > This is because commit c65a5480ff29 ("[MIPS] Fix potential latency
> >problem due to non-atomic cpu_wait.") moved the other generic
> >workaround
> >elsewhere.
> >
> > The intent has been since historical commit 450ad16ba0ab ("Get rid of
> >arch/mips64/kernel.  9116 lines of code gone.") that `check_bugs32' is
> >for
> >generic errata affecting both 32-bit and 64-bit operation (e.g. 32-bit
> >instructions, which naturally may occur in both cases) and
> >`check_bugs64'
> >is for errata affecting 64-bit operation only (e.g. 64-bit
> >instructions).
> >
> >But currently it appears we have no generic errata handled, as surely a
> >
> >34K erratum cannot affect 64-bit operation.  So I think such a change
> >makes sense in principle (if a generic erratum appears in the future we
> >
> >can add a third category, which includes workarounds that are always
> >applied), but I think it has to be made in a cleaner way.
> >
> >Specifically `check_errata' has to be renamed to `check_errata32', some
> >
> >commentary added as to the intent, and last but not least a proper
> >change
> >description added that not only repeats what the change does (and what
> >everyone sees regardless), but actually justifies why the change is
> >made.
> >Saying: "There is no need[...]" does not tell us *why* there is no
> >need.
> >
> >> But my suggestion is if you're going to clean-up bugs and workarounds
> >> you'd better establish a file for silicon bugs and provide Kconfig
> >> options to enable & disable them. Manage bug dependencies by Kconfig
> >> will be easier.
> >
> > Why is using Kconfig supposed to be better?  Several configurations
> >support multiple processor types (e.g. swappable CPU daugthercards or
> >FPGA
> >soft-cores) and having to list CPU types across platforms as CPUs are
> >added is going to be a maintenance nightmare.  Whereas having
> >workarounds
> >or panics associated with run-time determination of the actual CPU type
> >
> >guarantees they will trigger where necessary.  The use of `init'
> >sections
> >assures the reclaim of memory for use after bootstrap.
>
> Actually I meant let bug checks depends on Kconfig's CPU selection.
>

I don't think this is a good idea. Since the routine is executed single tim=
e,
so it is not performance critical.
And Kconfig for per-cpu is bad for the future if we want to try to archive
single kernel image.

> It's guaranteed that you can only select one kind of CPU one time,
> to prevent the overhead of checking bugs on irrelevant processors.
>
> And we still have to check PRID/CPUTYPE during boot to enable
> proper workarounds, because the Kconfig options are telling about the pos=
sibility,
> which means a processor potentially has some kinds of bug.
>
> In this case, M34K's errata should depends on or selected by
> CPU_MIPS32_R2 in Kconfig.
>
> So there won't be any nightmare, but only reduced code :-)
>
> Probably we can build-up a general framework for checks & workarounds,
> and display affected bugs in /proc/cpuinfo?
> That's my personal thought.
>
> Thanks.
>
> >
> >OTOH I agree splitting off errata handling to a separate file may make
> >sense for structural reasons; we have it already for `check_bugs64'.
> >
> >  Maciej
>
> --
> Jiaxun Yang



--=20
YunQiang Su
