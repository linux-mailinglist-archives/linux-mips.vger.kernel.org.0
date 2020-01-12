Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D31A413871B
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 17:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730190AbgALQvP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 11:51:15 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:55572 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730145AbgALQvO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Jan 2020 11:51:14 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id pUrC210045USYZQ01UrCgJ; Sun, 12 Jan 2020 17:51:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqgSG-0007zB-0w; Sun, 12 Jan 2020 17:51:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqgSF-0005KJ-VP; Sun, 12 Jan 2020 17:51:11 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] MIPS: ip22-gio: Make gio_match_device() static
Date:   Sun, 12 Jan 2020 17:51:10 +0100
Message-Id: <20200112165110.20427-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Unlike its PCI counterpart, gio_match_device() was never used outside
the GIO bus code.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/mips/include/asm/gio_device.h | 2 --
 arch/mips/sgi-ip22/ip22-gio.c      | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/gio_device.h b/arch/mips/include/asm/gio_device.h
index c52948f9ca9598af..159087f5386e9efd 100644
--- a/arch/mips/include/asm/gio_device.h
+++ b/arch/mips/include/asm/gio_device.h
@@ -32,8 +32,6 @@ struct gio_driver {
 };
 #define to_gio_driver(drv) container_of(drv, struct gio_driver, driver)
 
-extern const struct gio_device_id *gio_match_device(const struct gio_device_id *,
-						    const struct gio_device *);
 extern struct gio_device *gio_dev_get(struct gio_device *);
 extern void gio_dev_put(struct gio_device *);
 
diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
index 282b47c2dc2707b5..de0768a49ee87833 100644
--- a/arch/mips/sgi-ip22/ip22-gio.c
+++ b/arch/mips/sgi-ip22/ip22-gio.c
@@ -47,8 +47,9 @@ static struct device gio_bus = {
  * Used by a driver to check whether an of_device present in the
  * system is in its list of supported devices.
  */
-const struct gio_device_id *gio_match_device(const struct gio_device_id *match,
-		     const struct gio_device *dev)
+static const struct gio_device_id *
+gio_match_device(const struct gio_device_id *match,
+		 const struct gio_device *dev)
 {
 	const struct gio_device_id *ids;
 
@@ -58,7 +59,6 @@ const struct gio_device_id *gio_match_device(const struct gio_device_id *match,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(gio_match_device);
 
 struct gio_device *gio_dev_get(struct gio_device *dev)
 {
-- 
2.17.1

