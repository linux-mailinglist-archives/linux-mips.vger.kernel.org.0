Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4BB7691D8
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 11:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbjGaJdg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 05:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjGaJdc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 05:33:32 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CEC12A
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 02:33:27 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id QPHIq0mezv5uIQPHJqCuT7; Mon, 31 Jul 2023 11:33:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690796005; bh=isYG4ju5ujO2jvZKE7He4YghaXfIC1uepsHjRAJVSoU=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=nRMU0qnGfBvpeksQMwHRb9RI/gcni2T351aKK9aSZnxa89771uK1CVyDw0m3rbKzS
         Dvk1CbjYHG8tf7PgTgM4AANTN5AGdZd8PAOej0PGOGExm2Y1E/4FEChVoC0a7lIWid
         11HqrSaPdqXfVOAEKc/bd4wB+UwWehPXBxFUhoNK+377L6Y0C+z2nD9hWCgAHpeve5
         qb+l+2Gu44Jhucwt9VOjv1f4rFOtH+KxTVGctyIr2m1qmVtEPiz+1rLo41vhqEJEaI
         mSZDGVzuI5Ev/mOG5YXshseyY6pPey/RQT+8c3ABMxrIwsEWCH3/vwES1BTGme6IJj
         51OCrMZhLmfSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690796005; bh=isYG4ju5ujO2jvZKE7He4YghaXfIC1uepsHjRAJVSoU=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=nRMU0qnGfBvpeksQMwHRb9RI/gcni2T351aKK9aSZnxa89771uK1CVyDw0m3rbKzS
         Dvk1CbjYHG8tf7PgTgM4AANTN5AGdZd8PAOej0PGOGExm2Y1E/4FEChVoC0a7lIWid
         11HqrSaPdqXfVOAEKc/bd4wB+UwWehPXBxFUhoNK+377L6Y0C+z2nD9hWCgAHpeve5
         qb+l+2Gu44Jhucwt9VOjv1f4rFOtH+KxTVGctyIr2m1qmVtEPiz+1rLo41vhqEJEaI
         mSZDGVzuI5Ev/mOG5YXshseyY6pPey/RQT+8c3ABMxrIwsEWCH3/vwES1BTGme6IJj
         51OCrMZhLmfSw==
Date:   Mon, 31 Jul 2023 11:33:24 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 6/7] usb: dwc3: dwc3-octeon: Dump control register on
 clock init failure
Message-ID: <ZMd/5OX9szEMnhQH@lenoch>
References: <ZMd/HzISn0mPsNWt@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZMd/HzISn0mPsNWt@lenoch>
X-CMAE-Envelope: MS4wfLWc86PEY2dpI617wbrd4PmgMa6IW8wFqDldx1klsAL6WnQ2/q41tQKqaUgRM8C0Gw0M4U/ST0JywcARNpymFCyz3GBfDyBofVnGkpgMUCauN3zpwDlA
 iyrDDb7SK1ib8Ivwdm1SGbx/iP2yyfScN/M10tpMhPV8Dv0cil6dCS5RdsPNPCtJuD13GjnA7zsSv1FQVeXR9oEtNVjh5B/SF9M4DTow5cpMiq9vCk1n11MA
 lpVnG1L+U+exlorJ81mXGgqgHD1eV2nOfnvpqy/qKhKy4xBULTSdIwbz00ouTboM6w/PfPCb41V/QiAeHzb53fx+qB5fJ60Hr1zByEWA5EL4Tqg89QcLO5zS
 eIR29Q90
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

It might be interesting to know control register value in case
clock fails to enable.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 CHANGES:
 - v4: new patch
 - v5: Philippe's review tag

 drivers/usb/dwc3/dwc3-octeon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 330bcb59cc95..d578110f7afb 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -299,8 +299,8 @@ static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
 	val = dwc3_octeon_readq(uctl_ctl_reg);
 	if ((div != FIELD_GET(USBDRD_UCTL_CTL_H_CLKDIV_SEL, val)) ||
 	    (!(FIELD_GET(USBDRD_UCTL_CTL_H_CLK_EN, val)))) {
-		dev_err(dev, "dwc3 controller clock init failure.\n");
-			return -EINVAL;
+		dev_err(dev, "clock init failure (UCTL_CTL=%016llx)\n", val);
+		return -EINVAL;
 	}
 
 	/* Step 4c: Deassert the controller clock divider reset. */
-- 
2.39.2

