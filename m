Return-Path: <linux-mips+bounces-3498-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2607D8FCC69
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 14:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C92F9296A4E
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 12:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0508D199A89;
	Wed,  5 Jun 2024 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BchE46gj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECAA199A86;
	Wed,  5 Jun 2024 11:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588525; cv=none; b=WecLpA3lwwBzQCy+dm9S9lKW+fWVEQK9aumOCFBR8fOjniywonl12KwqqIJtNY6wdiLKZwr+kyt+fDxmi5C5vVqxUZVKGBI8A5/VO0ZXyyV1Jo1dvwcdkafhVSoJqsKtse1lITGCAeWwfaXszpXwqPfe26CZHgCxRCgCRrJzOEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588525; c=relaxed/simple;
	bh=ghaJ6hQdbi2GgdV2gtK7tru7aQc6vMTFxyqHR4nedXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Isnz0gAIv8jZv/2YgsI9ww6DPsIq9f11PSiDeO3K3c/h2YtWbmEa6gWt/osIrdCVZ4Bw7hYGN5JvDHLsVzo1WzHR2TZOzDgfRR6KEICQMY2liYD+V1JDudvfuduMtM9MRuymQk07WP5vJryaxzqOFnQiW368Oz6O+61EdCguOQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BchE46gj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8F6C32786;
	Wed,  5 Jun 2024 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588525;
	bh=ghaJ6hQdbi2GgdV2gtK7tru7aQc6vMTFxyqHR4nedXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BchE46gjUui4PfCiZx7c1+XYJvBddPg8AT0mgAB6BGMNPb45ZxMg5VC4de1eGrTwi
	 PSAqnhJsMcOvmV+hJ4dAr0WPmk+BYuUqRT6eBVQRAeLZXvz+Vzhh+oQp1v+riw+ggu
	 VbUqt5DNPa9iPnh7EM7bX5YM6ohQkddh5InBPc/WZRd7y3s5QpYhfZQVCSLgx1Fehb
	 NJ/F8hgcMBJFf/DHbNFk3GHAGnnmnpMABvPXiR4W4wHxt4IWm99Emd6u0b6Z1yLm0u
	 LpZrFiLhMm48qVHOWeKpPCV6GFO/EGlOOwjEbCv/XxP8aokjqAfEZd4ruVFQxtK6Tz
	 bq5Sd2XoE/eEQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Songyang Li <leesongyang@outlook.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	bhelgaas@google.com,
	rdunlap@infradead.org,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 4/4] MIPS: Octeon: Add PCIe link status check
Date: Wed,  5 Jun 2024 07:55:12 -0400
Message-ID: <20240605115518.2964670-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605115518.2964670-1-sashal@kernel.org>
References: <20240605115518.2964670-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.315
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
index d919a0d813a17..38de2a9c3cf1a
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


