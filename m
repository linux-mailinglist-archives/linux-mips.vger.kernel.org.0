Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7141E6133
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 14:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389842AbgE1Mow (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 08:44:52 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:34447 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389783AbgE1Mov (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 08:44:51 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mc1hn-1j0q9W2ejP-00dTHr; Thu, 28 May 2020 14:44:49 +0200
Received: by mail-qt1-f178.google.com with SMTP id i68so22037278qtb.5;
        Thu, 28 May 2020 05:44:49 -0700 (PDT)
X-Gm-Message-State: AOAM533WnvN07rc9kn9iA2pOoNSxdYddSO0XUjH6YdXgd55UJILAr8km
        up99alB8WtsYb9lfPalvPz442EBTtCqw1+osyWk=
X-Google-Smtp-Source: ABdhPJxZXUChaKTDliaMUeX0epZa/YK95/W0ULpyjKRLy+WFzLvw+joqo7cKUbQkQVsTL7VO0+fof/I8H1lW60z6P/E=
X-Received: by 2002:ac8:1b56:: with SMTP id p22mr2842856qtk.304.1590669888325;
 Thu, 28 May 2020 05:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
 <20200526125928.17096-5-Sergey.Semin@baikalelectronics.ru>
 <CAHp75VcfkPPy5YjNrcv8c6doyQz5C47QyREE0v6tfQjXYrBijQ@mail.gmail.com>
 <CAK8P3a2WMqTRitUU86hSV3HSK12-hF_RDoFg51PRGTLmXwznvA@mail.gmail.com> <20200528122738.rbl2dkgep4ipr2je@mobilestation>
In-Reply-To: <20200528122738.rbl2dkgep4ipr2je@mobilestation>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 28 May 2020 14:44:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ctV8Lj4PGJyzZ_eRMcXxoW1T7Wbk_2wkT4HUcFUTqdQ@mail.gmail.com>
Message-ID: <CAK8P3a1ctV8Lj4PGJyzZ_eRMcXxoW1T7Wbk_2wkT4HUcFUTqdQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] bus: Add Baikal-T1 AXI-bus driver
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "soc@kernel.org" <soc@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:IQDK3DI2FiEo5W/E3yLMWFY0APen8SVNQA3vx4FpFNeu+sk2UjA
 AtyC5KOHWPMxYI3ubOHRjxmmtKAHftzKsKALFrFmQqFmxv2Bm5Bbx73Isv+nAitDKMW3w20
 WMKXTqmMSdFFijamMnOwpmYP41S1vOvK3u2vS/MSpmWmP8WlLfp+pSvBwszC+wLueWMG4rA
 YwRDSh9AzDpMoFMPjjhVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WEZNJkvZYx4=:4hr8MA/5d0870mqr9bFoq7
 jJIgyNj7DvLkbFB3/30ALt4kcUfAiYRoTGxhEHoUK/XSiqEkgqzAstCcuaUsHmBzQjx520IQt
 zzLMyiJXEDNBpVWiE6/3wqnbZMSFDYUXr9D+DW2KREnue1T6V4QucmW7aBco3zjdYicCd6+Qd
 SOtjDlyRMhsLkkYCEZKbd2JkD3MVn8cCEhV9IkaKD98m247z6j0AE/swQMSe5pfeBdzak9xqK
 qgqHN2+Bw+JazSf8I1zV5B/JzkEX5Sx49rQuq3jgIWGJuceJieq5x4Q49aOKTlaEHzF7Jqrje
 AU1Eo3VYintIZwvtOwMPB/9/MPHuAYxQX9Nh6e1c93pYTDiw4yh8cBER9QJoLvbmF+oDvt/XS
 l9ceVthdMFRw4jwFmmNyBJYv51wWVpzMheSWhfswdf//pramYtDBxuUmMxVzUa1hfpEgIVp/J
 DhOiS7ZEf3WdUUoUcD+znBaS89I0sQX1kABmPSBknX0rxQjFaOHZHdmVmZlNFUEDf9jj+Rhrm
 QrBbo4usm2GJ1iPqn3DevI9Xj7aCttsWQlvlnZVRZ4rp6zrH6kI3BMBzOzF5de9JXNMP/IUi8
 CdLQZCb497VYAD79/TvRTnTOo1z2wOXrPj4ByCORy1THa/g+jsC45v150hG+c2I7TnX1DNGsJ
 xWRfgzehnvPNcOIL74AxY0LqokQVUSBlDQw/3ILSoLiX8M4xcsPEML5QjS2MrXWzzDXJftDBC
 xFkv/JanSFM6BDjFI9WH0BNWanp7CsCRJwvsRnbEJYbP54fdKodfTZTeTBzirzvb6ByEQAPbg
 qqL3iOCxaxHCU3IwUW8EGbS7TwxaK1OwOXnnb+Dqs9Ni0qrsw4=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 28, 2020 at 2:27 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Thu, May 28, 2020 at 02:14:58PM +0200, Arnd Bergmann wrote:
> > On Thu, May 28, 2020 at 12:01 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tuesday, May 26, 2020, Serge Semin <Sergey.Semin@baikalelectronics.ru> wrote:
> > >>
> > >> AXI3-bus is the main communication bus connecting all high-speed
> > >> peripheral IP-cores with RAM controller and MIPS P5600 cores on Baikal-T1
> > >> SoC. Bus traffic arbitration is done by means of DW AMBA 3 AXI
> > >> Interconnect (so called AXI Main Interconnect) routing IO requests from
> > >> one SoC block to another. This driver provides a way to detect any bus
> > >> protocol errors and device not responding situations by means of an
> > >> embedded on top of the interconnect errors handler block (EHB). AXI
> > >> Interconnect QoS arbitration tuning is currently unsupported.
> > >> The bus doesn't provide a way to detect the interconnected devices,
> > >> so they are supposed to be statically defined like by means of the
> > >> simple-bus sub-nodes.
> > >
> > >
> > >
> > > Few comments in case if you need a new version. Main point is about sysfs_streq().
> >
> > I've applied the patch now and folded in fixes for the build warnings and
> > errors pointed out by the test robot, but I did not include the changes you
> > suggested.
>
> Are you saying that the build-errors and warnings have already been fixed by
> you, right? If so could you please give me a link to the repo with those
> commits, so I'd work with the up-to-date code?

I've pushed it to https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/,

I made a local "baikal/drivers" branch with just your patches, updated
to address the build reports. This is merged into the "arm/drivers"
branch that contains all driver specific changes across all SoCs and
this is what I'll send to Linus next week.

There is also the "for-next" branch that contains all arm/* branches,
and this is what gets pulled into linux-next, so your patches will show
up there tomorrow as well.

You can normally check the status of any submission to soc@kernel.org
at https://patchwork.kernel.org/project/linux-soc/list/, but it seems that
has not picked up the status yet, and I'll have to update it manually.

       Arnd
