Return-Path: <linux-mips+bounces-10326-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6615FB27FE5
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 14:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D563B5C4E52
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 12:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DC830497E;
	Fri, 15 Aug 2025 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="nzVSmBLP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7524A30496D
	for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 12:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755260207; cv=none; b=eZ8kwvfCeHfS6pM7fWDNckedL7WxjrHqxguW6ze1S3dPot+3MbUzVlBH0EqmMIw96BRSwQITgG3KiDfeInwTDPdjKIOsz1fdHdA0d96qj+Wif7yPQDDz4kdrVjQdEb/q6UxsCFPdOunzhzOe6usOOA21+zve/Yt3p1mkcmmQ+m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755260207; c=relaxed/simple;
	bh=hfSRfDOUeDte8veYvygLPb606pAdkMkrLHLZSqsSGow=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tF5i//1LtG1FUtllE1KrxzMRng7LR9IpPOxEH1gKWzc1VRoO+TxjtSY2mFgNV688lAwO9HO24FjcDr8OUPEWli0NGrkV/4fwy1e26QihdtlF7cYe2dRQsdI+NVJTc3sclH1AkMQOxO7MdNTFN/BEdLsp8cM0xB76q2LUkOz35ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=nzVSmBLP; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 46994 invoked from network); 15 Aug 2025 14:16:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755260203; bh=GEK/6qZzB2CfjhKmipL1dcqXKA4bfE9g5cKzPnMC4FU=;
          h=From:To:Subject;
          b=nzVSmBLPY/3U2g6SLmJclWcQKM3+yyv+uNFtGoE4RHMW3rsW9Gt9WXFjNyxera/ji
           pYaYiRopOgqMWWiEH/aTsPrntz95zelSoCdW+DrNLWe9XC+tvx2CurNY6lW2SO2fgf
           4qncCl01fJEaZ+1UnxWmIOyIbpBmXEpV5D9KAyT3I26McDNfz4ewCdqg0x3C0etwqt
           3VbuqQ5og8OfITZK6IYMXRmC6aAS7J4Ywujl96xE8SlT/75cYlEq1SUuiRlCyp8O2m
           BqUcGICRDJSMne/BshIHvDJF4gIcwMyE0WqJuY+LrfLqzPaOR5jX66jVEsmzBfSZUQ
           Zpho0samr+lLQ==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <john@phrozen.org>; 15 Aug 2025 14:16:43 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: john@phrozen.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	olek2@wp.pl,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mips: lantiq: xway: sysctrl: rename stp clock
Date: Fri, 15 Aug 2025 14:12:23 +0200
Message-ID: <20250815121635.3397802-2-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250815121635.3397802-1-olek2@wp.pl>
References: <20250815121635.3397802-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 864f5383914da068b023479d4a3a7f42
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [QQOR]                               

Bindig requires a node name matching ‘^gpio@[0-9a-f]+$’. This patch
changes the clock name from “stp” to “gpio”.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/lantiq/xway/sysctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
index 5a75283d17f1..dcea4cf064ef 100644
--- a/arch/mips/lantiq/xway/sysctrl.c
+++ b/arch/mips/lantiq/xway/sysctrl.c
@@ -485,7 +485,7 @@ void __init ltq_soc_init(void)
 	/* add our generic xway clocks */
 	clkdev_add_pmu("10000000.fpi", NULL, 0, 0, PMU_FPI);
 	clkdev_add_pmu("1e100a00.gptu", NULL, 1, 0, PMU_GPT);
-	clkdev_add_pmu("1e100bb0.stp", NULL, 1, 0, PMU_STP);
+	clkdev_add_pmu("1e100bb0.gpio", NULL, 1, 0, PMU_STP);
 	clkdev_add_pmu("1e100c00.serial", NULL, 0, 0, PMU_ASC1);
 	clkdev_add_pmu("1e104100.dma", NULL, 1, 0, PMU_DMA);
 	clkdev_add_pmu("1e100800.spi", NULL, 1, 0, PMU_SPI);
-- 
2.47.2


