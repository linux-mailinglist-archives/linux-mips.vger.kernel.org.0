Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED453303E8
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 19:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhCGSXw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 13:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbhCGSX3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 13:23:29 -0500
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391D3C06174A
        for <linux-mips@vger.kernel.org>; Sun,  7 Mar 2021 10:23:29 -0800 (PST)
Received: from canardo.mork.no (ip6-localhost [IPv6:0:0:0:0:0:0:0:1])
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPS id 127INH8b020758
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
        Sun, 7 Mar 2021 19:23:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1615141398; bh=7g115GDZ+N9hrSzMSAD4HXOqfd0Z+Vno/JD8eofM5hg=;
        h=From:To:Cc:Subject:Date:Message-Id:From;
        b=H30VuTnixAI2glpaEh46iRxfIhBI0el6xgX/W5LKBlfzfR/Kcr6ikRX/9rn5qYNUC
         yHdFRZiKFRTIP/X3Hyu5LmOav6+s2cI4o3RvPJGzk1Iur0ydTXZhpOiZenlr737ubJ
         wP7ZaHohFJERs3arK4By1tAW6/nP6OMYyyYa+jU0=
Received: (from bjorn@localhost)
        by canardo.mork.no (8.15.2/8.15.2/Submit) id 127INHUh020757;
        Sun, 7 Mar 2021 19:23:17 +0100
From:   =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH] MIPS: vmlinux.lds.S: align raw appended dtb to 8 bytes
Date:   Sun,  7 Mar 2021 19:23:01 +0100
Message-Id: <20210307182301.20710-1-bjorn@mork.no>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
        shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on canardo.mork.no
X-Virus-Scanned: clamav-milter 0.102.4 at canardo
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The devicetree specification requires 8-byte alignment in
memory. This is now enforced by libfdt since commit 79edff12060f
("scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9")
which included the upstream commit 5e735860c478 ("libfdt: Check for
8-byte address alignment in fdt_ro_probe_()").

This broke the MIPS raw appended DTBs which would be appended to
the image immediately following the initramfs section.  This ends
with a 32bit size, resulting in a 4-byte alignment of the DTB.

Fix by padding with zeroes to 8-bytes when MIPS_RAW_APPENDED_DTB
is defined.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Bjørn Mork <bjorn@mork.no>
---
 arch/mips/kernel/vmlinux.lds.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index c1c345be04ff..850117efb09b 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -172,6 +172,11 @@ SECTIONS
 #endif
 
 #ifdef CONFIG_MIPS_RAW_APPENDED_DTB
+	.fill : {
+		FILL(0);
+		BYTE(0);
+		. = ALIGN(8);
+	}
 	__appended_dtb = .;
 	/* leave space for appended DTB */
 	. += 0x100000;
-- 
2.20.1

