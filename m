Return-Path: <linux-mips+bounces-10382-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA28BB2BED9
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 12:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB65E7A7345
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 10:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F65832039B;
	Tue, 19 Aug 2025 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X0J3KQ6Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AC831196B;
	Tue, 19 Aug 2025 10:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755599123; cv=none; b=bwlEwC+D3Z0hKcG2AiHdWEG1+LFn2rYIv6jSWm7Ckm4Zhhxnd0BRjYpYO/cSZSY1xiaQGf8HP7CXZOhlLvFZbSFF8pq097EwEhUqNr0H0+tSnODXk3s9MssV24WOZil6nJHMOmJYiLZirOAIppxpxEHmhBjdykJFd/dlyDyvb8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755599123; c=relaxed/simple;
	bh=9QL/zWeJ1kTH8RgmiL/R/P0VNpJ9vMsoJqEulT2Nk28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dNG+kCrc86h2zwsaUwaW0CfZ0w+mKLZ0+hLPhVSoUb5FenPYQ2eowEA2CC4rV70hao1jD73zudwYu3rBjtrZdUebzmshYBiKN/zz+Hvw+JRyWeWcb1r5Bx31uuNfbNb/+Hk7cMqKzzAJesUvd2croqwaRkxbJ5Y0gmSJnNB68WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X0J3KQ6Q; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755599118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XAEzHSx9J2WDYhJtUlgP9ek1q54RuWBFpaNSaatAxDQ=;
	b=X0J3KQ6QdHp2nrkM17xzAYgP67qu8bj+5NRUEyfkYF7GW1riZzDqG5Is4S9oamDrUH8J+t
	PDXdL73cV5/dsmwGikBBJsoHuNmspZlX/KOSdUXgJYrHkRkiQZXOQDrUuwMiE4VZ7kgAct
	x+A9DXUIbyiHlvxwgv7KwPJv0ACwoGc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-hardening@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: RB532: Replace deprecated strcpy() with memcpy() and strscpy()
Date: Tue, 19 Aug 2025 12:24:17 +0200
Message-ID: <20250819102419.712031-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use memcpy() and strscpy() instead.

Add the local variable 'size_t len' to keep track of the string lengths
and prefer memcpy() over strscpy() when we use the string length to
advance the 'cp' pointer.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/rb532/prom.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/mips/rb532/prom.c b/arch/mips/rb532/prom.c
index b88e89ec5894..8c370eb180ef 100644
--- a/arch/mips/rb532/prom.c
+++ b/arch/mips/rb532/prom.c
@@ -53,6 +53,7 @@ static void __init prom_setup_cmdline(void)
 	int prom_argc;
 	char **prom_argv;
 	int i;
+	size_t len;
 
 	prom_argc = fw_arg0;
 	prom_argv = (char **) fw_arg1;
@@ -82,20 +83,20 @@ static void __init prom_setup_cmdline(void)
 				mips_machtype = MACH_MIKROTIK_RB532;
 		}
 
-		strcpy(cp, prom_argv[i]);
-		cp += strlen(prom_argv[i]);
+		len = strlen(prom_argv[i]);
+		memcpy(cp, prom_argv[i], len + 1);
+		cp += len;
 	}
 	*(cp++) = ' ';
 
-	i = strlen(arcs_cmdline);
-	if (i > 0) {
+	len = strlen(arcs_cmdline);
+	if (len > 0) {
 		*(cp++) = ' ';
-		strcpy(cp, arcs_cmdline);
-		cp += strlen(arcs_cmdline);
+		memcpy(cp, arcs_cmdline, len + 1);
+		cp += len;
 	}
 	cmd_line[COMMAND_LINE_SIZE - 1] = '\0';
-
-	strcpy(arcs_cmdline, cmd_line);
+	strscpy(arcs_cmdline, cmd_line);
 }
 
 void __init prom_init(void)
-- 
2.50.1


