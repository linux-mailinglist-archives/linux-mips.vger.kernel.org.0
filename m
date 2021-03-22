Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440CD344CDD
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 18:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbhCVRK3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 13:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhCVRKN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 13:10:13 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF8AC061574;
        Mon, 22 Mar 2021 10:10:13 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id q5so11385280pfh.10;
        Mon, 22 Mar 2021 10:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fiyXOeQWEig0s6UT1FT5pCXalIidRHvGHYc/I0I86U4=;
        b=QKCSek145JEuRPcVGh+jry7eSFRT7rDliJdVjjDPerK0DFdLuxLHuth+sgT617W5Mm
         jecfEAMmOTZUwEtOT3NVkAuqnrRYhKJ/CPAWXtEAfpcv5KG+ByG0IJxfzUFn3hGP6OsW
         oPWtBEalIpy+zv0CWGZlMW8GxXXGV7ADUru4p65y9tx2V70fFVPGVCDw2XknH9W9/seH
         rGXSeCTpJaVlOEifvnGhW30lT6qTGVC8HeDy6eR1kA3bHZjb4uNfitWtT0tuQ4nhlZPN
         JOrlTpcixGngqPjLmXcVOVdlhvxtSuD9Os696fAhe93PNbZoIWZPQiMeHjELruNKLkUN
         u7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fiyXOeQWEig0s6UT1FT5pCXalIidRHvGHYc/I0I86U4=;
        b=e6MMktrDdCoTNtGegQcQFUMgR9FqHo4oZK4DjO0H0/ky4VtjScGgtbREDgDEJCOY9y
         ObaszwJqkYdND/mLQOYMvm/h4VWTNR/yiE7kcVBvkqouvuDg74KfV2m/oIpqGOLn6ygw
         mduUbj+WtKvgvpfvtkcig4o1oJAwkvhnFjjL0MEa+ZHfgMFQpwGMgCJPEVztOGp2/Vq0
         59/srjQEWrxKRU4ZFFm3DvF86c0pPG7PG7u3K4jfrQlOUR4kq57AwGnfE/ga2rZfZSTR
         ux9F2J1gEBeziS4kZQL1zJK935p0Gvlen8Jn4q9PkbdZ/6yHQiZakta+zvxeVCb9B3Iu
         N4Hw==
X-Gm-Message-State: AOAM532XA6xIyDMk/DQm605wrMerOw0A6Fx18EtIAwG2TZuDLBgTZvYm
        4RlvbubYwex51RWWcii7CnbRsHpafH7SovGHusU=
X-Google-Smtp-Source: ABdhPJyo1TSVtrx9+IOM2nIeFXCEIk7pxXeayGexYBlLGasNOgy9jn+8roBBPwJzj7t1TMvI/kT0tl7xmg8I5hxgK3k=
X-Received: by 2002:a63:cc:: with SMTP id 195mr493605pga.282.1616433012697;
 Mon, 22 Mar 2021 10:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210318045706.200458-1-hch@lst.de> <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk> <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de> <20210322151503.GX1463@shell.armlinux.org.uk>
 <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de> <20210322170338.GZ1463@shell.armlinux.org.uk>
In-Reply-To: <20210322170338.GZ1463@shell.armlinux.org.uk>
From:   Cye Borg <cyborgyn@gmail.com>
Date:   Mon, 22 Mar 2021 18:10:01 +0100
Message-ID: <CAD4NMuZWoV0m85OyBDHLt+J8NYCV5wYx7fFZaivBNEgDnrN5xw@mail.gmail.com>
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

PWS 500au:

snow / # lspci -vvx -s 7.1
00:07.1 IDE interface: Contaq Microsystems 82c693 (prog-if 80 [ISA
Compatibility mode-only controller, supports bus mastering])
        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr+ Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 0
        Region 0: I/O ports at 01f0 [size=8]
        Region 1: I/O ports at 03f4
        Region 4: I/O ports at 9080 [size=16]
        Kernel driver in use: pata_cypress
        Kernel modules: pata_cypress
00: 80 10 93 c6 45 00 80 02 00 80 01 01 00 00 80 00
10: f1 01 00 00 f5 03 00 00 00 00 00 00 00 00 00 00
20: 81 90 00 00 00 00 00 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00

snow / # lspci -vvx -s 7.2
00:07.2 IDE interface: Contaq Microsystems 82c693 (prog-if 00 [ISA
Compatibility mode-only controller])
        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr+ Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin B routed to IRQ 0
        Region 0: I/O ports at 0170 [size=8]
        Region 1: I/O ports at 0374
        Region 4: Memory at 0c240000 (32-bit, non-prefetchable)
[disabled] [size=64K]
        Kernel modules: pata_cypress
00: 80 10 93 c6 45 00 80 02 00 00 01 01 00 00 80 00
10: 71 01 00 00 75 03 00 00 00 00 00 00 00 00 00 00
20: 00 00 24 0c 00 00 00 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00

On Mon, Mar 22, 2021 at 6:04 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Mon, Mar 22, 2021 at 05:09:13PM +0100, John Paul Adrian Glaubitz wrote:
> > On 3/22/21 4:15 PM, Russell King - ARM Linux admin wrote:
> > > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > > asked for a lspci for that last week but nothing has yet been
> > > forthcoming from whoever responded to your patch for Alpha - so I
> > > can't compare what I'm seeing with what's happening with Alpha.
> >
> > Here is lspci on my DEC Alpha XP-1000:
> >
> > root@tsunami:~> lspci
> > 0000:00:07.0 ISA bridge: Contaq Microsystems 82c693
> > 0000:00:07.1 IDE interface: Contaq Microsystems 82c693
> > 0000:00:07.2 IDE interface: Contaq Microsystems 82c693
> > 0000:00:07.3 USB controller: Contaq Microsystems 82c693
> > 0000:00:0d.0 VGA compatible controller: Texas Instruments TVP4020 [Permedia 2] (rev 01)
> > 0001:01:03.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
> > 0001:01:06.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (rev 06)
> > 0001:01:08.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 03)
> > 0001:02:09.0 Ethernet controller: Intel Corporation 82541PI Gigabit Ethernet Controller (rev 05)
> > root@tsunami:~>
>
> This is no good. What I asked last Thursday was:
>
> "Could you send me the output of lspci -vvx -s 7.1 and lspci -vvx -s 7.2
> please?"
>
> so I can see the resources the kernel is using and a dump of the PCI
> config space to see what the hardware is using.
>
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
