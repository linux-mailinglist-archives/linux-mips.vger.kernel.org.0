Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1A56D7ECE
	for <lists+linux-mips@lfdr.de>; Wed,  5 Apr 2023 16:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238496AbjDEOLb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Apr 2023 10:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238518AbjDEOLJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Apr 2023 10:11:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124295FFD
        for <linux-mips@vger.kernel.org>; Wed,  5 Apr 2023 07:10:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q6-0003FA-5Y; Wed, 05 Apr 2023 16:10:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q3-009AbX-JG; Wed, 05 Apr 2023 16:10:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q2-00AmTj-If; Wed, 05 Apr 2023 16:10:14 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de,
        linux-mips@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: [PATCH 00/10] usb: musb: Convert to platform remove callback returning void
Date:   Wed,  5 Apr 2023 16:09:59 +0200
Message-Id: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=y5P77BkcrdOtb/jU7g30i0OmKFgbBK/VXLhzJ7hsVXY=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhTdRn1L4VMMF7t5Ctkm2O4pe/vUrsfKRt9EMbCBXYvpZ 3b/7a2djMYsDIxcDLJiiiz2jWsyrarkIjvX/rsMM4iVCWQKAxenAEyE5Sz7/4qp33SjuSouaNRP UuliYeFZvCvTrLZIsOyg1qGT1+VuVcu6/zGWndV/ItrbIkzW8kntxSLvdQ4rrtiHqfY+89CcNKP 3xZpz8ytrS51+ia9bJ7LA4XLlH1bX3RMPztzuE8NXXt+xYWLk5eApPwQCHr1J/P59mWGe7bagWQ /M1BeFeX/1UFgUNcNly6lNAvNvF70MKrOz1d7jZak0rYqpZnfe+1Ma5+V9xPrOGs6pk1g4Z23Ai VMWB40F0ji2JL169jc2W+mTZ8dy5cCuB8UOZqGnJAU0/b/1JXscqeyx8OZ3TIm9cKHjt9essnt8 2TN2TpXoVNgZ3pkTddNQ90LqdzaJevknxjFcu5LKPCoA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

this patch series adapts the platform drivers below drivers/usb/musb
to use the .remove_new() callback. Compared to the traditional .remove()
callback .remove_new() returns no value. This is a good thing because
the driver core doesn't (and cannot) cope for errors during remove. The
only effect of a non-zero return value in .remove() is that the driver
core emits a warning. The device is removed anyhow and an early return
from .remove() usually yields a resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

All drivers touched here returned zero unconditionally in their remove
callback, so they could all be converted trivially to .remove_new().

Best regards
Uwe

Uwe Kleine-König (10):
  usb: musb: da8xx: Convert to platform remove callback returning void
  usb: musb: jz4740: Convert to platform remove callback returning void
  usb: musb: mediatek: Convert to platform remove callback returning void
  usb: musb: mpfs: Convert to platform remove callback returning void
  usb: musb: musb_core: Convert to platform remove callback returning void
  usb: musb: musb_dsps: Convert to platform remove callback returning void
  usb: musb: omap2430: Convert to platform remove callback returning void
  usb: musb: sunxi: Convert to platform remove callback returning void
  usb: musb: tusb6010: Convert to platform remove callback returning void
  usb: musb: ux500: Convert to platform remove callback returning void

 drivers/usb/musb/da8xx.c     | 6 ++----
 drivers/usb/musb/jz4740.c    | 6 ++----
 drivers/usb/musb/mediatek.c  | 6 ++----
 drivers/usb/musb/mpfs.c      | 6 ++----
 drivers/usb/musb/musb_core.c | 5 ++---
 drivers/usb/musb/musb_dsps.c | 6 ++----
 drivers/usb/musb/omap2430.c  | 6 ++----
 drivers/usb/musb/sunxi.c     | 6 ++----
 drivers/usb/musb/tusb6010.c  | 6 ++----
 drivers/usb/musb/ux500.c     | 6 ++----
 10 files changed, 20 insertions(+), 39 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2
