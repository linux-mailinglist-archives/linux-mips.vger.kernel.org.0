Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 666E91389A9
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 04:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733020AbgAMDT2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 22:19:28 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:38026 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732961AbgAMDT2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Jan 2020 22:19:28 -0500
Received: by mail-io1-f48.google.com with SMTP id c16so3906867iom.5
        for <linux-mips@vger.kernel.org>; Sun, 12 Jan 2020 19:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3/cOLMl7mwYBctl2xQ5pd+ruSEBnbBUw3ounkb2JugM=;
        b=tiyi3Pp6BRpuQMwgtvBKxwjWh+EkrWAfWE75yuWSV1F14TrhzA/9zxNcZBnA63sQLX
         Biy5rVyeYpInqnYQ1a7K9WXoy/vgtftOmkpFg+vzE73fzKoMIWfMhv7R4Mn3wBNH55/A
         Ab6QIcbhSWV6+kMMURc+Cukm2VHtupQLpMHLrd0iTVK8/LFYCupy2iFTe7GnaA92OlL6
         9JTXmR3nMd6OVGLG/aorQO5VVFddVoY+fTSOl8Sg+V9hknTJBYoZAECg7Gd7PJSS6aet
         BJRgXa8KVOSoFYU1sQDBXC1nPESLKwdDg4W+HPAh/kIHw29MaGo7pwPza+HDFgKdaD60
         AomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3/cOLMl7mwYBctl2xQ5pd+ruSEBnbBUw3ounkb2JugM=;
        b=LEf0xyGPQ65GtmhtYHq5YPqCROpVNzz1m1pMyXoqs5yLC0dr7hKKjeYXbrItSDUuo2
         rYjwAnouJ7iZ2aEeOefucTXQ77YB0zUX2g1chhtXRYO/x+LVaOkrlIP89LYbFzJz3JA+
         qlZMaAH5YROyOyCFFPWQeY/az+ctbjTf3uj3gkaFp7e2l3acTg7nnjMnVfEti4QmgRmW
         SwvhfZ9cow9s/PPtpSPjb0ZEUTmZUmw8q2ZC8E6VbPJ/vO+FrnhG5m08xFDwEzRXbyxc
         oodA6GK6z6ERzYuGWdO4fOZnS2baJx53nrZlQsEvpOBQNOv+2vYLSBY4kghVBAIWvIxZ
         dvbQ==
X-Gm-Message-State: APjAAAXnqXhWesObvWgH02qFLjBYm5rbVd0yoxTsc367+YYgh6P50/Wz
        4J2sQVCJWi/RUzlSbLzvSSYFXuO0J9qZk66AMfk=
X-Google-Smtp-Source: APXvYqxIpDi53RhOSpwlnmlYyPogZkcO+cUQroVx803Nog3frJKnIqWCX1AedHXL1rmcPeG9E0JZdboHCWx+LCINbts=
X-Received: by 2002:a6b:4e0b:: with SMTP id c11mr9692654iob.143.1578885567638;
 Sun, 12 Jan 2020 19:19:27 -0800 (PST)
MIME-Version: 1.0
References: <CAP5Nno5CPjV2mcf2ny8AtcC2ziqDkv6Kc7f4hCq1TF4DvKvJkw@mail.gmail.com>
 <CAP5Nno466s9M_7E0keMP3s=rDuZ48hrAb9-xAv52SsADr910XA@mail.gmail.com>
 <20200109212404.GA1750666@aurel32.net> <CAP5Nno4d4r+yaARLGYd==5wznOMXf1Ufc2P-DjsVc-FavxLvUw@mail.gmail.com>
 <783FE963-FE06-40FA-8F8B-980B912A9602@flygoat.com> <CAP5Nno5aBir+DSFTrcGfenuo1s+UTGr5LKU6YDNYREjwahnXKA@mail.gmail.com>
In-Reply-To: <CAP5Nno5aBir+DSFTrcGfenuo1s+UTGr5LKU6YDNYREjwahnXKA@mail.gmail.com>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Mon, 13 Jan 2020 11:23:54 +0800
Message-ID: <CAAhV-H7nvhZaFVz+Jwf86GNAtp8qeY7Dj665xhGoovBg34HuuA@mail.gmail.com>
Subject: Re: debian bootup hangs on qemu-system-mips64el
To:     Jun Sun <jsun@junsun.net>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-discuss@nongnu.org,
        debian-mips@lists.debian.org,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        lixing <13699171092@139.com>,
        Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, all

I'm working on Loongson-3's SMP support in QEMU, and I'll send my patches s=
oon.

Huacai

On Mon, Jan 13, 2020 at 10:35 AM Jun Sun <jsun@junsun.net> wrote:
>
> Thanks, Jiaxun.  See more questions below.
>
> Jun
>
> On Sun, Jan 12, 2020 at 5:17 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wro=
te:
> >
> >
> >
> > =E4=BA=8E 2020=E5=B9=B41=E6=9C=8813=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=883:34:18, Jun Sun <jsun@junsun.net> =E5=86=99=E5=88=B0:
> > >Are you sure QEMU/MIPS does not support SMP?  Below link written in
> > >2016 clearly shows something was working then.
> > >
> > >https://www.mips.com/blog/how-to-run-smp-linux-in-qemu-on-a-mips64-rel=
ease-6-cpu/
> > >
> > >Also, as Lixing mentioned in our private exchange, there is SMP
> > >support for loongson.  Lixing, I assume loongson SMP support is
> > >already merged in QEMU repo, right?  Can you point out the relevant
> > >source code directories?
> > Hi Jun,
> >
> > As far as I known, Loongson is using there own SMP IPI implementation i=
nstead of MIPS MT One.
> > There QEMU implementation could be found here [1].
> > QEMU have implemented MIPS MT ASE for SMP.
> >
>
> Do you know how to enable and run MIPS MT ASE in qemu?  For with CPU opti=
ons?
