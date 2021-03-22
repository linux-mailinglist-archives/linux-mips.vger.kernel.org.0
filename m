Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C98344AB1
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 17:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbhCVQJ5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 12:09:57 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:46709 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231807AbhCVQJX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Mar 2021 12:09:23 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lON7D-002n34-BF; Mon, 22 Mar 2021 17:09:15 +0100
Received: from p57bd9564.dip0.t-ipconnect.de ([87.189.149.100] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lON7D-000xth-3u; Mon, 22 Mar 2021 17:09:15 +0100
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Christoph Hellwig <hch@lst.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
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
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk> <20210322145403.GA30942@lst.de>
 <20210322151503.GX1463@shell.armlinux.org.uk>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
Date:   Mon, 22 Mar 2021 17:09:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322151503.GX1463@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.149.100
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/22/21 4:15 PM, Russell King - ARM Linux admin wrote:
> I'm quite surprised that the CY82C693 even works on Alpha - I've
> asked for a lspci for that last week but nothing has yet been
> forthcoming from whoever responded to your patch for Alpha - so I
> can't compare what I'm seeing with what's happening with Alpha.

Here is lspci on my DEC Alpha XP-1000:

root@tsunami:~> lspci
0000:00:07.0 ISA bridge: Contaq Microsystems 82c693
0000:00:07.1 IDE interface: Contaq Microsystems 82c693
0000:00:07.2 IDE interface: Contaq Microsystems 82c693
0000:00:07.3 USB controller: Contaq Microsystems 82c693
0000:00:0d.0 VGA compatible controller: Texas Instruments TVP4020 [Permedia 2] (rev 01)
0001:01:03.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
0001:01:06.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (rev 06)
0001:01:08.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 03)
0001:02:09.0 Ethernet controller: Intel Corporation 82541PI Gigabit Ethernet Controller (rev 05)
root@tsunami:~>

It's using pata_cypress:

root@tsunami:~> lsmod|grep cypress
pata_cypress            3595  3
libata                235071  2 ata_generic,pata_cypress
root@tsunami:~

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

