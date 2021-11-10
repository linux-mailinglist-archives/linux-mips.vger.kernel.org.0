Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54EAE44C4FF
	for <lists+linux-mips@lfdr.de>; Wed, 10 Nov 2021 17:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhKJQ0O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Nov 2021 11:26:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhKJQ0K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Nov 2021 11:26:10 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA36DC0613F5
        for <linux-mips@vger.kernel.org>; Wed, 10 Nov 2021 08:23:22 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9dc9:efd5:4c6f:baa9])
        by laurent.telenet-ops.be with bizsmtp
        id GgPK2600C1LAWtA01gPKaH; Wed, 10 Nov 2021 17:23:20 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mkqNb-00BUyT-26; Wed, 10 Nov 2021 17:23:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mkqNa-007g1r-LI; Wed, 10 Nov 2021 17:23:18 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] of: Shrink struct of_device_id
Date:   Wed, 10 Nov 2021 17:23:17 +0100
Message-Id: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently struct of_device_id is 196 (32-bit) or 200 (64-bit) bytes
large.  It contains fixed-size strings for a name, a type, and a
compatible value, but the first two are barely used.
OF device ID tables contain multiple entries, plus an empty sentinel
entry.

Statistics for my current kernel source tree:
  - 4487 tables with 16836 entries (3367200 bytes)
  - 176 names (average 6.7 max 23 chars)
  - 66 types (average 5.1 max 21 chars)
  - 12192 compatible values (average 18.0 max 45 chars)
Taking into account the minimum needed size to store the strings, only
6.9% of the allocated space is used...

Reduce kernel size by reducing the sizes of the fixed strings by one
half.

This reduces the size of an ARM multi_v7_defconfig kernel by ca. 400
KiB.  For a typical kernel supporting a single board, you can expect to
save 50-100 KiB.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Notes:
  - While gcc complains if the non-NUL characters in a string do not fit
    in the available space, it does not complain if there is no space to
    store the string's NUL-terminator.  However, that should be caught
    during testing, as the affected entry won't ever match.  The kernel
    won't crash, as such strings will still be terminated by the
    sentinel in the table.

  - We could save even more by converting the strings from fixed-size
    arrays to pointers, at the expense of making it harder to mark
    entries __init.  Given most drivers support binding and unbinding
    and thus cannot use __init for of_device_id tables, perhaps that's
    the way to go?

Thanks for your comments!
---
 include/linux/mod_devicetable.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index ae2e75d15b219920..2bb2558d52d30d2b 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -266,9 +266,9 @@ struct sdw_device_id {
  * Struct used for matching a device
  */
 struct of_device_id {
-	char	name[32];
-	char	type[32];
-	char	compatible[128];
+	char	name[24];
+	char	type[24];
+	char	compatible[48];
 	const void *data;
 };
 
-- 
2.25.1

