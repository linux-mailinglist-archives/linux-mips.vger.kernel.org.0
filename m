Return-Path: <linux-mips+bounces-487-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4128031DA
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 114641F20F71
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7292122F10;
	Mon,  4 Dec 2023 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYju0IOl"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DAB22EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC81C433CA;
	Mon,  4 Dec 2023 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691051;
	bh=l3hz5mRSkD7DYuIne0Jscf5nMuXOjPSpfpHitUXLfNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YYju0IOlb2TZrxG39W4fehNxMRmqlATtHntDxpY+g2sbOW2vqYsLSabsIN85X2IKB
	 522QAmTLBVu3ccT3mp1eO35f9ihoS8ikt6C71Q7laTkABSBmgOze/5ZU1siNfxrL61
	 wLZhksMb3BVJ1GH/1CER0bvdgTak3ycLpRy4a1X8N4smggealQfRClDU4Z+/HXv4As
	 YHsH3CJxKh7SbOhBmpVJXnmDXpcblovN3gQzGtQrReuy+QcI1koELRFD76t4ZHnpSF
	 WzoaLZrAxPg5gTIHb8aiBU/X04pEQnBdaV/eN8tzdncKEhW0gIHqFIGcHZJShlFico
	 Opnidked/E+qA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 06/20] mips: mark local function static if possible
Date: Mon,  4 Dec 2023 12:56:56 +0100
Message-Id: <20231204115710.2247097-7-arnd@kernel.org>
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

These two functions are global but have no extern prototypes or other
callers, so it's best to mark them as static, avoiding these warnings:

arch/mips/kernel/mips-cm.c:204:13: error: no previous prototype for '__mips_cm_l2sync_phys_base' [-Werror=missing-prototypes]
arch/mips/mm/c-r4k.c:1827:12: error: no previous prototype for 'r4k_cache_init_pm' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/kernel/mips-cm.c | 2 +-
 arch/mips/mm/c-r4k.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 3f00788b0871..84b3affb9de8 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -201,7 +201,7 @@ phys_addr_t __mips_cm_phys_base(void)
 phys_addr_t mips_cm_phys_base(void)
 	__attribute__((weak, alias("__mips_cm_phys_base")));
 
-phys_addr_t __mips_cm_l2sync_phys_base(void)
+static phys_addr_t __mips_cm_l2sync_phys_base(void)
 {
 	u32 base_reg;
 
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 187d1c16361c..0619e5296ff3 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1828,7 +1828,7 @@ static struct notifier_block r4k_cache_pm_notifier_block = {
 	.notifier_call = r4k_cache_pm_notifier,
 };
 
-int __init r4k_cache_init_pm(void)
+static int __init r4k_cache_init_pm(void)
 {
 	return cpu_pm_register_notifier(&r4k_cache_pm_notifier_block);
 }
-- 
2.39.2


