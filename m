Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17EBE1F278C
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 01:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387869AbgFHXqw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Jun 2020 19:46:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:53466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387546AbgFHX0P (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Jun 2020 19:26:15 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6BF62076C;
        Mon,  8 Jun 2020 23:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591658775;
        bh=GPwglkMMRGPvGth9jFBh/6oBrS8f6pyUQs+nbjvD0JA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a5Z6kv0u6iOZqYAOFM2IZpNURlKgDqyKwqKTS+UI+ywBCb9Yc3x6Fccs3PuEqliYv
         YFrwiynYSAn2kMT7QVGUgZvFYthTC4upsstBtsKSN4jl8ok0LYwFQN4Xvxx83PsveO
         CrTL2MB225X53KwJtIkWtfAuqQ3ZCZv7GzGoKO0w=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Sasha Levin <sashal@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 55/72] mips: MAAR: Use more precise address mask
Date:   Mon,  8 Jun 2020 19:24:43 -0400
Message-Id: <20200608232500.3369581-55-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608232500.3369581-1-sashal@kernel.org>
References: <20200608232500.3369581-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

[ Upstream commit bbb5946eb545fab8ad8f46bce8a803e1c0c39d47 ]

Indeed according to the MIPS32 Privileged Resource Architecgture the MAAR
pair register address field either takes [12:31] bits for non-XPA systems
and [12:55] otherwise. In any case the current address mask is just
wrong for 64-bit and 32-bits XPA chips. So lets extend it to 59-bits
of physical address value. This shall cover the 64-bits architecture and
systems with XPA enabled, and won't cause any problem for non-XPA 32-bit
systems, since address values exceeding the architecture specific MAAR
mask will be just truncated with setting zeros in the unsupported upper
bits.

Co-developed-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/include/asm/mipsregs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index a6810923b3f0..a7f9acb42034 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -737,7 +737,7 @@
 
 /* MAAR bit definitions */
 #define MIPS_MAAR_VH		(_U64CAST_(1) << 63)
-#define MIPS_MAAR_ADDR		((BIT_ULL(BITS_PER_LONG - 12) - 1) << 12)
+#define MIPS_MAAR_ADDR		GENMASK_ULL(55, 12)
 #define MIPS_MAAR_ADDR_SHIFT	12
 #define MIPS_MAAR_S		(_ULCAST_(1) << 1)
 #define MIPS_MAAR_VL		(_ULCAST_(1) << 0)
-- 
2.25.1

