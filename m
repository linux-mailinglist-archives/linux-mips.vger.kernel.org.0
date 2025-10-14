Return-Path: <linux-mips+bounces-11711-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8367FBD9994
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 15:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9F3C582651
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 13:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BBB314A8A;
	Tue, 14 Oct 2025 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="18Vfa1VR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s9uz1WXb"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A8821D59B;
	Tue, 14 Oct 2025 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447153; cv=none; b=tUhI3VxzTlHhHYa56xL79rKfYaWewx99a/eEEpTys/Kfy9lhqPOm+XCWz6kjVD1s93Aeenj2CfDyecuKls60saOZWAkc7gK/icRoLBdSq2/O3cStVU36yhaFWTxQ+q5Lfmucy6oJCBY+EZZrntFoprwkcc5F1CTDc6bTCJKZdbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447153; c=relaxed/simple;
	bh=nwdxilI0gCDF3hCKssRA5tQbRafKabX/iqdQVkTDYQU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eMcY6XZnDrNH/aqvf7waos7whM0mE3Z7V5Iu/TEXsyPUFZoVlwGbhzqH9EN+6OvY3e2pToV3kBUzzDs9h0we5SVqQaA+uEA/Ri/FejfedJQNRkF9h7hac8N9IfjiczkXZQjaDeSKfXsrgccV6KXXolzbt5fXNohn4Jtfey+Dh3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=18Vfa1VR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s9uz1WXb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v6Z/SGyLOROhq9izjO/zGrkzO8eVf9t7/VpyDBR8sek=;
	b=18Vfa1VRutbhgbwNI48uwRFrpTeK2iXMNNTzbDO0N7x5xONQbK5szxonq4ynVgVeOR87f9
	/+dAtUgG+zz8okIOlqkYHW9vY7SNupVCUbTCAqxN7EwLA1hzMKiXwWbVBQ9DVEN/ssMks+
	RqDArBFm87CsFc2oSx+Dv4YpO/+fKtgNsszjib2frMB4kascP6vDibG2NAlRKZT943QWaa
	4mfweieMQ011LjiIYvfP1TGplFbYSC7aCT7dAqz00Wny5AkFg4vyB285fS0T5qFYa6MVxE
	sGWYCA/M2PuyV8MB8h7ezU3qRTZ9gJtE3qJTK2ZBsEgJP5Cg22uDTnqXzKBEIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v6Z/SGyLOROhq9izjO/zGrkzO8eVf9t7/VpyDBR8sek=;
	b=s9uz1WXbQUnSkz0696jxjnrvflf58GlYGmSwbNzRqndYmmv20g7+eUgK1BDUYWwmkhWTAe
	JKbsLnaYtHUjhaAg==
Subject: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
Date: Tue, 14 Oct 2025 15:05:15 +0200
Message-Id: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAItK7mgC/4WNQQqDMBBFryKz7pRMVLRdeY/iQk3UoZJIYoJFv
 HtTL9Dl+/DeP8Brx9rDMzvA6cierUkgbxkMc2cmjawSgxSyFDXl+O4DLwpD8lZnJ489bx5FPhB
 VqitUKSC5q9Mj71f31Sae2W/Wfa6bSL/1XzESCpTqMVZjQSTqvFnYhM1Zw/tdaWjP8/wCCbSiJ
 L4AAAA=
X-Change-ID: 20250813-kbuild-userprogs-bits-03c117da4d50
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1841;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=nwdxilI0gCDF3hCKssRA5tQbRafKabX/iqdQVkTDYQU=;
 b=MxoQo1TizE+S8bqU4JcnOVpUGYj4wmq5FSvunih7gRn6DU94kLSoa3uxPTVhQdnPvJtR0bw14
 Kuj7ZjOyybgA7859XltD841WYT6mM+WPK2cYwKR5+PQFZK7588LnrSg
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The current logic to inherit -m32/-m64 from the kernel build only works
for a few architectures. It does not handle byte order differences,
architectures using different compiler flags or different kinds of ABIs.

Introduce a per-architecture override mechanism to set CC_CAN_LINK and
the flags used for userprogs.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase and drop already applied patch
- Disable CC_CAN_LINK if the test program generates warnings
- Move to architecture-specific logic
- Link to v1: https://lore.kernel.org/r/20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de

---
Thomas Weißschuh (10):
      kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
      init: deduplicate cc-can-link.sh invocations
      kbuild: allow architectures to override CC_CAN_LINK
      riscv: Implement custom CC_CAN_LINK
      s390: Implement custom CC_CAN_LINK
      powerpc: Implement custom CC_CAN_LINK
      MIPS: Implement custom CC_CAN_LINK
      x86/Kconfig: Implement custom CC_CAN_LINK
      sparc: Implement custom CC_CAN_LINK
      kbuild: simplify CC_CAN_LINK

 Makefile                |  8 ++++++--
 arch/mips/Kconfig       | 15 +++++++++++++++
 arch/powerpc/Kconfig    | 15 +++++++++++++++
 arch/riscv/Kconfig      | 11 +++++++++++
 arch/s390/Kconfig       | 11 +++++++++++
 arch/sparc/Kconfig      | 11 +++++++++++
 arch/x86/Kconfig        | 11 +++++++++++
 init/Kconfig            |  7 +++++--
 scripts/Kconfig.include |  3 +++
 scripts/cc-can-link.sh  |  2 +-
 10 files changed, 89 insertions(+), 5 deletions(-)
---
base-commit: 10f8210c7a7098897fcee5ca70236167b39eb797
change-id: 20250813-kbuild-userprogs-bits-03c117da4d50

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


