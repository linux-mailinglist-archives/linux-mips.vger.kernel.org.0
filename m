Return-Path: <linux-mips+bounces-8682-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F0BA95FB9
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 09:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3BDB3ABC9C
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 07:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78ECA524C;
	Tue, 22 Apr 2025 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XdSGTa6W"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AC61EB5DC
	for <linux-mips@vger.kernel.org>; Tue, 22 Apr 2025 07:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307813; cv=none; b=MNxguPPbW/Tq/NsVUWcJlWTymMM3Uzpj9IWmbHJNTNgd3bq0tTcgrxB3jg5IiBHARs7PXSpWQ5wxytXeioWoobCWxHNXFsWena3z16v6TAI+JP2rMI1SASGJ6nCjnAUN0VSti8e7iFmBwGOMl5Ewm1KtqEElo2TzUfKxj3n6gpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307813; c=relaxed/simple;
	bh=R5SFfORZyHAzVkPV76H8wV6285XhlcAIVYEAw7yOVvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DuCAfFu1VMf0h3SXU1wlllju9+RZgBhl//fNMfEO8pK3RHRwO45X1P6UShp9lfpukWHofX5PZ3ADd4vXca+FCd/U7HlQf3m13jS8fPDSC2i0hDEqFX5xGpHeMHP40g0YLZwnNnuVsb55ZbHxgMhminbW76IhN3c/ZM5Pqb2FD+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XdSGTa6W; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745307807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OudTtl9ifhGoOWeWZyumebbyu3fyKvkdq2X/syYruzc=;
	b=XdSGTa6WnFgv860U++wFbXqW6yV3Z+iN1/kEXX8RQsqavIEFXgbncR4hKZdtl6uzYwWZE6
	hAXU8oAND2S72L4qw9R/1J0N06ycSVmbajeOyjahnw/GhIhVsnFlIMKBVlhAg9ZWMdfGrA
	AiV29uU+BFWdvXqZeDHcKaPFad/I5QA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-hardening@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: BCM63XX: Replace strcpy() with strscpy() in board_prom_init()
Date: Tue, 22 Apr 2025 09:42:55 +0200
Message-ID: <20250422074257.544016-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead.

Link: https://github.com/KSPP/linux/issues/88
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/bcm63xx/boards/board_bcm963xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 9cc8fbf218a5..c5617b889b1c 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -764,7 +764,7 @@ void __init board_prom_init(void)
 			snprintf(cfe_version, 12, "%s", (char *) &cfe[4]);
 		}
 	} else {
-		strcpy(cfe_version, "unknown");
+		strscpy(cfe_version, "unknown");
 	}
 	pr_info("CFE version: %s\n", cfe_version);
 
-- 
2.49.0


