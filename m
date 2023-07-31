Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 560E77691CA
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 11:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjGaJb7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 05:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbjGaJb1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 05:31:27 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7876510CE
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 02:31:24 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id QPFJq0lIWv5uIQPFKqCtwT; Mon, 31 Jul 2023 11:31:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795882; bh=zyvVzoejlo3FqR7ayhT/w66XsBh9AM5Bu614Jh/8fTs=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=qVZmkMMHXEoKJKy3ZPkc9LuKKsWT2vQcXN7PVkvf5cPL/7IFACAXtLWKMxroA3aYx
         Isc7VLxh+bGx7ZeD9Vne3CYHZ/g5ZmTFu4rJLbnNvqwsUmAGxJFkN4yzg5uE4O+pym
         EZ5HoVWZCmzS/vk9C2rm/FJrLR30r/vcugJHaIrX48kxQJxc42AHvYqVyOhFtyQnMf
         1pR7T4QjHBXTC3VRG894iuHNlcknmJiLkGLph9dc8fbSbwU5p7NbhjHsqfhGqBBnZv
         d5FirYPi3g0hUparDhaKGDu0YltFqUJmNpYLqcFI8S/tDTRuN4oyvTE7RLWsmsMY2q
         mw1Sif+Wj2YtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795882; bh=zyvVzoejlo3FqR7ayhT/w66XsBh9AM5Bu614Jh/8fTs=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=qVZmkMMHXEoKJKy3ZPkc9LuKKsWT2vQcXN7PVkvf5cPL/7IFACAXtLWKMxroA3aYx
         Isc7VLxh+bGx7ZeD9Vne3CYHZ/g5ZmTFu4rJLbnNvqwsUmAGxJFkN4yzg5uE4O+pym
         EZ5HoVWZCmzS/vk9C2rm/FJrLR30r/vcugJHaIrX48kxQJxc42AHvYqVyOhFtyQnMf
         1pR7T4QjHBXTC3VRG894iuHNlcknmJiLkGLph9dc8fbSbwU5p7NbhjHsqfhGqBBnZv
         d5FirYPi3g0hUparDhaKGDu0YltFqUJmNpYLqcFI8S/tDTRuN4oyvTE7RLWsmsMY2q
         mw1Sif+Wj2YtA==
Date:   Mon, 31 Jul 2023 11:31:21 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 2/7] usb: dwc3: dwc3-octeon: Use _ULL bitfields defines
Message-ID: <ZMd/aa2ncz6tJGNU@lenoch>
References: <ZMd/HzISn0mPsNWt@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMd/HzISn0mPsNWt@lenoch>
X-CMAE-Envelope: MS4wfBpHXL+vnvCjyDA/B27KBP3vbHfIk8ksxxDfj8qyIGW78CAJhpndfUsAKED4wTUcdrRwiWCflb9Iuu7P3fl2wHiiAkTcFtjOb0PuKPASpCnRDpvpqxK1
 s7DJqVajGM47u31jK+bkfJId0fpfI833vSeloml2PWzqHp5hQz+g6rA8YTutb50IVmce/5fCukryPji4hctByupTzDhrxnnyXf/NUpF5d4R3KEgqJG4qxGum
 wFDZwRQEuFXo4LFiLuApqYdhbexmLMf+mizOAsfBRqHiinxTJ/D/hicWhC08ixAuN7fTyTW1MQn3krPBvzLIEg9YrNBgEUYP2kzcXofMeSuQ86h7g+5LtgfX
 K+y1qwP6
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

While driver is intended to run on 64bit machines, it is compile time
tested for 32bit targets as well. Here shift count overflow is reported
for bits greater than 31, so use _ULL versions of BIT and GENMASK macros
to silence these warnings.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307260537.MROrhVNM-lkp@intel.com/
---
 CHANGES:
 -v5: new patch

 drivers/usb/dwc3/dwc3-octeon.c | 78 +++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 7134cdfc0fb6..69fe50cfa719 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -24,9 +24,9 @@
 /* BIST fast-clear mode select. A BIST run with this bit set
  * clears all entries in USBH RAMs to 0x0.
  */
-# define USBDRD_UCTL_CTL_CLEAR_BIST		BIT(63)
+# define USBDRD_UCTL_CTL_CLEAR_BIST		BIT_ULL(63)
 /* 1 = Start BIST and cleared by hardware */
-# define USBDRD_UCTL_CTL_START_BIST		BIT(62)
+# define USBDRD_UCTL_CTL_START_BIST		BIT_ULL(62)
 /* Reference clock select for SuperSpeed and HighSpeed PLLs:
  *	0x0 = Both PLLs use DLMC_REF_CLK0 for reference clock
  *	0x1 = Both PLLs use DLMC_REF_CLK1 for reference clock
@@ -35,32 +35,32 @@
  *	0x3 = SuperSpeed PLL uses DLMC_REF_CLK1 for reference clock &
  *	      HighSpeed PLL uses PLL_REF_CLK for reference clck
  */
-# define USBDRD_UCTL_CTL_REF_CLK_SEL		GENMASK(61, 60)
+# define USBDRD_UCTL_CTL_REF_CLK_SEL		GENMASK_ULL(61, 60)
 /* 1 = Spread-spectrum clock enable, 0 = SS clock disable */
-# define USBDRD_UCTL_CTL_SSC_EN			BIT(59)
+# define USBDRD_UCTL_CTL_SSC_EN			BIT_ULL(59)
 /* Spread-spectrum clock modulation range:
  *	0x0 = -4980 ppm downspread
  *	0x1 = -4492 ppm downspread
  *	0x2 = -4003 ppm downspread
  *	0x3 - 0x7 = Reserved
  */
-# define USBDRD_UCTL_CTL_SSC_RANGE		GENMASK(58, 56)
+# define USBDRD_UCTL_CTL_SSC_RANGE		GENMASK_ULL(58, 56)
 /* Enable non-standard oscillator frequencies:
  *	[55:53] = modules -1
  *	[52:47] = 2's complement push amount, 0 = Feature disabled
  */
-# define USBDRD_UCTL_CTL_SSC_REF_CLK_SEL	GENMASK(55, 47)
+# define USBDRD_UCTL_CTL_SSC_REF_CLK_SEL	GENMASK_ULL(55, 47)
 /* Reference clock multiplier for non-standard frequencies:
  *	0x19 = 100MHz on DLMC_REF_CLK* if REF_CLK_SEL = 0x0 or 0x1
  *	0x28 = 125MHz on DLMC_REF_CLK* if REF_CLK_SEL = 0x0 or 0x1
  *	0x32 =  50MHz on DLMC_REF_CLK* if REF_CLK_SEL = 0x0 or 0x1
  *	Other Values = Reserved
  */
-# define USBDRD_UCTL_CTL_MPLL_MULTIPLIER	GENMASK(46, 40)
+# define USBDRD_UCTL_CTL_MPLL_MULTIPLIER	GENMASK_ULL(46, 40)
 /* Enable reference clock to prescaler for SuperSpeed functionality.
  * Should always be set to "1"
  */
-# define USBDRD_UCTL_CTL_REF_SSP_EN		BIT(39)
+# define USBDRD_UCTL_CTL_REF_SSP_EN		BIT_ULL(39)
 /* Divide the reference clock by 2 before entering the
  * REF_CLK_FSEL divider:
  *	If REF_CLK_SEL = 0x0 or 0x1, then only 0x0 is legal
@@ -68,21 +68,21 @@
  *		0x1 = DLMC_REF_CLK* is 125MHz
  *		0x0 = DLMC_REF_CLK* is another supported frequency
  */
-# define USBDRD_UCTL_CTL_REF_CLK_DIV2		BIT(38)
+# define USBDRD_UCTL_CTL_REF_CLK_DIV2		BIT_ULL(38)
 /* Select reference clock freqnuency for both PLL blocks:
  *	0x27 = REF_CLK_SEL is 0x0 or 0x1
  *	0x07 = REF_CLK_SEL is 0x2 or 0x3
  */
-# define USBDRD_UCTL_CTL_REF_CLK_FSEL		GENMASK(37, 32)
+# define USBDRD_UCTL_CTL_REF_CLK_FSEL		GENMASK_ULL(37, 32)
 /* Controller clock enable. */
-# define USBDRD_UCTL_CTL_H_CLK_EN		BIT(30)
+# define USBDRD_UCTL_CTL_H_CLK_EN		BIT_ULL(30)
 /* Select bypass input to controller clock divider:
  *	0x0 = Use divided coprocessor clock from H_CLKDIV
  *	0x1 = Use clock from GPIO pins
  */
-# define USBDRD_UCTL_CTL_H_CLK_BYP_SEL		BIT(29)
+# define USBDRD_UCTL_CTL_H_CLK_BYP_SEL		BIT_ULL(29)
 /* Reset controller clock divider. */
-# define USBDRD_UCTL_CTL_H_CLKDIV_RST		BIT(28)
+# define USBDRD_UCTL_CTL_H_CLKDIV_RST		BIT_ULL(28)
 /* Clock divider select:
  *	0x0 = divide by 1
  *	0x1 = divide by 2
@@ -93,29 +93,29 @@
  *	0x6 = divide by 24
  *	0x7 = divide by 32
  */
-# define USBDRD_UCTL_CTL_H_CLKDIV_SEL		GENMASK(26, 24)
+# define USBDRD_UCTL_CTL_H_CLKDIV_SEL		GENMASK_ULL(26, 24)
 /* USB3 port permanently attached: 0x0 = No, 0x1 = Yes */
-# define USBDRD_UCTL_CTL_USB3_PORT_PERM_ATTACH	BIT(21)
+# define USBDRD_UCTL_CTL_USB3_PORT_PERM_ATTACH	BIT_ULL(21)
 /* USB2 port permanently attached: 0x0 = No, 0x1 = Yes */
-# define USBDRD_UCTL_CTL_USB2_PORT_PERM_ATTACH	BIT(20)
+# define USBDRD_UCTL_CTL_USB2_PORT_PERM_ATTACH	BIT_ULL(20)
 /* Disable SuperSpeed PHY: 0x0 = No, 0x1 = Yes */
-# define USBDRD_UCTL_CTL_USB3_PORT_DISABLE	BIT(18)
+# define USBDRD_UCTL_CTL_USB3_PORT_DISABLE	BIT_ULL(18)
 /* Disable HighSpeed PHY: 0x0 = No, 0x1 = Yes */
-# define USBDRD_UCTL_CTL_USB2_PORT_DISABLE	BIT(16)
+# define USBDRD_UCTL_CTL_USB2_PORT_DISABLE	BIT_ULL(16)
 /* Enable PHY SuperSpeed block power: 0x0 = No, 0x1 = Yes */
-# define USBDRD_UCTL_CTL_SS_POWER_EN		BIT(14)
+# define USBDRD_UCTL_CTL_SS_POWER_EN		BIT_ULL(14)
 /* Enable PHY HighSpeed block power: 0x0 = No, 0x1 = Yes */
-# define USBDRD_UCTL_CTL_HS_POWER_EN		BIT(12)
+# define USBDRD_UCTL_CTL_HS_POWER_EN		BIT_ULL(12)
 /* Enable USB UCTL interface clock: 0xx = No, 0x1 = Yes */
-# define USBDRD_UCTL_CTL_CSCLK_EN		BIT(4)
+# define USBDRD_UCTL_CTL_CSCLK_EN		BIT_ULL(4)
 /* Controller mode: 0x0 = Host, 0x1 = Device */
-# define USBDRD_UCTL_CTL_DRD_MODE		BIT(3)
+# define USBDRD_UCTL_CTL_DRD_MODE		BIT_ULL(3)
 /* PHY reset */
-# define USBDRD_UCTL_CTL_UPHY_RST		BIT(2)
+# define USBDRD_UCTL_CTL_UPHY_RST		BIT_ULL(2)
 /* Software reset UAHC */
-# define USBDRD_UCTL_CTL_UAHC_RST		BIT(1)
+# define USBDRD_UCTL_CTL_UAHC_RST		BIT_ULL(1)
 /* Software resets UCTL */
-# define USBDRD_UCTL_CTL_UCTL_RST		BIT(0)
+# define USBDRD_UCTL_CTL_UCTL_RST		BIT_ULL(0)
 
 #define USBDRD_UCTL_BIST_STATUS			0x08
 #define USBDRD_UCTL_SPARE0			0x10
@@ -130,59 +130,59 @@
  */
 #define USBDRD_UCTL_HOST_CFG			0xe0
 /* Indicates minimum value of all received BELT values */
-# define USBDRD_UCTL_HOST_CFG_HOST_CURRENT_BELT	GENMASK(59, 48)
+# define USBDRD_UCTL_HOST_CFG_HOST_CURRENT_BELT	GENMASK_ULL(59, 48)
 /* HS jitter adjustment */
-# define USBDRD_UCTL_HOST_CFG_FLA		GENMASK(37, 32)
+# define USBDRD_UCTL_HOST_CFG_FLA		GENMASK_ULL(37, 32)
 /* Bus-master enable: 0x0 = Disabled (stall DMAs), 0x1 = enabled */
-# define USBDRD_UCTL_HOST_CFG_BME		BIT(28)
+# define USBDRD_UCTL_HOST_CFG_BME		BIT_ULL(28)
 /* Overcurrent protection enable: 0x0 = unavailable, 0x1 = available */
-# define USBDRD_UCTL_HOST_OCI_EN		BIT(27)
+# define USBDRD_UCTL_HOST_OCI_EN		BIT_ULL(27)
 /* Overcurrent sene selection:
  *	0x0 = Overcurrent indication from off-chip is active-low
  *	0x1 = Overcurrent indication from off-chip is active-high
  */
-# define USBDRD_UCTL_HOST_OCI_ACTIVE_HIGH_EN	BIT(26)
+# define USBDRD_UCTL_HOST_OCI_ACTIVE_HIGH_EN	BIT_ULL(26)
 /* Port power control enable: 0x0 = unavailable, 0x1 = available */
-# define USBDRD_UCTL_HOST_PPC_EN		BIT(25)
+# define USBDRD_UCTL_HOST_PPC_EN		BIT_ULL(25)
 /* Port power control sense selection:
  *	0x0 = Port power to off-chip is active-low
  *	0x1 = Port power to off-chip is active-high
  */
-# define USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN	BIT(24)
+# define USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN	BIT_ULL(24)
 
 /*
  * UCTL Shim Features Register
  */
 #define USBDRD_UCTL_SHIM_CFG			0xe8
 /* Out-of-bound UAHC register access: 0 = read, 1 = write */
-# define USBDRD_UCTL_SHIM_CFG_XS_NCB_OOB_WRN	BIT(63)
+# define USBDRD_UCTL_SHIM_CFG_XS_NCB_OOB_WRN	BIT_ULL(63)
 /* SRCID error log for out-of-bound UAHC register access:
  *	[59:58] = chipID
  *	[57] = Request source: 0 = core, 1 = NCB-device
  *	[56:51] = Core/NCB-device number, [56] always 0 for NCB devices
  *	[50:48] = SubID
  */
-# define USBDRD_UCTL_SHIM_CFG_XS_NCB_OOB_OSRC	GENMASK(59, 48)
+# define USBDRD_UCTL_SHIM_CFG_XS_NCB_OOB_OSRC	GENMASK_ULL(59, 48)
 /* Error log for bad UAHC DMA access: 0 = Read log, 1 = Write log */
-# define USBDRD_UCTL_SHIM_CFG_XM_BAD_DMA_WRN	BIT(47)
+# define USBDRD_UCTL_SHIM_CFG_XM_BAD_DMA_WRN	BIT_ULL(47)
 /* Encoded error type for bad UAHC DMA */
-# define USBDRD_UCTL_SHIM_CFG_XM_BAD_DMA_TYPE	GENMASK(43, 40)
+# define USBDRD_UCTL_SHIM_CFG_XM_BAD_DMA_TYPE	GENMASK_ULL(43, 40)
 /* Select the IOI read command used by DMA accesses */
-# define USBDRD_UCTL_SHIM_CFG_DMA_READ_CMD	BIT(12)
+# define USBDRD_UCTL_SHIM_CFG_DMA_READ_CMD	BIT_ULL(12)
 /* Select endian format for DMA accesses to the L2C:
  *	0x0 = Little endian
  *	0x1 = Big endian
  *	0x2 = Reserved
  *	0x3 = Reserved
  */
-# define USBDRD_UCTL_SHIM_CFG_DMA_ENDIAN_MODE	GENMASK(9, 8)
+# define USBDRD_UCTL_SHIM_CFG_DMA_ENDIAN_MODE	GENMASK_ULL(9, 8)
 /* Select endian format for IOI CSR access to UAHC:
  *	0x0 = Little endian
  *	0x1 = Big endian
  *	0x2 = Reserved
  *	0x3 = Reserved
  */
-# define USBDRD_UCTL_SHIM_CFG_CSR_ENDIAN_MODE	GENMASK(1, 0)
+# define USBDRD_UCTL_SHIM_CFG_CSR_ENDIAN_MODE	GENMASK_ULL(1, 0)
 
 #define USBDRD_UCTL_ECC				0xf0
 #define USBDRD_UCTL_SPARE1			0xf8
-- 
2.39.2

