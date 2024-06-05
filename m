Return-Path: <linux-mips+bounces-3493-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 415B48FCBDC
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 14:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B83A288F32
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 12:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A6A1ACAE4;
	Wed,  5 Jun 2024 11:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLXEY2ZU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909961ACACA;
	Wed,  5 Jun 2024 11:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588365; cv=none; b=tQs/zH99VXAvC3bKnrXsjkAtkZ70R5JNVfOXRu5nfmfnCX6LWID0HeHUHhsmDqXwop8a/a1wPUCgdmH04OkkfzhgP44GYmL2V+NbVfzj2FFyccS9D3V7GEJCq/oODg2VDsWbN3Xdq4B3wvMBEB56tHSkBBMKHKP//fOFYkUpojU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588365; c=relaxed/simple;
	bh=2Eq7FXzfZwx2HaQ3uWYtAcoK8wDlGTa/EEgdlOM4Who=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjhdc/43TCLdxOibMEwHNsBWDin42mDRSli7hldsN3pmY1EutIoGDYqO/6e0hi1PMsH/TsY+zXHr8zLbXnuj8fWzplYbtoPeDpvT8iBR4meTZ+2f0nnnpl+ufS4Wnr0zit1OUzoaPpd3Wj4gT014pLm6yhyJSrVM1Qfsx7rm4MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLXEY2ZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C69CC3277B;
	Wed,  5 Jun 2024 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588365;
	bh=2Eq7FXzfZwx2HaQ3uWYtAcoK8wDlGTa/EEgdlOM4Who=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PLXEY2ZU4Chgee1Rt2cKuNILr/0FBJd59qVG5qTEnudewdcKKaaLInz/7/qzo1zBw
	 /05YuvUnoJB29UuhFIXVK3JYka363X6mJvyII08+J9FeRfbmk3LxU3z37o9Wrg59Iz
	 vzL/TGLOPb4RrYllNbyPDOCJUPkRLfcBWADTsUgNmf/jhEAr6pvjcoAZg8Pr423Hk+
	 DMvHgKNlJVgb4BP06jYerY/WcR+oFDA9LRueehis263rHMXcZpQ5f8NtXJ1AIK74zR
	 LkVyZPo6JpHytEX5XGguzOZZ1tueZVcbxT6Eb1PhceoTN+3aTloycfcIHWAKl82Ddw
	 EpcsnnicgZlOQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Songyang Li <leesongyang@outlook.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	rdunlap@infradead.org,
	bhelgaas@google.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 10/20] MIPS: Octeon: Add PCIe link status check
Date: Wed,  5 Jun 2024 07:51:53 -0400
Message-ID: <20240605115225.2963242-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605115225.2963242-1-sashal@kernel.org>
References: <20240605115225.2963242-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
Content-Transfer-Encoding: 8bit

From: Songyang Li <leesongyang@outlook.com>

[ Upstream commit 29b83a64df3b42c88c0338696feb6fdcd7f1f3b7 ]

The standard PCIe configuration read-write interface is used to
access the configuration space of the peripheral PCIe devices
of the mips processor after the PCIe link surprise down, it can
generate kernel panic caused by "Data bus error". So it is
necessary to add PCIe link status check for system protection.
When the PCIe link is down or in training, assigning a value
of 0 to the configuration address can prevent read-write behavior
to the configuration space of peripheral PCIe devices, thereby
preventing kernel panic.

Signed-off-by: Songyang Li <leesongyang@outlook.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/pci/pcie-octeon.c | 6 ++++++
 1 file changed, 6 insertions(+)
 mode change 100644 => 100755 arch/mips/pci/pcie-octeon.c

diff --git a/arch/mips/pci/pcie-octeon.c b/arch/mips/pci/pcie-octeon.c
old mode 100644
new mode 100755
index c9edd3fb380df..9eaacd3d33880
--- a/arch/mips/pci/pcie-octeon.c
+++ b/arch/mips/pci/pcie-octeon.c
@@ -230,12 +230,18 @@ static inline uint64_t __cvmx_pcie_build_config_addr(int pcie_port, int bus,
 {
 	union cvmx_pcie_address pcie_addr;
 	union cvmx_pciercx_cfg006 pciercx_cfg006;
+	union cvmx_pciercx_cfg032 pciercx_cfg032;
 
 	pciercx_cfg006.u32 =
 	    cvmx_pcie_cfgx_read(pcie_port, CVMX_PCIERCX_CFG006(pcie_port));
 	if ((bus <= pciercx_cfg006.s.pbnum) && (dev != 0))
 		return 0;
 
+	pciercx_cfg032.u32 =
+		cvmx_pcie_cfgx_read(pcie_port, CVMX_PCIERCX_CFG032(pcie_port));
+	if ((pciercx_cfg032.s.dlla == 0) || (pciercx_cfg032.s.lt == 1))
+		return 0;
+
 	pcie_addr.u64 = 0;
 	pcie_addr.config.upper = 2;
 	pcie_addr.config.io = 1;
-- 
2.43.0


