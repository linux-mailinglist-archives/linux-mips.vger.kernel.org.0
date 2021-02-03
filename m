Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D017130D65B
	for <lists+linux-mips@lfdr.de>; Wed,  3 Feb 2021 10:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbhBCJbS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 04:31:18 -0500
Received: from polaris.svanheule.net ([84.16.241.116]:59660 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233500AbhBCJag (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Feb 2021 04:30:36 -0500
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eaff:9701:9f3c:99a2:7251:cce9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id E09C21C8C19;
        Wed,  3 Feb 2021 10:23:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1612344226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=72bGU27IKTK7uzsu+gYNWJLAfcIFrJlPlB1wOH6GCHs=;
        b=QLydjcwv3LnxbcHoWxeTSZN2VJ6PmyY4JcYu0MJeX+x17kufLQVFzC8fxEDO6XiQKlgc4t
        ss7e9+q9AGdQX7SpNDh6VVo2nN4IQK+bd3IkspqxKAZ8Ec4EseREIHhHGjTwjdsHzKqDua
        jQwigajQakMcSHK/nkKd2RCDps350e25801J8ltzfLGlx7wdOsov1kIkZBvj8OJWTyqkxC
        Ho0nIXSfweO3DronbGZaDq7Ynd8YETgv08F980/KiTD67Q+TgwLehUl42RigXZ7DBHPj/K
        6rbwm0z7mjQM7IAlQJCOjqHyPYaaeYMc6HXAFurYgRkEsZiH1dbbDyuvUHbVEw==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-mips@vger.kernel.org
Cc:     John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH] MIPS: ralink: manage low reset lines
Date:   Wed,  3 Feb 2021 10:21:41 +0100
Message-Id: <20210203092140.12458-1-sander@svanheule.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reset lines with indices smaller than 8 are currently considered invalid
by the rt2880-reset reset controller.

The MT7621 SoC uses a number of these low reset lines. The DTS defines
reset lines "hsdma", "fe", and "mcm" with respective values 5, 6, and 2.
As a result of the above restriction, these resets cannot be asserted or
de-asserted by the reset controller. In cases where the bootloader does
not de-assert these lines, this results in e.g. the MT7621's internal
switch staying in reset.

Change the reset controller to only ignore the system reset, so all
reset lines with index greater than 0 are considered valid.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
This patch was tested on a TP-Link EAP235-Wall, with an MT7621DA SoC.
The bootloader on this device would leave reset line 2 ("mcm") asserted,
which caused the internal switch to be unresponsive on an uninterrupted
boot from flash.

When tftpboot was used in the bootloader to load an initramfs, it did
initialise the internal switch, and cleared the mcm reset line. In this
case the switch could be used from the OS. With this patch applied, the
switch works both in an initramfs, and when (cold) booting from flash.

 arch/mips/ralink/reset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/ralink/reset.c b/arch/mips/ralink/reset.c
index 8126f1260407..274d33078c5e 100644
--- a/arch/mips/ralink/reset.c
+++ b/arch/mips/ralink/reset.c
@@ -27,7 +27,7 @@ static int ralink_assert_device(struct reset_controller_dev *rcdev,
 {
 	u32 val;
 
-	if (id < 8)
+	if (id == 0)
 		return -1;
 
 	val = rt_sysc_r32(SYSC_REG_RESET_CTRL);
@@ -42,7 +42,7 @@ static int ralink_deassert_device(struct reset_controller_dev *rcdev,
 {
 	u32 val;
 
-	if (id < 8)
+	if (id == 0)
 		return -1;
 
 	val = rt_sysc_r32(SYSC_REG_RESET_CTRL);
-- 
2.29.2

