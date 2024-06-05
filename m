Return-Path: <linux-mips+bounces-3496-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF108FCC47
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 14:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3996FB24FF3
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 12:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0DF1B4C2E;
	Wed,  5 Jun 2024 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hI1CmksD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A161B4C2B;
	Wed,  5 Jun 2024 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588493; cv=none; b=q47IiA4oYUdYylyFyuPMcZJ1/v+lGEIHYuXZOkRr+lrHAWbBWUKeJe+7SpErDgjkysjAw/fTkQJdCMgyCXf7oDnCyAMd16+twsglxWWSFGl16UO8ldbSTWU1cKxvN44kE1HDTn3yTKNwYhTaSc3wH5th/QQ/mIfBuY9luslvaU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588493; c=relaxed/simple;
	bh=ghaJ6hQdbi2GgdV2gtK7tru7aQc6vMTFxyqHR4nedXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCgSMq5bM6AizJNFe5XejxmW1Cnro+hZln3h/9fmSBZCwxAmH8ud/kbr6mLvo3xL0kUkpnqqf4S1QvedPCEE68w9Jl5RRbwY3WDt+Zw+0pjL4jqbxyw7LCTxf/LbZZK+jzB8PCZ9vK706t8UyudTtpLiLX8K79+YzislBZFKQ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hI1CmksD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05C3C3277B;
	Wed,  5 Jun 2024 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588492;
	bh=ghaJ6hQdbi2GgdV2gtK7tru7aQc6vMTFxyqHR4nedXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hI1CmksDwIxuLZlQ5Sf3AkULf+G9GFNg9EVDBm/ThjPTBuc37bLKj72DqGOmKJh8f
	 ch9EbPlaqyqzfrQ+REA22YYKfR0muj26fwH9F0UOb3jkQAibOyh26tgx3GQIA364/x
	 RJmjqkT1SEW0YGbFkutpvNFmC3Bf9BdhwP4ga2YOgNun80swPqyY6NtdsWSXQNlVIK
	 28cCTasWopm70y9OLrUJZEsazoZ3bSkY0tWS/z/eLLyqPDA6g/kwOEyE2dDN2AtDXk
	 3SEhDTkk8Y5eH8wdi/8GMmRdGfltMg4u15CdwggvpzwQBw0+7bvzDau9UZ1R0QfQUI
	 NwHpKEmhA1Vew==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Songyang Li <leesongyang@outlook.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	bhelgaas@google.com,
	rdunlap@infradead.org,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 5/7] MIPS: Octeon: Add PCIe link status check
Date: Wed,  5 Jun 2024 07:54:34 -0400
Message-ID: <20240605115442.2964376-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605115442.2964376-1-sashal@kernel.org>
References: <20240605115442.2964376-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.218
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


