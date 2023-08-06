Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1A6771495
	for <lists+linux-mips@lfdr.de>; Sun,  6 Aug 2023 13:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjHFLsp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Aug 2023 07:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjHFLso (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 6 Aug 2023 07:48:44 -0400
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEA6139
        for <linux-mips@vger.kernel.org>; Sun,  6 Aug 2023 04:48:41 -0700 (PDT)
Received: from lenoch ([80.95.121.122])
        by cmgsmtp with ESMTPSA
        id ScFRqy7JtPm6CScFSq4ZBq; Sun, 06 Aug 2023 13:48:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691322519; bh=lRnY1nwAI82LualsbcRURHKRlY+JPDkXSUV+I74fcb0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=KHdxWBc5WyteT66HTzsx4KH+UssNG4sZ6Jha7RJppuc/gXo/Jc7U9GdRdQmb0LCzR
         jo1RqmL9Kvx13GHVq9YrRYc7Ak8bppYmhVyaKg35PDqcfTxkb4mTkBNLeSlu+SWKn4
         0kIdaCS9VCyIuYeSiQUZbvmw152AzN92qnXKve7OZBtXEyB0GW0peMOktIzzW6MrzM
         /Eqw6joOqzETXqd02UIcAjfKLdQPd9DDmjbop9qenhyfXtPYiBP8/peCI1z+DCqXnw
         Xso4MUlbsWtjH68w4Tnm2cqQQTNRZcnZ+b6zAJPfdHAxlhTsSvikP5+6MK217sHYQz
         U/qA0GiXGL9ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691322519; bh=lRnY1nwAI82LualsbcRURHKRlY+JPDkXSUV+I74fcb0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=KHdxWBc5WyteT66HTzsx4KH+UssNG4sZ6Jha7RJppuc/gXo/Jc7U9GdRdQmb0LCzR
         jo1RqmL9Kvx13GHVq9YrRYc7Ak8bppYmhVyaKg35PDqcfTxkb4mTkBNLeSlu+SWKn4
         0kIdaCS9VCyIuYeSiQUZbvmw152AzN92qnXKve7OZBtXEyB0GW0peMOktIzzW6MrzM
         /Eqw6joOqzETXqd02UIcAjfKLdQPd9DDmjbop9qenhyfXtPYiBP8/peCI1z+DCqXnw
         Xso4MUlbsWtjH68w4Tnm2cqQQTNRZcnZ+b6zAJPfdHAxlhTsSvikP5+6MK217sHYQz
         U/qA0GiXGL9ag==
Date:   Sun, 6 Aug 2023 13:48:37 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Robert Richter <rric@kernel.org>
Cc:     linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org
Subject: (Octeon) MMC performance degradation due to too many requests
Message-ID: <ZM+IlctTTQLs7Qg9@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGsAz2okKvwHuhjhsk5x+bxyGshiYe9L0DCHCKxUEQ9ABAainCtMmD09+9/1ulzStGOWpi107YPOD2+13inwS0yeqrFqZNJwc4pokNQ2kvDYJNrzgBUk
 qoDQRuY2nYnKx+kUBHdTjwWd8XbhBnnlRFsM53eROAbu27PLL7LuUGjl8OqnigYT8HD8IwyZjlrEmI+DcfKcWEcnCqHY7Me1E0GQLI8yziH1xwz+j+VdwOe9
 dXcQmN7pVdf4+o3DMJsErfREVDNK2VwbnxPY2wrcHYM=
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Linus,

let me appologize for walking into dark past :) Here's some more context
for a start:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1691602.html
(note that "OK phew then I'm safe" ;-))

After moving a few Octeon 70XX based boards from vendor based 4.9 kernel
to 6.1 mainline a huge drop of MMC performance was observed.

While running badblocks on 2G partition takes 1min (±5s) and about 35k
interrupts on 4.9, recent kernels need over 3mins and 500k+ interrupts.

How do we get there?
ff4143ccff31 ("MIPS: Octeon: cavium_octeon_defconfig: Enable Octeon MMC")
enabled MMC driver, but left MMC_BLOCK_BOUNCE disabled, although driver
performace depends on it.
c3dccb74be28 ("mmc: core: Delete bounce buffer Kconfig option")
Added MMC_CAP_NO_BOUNCE_BUFF to the caps, based on assumption it should
be there as MMC_BLOCK_BOUNCE is disabled in defconfig
de3ee99b097d ("mmc: Delete bounce buffer handling")
finally removed all bounce buffer handling as almost nothing needs that.

Sadly, 70XX SoC cannot do SG, so it suffers a lot. Strangely enough,
above patches are either authored or suggested by Cavium's employees.

So, given the number of affected SoC and before cooking driver specific
solution, are we sure we indeed do not want some generic one?

While there, you might consider following patch:
-- >8 --
From: Ladislav Michl <ladis@linux-mips.org>
Subject: [PATCH] mmc: cavium: Remove misleading comment

Comment about disabling bounce buffers was added with c3dccb74be28
("mmc: core: Delete bounce buffer Kconfig option") and should be
deleted with de3ee99b097d ("mmc: Delete bounce buffer handling").
For the record, this driver should have never been used
MMC_CAP_NO_BOUNCE_BUFF as it hits performance badly for non SG
capable SoC.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Fixes: de3ee99b097d ("mmc: Delete bounce buffer handling")
---
 drivers/mmc/host/cavium.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mmc/host/cavium.c b/drivers/mmc/host/cavium.c
index b58f003b10a4..71a9f91d2fc6 100644
--- a/drivers/mmc/host/cavium.c
+++ b/drivers/mmc/host/cavium.c
@@ -1032,8 +1032,6 @@ int cvm_mmc_of_slot_probe(struct device *dev, struct cvm_mmc_host *host)
 	 * We only have a 3.3v supply, we cannot support any
 	 * of the UHS modes. We do support the high speed DDR
 	 * modes up to 52MHz.
-	 *
-	 * Disable bounce buffers for max_segs = 1
 	 */
 	mmc->caps |= MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
 		     MMC_CAP_CMD23 | MMC_CAP_POWER_OFF_CARD | MMC_CAP_3_3V_DDR;
-- 
2.39.2

