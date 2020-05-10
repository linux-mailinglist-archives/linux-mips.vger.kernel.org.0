Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34D61CCD78
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2020 22:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbgEJUGe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 May 2020 16:06:34 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:46609 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728071AbgEJUGe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 May 2020 16:06:34 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5725C100002;
        Sun, 10 May 2020 20:06:31 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Richard Weinberger <richard@nod.at>,
        linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] mtd: rawnand: au1550nd: Stop using IO_ADDR_{R, W} in au_{read, write}_buf[16]()
Date:   Sun, 10 May 2020 22:06:30 +0200
Message-Id: <20200510200630.2987-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200419193037.1544035-2-boris.brezillon@collabora.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 15770370df4d51bd5ca408f0b8c46c90098d3300
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 2020-04-19 at 19:30:34 UTC, Boris Brezillon wrote:
> We are about to re-use those for the exec_op() implementation which
> will not rely on au1550_hwcontrol(). Let's patch those helpers to
> simply use the iomem address stored in the context.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
