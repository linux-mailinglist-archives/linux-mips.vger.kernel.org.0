Return-Path: <linux-mips+bounces-497-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 415D88031E5
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 721A21C209AB
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BBB22F14;
	Mon,  4 Dec 2023 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDgmyixR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E375222EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416CEC433CA;
	Mon,  4 Dec 2023 11:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691070;
	bh=I6e6Jdsd6eFyhDh9BLUZ1O2SCcl426/1L6UNxcB9EvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jDgmyixRN4sf7gYD8vVt4DZLUwhlb20yLc5VtWPWNFQvoj8+0VvqLydiBOCPyG0Y1
	 isQ0RKV78VcuIhioHT8TlHcGaG+6Btq89S1SapqHdQjMfcV/JGcAnMIrwT36TxRpBu
	 eMoZV3OW66g6+CVBlEWoFZElyiaeJtc1hGX0uqv8noA3o1K9rtMpDpSR1/Al5mZQrb
	 4yT36qMUpu00hCWgacT1FxpI1IdMay1rj66/86cgSFl1B91NSM+sEKZmRQUOLiPrZq
	 bwKglKYsSbljMAGaU5pdrXBebAN15jFI4Gf60NNL5aSrrxZhP6uIJlmkKVhETL8bkB
	 W/xrMj/D6OW6Q==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 16/20] mips: remove extraneous asm-generic/iomap.h include
Date: Mon,  4 Dec 2023 12:57:06 +0100
Message-Id: <20231204115710.2247097-17-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When this file is included before defining readq(), it misses the declarations
for a couple of functions that now become unusable:

lib/iomap.c:156:5: warning: no previous prototype for 'ioread64_lo_hi' [-Wmissing-prototypes]
lib/iomap.c:163:5: warning: no previous prototype for 'ioread64_hi_lo' [-Wmissing-prototypes]
lib/iomap.c:170:5: warning: no previous prototype for 'ioread64be_lo_hi' [-Wmissing-prototypes]
lib/iomap.c:178:5: warning: no previous prototype for 'ioread64be_hi_lo' [-Wmissing-prototypes]
lib/iomap.c:264:6: warning: no previous prototype for 'iowrite64_lo_hi' [-Wmissing-prototypes]
lib/iomap.c:272:6: warning: no previous prototype for 'iowrite64_hi_lo' [-Wmissing-prototypes]
lib/iomap.c:280:6: warning: no previous prototype for 'iowrite64be_lo_hi' [-Wmissing-prototypes]
lib/iomap.c:288:6: warning: no previous prototype for 'iowrite64be_hi_lo' [-Wmissing-prototypes]

The file is included again later from asm-generic/io.h, so dropping the initial
include statement makes it do the right thing, both for avoiding the warning
and for actually providing these functions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/io.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index b0866100baf2..85bbd967e05f 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -187,8 +187,6 @@ void iounmap(const volatile void __iomem *addr);
 #define ioremap_wc(offset, size)					\
 	ioremap_prot((offset), (size), boot_cpu_data.writecombine)
 
-#include <asm-generic/iomap.h>
-
 #if defined(CONFIG_CPU_CAVIUM_OCTEON)
 #define war_io_reorder_wmb()		wmb()
 #else
-- 
2.39.2


