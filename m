Return-Path: <linux-mips+bounces-9184-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C77AD1292
	for <lists+linux-mips@lfdr.de>; Sun,  8 Jun 2025 16:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E63E83AA0B7
	for <lists+linux-mips@lfdr.de>; Sun,  8 Jun 2025 14:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D3D22B585;
	Sun,  8 Jun 2025 14:20:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781C8149C53;
	Sun,  8 Jun 2025 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749392434; cv=none; b=MZhYFMaQIvJPy3ciabWB112FRQMzkMa8W8yHU6gPGooEAy3TSe8We6BCf4pw3mN45Lcf6DhMRUVDpC3j164QzJBY3QmQh9+TK5Zhis7cmRX2oU2TRQeiaHTaI4zvC+B/4kClqK8WohHKOkByVN+DTVFPj325xqfWuTj2SIaPy/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749392434; c=relaxed/simple;
	bh=6OQVeSmzJ/KSinALDQt26srfAAsc8/6CtoL0wcAXxKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ww97hym3hmzMpaOtT3nzYEw2FkT4TLAD07Fqvf9wqRClpjaX92sfjuvztES0J7vC+vP5TArxgRn/D5OZG5iykzr2+exJNvXb/QWtnOpXRDEes4Lu/8MR9OwNCKmDPpLiBmgFQoSxZqUBmbxWk2KjhGFLNA1sk3otu8fi4cfc9zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4E9C4CEEE;
	Sun,  8 Jun 2025 14:20:31 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] MIPS/Loongson: Fix build warnings about export.h
Date: Sun,  8 Jun 2025 22:20:10 +0800
Message-ID: <20250608142010.161632-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") and 7d95680d64ac8e836c ("scripts/misc-check:
check unnecessary #include <linux/export.h> when W=1"), we get some build
warnings with W=1:

arch/mips/loongson64/setup.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

So fix these build warnings for MIPS/Loongson.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/mips/loongson64/setup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
index 257038e18779..b3e590eae952 100644
--- a/arch/mips/loongson64/setup.c
+++ b/arch/mips/loongson64/setup.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2007 Lemote Inc. & Institute of Computing Technology
  * Author: Fuxin Zhang, zhangfx@lemote.com
  */
-#include <linux/export.h>
 #include <linux/init.h>
 
 #include <asm/bootinfo.h>
-- 
2.47.1


