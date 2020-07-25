Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2656E22D3A1
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 03:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgGYBqT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 21:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgGYBqT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jul 2020 21:46:19 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56350C0619D3;
        Fri, 24 Jul 2020 18:46:19 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 2C2391FEB5;
        Sat, 25 Jul 2020 01:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595641579; bh=4P7y2LQNJndHKfA8n1MwNs3vn+NoPJ2RNNraQAFSUuM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J4OB9Vpqpe3PxxmmcGSSS1oWb0r/rjR93l0o3WwJvYtiVQJ1PpTbzqxTNwK/sAqql
         mGYayE40PX1sKEDjvliR3sttcPbbUEc0qEMtV6rFUcPRFxKhd8c+cwSh+bQjCds3Fr
         7E5oM18nMJbGsJSubqD2cNdMzYjctAF25ghC8UBEaiSJ+eqqwC54n6gWf6ZIOvwYOl
         0+dlUbiezmSlWR070dJZ3++cJYKEIH/oK2x24cUVRP9xNipNNDYVjllPtjFlngCSbP
         IDQDJUSgLoc6ijdQr5kJFJFg4XN38anfIi4f1ZdAXmb3+EMw81v4sPkQTbJFHjty1J
         oBwThxlbBm7pQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
Date:   Sat, 25 Jul 2020 09:45:17 +0800
Message-Id: <20200725014529.1143208-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
References: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It can be very big on LS7A PCH systems.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
--
v3: Move IO_SPACE_LIMIT to spaces.h
---
 arch/mips/include/asm/io.h                     | 2 --
 arch/mips/include/asm/mach-generic/spaces.h    | 4 ++++
 arch/mips/include/asm/mach-loongson64/spaces.h | 3 +--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 346fffd9e972..8ca53f17c7c2 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -51,8 +51,6 @@
 
 /* ioswab[bwlq], __mem_ioswab[bwlq] are defined in mangle-port.h */
 
-#define IO_SPACE_LIMIT 0xffff
-
 /*
  * On MIPS I/O ports are memory mapped, so we access them using normal
  * load/store instructions. mips_io_port_base is the virtual address to
diff --git a/arch/mips/include/asm/mach-generic/spaces.h b/arch/mips/include/asm/mach-generic/spaces.h
index ee5ebe98f6cf..c3ac06a6acd2 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -14,6 +14,10 @@
 
 #include <asm/mipsregs.h>
 
+#ifndef IO_SPACE_LIMIT
+#define IO_SPACE_LIMIT 0xffff
+#endif
+
 /*
  * This gives the physical RAM offset.
  */
diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson64/spaces.h
index 3de0ac9d8829..ce04e998a37b 100644
--- a/arch/mips/include/asm/mach-loongson64/spaces.h
+++ b/arch/mips/include/asm/mach-loongson64/spaces.h
@@ -11,8 +11,7 @@
 #define PCI_IOSIZE	SZ_16M
 #define MAP_BASE	(PCI_IOBASE + PCI_IOSIZE)
 
-/* Reserved at the start of PCI_IOBASE for legacy drivers */
-#define MMIO_LOWER_RESERVED	0x10000
+#define IO_SPACE_LIMIT  (PCI_IOSIZE - 1)
 
 #include <asm/mach-generic/spaces.h>
 #endif
-- 
2.28.0.rc1

