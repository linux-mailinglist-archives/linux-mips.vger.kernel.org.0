Return-Path: <linux-mips+bounces-9427-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE96AE0DE5
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 21:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E09D51889690
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 19:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B1128EBF7;
	Thu, 19 Jun 2025 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsWHI6uC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D533B28E572;
	Thu, 19 Jun 2025 19:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360931; cv=none; b=pQspgrUG3RLq/xukBMNSfU7rN2BOGBErv6hEn1BPmRE3X8UXi0lvHDXorkKYfqYHMvLyPyNBQLu3E6X7wwONINRWJYH6s0ptB1X9RePswvnpXT3qA6cZM1GFHINRWwFP2QwhJ9eRomEIvU+y3iVxVKiAynGmKrKxx4YaS7OOPJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360931; c=relaxed/simple;
	bh=TvyRRr0Q9p57RHCbNRzLmr80cK6DSzs3Te1JHJiic8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfnEuOn0kGYIxyjs27J1SJiHzuKekYSMUCy5dhndePPRUGHgIQrW5n8F5XGpmM5MT18pVzN6TIr3dBghhG8XlXZDEnGYQ+cPBmDyQrlPdis1+taLwNF8kT3K7x3ljNBkCqSbFCybp9SzWAcggkpvu+Pk6fw48nJBGgkDdGb9qTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsWHI6uC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7F8C4CEEA;
	Thu, 19 Jun 2025 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360930;
	bh=TvyRRr0Q9p57RHCbNRzLmr80cK6DSzs3Te1JHJiic8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gsWHI6uCzGtgTFS0+9VVGWSKxIlVRoAXr7ncQjaX5JwXgHpNeTiXfuOdhYkgBgHlJ
	 YQL+IwHGvkSc1iwP/qogzJwScgBGmtDDqgVmXHbv1uR/qUAz+wTmjf+9RfsQ9xDMXt
	 cx09P6ml5LT5uoXwPMu9X1MNzCP//2MHKBcUUMASgM0/fV4ggydLqclno7rm2SDVnv
	 ONIUBY64Njs+//9An/TZjwOxs648bB/vuUO+DLFNNZV/7HJSplry+6xHCOjC37RY1I
	 BLeB2leI6kKtRZ0xNTVxiSLCJo6HP4VbBMk/fOsC2kXM/UVnKAzfqEAO22jUF5/WYU
	 gM0TVdi6sVQnQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 9/9] MAINTAINERS: drop arch/*/lib/crypto/ pattern
Date: Thu, 19 Jun 2025 12:19:08 -0700
Message-ID: <20250619191908.134235-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Since all files arch/*/lib/crypto/* have been moved into lib/crypto/,
remove the arch/*/lib/crypto/ file pattern from MAINTAINERS.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..8ca374b24a806 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6408,11 +6408,10 @@ M:	Jason A. Donenfeld <Jason@zx2c4.com>
 M:	Ard Biesheuvel <ardb@kernel.org>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-next
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-fixes
-F:	arch/*/lib/crypto/
 F:	lib/crypto/
 
 CRYPTO SPEED TEST COMPARE
 M:	Wang Jinchao <wangjinchao@xfusion.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.50.0


