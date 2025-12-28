Return-Path: <linux-mips+bounces-12636-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C30CE55E6
	for <lists+linux-mips@lfdr.de>; Sun, 28 Dec 2025 20:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 089D93009A9D
	for <lists+linux-mips@lfdr.de>; Sun, 28 Dec 2025 19:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31256146588;
	Sun, 28 Dec 2025 19:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CHepyuL4"
X-Original-To: linux-mips@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BA32C8B;
	Sun, 28 Dec 2025 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766948694; cv=none; b=pLMykZEJ+znI7DqmBOPb+pcFx+jkj4VJFJM5vyyeh5nSFutEbWMXyFUi4PgSJJ92sGvoiv0uSW1TrHLyW9r9tu/tMPVJpA+ANnzP1Z3bPh5+eu78SIYYwpUap+khJChcZNjJiGwYwfba2nm8nCaUZ6Y0O4HvR7EUrgeepT25td4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766948694; c=relaxed/simple;
	bh=oCwWqsrsxMwQ7UIBcxH/JtfRl6xypC2chbyhj1Q7R0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRaxY/d63ioMS/DsrPHRSCMbWzGC3I/Ag4sXJ1fTlF492YckygTO0+Qz4Ynii0/OStZxQyS+fW+jfh6m7Db9C+rIpTlDZIHnqG9S2taLYu5wcweulJgGETJmC1yCu/DDGtuwcG4P2Phea9ZP3c4ttRQF3UwyVYfMK03mP4g1pwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CHepyuL4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Ma7GBrv+Zw5sXayAuTjDRTV4LXnqWjqSeglh5Be+5T8=; b=CHepyuL4Hwc13MIf0tJv8W67DZ
	NEVyk6WC/pyvwM7+VKJGNo+lOs5Ep8MZJx8AzWLvaLqd/rAdZw80YL5Oa1gon0eFjTCyc8sw0uoKa
	JMlYuPSygAiw/WNO4+Dg6KSvC3A3MvdqlKrxUJLakBEEv2oe6fqRrangONt0sj0nu63+1Qu5u+5ON
	LDt0/CQO6s1pI3KjhioaKUV9E9/UUsEis2KTBPBT5HINJsAQqqR+vlxEW19z81BKix8wCi7HpYAV2
	vDDox3CpgTUaetaGeobm/qmvrmFUq+YdMUDAHbKiifuQ+gY3Z9jojbNyH6EQwesXsTc1AYfPtDKeQ
	5g3K835w==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZw4L-00000002xxE-3FjE;
	Sun, 28 Dec 2025 19:04:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: [PATCH] mips: LOONGSON32: drop a dangling Kconfig symbol
Date: Sun, 28 Dec 2025 11:04:43 -0800
Message-ID: <20251228190443.2479978-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPU_GAS_LOAD_STORE_LR is not used anywhere in the kernel sources,
so drop it.

Fixes: 85c4354076ca ("MIPS: loongson32: Switch to generic core")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org

 arch/mips/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251219.orig/arch/mips/Kconfig
+++ linux-next-20251219/arch/mips/Kconfig
@@ -1408,7 +1408,6 @@ config CPU_LOONGSON32
 	select CPU_MIPS32
 	select CPU_MIPSR2
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_CPUFREQ

