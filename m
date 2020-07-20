Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258AA2258E5
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 09:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgGTHom (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jul 2020 03:44:42 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:41356 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgGTHom (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 03:44:42 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 6B7C71FEC7;
        Mon, 20 Jul 2020 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595231081; bh=cp+frRMJbDSmQF0aHJsiydb5cvCrlCDWTwGZKrqtUy0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ASX+t96hntqJaytBufC3nJUDijiewiMVBuDyDErO8UE5xAmylMffgM2To0T5GKkTo
         0uE9D73nBInSL4OYPqNdZ/dJszcqZwWANaEY3JKAclGO08/MSEwhuwflbKCjHp/z3f
         tkdj2eDUGOl/DcvBe8Qs1aaq02E9CJIBtNIHK1fZrgo1/RUc7twgA6+DhvvnyctMaq
         8td2uxoQmYYk1q7n4aj+d1s7Znu4JxID8pTFHyBpQrEWTYSG49I5pDHcmJLFx7LEgW
         EhYEpxTYZdRUFxLNEfOVARYnr0OT1P3k76NFkRFJI8sAFbN57arWt9XqB/9Tbcnuyh
         6G5eUZqRy9udg==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
Date:   Mon, 20 Jul 2020 15:42:36 +0800
Message-Id: <20200720074249.596364-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200720074249.596364-1-jiaxun.yang@flygoat.com>
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com>
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
index 3de0ac9d8829..b99b43854929 100644
--- a/arch/mips/include/asm/mach-loongson64/spaces.h
+++ b/arch/mips/include/asm/mach-loongson64/spaces.h
@@ -11,8 +11,7 @@
 #define PCI_IOSIZE	SZ_16M
 #define MAP_BASE	(PCI_IOBASE + PCI_IOSIZE)
 
-/* Reserved at the start of PCI_IOBASE for legacy drivers */
-#define MMIO_LOWER_RESERVED	0x10000
+#define IO_SPACE_LIMIT 0x00ffffff
 
 #include <asm/mach-generic/spaces.h>
 #endif
-- 
2.28.0.rc1

