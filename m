Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F59421FCF4
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 21:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbgGNTMg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 15:12:36 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:32920 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728117AbgGNTMf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jul 2020 15:12:35 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id EE3A0BC0D1;
        Tue, 14 Jul 2020 19:12:32 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     tsbogend@alpha.franken.de, grandmaster@al2klimov.de,
        paulburton@kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mips: Replace HTTP links with HTTPS ones
Date:   Tue, 14 Jul 2020 21:12:26 +0200
Message-Id: <20200714191226.48652-1-grandmaster@al2klimov.de>
In-Reply-To: <59938583-2ce4-c7bf-c454-89a1559be846@flygoat.com>
References: <59938583-2ce4-c7bf-c454-89a1559be846@flygoat.com>
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
 arch/mips/Kconfig           | 2 +-
 arch/mips/include/asm/war.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6fee1a133e9d..eaf7519e3033 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
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

