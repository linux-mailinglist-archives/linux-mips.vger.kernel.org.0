Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEAB1D7E6A
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 18:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgERQ2o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 12:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbgERQ2n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 12:28:43 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87348C061A0C
        for <linux-mips@vger.kernel.org>; Mon, 18 May 2020 09:28:43 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 74E8F2A0D72;
        Mon, 18 May 2020 17:28:41 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 0/8] mtd: rawnand: bcm47xx: Convert to exec_op() (and more)
Date:   Mon, 18 May 2020 18:28:29 +0200
Message-Id: <20200518162837.304471-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

A bit of context to explain the motivation behind those conversions
I've been sending for the last couple of weeks. The raw NAND subsystem
carries a lot of history which makes any rework not only painful, but
also subject to regressions which we only detect when someone dares to
update its kernel on one of those ancient HW. While carrying drivers
for old HW is not a problem per se, carrying ancient and unmaintained
drivers that are not converted to new APIs is a maintenance burden,
hence this massive conversion attempt I'm conducting here.

So here is a series converting the BCM47XX NAND controller driver to
exec_op(), plus a bunch of minor improvements done along the way.
I hope I'll find someone to test those changes, but if there's no one
still having access to this  HW or no interest in keeping it supported
in recent kernel versions, we should definitely consider removing the
driver instead.

No major changes in this v2, apart from fixes for things reported by
Miquel. See the changelog on each patch for more details.

Regards,

Boris

Boris Brezillon (8):
  mtd: rawnand: Add an is_last flag to nand_subop
  mtd: rawnand: bcm47xx: Drop dependency on BCMA
  mtd: rawnand: bcm47xx: Allow compiling the driver when COMPILE_TEST=y
  mtd: rawnand: bcm47xx: Demistify a few more things
  mtd: rawnand: bcm47xx: Implement the exec_op() interface
  mtd: rawnand: bcm47xx: Get rid of the legacy implementation
  mtd: rawnand: bcm47xx: Simplify the init() function
  mtd: rawnand: bcm47xx: Merge all source files

 drivers/mtd/nand/raw/Kconfig                  |   3 +-
 drivers/mtd/nand/raw/Makefile                 |   2 +-
 .../mtd/nand/raw/bcm47xx-nand-controller.c    | 343 +++++++++++++
 drivers/mtd/nand/raw/bcm47xxnflash/Makefile   |   5 -
 .../nand/raw/bcm47xxnflash/bcm47xxnflash.h    |  26 -
 drivers/mtd/nand/raw/bcm47xxnflash/main.c     |  77 ---
 .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  | 450 ------------------
 drivers/mtd/nand/raw/nand_base.c              |   2 +
 include/linux/mtd/rawnand.h                   |   2 +
 9 files changed, 349 insertions(+), 561 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/bcm47xx-nand-controller.c
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/Makefile
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/main.c
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c

-- 
2.25.4

