Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88962281D1
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jul 2020 16:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbgGUOSX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jul 2020 10:18:23 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:41548 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728422AbgGUOSX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jul 2020 10:18:23 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id DDE361FEB4;
        Tue, 21 Jul 2020 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595341103; bh=rfhgxcgTRXRnixaK9WOYySMjMzurllPqKi4thxhc7pE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ja1y7LsN96Ho8etyH1g9QmqOYXvteQGTHb1R/LMUf8PZ55bWDuFqobo1XqejVqaTx
         1mFS9rNEayiSq1v/Y+iZtXYWZDpQYbTos9JOCWT9WL9PyEO2kEssgb7tEJEPto8vEX
         cEg+MH3cVDgOA7PQngBuk/8lPdBM5/VWrckUfsiyuky7hA4bhM5dvxop1lfm2qRK8X
         GC1ReXN3HWmsb3Mq+wkhlBi31WsJPptOwTWGQQTFFSbschv2ccc4f8f3LZXcLdqJ6x
         QsDJCXQ5QS2/7aMqAHJqZOemd9bFlkQuoQQugoiPQUt6DSUsaxVMNm2WVV+K9ADKTo
         6VJgi+qWB4rgQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
Date:   Tue, 21 Jul 2020 22:17:31 +0800
Message-Id: <20200721141742.996350-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
References: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It can be very big on LS7A PCH systems.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/io.h                     | 3 ++-
 arch/mips/include/asm/mach-loongson64/spaces.h | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 346fffd9e972..0072489325fa 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -50,8 +50,9 @@
 # define __relaxed_ioswabq ioswabq
 
 /* ioswab[bwlq], __mem_ioswab[bwlq] are defined in mangle-port.h */
-
+#ifndef IO_SPACE_LIMIT
 #define IO_SPACE_LIMIT 0xffff
+#endif
 
 /*
  * On MIPS I/O ports are memory mapped, so we access them using normal
diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson64/spaces.h
index 3de0ac9d8829..fa5ea4ee8b6c 100644
--- a/arch/mips/include/asm/mach-loongson64/spaces.h
+++ b/arch/mips/include/asm/mach-loongson64/spaces.h
@@ -11,8 +11,7 @@
 #define PCI_IOSIZE	SZ_16M
 #define MAP_BASE	(PCI_IOBASE + PCI_IOSIZE)
 
-/* Reserved at the start of PCI_IOBASE for legacy drivers */
-#define MMIO_LOWER_RESERVED	0x10000
+#define IO_SPACE_LIMIT  PCI_IOSIZE
 
 #include <asm/mach-generic/spaces.h>
 #endif
-- 
2.28.0.rc1

