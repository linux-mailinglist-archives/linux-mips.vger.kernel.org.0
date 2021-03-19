Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0975341159
	for <lists+linux-mips@lfdr.de>; Fri, 19 Mar 2021 01:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbhCSAND (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Mar 2021 20:13:03 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:37820 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhCSAMm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Mar 2021 20:12:42 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 0DF1592009C; Fri, 19 Mar 2021 01:12:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id F30ED92009B;
        Fri, 19 Mar 2021 01:12:38 +0100 (CET)
Date:   Fri, 19 Mar 2021 01:12:38 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Christoph Hellwig <hch@lst.de>
cc:     "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 04/10] MIPS: disable CONFIG_IDE in
 sb1250_swarm_defconfig
In-Reply-To: <20210318045706.200458-5-hch@lst.de>
Message-ID: <alpine.DEB.2.21.2103190042210.21463@angie.orcam.me.uk>
References: <20210318045706.200458-1-hch@lst.de> <20210318045706.200458-5-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 18 Mar 2021, Christoph Hellwig wrote:

> sb1250_swarm_defconfig enables CONFIG_IDE but no actual host controller
> driver, so just drop CONFIG_IDE, CONFIG_BLK_DEV_IDECD and
> CONFIG_BLK_DEV_IDETAPE as they are useless.

 Actually BLK_DEV_PLATFORM would handle the SWARM's platform driver as an 
IDE device, however the driver has supported libata ever since commit 
2fef357cf391 ("IDE: Fix platform device registration in Swarm IDE driver 
(v2)") back in 2008, so this is good to go.  We should probably enable 
PATA_PLATFORM in the defconfig instead.

 The printed name of the driver could be improved I suppose though:

scsi host0: pata_platform
ata1: PATA max PIO0 mmio cmd 0x100b3e00 ctl 0x100b7ec0 irq 36

(PIO3 is actually hardwired; it's an odd interface and people reported 
issues with it, but I have never had any myself be it with IDE or libata).

Acked-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej
