Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFAD13897E
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 03:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732594AbgAMCf3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 21:35:29 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:40472 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732487AbgAMCf3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Jan 2020 21:35:29 -0500
Received: by mail-il1-f196.google.com with SMTP id c4so6878321ilo.7
        for <linux-mips@vger.kernel.org>; Sun, 12 Jan 2020 18:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=junsun-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+vmq+MvCN9yDxyzsI/kecgh7O950q8Ev4MqUe7jGaF0=;
        b=d86FaI31vbSfebmdD4QHwtNdhZgknCrAI2pHU77pnT1EO+t1FsxlhS9gGCUMi+KHf1
         Is7LZbi77MhDOMAZiCXC4uL5c5PcunHLm5gozPsOFWZGApA/BMtf7z7zOq3Gql52MDrK
         4kfxYKap80VexpZf8q/k2tkhDYVA/brwvwLUiCQgP1b+0sdT/broa7Fsw//kyxGi/5n1
         OSb1MmpMW8GmVv78/pAFsQyPUNCTMd4vTJU+bpVgyFdhYWvWqHt6603+VEFtJkDptNbL
         PwIyYZKGDgxprq5e03cromR25286z3qwHmg4GvJfP2MwjWs96f/zLXmQRzw7jxc15U3k
         3a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+vmq+MvCN9yDxyzsI/kecgh7O950q8Ev4MqUe7jGaF0=;
        b=LVIqWffkjjPRFX9sKFefv52WXZMApOG0g1QR3ui4SWzDSbT7kP23TfrGK8LBVHZA+k
         Wwh0s99Yi1FrMxqE0KRjPLXOfcQFBx506wxsu4W9nBn3maqxB2b5GTyBp4KB1k7Ofxa3
         pAt2rTbsD2qLqqBvGODnZ96Z7V4EhxNnigC1gpt9FyMP8iqGOjcrLxpZkqB3Yp/blMyE
         z1+Fsa9NK1hngPgAyxA+ylRGTIMmrTYmKlfLBa/M6uqRoLE00JDemTDG0+o3Z5svKJ7J
         ykGD6NkOKxJsc4tAWCIkOw0VavHdE+KJXgpTvdrTlIf2evIO9VxROWmOyZac81d6hPq0
         /4dg==
X-Gm-Message-State: APjAAAXztwm23F2s8rf2sAyV101/jyRtNUfVnYq1mXhpN9vWo/kOBa88
        atyZ1Z+QDNBLOVjaSP5OkLFxN5rpyVXj0MbbIQVXSfF2
X-Google-Smtp-Source: APXvYqyW5U/m4CZjqvKE5eCyoSFdFSizD/ZuzxOAzeaULk/T0wvPsC3U7CpX/k5JHupXByTg6rMO0LdED0f/qb2FZ98=
X-Received: by 2002:a92:8f4b:: with SMTP id j72mr13433345ild.1.1578882928337;
 Sun, 12 Jan 2020 18:35:28 -0800 (PST)
MIME-Version: 1.0
References: <CAP5Nno5CPjV2mcf2ny8AtcC2ziqDkv6Kc7f4hCq1TF4DvKvJkw@mail.gmail.com>
 <CAP5Nno466s9M_7E0keMP3s=rDuZ48hrAb9-xAv52SsADr910XA@mail.gmail.com>
 <20200109212404.GA1750666@aurel32.net> <CAP5Nno4d4r+yaARLGYd==5wznOMXf1Ufc2P-DjsVc-FavxLvUw@mail.gmail.com>
 <783FE963-FE06-40FA-8F8B-980B912A9602@flygoat.com>
In-Reply-To: <783FE963-FE06-40FA-8F8B-980B912A9602@flygoat.com>
From:   Jun Sun <jsun@junsun.net>
Date:   Sun, 12 Jan 2020 18:35:18 -0800
Message-ID: <CAP5Nno5aBir+DSFTrcGfenuo1s+UTGr5LKU6YDNYREjwahnXKA@mail.gmail.com>
Subject: Re: debian bootup hangs on qemu-system-mips64el
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     qemu-discuss@nongnu.org, debian-mips@lists.debian.org,
        linux-mips@vger.kernel.org, lixing <13699171092@139.com>,
        Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thanks, Jiaxun.  See more questions below.

Jun

On Sun, Jan 12, 2020 at 5:17 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
>
>
>
> =E4=BA=8E 2020=E5=B9=B41=E6=9C=8813=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
3:34:18, Jun Sun <jsun@junsun.net> =E5=86=99=E5=88=B0:
> >Are you sure QEMU/MIPS does not support SMP?  Below link written in
> >2016 clearly shows something was working then.
> >
> >https://www.mips.com/blog/how-to-run-smp-linux-in-qemu-on-a-mips64-relea=
se-6-cpu/
> >
> >Also, as Lixing mentioned in our private exchange, there is SMP
> >support for loongson.  Lixing, I assume loongson SMP support is
> >already merged in QEMU repo, right?  Can you point out the relevant
> >source code directories?
> Hi Jun,
>
> As far as I known, Loongson is using there own SMP IPI implementation ins=
tead of MIPS MT One.
> There QEMU implementation could be found here [1].
> QEMU have implemented MIPS MT ASE for SMP.
>

Do you know how to enable and run MIPS MT ASE in qemu?  For with CPU option=
s?
