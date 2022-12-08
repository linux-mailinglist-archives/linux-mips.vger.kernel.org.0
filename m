Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD55646E76
	for <lists+linux-mips@lfdr.de>; Thu,  8 Dec 2022 12:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiLHL1H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Dec 2022 06:27:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbiLHL1G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Dec 2022 06:27:06 -0500
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 08 Dec 2022 03:27:05 PST
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17306318
        for <linux-mips@vger.kernel.org>; Thu,  8 Dec 2022 03:27:04 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id 3F2Lp3OeBPm6C3F2PpJ7vx; Thu, 08 Dec 2022 12:26:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1670498761; bh=LN1T34mwUqz5rlSJTi6bRhKPfe5rEZQ16cXZkGXMi5U=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=gD+2oqJRvMkqJmrokuC3sRhRatEJnJDEh+rxWEF0cKXjJYCZdscz0lxB7flqBu6uS
         YIa9ofALXBkHOcAJQkg6R9vIg97NZEUE2sWAxyRLLEDggSBzqHy5wR4BO5KBz4Yp5f
         JEXg4QiqJeGj+OTDgdcNPoF1pBDt2Ck5PveCV9Cy0dPLc8rdCnwrsZrEb4t12vfLNu
         18/++QT8tVq/kUK+YkZouLM2mJFs+mNsxBRmz+2VsA8oU44IG4m0B0SOpJf5iVMW2E
         uvPx3qTB2M5CQRPR0Eeh/0OLmVjoByueojLpf0j239INbTuHjEahuktJcGK5No4xmQ
         SdvGSzbGGmUCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1670498761; bh=LN1T34mwUqz5rlSJTi6bRhKPfe5rEZQ16cXZkGXMi5U=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=gD+2oqJRvMkqJmrokuC3sRhRatEJnJDEh+rxWEF0cKXjJYCZdscz0lxB7flqBu6uS
         YIa9ofALXBkHOcAJQkg6R9vIg97NZEUE2sWAxyRLLEDggSBzqHy5wR4BO5KBz4Yp5f
         JEXg4QiqJeGj+OTDgdcNPoF1pBDt2Ck5PveCV9Cy0dPLc8rdCnwrsZrEb4t12vfLNu
         18/++QT8tVq/kUK+YkZouLM2mJFs+mNsxBRmz+2VsA8oU44IG4m0B0SOpJf5iVMW2E
         uvPx3qTB2M5CQRPR0Eeh/0OLmVjoByueojLpf0j239INbTuHjEahuktJcGK5No4xmQ
         SdvGSzbGGmUCw==
Date:   Thu, 8 Dec 2022 12:25:57 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     linux-mips@vger.kernel.org
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH] MIPS: OCTEON: warn only once if deprecated link status is
 being used
Message-ID: <Y5HJxeWqJFK0oWyS@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfGcd758Z/N2fSs+aJsIR8cSZ7JGvxnBQAZsZnCGpgp0krvnn5/0dIj4HiXMiVlQZgcBIRJ1GmAyyD+rqHRvXCYEH8z5m5+pTaYqiwEPU9ClrqxrQvMQf
 XT+9+qEv1qqxdhaKmmadMV5BuB6gbOFTp3xzrR12Rngb5uz5wQju53ldPvzYG9bgCcX+Op+BHOdny9M893tAynzhTaT/0ljajbs=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Avoid flooding kernel log with warnings.

Fixes: 2c0756d306c2 ("MIPS: OCTEON: warn if deprecated link status is being used")
Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 arch/mips/cavium-octeon/executive/cvmx-helper-board.c | 2 +-
 arch/mips/cavium-octeon/executive/cvmx-helper.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
index d09d0769f549..0fd9ac76eb74 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
@@ -211,7 +211,7 @@ union cvmx_helper_link_info __cvmx_helper_board_link_get(int ipd_port)
 {
 	union cvmx_helper_link_info result;
 
-	WARN(!octeon_is_simulation(),
+	WARN_ONCE(!octeon_is_simulation(),
 	     "Using deprecated link status - please update your DT");
 
 	/* Unless we fix it later, all links are defaulted to down */
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
index 6f49fd9be1f3..9abfc4bf9bd8 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -1096,7 +1096,7 @@ union cvmx_helper_link_info cvmx_helper_link_get(int ipd_port)
 		if (index == 0)
 			result = __cvmx_helper_rgmii_link_get(ipd_port);
 		else {
-			WARN(1, "Using deprecated link status - please update your DT");
+			WARN_ONCE(1, "Using deprecated link status - please update your DT");
 			result.s.full_duplex = 1;
 			result.s.link_up = 1;
 			result.s.speed = 1000;
-- 
2.32.0
