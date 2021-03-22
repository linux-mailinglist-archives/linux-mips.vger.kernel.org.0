Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04601344CA3
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 18:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbhCVRD6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 13:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbhCVRDo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 13:03:44 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B377C061574;
        Mon, 22 Mar 2021 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wV1YEGKuNRS2dc6Y08t0sD+CscP6sVsyJ0i2JrkZIfw=; b=eGT9FGDZWFvnlavLs1I3beH+3
        GXu1DCAg9ojsZsKcjVA1xeUe6F+ljorqBw+aVYfrc1xvuzBpOQbmcewOwdLKRYulbxCc1QTGrXHNH
        P1xrkOztmZC5mGVuiPAoPhO4ZFBAHN38D1vaIMHTLuc4aaII857JOTs0CXaUiwWAu/Gj69va3K1p9
        QHPwjRu8bfv4W+44yn+PwRo8lhjm4DiG+9nwasYCfFV+tgWN67bhwzrVLop07LmqjESjPrp5TdxgL
        MnwzqA9oCAKlFyZJqPqyqw2BaRHjaeIVerESLUZKUMwX90Ase2kGTbov1wDhVxTkzzNTRlQ4joLr1
        zVOUDbnvQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51590)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lONxr-0006kA-G1; Mon, 22 Mar 2021 17:03:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lONxq-0003OE-R8; Mon, 22 Mar 2021 17:03:38 +0000
Date:   Mon, 22 Mar 2021 17:03:38 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Christoph Hellwig <hch@lst.de>,
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
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Message-ID: <20210322170338.GZ1463@shell.armlinux.org.uk>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de>
 <20210322151503.GX1463@shell.armlinux.org.uk>
 <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 22, 2021 at 05:09:13PM +0100, John Paul Adrian Glaubitz wrote:
> On 3/22/21 4:15 PM, Russell King - ARM Linux admin wrote:
> > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > asked for a lspci for that last week but nothing has yet been
> > forthcoming from whoever responded to your patch for Alpha - so I
> > can't compare what I'm seeing with what's happening with Alpha.
> 
> Here is lspci on my DEC Alpha XP-1000:
> 
> root@tsunami:~> lspci
> 0000:00:07.0 ISA bridge: Contaq Microsystems 82c693
> 0000:00:07.1 IDE interface: Contaq Microsystems 82c693
> 0000:00:07.2 IDE interface: Contaq Microsystems 82c693
> 0000:00:07.3 USB controller: Contaq Microsystems 82c693
> 0000:00:0d.0 VGA compatible controller: Texas Instruments TVP4020 [Permedia 2] (rev 01)
> 0001:01:03.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
> 0001:01:06.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (rev 06)
> 0001:01:08.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 03)
> 0001:02:09.0 Ethernet controller: Intel Corporation 82541PI Gigabit Ethernet Controller (rev 05)
> root@tsunami:~>

This is no good. What I asked last Thursday was:

"Could you send me the output of lspci -vvx -s 7.1 and lspci -vvx -s 7.2
please?"

so I can see the resources the kernel is using and a dump of the PCI
config space to see what the hardware is using.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
