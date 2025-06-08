Return-Path: <linux-mips+bounces-9181-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9325AD10BD
	for <lists+linux-mips@lfdr.de>; Sun,  8 Jun 2025 03:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB6DF3A40BF
	for <lists+linux-mips@lfdr.de>; Sun,  8 Jun 2025 01:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1787743159;
	Sun,  8 Jun 2025 01:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpjtjXs6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CEC171D2;
	Sun,  8 Jun 2025 01:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749347508; cv=none; b=ooEEp8GnC7Lq6roxZWDz7kpQa7j7Z3juSdRv5jjMHdpgAPYjjRdn6d7AYRYO6hWtRQ5rmpL7BGW2mXYWz8xEGrzUaAL7zCiAt/3Ji0S6DSDUTvdbFbVIXHFjcJ8TKsEWtDmvK/MvbrqPf2xT9iSDk+Pz82j3MV8SweyV672Fmvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749347508; c=relaxed/simple;
	bh=3Gq9peW74fSvYyE65Zgyx4l3vTl9c6C+4T79M0ERd1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=habCDch5mxufV3NaMfSZyCW8d4ZpGrhWbFyY9WN3qFkbNQJ7QuoEzXM9tj+J6veKb9zozUjLoXkae2yli7KKqSG3SmT3ktHqBxQ8EvLK+pvwdtNcQTXNB5UB/BrXuhKnwIiTuhG4gBGoeXqtFV88zAKxXfkuzWnjM2L2E9N+J3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpjtjXs6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3700FC4CEE4;
	Sun,  8 Jun 2025 01:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749347506;
	bh=3Gq9peW74fSvYyE65Zgyx4l3vTl9c6C+4T79M0ERd1o=;
	h=From:To:Cc:Subject:Date:From;
	b=NpjtjXs6nPp2AHLP3AVq+cDgR5KhAUiyIxt0FJP2ho61shSEzk2vmHMrLeB7UzRYG
	 pxTC/uMESNAwjBvH6YbZDkciJAW24s82QCwXkGyISg8p5uW2rcbWjeBHUCckULt5eM
	 WmxYWT1EmeKBbQo8k0RQ4zXbThdadlSsMV40KVRbOUD+GVCClCztWzGTqfw6WGaALU
	 5+1axVrpmmYueUdKINjFWK86WVMcKnNRLBhVWp6A4q6xJ1UjEHnt6g/Itc00UM/TyM
	 2Qs03H6uXUaWMk+z4KzBXZLIHF9JNGQhZ1FV+/WRxLflb+utLOQ4RgxamlzoIl50L1
	 Cm6D2wvKRGqyA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mips: boot: use 'targets' instead of extra-y in Makefile
Date: Sun,  8 Jun 2025 10:51:34 +0900
Message-ID: <20250608015136.2960777-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmlinux.bin.* files are built as prerequisites of other objects.
There is no need to use extra-y, which is planned for deprecation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/boot/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/Makefile b/arch/mips/boot/Makefile
index 196c44fa72d9..8473c4671702 100644
--- a/arch/mips/boot/Makefile
+++ b/arch/mips/boot/Makefile
@@ -54,10 +54,10 @@ UIMAGE_ENTRYADDR = $(VMLINUX_ENTRY_ADDRESS)
 # Compressed vmlinux images
 #
 
-extra-y += vmlinux.bin.bz2
-extra-y += vmlinux.bin.gz
-extra-y += vmlinux.bin.lzma
-extra-y += vmlinux.bin.lzo
+targets += vmlinux.bin.bz2
+targets += vmlinux.bin.gz
+targets += vmlinux.bin.lzma
+targets += vmlinux.bin.lzo
 
 $(obj)/vmlinux.bin.bz2: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,bzip2)
-- 
2.43.0


