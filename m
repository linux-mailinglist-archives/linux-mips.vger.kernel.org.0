Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9946A347139
	for <lists+linux-mips@lfdr.de>; Wed, 24 Mar 2021 06:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235383AbhCXFrl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Mar 2021 01:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbhCXFrh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Mar 2021 01:47:37 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E707CC061763;
        Tue, 23 Mar 2021 22:47:36 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id j25so16533361pfe.2;
        Tue, 23 Mar 2021 22:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/V/wb+c7o+naCxYjw0DGXPXFDsGm4gbTHC17MJ5eDA=;
        b=UORtWm7q81uVrGPPQlVIZPbeeLQ5Ne8SaeD8lCdBTGsiDw082WEG6F9ZzA44U7U20R
         nV0g4QOZ3cVOGF1M34wItVLRDN6BWKP0dJcPaWHuOGdYTwmQc+ERekjLVjS75urj56/E
         +hMTzpYLp2A3QEQEX5ppZPuGBaX5V/7rL+E1Jv1OGi9gnA7+cBlLdMcbIGTE+DShJwDC
         valenRD79ZEs1slQeOKxDhcyC61Tb+Guz7lezNct2UqXfTHxPDfhxICDye2shpCqalF8
         vULIh21cEGxjhmCP/NP68GNRFUgz+siJXtxwVQFLLrfq4gHPcJ0a2joISY4EfZduxX5i
         Ytjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/V/wb+c7o+naCxYjw0DGXPXFDsGm4gbTHC17MJ5eDA=;
        b=oscFlj4XeavLqFj8WHkMOw9P/1X+sbv0I4JdLls2hYOYLx7+DHZNZ23hy5VGcNoB/x
         QM6Gz6S2UaedA/OP6cGx0gqnDnkd4fI0aX94ttfWkGR9m7arZnT7P/NlJ4jae3dBsvvu
         3VRRmX50xhNTZbaCk+xb59Kh3+bfmSkPd3icaj1pZYHhLA+9H4J/WJKtXDaXc9wyjVTi
         AH3NEaURI6SAIDkayqmQi0hJFbaIn5q3ecOK95K1qrgvysh4Sfjyj64vtEmt67w1GotC
         dv4rKBhwKGZOrqz9uiClzPIt3ZW1Vq0FVx5WNXUZKLZV0uVIM5Jsv/8mimr2SRO3RD1/
         X/xw==
X-Gm-Message-State: AOAM5313HS0tSB9gPlQXqv2AbCOsRyyUgWXtwGLr9yzVcvmuYa4d3MCu
        7MB+kGo/QQZlMqeEvdTa25kyMK0KXXToMjsj5pw=
X-Google-Smtp-Source: ABdhPJyRFizO8aX0S/3g4GodbO0+twLfEMtbSN263NpOZxooLbeo3ay8YVAxGGNOSILNHDlAEwauCjMZR6X+p8NNLe8=
X-Received: by 2002:a63:fa4c:: with SMTP id g12mr1614518pgk.205.1616564856232;
 Tue, 23 Mar 2021 22:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210318045706.200458-1-hch@lst.de> <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk> <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de> <20210322151503.GX1463@shell.armlinux.org.uk>
 <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
 <20210322170338.GZ1463@shell.armlinux.org.uk> <CAD4NMuZWoV0m85OyBDHLt+J8NYCV5wYx7fFZaivBNEgDnrN5xw@mail.gmail.com>
 <20210323184321.GE1463@shell.armlinux.org.uk>
In-Reply-To: <20210323184321.GE1463@shell.armlinux.org.uk>
From:   Cye Borg <cyborgyn@gmail.com>
Date:   Wed, 24 Mar 2021 06:47:25 +0100
Message-ID: <CAD4NMubOZ019ESLVXbZXVYf1UGC7z9tQ4655TS68tSdwG9TTWA@mail.gmail.com>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Christoph Hellwig <hch@lst.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Sure, here it is:
snow / # lspci -vxxx -s 7.0
00:07.0 ISA bridge: Contaq Microsystems 82c693
        Flags: bus master, medium devsel, latency 0
        Kernel modules: pata_cypress
00: 80 10 93 c6 47 00 80 02 00 00 01 06 00 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 03 02 00 00 26 60 00 01 f0 60 00 80 80 71 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Best regards,
Barnabas

ps.: let me know, if anything else I can do.

On Tue, Mar 23, 2021 at 7:43 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Mon, Mar 22, 2021 at 06:10:01PM +0100, Cye Borg wrote:
> > PWS 500au:
> >
> > snow / # lspci -vvx -s 7.1
> > 00:07.1 IDE interface: Contaq Microsystems 82c693 (prog-if 80 [ISA
> > Compatibility mode-only controller, supports bus mastering])
> >         Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop-
> > ParErr+ Stepping- SERR- FastB2B- DisINTx-
> >         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
> > >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> >         Latency: 0
> >         Interrupt: pin A routed to IRQ 0
> >         Region 0: I/O ports at 01f0 [size=8]
> >         Region 1: I/O ports at 03f4
> >         Region 4: I/O ports at 9080 [size=16]
> >         Kernel driver in use: pata_cypress
> >         Kernel modules: pata_cypress
> > 00: 80 10 93 c6 45 00 80 02 00 80 01 01 00 00 80 00
> > 10: f1 01 00 00 f5 03 00 00 00 00 00 00 00 00 00 00
> > 20: 81 90 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 30: 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00
> >
> > snow / # lspci -vvx -s 7.2
> > 00:07.2 IDE interface: Contaq Microsystems 82c693 (prog-if 00 [ISA
> > Compatibility mode-only controller])
> >         Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop-
> > ParErr+ Stepping- SERR- FastB2B- DisINTx-
> >         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
> > >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> >         Latency: 0
> >         Interrupt: pin B routed to IRQ 0
> >         Region 0: I/O ports at 0170 [size=8]
> >         Region 1: I/O ports at 0374
> >         Region 4: Memory at 0c240000 (32-bit, non-prefetchable)
> > [disabled] [size=64K]
> >         Kernel modules: pata_cypress
> > 00: 80 10 93 c6 45 00 80 02 00 00 01 01 00 00 80 00
> > 10: 71 01 00 00 75 03 00 00 00 00 00 00 00 00 00 00
> > 20: 00 00 24 0c 00 00 00 00 00 00 00 00 00 00 00 00
> > 30: 00 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00
>
> Thanks very much.
>
> Could I also ask for the output of:
>
> # lspci -vxxx -s 7.0
>
> as well please - this will dump all 256 bytes for the ISA bridge, which
> contains a bunch of configuration registers. Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
