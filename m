Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B28C576AB3E
	for <lists+linux-mips@lfdr.de>; Tue,  1 Aug 2023 10:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbjHAInE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Aug 2023 04:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232169AbjHAImv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Aug 2023 04:42:51 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C848C10C7
        for <linux-mips@vger.kernel.org>; Tue,  1 Aug 2023 01:42:49 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id QkxoqAnWFv5uIQkxpqFl1S; Tue, 01 Aug 2023 10:42:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690879367; bh=JWpGmZjXUjgR7yQlSUk5xck/N4ztdufJt7qH4vqz7mc=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=J1AJYSiZanDiGhwgc38fTBPfllxVmp/STXFdXKyxZTNLfMHEd9Wxbwte1IE1LW1cY
         LCCKIrQ/hj+CisnNS8ErYF9s6MsiFbdXIsT/qGFNhTln+ujjYiT6HXI2Jfa8B+lBht
         9l214Lz8UUG6tZddEOmkau0GMXRkdtZgBB2p6TTe/hj7YTIh7+UKzZgZpESBTOElA+
         97jRINpWDm4FmfmNNk6PN8EgBYRBxWOw1UW4n+4rfo/t6I83++5wrT3G5N8OAAiRXE
         59W/e/j/AT7ehOdGFXGaE1ZDTd9y5a/aZGvl5Mok0bvwRGUIx7hFWMVlIgU2KHmTax
         3H8KKfSfThwJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690879367; bh=JWpGmZjXUjgR7yQlSUk5xck/N4ztdufJt7qH4vqz7mc=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=J1AJYSiZanDiGhwgc38fTBPfllxVmp/STXFdXKyxZTNLfMHEd9Wxbwte1IE1LW1cY
         LCCKIrQ/hj+CisnNS8ErYF9s6MsiFbdXIsT/qGFNhTln+ujjYiT6HXI2Jfa8B+lBht
         9l214Lz8UUG6tZddEOmkau0GMXRkdtZgBB2p6TTe/hj7YTIh7+UKzZgZpESBTOElA+
         97jRINpWDm4FmfmNNk6PN8EgBYRBxWOw1UW4n+4rfo/t6I83++5wrT3G5N8OAAiRXE
         59W/e/j/AT7ehOdGFXGaE1ZDTd9y5a/aZGvl5Mok0bvwRGUIx7hFWMVlIgU2KHmTax
         3H8KKfSfThwJg==
Date:   Tue, 1 Aug 2023 10:42:44 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 4/7] usb: dwc3: dwc3-octeon: Avoid half-initialized
 controller state
Message-ID: <ZMjFhMrnrJRQ2Qlf@lenoch>
References: <ZMd/HzISn0mPsNWt@lenoch>
 <ZMd/oMRx8ze22/kK@lenoch>
 <20230801003838.ifbydrbwq34df3n3@synopsys.com>
 <ZMiaIUy6d5gVl7mA@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMiaIUy6d5gVl7mA@lenoch>
X-CMAE-Envelope: MS4wfFPiDbeufM4QXtXC/gck9KMHReF52FSTt92B82pVsT4ontnMmjF6s0bRsx4IlSjUP7+R8w99DqpRS1MhRaZg4AM03barvp4s+Y8FGarak+KldTT1KmIa
 A+S1kngsnG4gFIY4B7gky5rfXfxu3cOEikHGfc8uBLkq6XIaXrjXqoJMYjz6QvIP3XqTLoJo5D1ywnoaqBWqQo4fgXSF1f1Q2dX/XPXhOakDEZ8iXQSIMcoW
 GbnQNpUOKEFiaYNa20egGpuTI3DXSEpUMcYZwqeQGV+8mFk4HoOyB8XZ9i7T1ePTJaJ7DO9pEeF/WaitK0m70f5yW3Jfvr8SaV91z9l95pFR/VdfYzaNLok/
 7LE2A2io
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 01, 2023 at 07:37:37AM +0200, Ladislav Michl wrote:
> Anyway, what about just passing octeon into dwc3_octeon_config_gpio
> and use all that dirty magic inside. Would that work work for you?

Something like this:

[PATCH] usb: dwc3: dwc3-octeon: Consolidate pinmux configuration

As there is no pinctrl driver for Octeon, pinmux configuration is done
in dwc3_octeon_config_gpio function. It has been always done the tricky
way: there are two UCTLs; first at 0x1180068000000 and second at
0x1180069000000, so address based test is used to get index to configure
pin muxing, because DT does not provide that information.

To make pinmux configuration a little less hackish until proper solution
is developed, move all its logic into dwc3_octeon_config_gpio function.
---
 drivers/usb/dwc3/dwc3-octeon.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 90e1ae66769f..f35dca899d6e 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -206,9 +206,10 @@ static inline void dwc3_octeon_writeq(void __iomem *base, uint64_t val)
 	cvmx_writeq_csr(base, val);
 }
 
-static void dwc3_octeon_config_gpio(int index, int gpio)
+static void dwc3_octeon_config_gpio(struct dwc3_octeon *octeon, int gpio)
 {
 	union cvmx_gpio_bit_cfgx gpio_bit;
+	int index = ((__force uintptr_t)octeon->base >> 24) & 1;
 
 	if ((OCTEON_IS_MODEL(OCTEON_CN73XX) ||
 	    OCTEON_IS_MODEL(OCTEON_CNF75XX))
@@ -237,7 +238,7 @@ static inline uint64_t dwc3_octeon_readq(void __iomem *addr)
 
 static inline void dwc3_octeon_writeq(void __iomem *base, uint64_t val) { }
 
-static inline void dwc3_octeon_config_gpio(int index, int gpio) { }
+static inline void dwc3_octeon_config_gpio(struct dwc3_octeon *octeon, int gpio) { }
 
 static uint64_t octeon_get_io_clock_rate(void)
 {
@@ -422,7 +423,7 @@ static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
 		val &= ~USBDRD_UCTL_HOST_PPC_EN;
 	} else {
 		val |= USBDRD_UCTL_HOST_PPC_EN;
-		dwc3_octeon_config_gpio(((u64)octeon->base >> 24) & 1, power_gpio);
+		dwc3_octeon_config_gpio(octeon, power_gpio);
 		dev_dbg(dev, "power control is using gpio%d\n", power_gpio);
 	}
 	if (power_active_low)
-- 
2.39.2

