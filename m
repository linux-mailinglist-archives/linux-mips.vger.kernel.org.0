Return-Path: <linux-mips+bounces-3491-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B346B8FCB07
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 13:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D955C1C22282
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 11:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B206C3DAC18;
	Wed,  5 Jun 2024 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T19u6eIZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AC83DAC0F;
	Wed,  5 Jun 2024 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588191; cv=none; b=VOx1WTEcp2VYO6dNcSrZy62wLT4eU5ofdg/MXRuWOzTm8az9FciFPxKXC86yFU0MP14ZhRU9WEKEh5UGVkgEwcPtNb8XJ3NvCNcLz3dHrh7n6Hp8goh2TmhxHfCFC7GxIrDofAUIf6IOIYRWE7NyfNMP2eDbzo6CfhaWNL5KjJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588191; c=relaxed/simple;
	bh=QEYKIRsy6u5hKLiEKLK0lf/JlhZ9x4bPSHioXsk9Fqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtUSR1VSVfvKoBt6hlhHe9T0+4uSlegc+Hd3NGfdWRJyL4yYJry+YyEVjFVoGgghlq9wFhAPivVM6JywW28/5eYlugbc3F/lMO5gjanDjQ4/aayq/7fIt93W74XABzJpGM0W04MRZfBSP9limQQiTBkYVNNDoFY8HHE9ejI8yEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T19u6eIZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C76C4AF08;
	Wed,  5 Jun 2024 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588191;
	bh=QEYKIRsy6u5hKLiEKLK0lf/JlhZ9x4bPSHioXsk9Fqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T19u6eIZK8UnQFyjakZee6l5jk16n/obdrFZFjBfdrK0TzjHA2JMTluoJ8+Gnnd5s
	 Mh48fdecX0ige6PBmowoM91fxQh7lXFMEW1wjAHN3PiKLZhqloDPzt1WHXAtIksXAX
	 Em0vcZRZg6g3QrBdoqbO8stVenZMIU29G20F3YRUCj0ecCPlh5WbWMYPOEcA5zHU8u
	 twuav3ySe2G0vrB7ZdsFN9xPz4/zwgUZ0lshpj1Gr5/XZNu9IlzqhDRiiGKH5IMx30
	 MZGMrwftOYH5mIReXVUhfz2FvvuX2XrK7xJ5l5TOyz1r8L/+K5Usr+wE8OuR4qdY7r
	 /iTIfP2SUarqA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Songyang Li <leesongyang@outlook.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	bhelgaas@google.com,
	rdunlap@infradead.org,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 12/28] MIPS: Octeon: Add PCIe link status check
Date: Wed,  5 Jun 2024 07:48:41 -0400
Message-ID: <20240605114927.2961639-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114927.2961639-1-sashal@kernel.org>
References: <20240605114927.2961639-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.3
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
index 2583e318e8c6b..b080c7c6cc463
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


