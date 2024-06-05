Return-Path: <linux-mips+bounces-3497-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E2B8FCC57
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 14:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E956B1F21A18
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 12:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4AA1B5F14;
	Wed,  5 Jun 2024 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQNxBAl3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305091B5F0F;
	Wed,  5 Jun 2024 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588511; cv=none; b=HOaHOy8fJ1xSgIVMODyS3pZwIV/O0SRd2XR9+bpqdZobNKXOk7jRiURZqmQOrllTvUNsmL3Huyq0MG1B6HYQeAfAMBAp1iEy3HMhzJTDrzWIRQfsCrz+mWRXHgW1mfaunSPCOmlQ1ke2s61I85FD/Wvh1lt81y/GpvBDjZQBl+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588511; c=relaxed/simple;
	bh=ghaJ6hQdbi2GgdV2gtK7tru7aQc6vMTFxyqHR4nedXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFTIndLjGgSzHUmLNkBPv7GhwNbV7PuFgqXOmz5p0VG5yFGHgJHujCBwOk/xUWl8SbwgLJHV0T8CCZOOhPZvborgkvTHxOReOpdBs0vnXN8P+tiU37WZqiT2/Ll8EjlP+3yMhpgZVFmdNAcHaMr3wjZ1MeBDI2aTp0VgzHgvuMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQNxBAl3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD13C32786;
	Wed,  5 Jun 2024 11:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588511;
	bh=ghaJ6hQdbi2GgdV2gtK7tru7aQc6vMTFxyqHR4nedXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rQNxBAl3OHFlcsWARoFqgU3ppKqxEuCQISO/EuLmIRDIfK0DQbEvKe/m8KFuct1pp
	 LOfOQKk9PfHztdqJyXNHBXj4ufDsVVdweHVLJsRNVKbko1E/1r3D/lcou5/5+Sb9v1
	 yiOiEckz6q46YuuVRrXsJAfyBIJvbLEZ8wskBzkJhGdhgSBOYQGqJ67nhLPUE4eeJB
	 J66bLPs5GHVpJE8qwfitUX9C3MahBxkoFHjmF0FkVBZQNkViW3KBKCjVys80PGso86
	 PGPHpg8rpokIIITwoV0Tn5YRj1uqRgeQXX/D1fuMHOskuOL5LPTBZM0zaalW4hJPw9
	 BQw+2zPWZctQQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Songyang Li <leesongyang@outlook.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	bhelgaas@google.com,
	rdunlap@infradead.org,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 4/5] MIPS: Octeon: Add PCIe link status check
Date: Wed,  5 Jun 2024 07:54:57 -0400
Message-ID: <20240605115504.2964549-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605115504.2964549-1-sashal@kernel.org>
References: <20240605115504.2964549-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.277
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


