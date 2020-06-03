Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF93E1ED1FA
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2020 16:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgFCOWI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 3 Jun 2020 10:22:08 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:37741 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgFCOWI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Jun 2020 10:22:08 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 06B3C240009;
        Wed,  3 Jun 2020 14:22:04 +0000 (UTC)
Date:   Wed, 3 Jun 2020 16:22:03 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 0/8] mtd: rawnand: bcm47xx: Convert to exec_op() (and
 more)
Message-ID: <20200603162203.7db6462a@xps13>
In-Reply-To: <20200518162837.304471-1-boris.brezillon@collabora.com>
References: <20200518162837.304471-1-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 18 May
2020 18:28:29 +0200:

> Hello,
> 
> A bit of context to explain the motivation behind those conversions
> I've been sending for the last couple of weeks. The raw NAND subsystem
> carries a lot of history which makes any rework not only painful, but
> also subject to regressions which we only detect when someone dares to
> update its kernel on one of those ancient HW. While carrying drivers
> for old HW is not a problem per se, carrying ancient and unmaintained
> drivers that are not converted to new APIs is a maintenance burden,
> hence this massive conversion attempt I'm conducting here.
> 
> So here is a series converting the BCM47XX NAND controller driver to
> exec_op(), plus a bunch of minor improvements done along the way.
> I hope I'll find someone to test those changes, but if there's no one
> still having access to this  HW or no interest in keeping it supported
> in recent kernel versions, we should definitely consider removing the
> driver instead.
> 
> No major changes in this v2, apart from fixes for things reported by
> Miquel. See the changelog on each patch for more details.
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (8):
>   mtd: rawnand: Add an is_last flag to nand_subop
>   mtd: rawnand: bcm47xx: Drop dependency on BCMA
>   mtd: rawnand: bcm47xx: Allow compiling the driver when COMPILE_TEST=y
>   mtd: rawnand: bcm47xx: Demistify a few more things
>   mtd: rawnand: bcm47xx: Implement the exec_op() interface
>   mtd: rawnand: bcm47xx: Get rid of the legacy implementation
>   mtd: rawnand: bcm47xx: Simplify the init() function
>   mtd: rawnand: bcm47xx: Merge all source files
> 
>  drivers/mtd/nand/raw/Kconfig                  |   3 +-
>  drivers/mtd/nand/raw/Makefile                 |   2 +-
>  .../mtd/nand/raw/bcm47xx-nand-controller.c    | 343 +++++++++++++
>  drivers/mtd/nand/raw/bcm47xxnflash/Makefile   |   5 -
>  .../nand/raw/bcm47xxnflash/bcm47xxnflash.h    |  26 -
>  drivers/mtd/nand/raw/bcm47xxnflash/main.c     |  77 ---
>  .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  | 450 ------------------
>  drivers/mtd/nand/raw/nand_base.c              |   2 +
>  include/linux/mtd/rawnand.h                   |   2 +
>  9 files changed, 349 insertions(+), 561 deletions(-)
>  create mode 100644 drivers/mtd/nand/raw/bcm47xx-nand-controller.c
>  delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/Makefile
>  delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
>  delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/main.c
>  delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
> 

Anyone to test this series?

If not I will apply it as soon as v5.8-rc1 is released.


Thanks,
Miquèl
