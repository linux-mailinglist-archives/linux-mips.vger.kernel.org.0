Return-Path: <linux-mips+bounces-10350-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F34FAB294B6
	for <lists+linux-mips@lfdr.de>; Sun, 17 Aug 2025 20:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E46697B43ED
	for <lists+linux-mips@lfdr.de>; Sun, 17 Aug 2025 18:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE89C3002DE;
	Sun, 17 Aug 2025 18:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OZOHNLMN"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2598F28399
	for <linux-mips@vger.kernel.org>; Sun, 17 Aug 2025 18:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755455895; cv=none; b=a5dlLqr9jXazjt7sbfcC+isVlowfC4zh2S3vxhGn8Ud6p3L+WdZ4fiws55ruoKsEGNQPj4u6vml0beg9FYip/ExMXqq+ftDDZv4eMtMzNW9pCNgVhJpDzVyXNLnALYKEY3qae49S5ABbQSqtZVuPjo+LQF6DbAZadnyzKucdrGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755455895; c=relaxed/simple;
	bh=sjVKdScJg1tpQ2DUxpoJnfCD3diHwlzHH3yVwhCQJTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e83L8gzfqr/x6WP6Kar2OA/F0k/J1+SW5OmWC+doejbxw3YZui2QQ8y4oQk1JOaUPziF3LcCSQG//w3cn+tbMliAI+38cWZmQ1h9s+h6b1HJb3+dbbaz37vUoqGuG4o9vxrnN82D1y9a944QoTFFP8r+m6zjmFbOliT4zMsltWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OZOHNLMN; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755455890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xw23XuAqvkfjRvWscmZ9n/cdkV9n+OCr1B3xpq9eAq8=;
	b=OZOHNLMNWmdE0QQiWgcj+p+qqlf8n0Kh4bSo8zUfrZ60Lug+KAy5jCy57xuUZ9QjDVPNE9
	iqm0UzrK4t5zI77R74uau0mrYWzuhukcDJzERt778vmuFgrePGmrV8kbQuDeIQwbjRC1oM
	vP0fMYg58VQ7CPE/CNbQHt6pPiMuQTs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] MIPS: sgi-ip32: Replace deprecated strcpy() in plat_mem_setup()
Date: Sun, 17 Aug 2025 20:37:12 +0200
Message-ID: <20250817183728.612012-2-thorsten.blum@linux.dev>
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

strcpy() is deprecated; use strscpy() instead.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/sgi-ip32/ip32-setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/sgi-ip32/ip32-setup.c b/arch/mips/sgi-ip32/ip32-setup.c
index aeb0805aae57..c2ebc4bbd866 100644
--- a/arch/mips/sgi-ip32/ip32-setup.c
+++ b/arch/mips/sgi-ip32/ip32-setup.c
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/param.h>
 #include <linux/sched.h>
+#include <linux/string.h>
 
 #include <asm/bootinfo.h>
 #include <asm/mipsregs.h>
@@ -90,7 +91,7 @@ void __init plat_mem_setup(void)
 			static char options[8] __initdata;
 			char *baud = ArcGetEnvironmentVariable("dbaud");
 			if (baud)
-				strcpy(options, baud);
+				strscpy(options, baud);
 			add_preferred_console("ttyS", *(con + 1) == '2' ? 1 : 0,
 					      baud ? options : NULL);
 		}
-- 
2.50.1


