Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442032EF0F0
	for <lists+linux-mips@lfdr.de>; Fri,  8 Jan 2021 11:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbhAHK4L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jan 2021 05:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727661AbhAHK4L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Jan 2021 05:56:11 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042A4C0612F4
        for <linux-mips@vger.kernel.org>; Fri,  8 Jan 2021 02:55:30 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id EAvV240024C55Sk01AvVpT; Fri, 08 Jan 2021 11:55:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxpQW-0020Ae-M7; Fri, 08 Jan 2021 11:55:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxpQW-008VkE-8j; Fri, 08 Jan 2021 11:55:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH trivial] MIPS: bitops: Fix reference to ffz location
Date:   Fri,  8 Jan 2021 11:55:26 +0100
Message-Id: <20210108105526.2028605-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Unlike most other architectures, MIPS defines ffz() below ffs().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/mips/include/asm/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
index a74769940fbd983c..1b08f9f38593ce15 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -435,7 +435,7 @@ static inline int fls(unsigned int x)
  *
  * This is defined the same way as
  * the libc and compiler builtin ffs routines, therefore
- * differs in spirit from the above ffz (man ffs).
+ * differs in spirit from the below ffz (man ffs).
  */
 static inline int ffs(int word)
 {
-- 
2.25.1

