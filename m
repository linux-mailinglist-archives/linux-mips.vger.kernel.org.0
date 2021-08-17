Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885253EF068
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 18:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhHQQuC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Aug 2021 12:50:02 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:31329 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbhHQQuA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Aug 2021 12:50:00 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 93559240007;
        Tue, 17 Aug 2021 16:49:25 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: maps: remove dead MTD map driver for PMC-Sierra MSP boards
Date:   Tue, 17 Aug 2021 18:49:25 +0200
Message-Id: <20210817164925.109210-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210817104531.12675-1-lukas.bulwahn@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'60d0607998d6080db7af1d5bd8c9391f766fe697'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 2021-08-17 at 10:45:31 UTC, Lukas Bulwahn wrote:
> Commit 1b00767fd8e1 ("MIPS: Remove PMC MSP71xx platform") removes the
> config PMC_MSP in ./arch/mips/Kconfig.
> 
> Hence, since then, the corresponding MTD map driver for PMC-Sierra MSP
> boards is dead code. Remove this dead driver.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
