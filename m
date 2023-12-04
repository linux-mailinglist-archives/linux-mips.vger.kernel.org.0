Return-Path: <linux-mips+bounces-495-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CCC8031E3
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EF651C209D0
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6238D22F14;
	Mon,  4 Dec 2023 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfqFb3Q+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B4922EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DD1C433C7;
	Mon,  4 Dec 2023 11:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691066;
	bh=mHja8axhsHXkDaKV6E+Gy/vhO170K/x0LJkgRVpgsKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DfqFb3Q+q+KbsNMRhDvUAK/ugHVnAYEo780Lilzvxrp1kLwQ6TwUhySHx1xCppK9D
	 3T4HrkoiBhATuMbgGBUTVQqGY2ORlNOsIQlcxF2GAYgdAcUn+msBqkjrzLGrJWb7Xw
	 3TCAyEp19aUxS0bZs8zCB2XFkcjH/3UtMP6ju9VjQyFKY0pWwaQAfALuO61mvZ9rLg
	 /cok18i/3aUmCd8mS8nbp6qYmuAcLa6IgFHwxBP5Ck1YSD4SMjQ/xjDrT8wjbZsovW
	 VtPdLYxkYaj7RfqED2eMxE4rW5NWluFQQSYdCLo5LuH1ENd0n2EcVxKzfHz5Id44d9
	 4MAfQlgB3B/Ug==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 14/20] mips: spram: fix missing prototype warning for spram_config
Date: Mon,  4 Dec 2023 12:57:04 +0100
Message-Id: <20231204115710.2247097-15-arnd@kernel.org>
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

arch/mips/kernel/spram.c:194:6: error: no previous prototype for 'spram_config' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/spram.h | 2 +-
 arch/mips/kernel/spram.c      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/spram.h b/arch/mips/include/asm/spram.h
index 373f2a5d495d..9f6a2cb1943a 100644
--- a/arch/mips/include/asm/spram.h
+++ b/arch/mips/include/asm/spram.h
@@ -3,7 +3,7 @@
 #define _MIPS_SPRAM_H
 
 #if defined(CONFIG_MIPS_SPRAM)
-extern __init void spram_config(void);
+extern void spram_config(void);
 #else
 static inline void spram_config(void) { }
 #endif /* CONFIG_MIPS_SPRAM */
diff --git a/arch/mips/kernel/spram.c b/arch/mips/kernel/spram.c
index d5d96214cce5..71c7e5e27567 100644
--- a/arch/mips/kernel/spram.c
+++ b/arch/mips/kernel/spram.c
@@ -12,6 +12,7 @@
 #include <asm/mipsregs.h>
 #include <asm/r4kcache.h>
 #include <asm/hazards.h>
+#include <asm/spram.h>
 
 /*
  * These definitions are correct for the 24K/34K/74K SPRAM sample
-- 
2.39.2


