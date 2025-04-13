Return-Path: <linux-mips+bounces-8573-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE24A870A4
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 06:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F6473BC1BE
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 04:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7200B145B25;
	Sun, 13 Apr 2025 04:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yc/ME7eQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426E7383A5;
	Sun, 13 Apr 2025 04:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744520140; cv=none; b=TKsUEs/iOLgpWLahcTYGmR4hcMZEkue5gaKvCVZaXKs7sMT50ta4UYfmk7dGnTWK1qZx35DcXxA3qTty/HuwnxTdzE3EzR+ddj53nPZydIpdgjkDIP3v6rNwGm90lHcVqSmOLDN0IgKYOL87VSntKg4ySkfVefZqhMopeNNEIr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744520140; c=relaxed/simple;
	bh=KIyhx1f4Q7uvfnMxlwu8uJX8GawuhnAXHEOquMlum8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iFdm1y95IKnjwIMMsafBjAQPO3jAbEP0z86rOdGBUkn7vdO0D6SHL4bKzmjBWlfCtfmI224B4i+0CFBstNnvGozywYTeBWxONp9a/MQhK//pjhfaKe6fJMDtWfDyD/Kiay/PskBygQvT3+fIvvLBuR5926ia8BdnfrOgvgCT+uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yc/ME7eQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EB2C4CEDD;
	Sun, 13 Apr 2025 04:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520139;
	bh=KIyhx1f4Q7uvfnMxlwu8uJX8GawuhnAXHEOquMlum8c=;
	h=From:To:Cc:Subject:Date:From;
	b=Yc/ME7eQGv8kGFM/ofAJq9o/X0+8PKRBpM3Wp5A+5TdNIaSiKI9px1zivC+4ScNOE
	 edV34Vx6yTLrfmA6YUyw5zdvhZoT23tXp10pvsPW7szRHx12TRNTLtMyrg/X+YqTQp
	 jPiyzNsejFq70gbzcjMylWY8tJzHDhjL2q/fGBAsYQXAqZ2lgNWp+Z5QIIiFeUDz9X
	 CnonudAtwDp1I5jboQgmoWL3IVF/z/968+wE/w6DgOrbLOQRwJzSSFg5+BjyipQWSY
	 Ur5ba8acNYG7o1Ehc6NJ+tF4e1U7N1lHgTSXt2pPaKe9V+6IC59DbmTmOx1mKwPWgl
	 jY4IW/oULs7Zw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 0/9] Remove per-architecture poly1305 shash glue code
Date: Sat, 12 Apr 2025 21:54:12 -0700
Message-ID: <20250413045421.55100-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the per-architecture poly1305 shash glue code and
re-implements the poly1305 shashes on top of the Poly1305 library
functions.  This ends up being much simpler, and it is how it should
have been done originally.  This follows similar changes to crc32,
crc32c, and chacha20.

This series also makes the Poly1305 library be optimized on PowerPC.
Previously the PowerPC-optimized Poly1305 code only supported shash.

Eric Biggers (9):
  crypto: powerpc/poly1305 - implement library instead of shash
  crypto: poly1305 - centralize the shash wrappers for arch code
  crypto: arm/poly1305 - remove redundant shash algorithm
  crypto: arm64/poly1305 - remove redundant shash algorithm
  crypto: mips/poly1305 - drop redundant dependency on CONFIG_MIPS
  crypto: mips/poly1305 - remove redundant shash algorithm
  crypto: x86/poly1305 - remove redundant shash algorithm
  crypto: x86/poly1305 - don't select CRYPTO_LIB_POLY1305_GENERIC
  crypto: poly1305 - remove rset and sset fields of poly1305_desc_ctx

 arch/arm/crypto/Kconfig                 |   6 -
 arch/arm/crypto/poly1305-glue.c         | 170 ++----------------------
 arch/arm64/crypto/Kconfig               |   6 -
 arch/arm64/crypto/poly1305-glue.c       | 143 ++------------------
 arch/mips/crypto/Kconfig                |   6 -
 arch/mips/crypto/poly1305-glue.c        | 120 +----------------
 arch/powerpc/crypto/Kconfig             |  11 +-
 arch/powerpc/crypto/poly1305-p10-glue.c | 134 ++++++-------------
 arch/x86/crypto/Kconfig                 |   8 --
 arch/x86/crypto/poly1305_glue.c         |  99 ++------------
 crypto/Makefile                         |   3 +-
 crypto/poly1305.c                       | 153 +++++++++++++++++++++
 crypto/poly1305_generic.c               | 149 ---------------------
 include/crypto/poly1305.h               |  13 +-
 lib/crypto/poly1305.c                   |   2 -
 15 files changed, 242 insertions(+), 781 deletions(-)
 create mode 100644 crypto/poly1305.c
 delete mode 100644 crypto/poly1305_generic.c


base-commit: 3be3f70ee95da03a87d94c4a714ee679a5c7b34d
-- 
2.49.0


