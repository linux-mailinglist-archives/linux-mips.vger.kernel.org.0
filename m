Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9571DC7B3
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 09:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgEUHa2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 03:30:28 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:34467 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728316AbgEUHa2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 03:30:28 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MEmpp-1jqlgo3dFL-00GHJO; Thu, 21 May 2020 09:30:26 +0200
Received: by mail-qt1-f176.google.com with SMTP id c24so4757765qtw.7;
        Thu, 21 May 2020 00:30:25 -0700 (PDT)
X-Gm-Message-State: AOAM531XMZgv+q3ZN8K+wb5hpUxL54KCDewzxB5xuzM2b+Ys4b3tla6R
        Us46VOP8APtHPTHr25tuLn0y1tBiRMxa9/Mb6hg=
X-Google-Smtp-Source: ABdhPJxb5MQ8kuEO75fNExBq52zxkwucWqTuaAehdsr7lKk/Qfg8lylkr0b4j+C/p9or/isfYY2zvvtfKGWgdvJXJ4w=
X-Received: by 2002:aed:2441:: with SMTP id s1mr9376585qtc.304.1590046224526;
 Thu, 21 May 2020 00:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
 <20200521004217.6gdcpboxaqizreky@mobilestation> <20200521071457.GC7309@alpha.franken.de>
In-Reply-To: <20200521071457.GC7309@alpha.franken.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 21 May 2020 09:30:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2OYtd9Fa44ufbnpFoW3=G+NUtuueAoAV9CGVRBgOhSGw@mail.gmail.com>
Message-ID: <CAK8P3a2OYtd9Fa44ufbnpFoW3=G+NUtuueAoAV9CGVRBgOhSGw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] mips: Prepare MIPS-arch code for Baikal-T1 SoC support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Olof Johansson <olof@lixom.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:BcLrKcPnWA60MbUrQ9m1/wEg+zlclLnUt4s6jdc55n5PTkhjbZL
 JgQ+jIrAuUH53tQy6AJVWAapHq4JN24cYVd4zHakTRcWD2GUalJiJFHV0IQeSOoXJuykKVA
 4yuy5miOgwEYcUL+r5fAMgv7geU6XWtbNupIwZkFXsgKNfDTko3DxnUs1VpJ4EYSMbBxOlj
 PCAXJ5y7tFUan4YQu+3Gg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0WZ1TGQ04lQ=:NuCiqnLBLVWV/H5RW2GeWA
 1ZrTFLJQOaNa5ZB0mqoCscEAJdsouplyCjNs621j8hdRt3+qXYKmFIIaWUmht2sPppbJpVwPA
 D8LZG3lJdGpboNIW3etKekHbZH8q9FTljTCMP+tbJCJ4A/3vQVvA6Z8tmpdMcQhqKMK0xBXBb
 YuE94Z5LmdeY7mAVavfDskJGVf2UELX42Q5ogBIXNNx5CHrAKstrWfCMoaVdPh4rzjYjrVe4N
 6gunuZFFlrsk45oDqhKP1RXgVTQUObgmG+Xnv7N82bEF1ee/46guE3fQfFe62IpWr8gWnakMA
 7y8tHyCD8eBJKGGk6Y8YPVqghhsqX7rMEhiz1PYdRVxEbeYeE5L5NoVRIrYtvcZuju6QmtBga
 hpzst3ekEVJJubacjpkJHPkN1MeaQjVkinXdOQldPciD55vSZSX4j/XOhlnfkTJWbKtJHZjRp
 vjmJz3NCGf5hcnBXONr6F9z4hqu3duHufBeGMdZ00IgJ8X823ml5ajiZ0JIfxXZqDlHetEZvc
 VnzKEiWC+q90HME8tonwPYZR+g/2ASM1doSwHHXC0gs86XXDbdKZHSJWk157z5+9rWVbh5/pz
 bVKX/02JaMoNMpza0JiKAtTTra7T3q/KAwwZfHAlQ19xrdycVrKm7Yw28Lk84PUdfHyObCt7m
 /ZipSQ9zkScUf1OmSUc9XXEdUPq4MMcuflC+QGXakePevPu+Zr2FSTsqQxJviIE0TqrnUuQyu
 oGImf5AEAuQmq/nP8jNpTCNVvWdCFaVGLR+oxZQZNijxPcy2TQaRSGyGnzC0ehiv7IXdCI4BY
 GN+GGb2Nw8HOAWvPIiynoEnNJIqnh32f8+1JEht32H1WSSPMKs=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 9:18 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Thu, May 21, 2020 at 03:42:17AM +0300, Serge Semin wrote:
> > On Thu, May 21, 2020 at 03:34:29AM +0300, Serge Semin wrote:
> > >
> > > This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> > > base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> > > tag: v5.7-rc4
> >
> > Thomas,
> > Please note that this patchset is based on the Linux 5.7-rc4 tree (it most likely
> > will get cleanly applied on rc6 as well), while mips-next is still at rc1. Due
> > to that the patchset fails to be applied on mips-next. I think it would be
> > better first to merge the last Linux tree into the mips-next, then try to merge
> > this patchset in. Should you have any problem after that, please let me know.
> > I'll resend the patchset being rebased on top of the new mips-next tree.
>
> no, that's not how it works. Please rebase your patches on top of
> mips-next. Thank you.

Right, backmerges should generally be avoided. However if something
between rc1 and rc4 is required to make Baikal-T1 work, rebasing it to
rc1 would make it non-bisectable, which is also bad.

Serge, are you aware of something in -rc4 that is needed as a dependency?

       Arnd
