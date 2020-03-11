Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDDE181C9A
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 16:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730068AbgCKPoh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 11:44:37 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:36751 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729999AbgCKPoh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 11:44:37 -0400
X-Originating-IP: 90.89.41.158
Received: from localhost.localdomain (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9CB761C0004;
        Wed, 11 Mar 2020 15:44:33 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Paul Burton <paulburton@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
        linux-mtd@lists.infradead.org, dri-devel@lists.freedesktop.org,
        James Hogan <jhogan@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Brian Norris <computersforpeace@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH V4 3/3] mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers
Date:   Wed, 11 Mar 2020 16:44:33 +0100
Message-Id: <20200311154433.25431-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122213313.35820-4-kdasu.kdev@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: a5d53ad26a8b441325eb9de8e9bb816584ebca7c
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 2020-01-22 at 21:33:13 UTC, Kamal Dasu wrote:
> Legacy mips soc platforms that have controller v5.0 and 6.0 use
> flash-edu block for dma transfers. This change adds support for
> nand dma transfers using the EDU block.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
