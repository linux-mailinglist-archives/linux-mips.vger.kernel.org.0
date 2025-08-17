Return-Path: <linux-mips+bounces-10354-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC5B294C5
	for <lists+linux-mips@lfdr.de>; Sun, 17 Aug 2025 20:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFBA43BF308
	for <lists+linux-mips@lfdr.de>; Sun, 17 Aug 2025 18:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02450304BDD;
	Sun, 17 Aug 2025 18:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kFMNXzo3"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F81304BAF
	for <linux-mips@vger.kernel.org>; Sun, 17 Aug 2025 18:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755455903; cv=none; b=CcbNY1DKqInMrzdEJDrKyL3ENrqENuLISsiZuCcUitrR3qpoOQbcuJKkCYxbg59dQhF4HVGLB6Vp8F3Wx5jLdJdeuPe828VLRZxfTXfjAUkCIEO6QxcheDKNXLqBPSQqu2mSjYrhQzbMA3/K+ceUWNZik8bavA6rWs1xpaRnAp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755455903; c=relaxed/simple;
	bh=WDubkQXj+WecCwutyb4R4Rnw4oCkjIAgv6xfP0GAdoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUdW5pVw9WWjm5uhj6AfUJcDX2Q9rnE3mB9i+qjCTsbCDH4n3kt/hvB0oI6DzqLm8+4padCMF/JNvtphkHL6uXKSlBVZ9JW18bRGcFZUCHM2p5wN1C3IRGtJv0CD6rW+ifkSJ9KSoQwLeAHdG0ISoMmte6lEeKJJp3mUdKfrpKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kFMNXzo3; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755455900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VA9WYqKLyv5vGih4pdWtpESKMQX+ELYLixIxakJ64+M=;
	b=kFMNXzo3tS0Rs14uV7z40fXk2N9MIkEU0LPpQAF3jVCqO8H3xrWX0sOs9m6/kHhsYDAsRe
	MBjy687TmWxYp62wmpOBawVtwhXoZUxPkbPPtY/pnaxnNpuOOpkfveHZmjUC7jPB2awqDh
	OCJ7G7FqY/XxdsLk7wV+zO2R/0JoFTM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] MIPS: octeon: Replace memset(0) + deprecated strcpy() with strscpy_pad()
Date: Sun, 17 Aug 2025 20:37:16 +0200
Message-ID: <20250817183728.612012-6-thorsten.blum@linux.dev>
In-Reply-To: <20250817183728.612012-1-thorsten.blum@linux.dev>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace memset(0) followed by the deprecated strcpy() with strscpy_pad()
to improve octeon_fdt_set_phy(). This avoids zeroing the memory before
copying the string and ensures the destination buffer is only written to
once, simplifying the code and improving efficiency.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/cavium-octeon/octeon-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
index 5e1dd4e6e82f..47677b5d7ed0 100644
--- a/arch/mips/cavium-octeon/octeon-platform.c
+++ b/arch/mips/cavium-octeon/octeon-platform.c
@@ -13,6 +13,7 @@
 #include <linux/of_fdt.h>
 #include <linux/platform_device.h>
 #include <linux/libfdt.h>
+#include <linux/string.h>
 
 #include <asm/octeon/octeon.h>
 #include <asm/octeon/cvmx-helper-board.h>
@@ -538,8 +539,7 @@ static void __init octeon_fdt_set_phy(int eth, int phy_addr)
 
 	if (octeon_has_88e1145()) {
 		fdt_nop_property(initial_boot_params, phy, "marvell,reg-init");
-		memset(new_name, 0, sizeof(new_name));
-		strcpy(new_name, "marvell,88e1145");
+		strscpy_pad(new_name, "marvell,88e1145");
 		p = fdt_getprop(initial_boot_params, phy, "compatible",
 				&current_len);
 		if (p && current_len >= strlen(new_name))
-- 
2.50.1


