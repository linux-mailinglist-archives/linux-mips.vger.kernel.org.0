Return-Path: <linux-mips+bounces-9063-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBF7ABFEFA
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 23:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26E0D1BA31F3
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 21:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2290B4B1E76;
	Wed, 21 May 2025 21:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="dmGicxAa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E8D1F099C
	for <linux-mips@vger.kernel.org>; Wed, 21 May 2025 21:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863223; cv=none; b=le2VVMinxqI/075d3JTHl/IgOENrXX0GHXS89ZRATCf7kk++uQ2YQmytedQhkAnjPMMFBDevoaP6AIRHZZrUwkFgPtFnLM9v+v89N+OWhqa6tOPbngIq7iJ/cChnP8kE79mPw+430cVEV15GLF1BY+rEm91XnDR7WYvnzkpMu6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863223; c=relaxed/simple;
	bh=vN1r6zqn3d9tBHJkeSLhwDop6Ruw32TGU6wIRhVF4Z8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kkr4nlIx7VERgZZocTLucZsmOQYNyPqYM2zqeJTQm03Ia+MRrYVnQTBv5Sn9DJ7ljgyFc2KNZLKbP3hd9WhuT3zDKe5VrPaRb35v3gN5XS7Xy8brTxYEiZYBb1Y9QRiC29qRj+8Qk/aWqwa0zN5cBb1X5Qk4LQniX3q0eSQqzts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=dmGicxAa; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5FD51A77DC;
	Wed, 21 May 2025 23:33:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1747863218; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=d3WTE/RsJr1jJjo0eFbqgq33WQ2zMmNlJsk6CWPh690=;
	b=dmGicxAa1wjJLPMnhBx2/lqprn5p2lWhmjSBX2XR4ACnp72FzsQeaH1WULcF4QHxT9QS1V
	z/qth6mDUiOTsO10zfvGGzeVUH86dxAypZAyNedgxzLa8G/P53KlNX4n7LAcOj8iSx+rA5
	nHMyydNLxraSxSeDVNASkJLT5dyHnbkA67HkyG3LzPaGWWbtFVzyr7Yos+EuRw15PBslf5
	d5gMupiFuDIjok6NWjXGf/fSjI2642z0QiwYQAWqHWkEjgHLdYiRg0TVGTJY5I2VLW0PjK
	kzC7qafAyOMhlnBxw7qLTY+UQChFPnGiylWrWAlEnBwLyQtqQeqf6kocU6wSMQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: lkp@intel.com,
	cjd@cjdns.fr,
	fazilyildiran@gmail.com,
	oe-kbuild-all@lists.linux.dev,
	paul@pgazz.com,
	tsbogend@alpha.franken.de
Subject: [PATCH v2] mips: econet: Fix incorrect Kconfig dependencies
Date: Wed, 21 May 2025 21:33:33 +0000
Message-Id: <20250521213333.481144-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

config ECONET selects SERIAL_OF_PLATFORM and that depends on SERIAL_8250
so we need to select SERIAL_8250 directly.
Also do not enable DEBUG_ZBOOT unless DEBUG_KERNEL is set.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505211654.CBdIsoTq-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202505211451.WRjyf3a9-lkp@intel.com/
---
I only now noticed the DEBUG_ZBOOT issue since they both touch the same
place decided better to do it in one patch.
---
 arch/mips/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c3dbdc808664..1e48184ecf1e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -395,9 +395,10 @@ config ECONET
 	bool "EcoNet MIPS family"
 	select BOOT_RAW
 	select CPU_BIG_ENDIAN
-	select DEBUG_ZBOOT
+	select DEBUG_ZBOOT if DEBUG_KERNEL
 	select EARLY_PRINTK_8250
 	select ECONET_EN751221_TIMER
+	select SERIAL_8250
 	select SERIAL_OF_PLATFORM
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_HAS_CPU_MIPS32_R1
-- 
2.39.5


