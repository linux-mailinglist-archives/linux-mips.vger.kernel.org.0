Return-Path: <linux-mips+bounces-3492-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB828FCB72
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 14:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3C81B24544
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 12:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89F019FA99;
	Wed,  5 Jun 2024 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTpc8MZz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B6E19FA94;
	Wed,  5 Jun 2024 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588284; cv=none; b=r81RTwHRj2XG1ZKSO7XfcrHkL9KRTVlFvLQLdHH/hkR3C/MKJe9Xu1sUZuqfOVuOglfWFeq+PW/49KKi/jVAp1ZDDN7dfKlFyfeLguU1/B2dUD8hS6QsUoB1xJY+PF/FUnxuLpdpGlkm1sVrBY+DS63YWCxj4VSZ6zVlVdAHFvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588284; c=relaxed/simple;
	bh=QEYKIRsy6u5hKLiEKLK0lf/JlhZ9x4bPSHioXsk9Fqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HAE6P5TsYofcmOuP54ba5/HL5LNUi2YeGaq4PRgTRrVD6vnJrajuwBaZKFpSxOyxrizxIWL2k7mBI3ycSEB+I/J/mnJJPKnT99XpIDRY5m+aEZgZdZf6i653gkpy8TWqbbZN+NqoFfOGLpLxCpobnPyXsXz/utsesL2k9nDLZAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTpc8MZz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25C5C3277B;
	Wed,  5 Jun 2024 11:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588284;
	bh=QEYKIRsy6u5hKLiEKLK0lf/JlhZ9x4bPSHioXsk9Fqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BTpc8MZz4Bhnq5LNFElMhXvSvY/QOSmwwEStwLo39N6joJyRmHnqaenzhplTnzBLC
	 TlNbRE/SabtB5TYNbXjkNRhveC9NdTIP3dqL4gCHcDJvzZHp1R4WPFbqDk9Yw+D+QU
	 J01x/wkXgIps8mjeHgT22wrcIfAxmyc0j3yZva51YGRG4vygSmWFFJIsRcxxKjENo/
	 1iB9tgK+BThuzbJGU6VbLxsx8fz82pIKYoJ51bQJ7mBPXSPZ/1YTKfDUDRynTDHAar
	 JsXBUlfyQ3nDJvZJmCzVj5KQlKr7giO7DO2JfOk4mzlYxbmY1DZRi4SM/w3f3vI3f7
	 v3Rax0tkJHRGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Songyang Li <leesongyang@outlook.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	rdunlap@infradead.org,
	bhelgaas@google.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 11/24] MIPS: Octeon: Add PCIe link status check
Date: Wed,  5 Jun 2024 07:50:21 -0400
Message-ID: <20240605115101.2962372-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605115101.2962372-1-sashal@kernel.org>
References: <20240605115101.2962372-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.12
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


