Return-Path: <linux-mips+bounces-9060-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7933ABFC3B
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 19:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82F0416E2F8
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 17:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C1317C21B;
	Wed, 21 May 2025 17:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="fhQhKMgC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9D1C5F09
	for <linux-mips@vger.kernel.org>; Wed, 21 May 2025 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848423; cv=none; b=qHp9yd9k7wAVF0sTuQzBGAAe8ZfuBmVf3ZmeLgUwNM4JySn6pTnb2gpBHx0tsMtWPnb45aIife0oUJH1j+RQA/ph6kFmzkPaEG+oN68C8aIny/rgb1vzxsRTp6PizG6XWjSrbwhb2CIVDQ8/IrJ1FDs9wBZ8YUApBj0YH/d+9Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848423; c=relaxed/simple;
	bh=Ozf2K5aLWxUcsueIVSaKOvz59INQJwnTXOlW4JzMWoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bf3PduHR0p8Z/RTm1q9B2/ibzbRRk7xB+dfA6YFDggOGSg5qTVHRISG/aEXphBeadWkqBfNuQ/2l42wa/07fccX1b+SDIN1/8PikpK+LE4eTNKAku5f36w9+SvA9ihvnZ3cPizdYS7dLRHKgyNrL7h6SNTtzKxUNdJZB1JFe/r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=fhQhKMgC; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8BA21A2540;
	Wed, 21 May 2025 19:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1747848413; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9ZOwVLxDdRlVFdc4Md6tASgtfCFcbsCuBgUjD/USceM=;
	b=fhQhKMgCZOphb0Zs+ry/C17CoKBQcT1oNGeZI/wGCdMSZanyB7DGoJJ201prtjw2LsVK/a
	jCd+vik69LbvcA8S2L6mDq06TQtDzTj+7f1fTROTPb45atJvkQ12bUUTPcNBroMlEHiGSz
	ug5FtZomm20TzfO5+AFJoQ4tyATH16Aa9ED+2mrv3mIR93m5n8rJEK0S+6Ym2w+mqxCAe8
	ILl7iwy6XwbHLDgXycpGGcF5uk8PR9sAKZOPGPh5KyREE/4atUfQg2KGQS2hUOeOImcb+9
	jwg6y5AvWIGof2chWwXo2epr83fJ/iRJUe3fj7VXsT3uMZBQLNhWyJcv1TjAoQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: lkp@intel.com
Cc: cjd@cjdns.fr,
	fazilyildiran@gmail.com,
	linux-mips@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	paul@pgazz.com,
	tsbogend@alpha.franken.de
Subject: [PATCH] mips: econet: Select SERIAL_8250 because SERIAL_OF_PLATFORM depends on it
Date: Wed, 21 May 2025 17:26:45 +0000
Message-Id: <20250521172646.461046-1-cjd@cjdns.fr>
In-Reply-To: <202505211654.CBdIsoTq-lkp@intel.com>
References: <202505211654.CBdIsoTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

config ECONET selects SERIAL_OF_PLATFORM and that depends on SERIAL_8250.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505211654.CBdIsoTq-lkp@intel.com/
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c3dbdc808664..b23122633a02 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -398,6 +398,7 @@ config ECONET
 	select DEBUG_ZBOOT
 	select EARLY_PRINTK_8250
 	select ECONET_EN751221_TIMER
+	select SERIAL_8250
 	select SERIAL_OF_PLATFORM
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_HAS_CPU_MIPS32_R1
-- 
2.39.5


