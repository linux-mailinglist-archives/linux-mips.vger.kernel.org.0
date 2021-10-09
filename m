Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7EA427CCB
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 20:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhJISwB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Oct 2021 14:52:01 -0400
Received: from aposti.net ([89.234.176.197]:46656 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229601AbhJISwA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 9 Oct 2021 14:52:00 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>
Cc:     list@opendingux.net, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/3] mtd: Ingenic NAND fix for JZ4740
Date:   Sat,  9 Oct 2021 20:49:49 +0200
Message-Id: <20211009184952.24591-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Looks like NAND support has been broken on the JZ4740 SoC for a while;
it looks like it comes from the fact that the "hw_oob_first" mechanism
was dropped from the NAND core and moved to the Davinci driver.

It turns out the JZ4740 SoC needs it too; I didn't notice it when
writing the new ingenic-nand driver (to replace the old jz4740-nand
driver) most likely because my Device Tree had the "nand-ecc-mode" set
to "hw_oob_first".

I am not very sure about patch [1/3]; to me the original code does not
make sense, and it didn't work out-of-the-box on the JZ4740 without it.
By applying patch [1/3] the function nand_read_page_hwecc_oob_first()
can be reused for the JZ4740 SoC as well. But I did not test patch [1/3]
on Davinci.

Cheers,
-Paul

Paul Cercueil (3):
  mtd: rawnand/davinci: Don't calculate ECC when reading page
  mtd: rawnand: Export nand_read_page_hwecc_oob_first()
  mtd: rawnand/ingenic: JZ4740 needs 'oob_first' read page function

 drivers/mtd/nand/raw/davinci_nand.c           | 73 +------------------
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |  5 ++
 drivers/mtd/nand/raw/nand_base.c              | 69 ++++++++++++++++++
 include/linux/mtd/rawnand.h                   |  2 +
 4 files changed, 77 insertions(+), 72 deletions(-)

-- 
2.33.0

