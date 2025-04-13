Return-Path: <linux-mips+bounces-8578-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C1FA870B5
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 06:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B019173A12
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 04:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6A8186295;
	Sun, 13 Apr 2025 04:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASqL0WN/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2103517C210;
	Sun, 13 Apr 2025 04:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744520143; cv=none; b=BrtdBJG5Kh/t0zcv7Es9gXg5d+Ntu+9vB9O6n1OjIRNqTlTgagdM/z0ZmzKuYIkO6JuqA3dQ4DGWlSIU5AqJuU1z3QtrxKgqSoBQShucqsv3W9uGipn1jprbiqzfYz4nEb0Tx2Gn+mNLTKU1fywPzH0N9MSvO0X2nmArzIRku6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744520143; c=relaxed/simple;
	bh=S6EtgyS23+qRGH0eAeuHrJro1hFgR1JlJgbog1ls+WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMbBM2AiDSmu9Qpjulu00hEGuuiFvzRYXvbAbAOd6ZqQ74qjK/7aJsrMiRfnMVhTQcp3QIRDH9dHvzxVN/cZAz+Uffc0+US6g8iKBCXl36Y6rqpKjOCzdPnm/t5YB4TkVCKvZ72qdmipBEIeuSBJZAWNbks2mswzxyOEG19F2EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASqL0WN/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DD0C4CEE5;
	Sun, 13 Apr 2025 04:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520142;
	bh=S6EtgyS23+qRGH0eAeuHrJro1hFgR1JlJgbog1ls+WE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ASqL0WN/Mm67yTnOT6LYSFTru/q7hLEducze6iLetJNyVrFU28EBOBehoKHuj4Oxx
	 bjNrhBx1GKB0g3RiBz6f2ge6+haqU+3AGx/seBNICYpwgrSAkVxX7uFXlRysnKMm/g
	 O+De6pWgmW8F/TYbosTH+Sg3Ys6WTqGBK6jlwM2pY+X/gK90/5I10kVKFa28LkyYU6
	 RglM1wB2KVZKfoRMWa8zL7zk6LfUOR7wBBoj+G0Zm9GzXpR/PH6kNHUuCBkVvRirRB
	 lrHTms4JzO/mMetcYLgGd6h4HxCTgRyvHehtFp2NG6lAZyQce9YRhNenb0nqAWOdxQ
	 sEgZopVA4Pd9Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 5/9] crypto: mips/poly1305 - drop redundant dependency on CONFIG_MIPS
Date: Sat, 12 Apr 2025 21:54:17 -0700
Message-ID: <20250413045421.55100-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
References: <20250413045421.55100-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

arch/mips/crypto/Kconfig is sourced only when CONFIG_MIPS is enabled, so
there is no need for options defined in that file to depend on it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/crypto/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 0189686de3a1..9892391f74ac 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -2,11 +2,10 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 
 config CRYPTO_POLY1305_MIPS
 	tristate
-	depends on MIPS
 	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
-- 
2.49.0


