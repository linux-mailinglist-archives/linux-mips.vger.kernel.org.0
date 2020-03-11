Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4FA0181C9D
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 16:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729999AbgCKPop (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 11:44:45 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55273 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729988AbgCKPop (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 11:44:45 -0400
X-Originating-IP: 90.89.41.158
Received: from localhost.localdomain (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DB3F940008;
        Wed, 11 Mar 2020 15:44:39 +0000 (UTC)
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
Subject: Re: [PATCH V4 2/3] arch: mips: brcm: Add 7425 flash-edu support
Date:   Wed, 11 Mar 2020 16:44:39 +0100
Message-Id: <20200311154439.25493-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122213313.35820-3-kdasu.kdev@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 634088e2621310d2473e4ec3b69843e32d5cee20
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 2020-01-22 at 21:33:12 UTC, Kamal Dasu wrote:
> Nand controller v5.0 and v6.0 have nand edu blocks that enable
> dma nand flash transfers. This allows for faster read and write
> access.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Acked-by: Paul Burton <paulburton@kernel.org>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
