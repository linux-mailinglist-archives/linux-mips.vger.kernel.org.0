Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE2B280DF0
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 09:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgJBHPq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 03:15:46 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:55649 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJBHPq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Oct 2020 03:15:46 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 26DBC24000B;
        Fri,  2 Oct 2020 07:15:42 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-mtd@lists.infradead.org,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3] mtd: physmap: Add Baikal-T1 physically mapped ROM support
Date:   Fri,  2 Oct 2020 09:15:42 +0200
Message-Id: <20201002071542.26477-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200920111445.21816-1-Sergey.Semin@baikalelectronics.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b3e79e7682e075326df8041b826b03453acacd0a
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 2020-09-20 at 11:14:44 UTC, Serge Semin wrote:
> Baikal-T1 Boot Controller provides an access to a RO storages, which are
> physically mapped into the SoC MMIO space. In particularly there are
> Internal ROM embedded into the SoC with a pre-installed firmware,
> externally attached SPI flash (also accessed in the read-only mode) and a
> memory region, which mirrors one of them in accordance with the currently
> enabled system boot mode (also called Boot ROM).
> 
> This commit adds the Internal ROM support to the physmap driver of the MTD
> kernel subsystem. The driver will create the Internal ROM MTD as long as
> it is defined in the system dts file. The physically mapped SPI flash
> region will be used to implement the SPI-mem interface. The mirroring
> memory region won't be accessible directly since it's redundant due to
> both bootable regions being exposed anyway.
> 
> Note we had to create a dedicated code for the ROMs since read from the
> corresponding memory regions must be done via the dword-aligned addresses.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-mips@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
