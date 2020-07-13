Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D970621D23B
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2020 10:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgGMIww (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jul 2020 04:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgGMIww (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jul 2020 04:52:52 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966F9C061755;
        Mon, 13 Jul 2020 01:52:52 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id D3B1DBC053;
        Mon, 13 Jul 2020 08:52:49 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     tsbogend@alpha.franken.de, paulburton@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] MIPS: Replace HTTP links with HTTPS ones
Date:   Mon, 13 Jul 2020 10:52:43 +0200
Message-Id: <20200713085243.32566-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 arch/mips/Kconfig           | 4 ++--
 arch/mips/include/asm/war.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6fee1a133e9d..bdd073a0a67e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2393,7 +2393,7 @@ config MIPS_MT_SMP
 	  on cores with the MT ASE and uses the available VPEs to implement
 	  virtual processors which supports SMP. This is equivalent to the
 	  Intel Hyperthreading feature. For further information go to
-	  <http://www.imgtec.com/mips/mips-multithreading.asp>.
+	  <https://www.imgtec.com/mips/mips-multithreading.asp>.
 
 config MIPS_MT
 	bool
@@ -2825,7 +2825,7 @@ config SMP
 	  Y to "Enhanced Real Time Clock Support", below.
 
 	  See also the SMP-HOWTO available at
-	  <http://www.tldp.org/docs.html#howto>.
+	  <https://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
 
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index 1eedd596a064..e43f800e662d 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -121,7 +121,7 @@
  * operate correctly if the internal data cache refill buffer is empty.	 These
  * CACHE instructions should be separated from any potential data cache miss
  * by a load instruction to an uncached address to empty the response buffer."
- * (Revision 2.0 device errata from IDT available on http://www.idt.com/
+ * (Revision 2.0 device errata from IDT available on https://www.idt.com/
  * in .pdf format.)
  */
 #ifndef R4600_V2_HIT_CACHEOP_WAR
-- 
2.27.0

