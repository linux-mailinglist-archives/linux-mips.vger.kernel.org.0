Return-Path: <linux-mips+bounces-14808-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCOFCFZvF2pDFAgAu9opvQ
	(envelope-from <linux-mips+bounces-14808-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 00:25:26 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 916745EAA75
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 00:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 844BA3019451
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2026 22:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEFA3C1F37;
	Wed, 27 May 2026 22:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgB4luU9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCE134F474
	for <linux-mips@vger.kernel.org>; Wed, 27 May 2026 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779920723; cv=none; b=PbQElco4qX2nbe6V7Nu+gjbAqOJXNs6gprRsOW6/WAc9rYReLmhaJ/7Ca+BiQpZIW2wUwTjsSbxhby+Cf3rUrIfKhL3+FCVA6xn2T++5+LfobPmLKdLv0f9pSo4YXun5gpFz6tGFAOVniwnuiekI7aHSXd9Vy9tw17zOf+VdolQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779920723; c=relaxed/simple;
	bh=8Oui1g/t3CEcwouE9CYohY0ZFQnGESUjzQFNTcFUoII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MO3lo/+gdyMBBDt9/LFqS6dT3Trpe/XctA0Znl00XQSzrKdGbucyNhaoGa/r8el22KC9gZHOvNOhD7bNHfBu4okU71xMX6sW0F1z6EfcH3NOwdCW+ixQdClZPVqobmitDHef6fk5UKM5QvMZ5Ig2/Xx8xLs+aFeu9iUFAkxYMBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgB4luU9; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c802803ac17so5071214a12.1
        for <linux-mips@vger.kernel.org>; Wed, 27 May 2026 15:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779920722; x=1780525522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LkkSrN05A0yihgCNeGvH3o3kC9AabElowNNwozsOF+w=;
        b=CgB4luU9piCAjy67jteaC1GDYKG7JKuViSTPLSpG/s88tc8EuPX4ZUzdTytQAPDtdK
         6i+Rc58tgG/aa8zQQU0P2i+1phQxIbRIlIlQvChpa7THrVt3+Y7xzWHisLo+zOpABA94
         xYWO4PbFqK/tcX/35FZK5qdqNBPYO+2bL69nCGvG4G2Pg9INL+srlz7AFQS3qnaFmnrK
         YND6FzXz8boBqitE7fkuBQ4ZdYMHTwZcs2ElqUfaGiTBnzrQGuyP9oVmyIsKkz8m6rnI
         ekEFp4UX4LnIxiF3wAdbln7Temh7DnjWpVuKvweDy/p0XaFgoPg9WrS8NdYL6KENWWeE
         7s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920722; x=1780525522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkkSrN05A0yihgCNeGvH3o3kC9AabElowNNwozsOF+w=;
        b=P2BkSpRH2bzbVPSxyNdM2IEAGBDk/d2mSZFBim5oCDFmPh/4aI8jx2XQS0ashe8oHb
         oZ0JQMNzCL3PoDymh99ZD6RpGkBojYvuXPAWELQrlKtXenRWyJcEPmtxSWuCK5hlWN1e
         RC8S494Wm06vwzXZ80G9f1PkzYenoPtFaUfJFeN5zzF7Li9SRuv2/YOqlnZEMw6SoK7Z
         nSr7BNM/8yiKEyF/tjMBSTKvUBiUoprkqLoy9AokzOo/NqC0YOf0s0AIrY6o5GUwRziE
         6WcXuj6SzXkQZa5Mbo8DCE2tth5IzkvDvKRZswfTbDCxpQUXCxqKEizeSXrIEmvbJ6d3
         /aLg==
X-Gm-Message-State: AOJu0Yw41k0+FLqimBVEzHkOe8gjyE37Tg55Ctyb5fSr+wAaz09/OtRf
	5ra9OuIlukZpLn4AZHRtJQXwN1nt/ktPBlTLeZ1X932wdmw1GHNXjQWuzMq0bw==
X-Gm-Gg: Acq92OEdVUqmea/j5XNuAZIctjhwd4unpRa+W5006X0JIpMH0WNzy4I56K2R7j4fRe1
	sWC1DuYBUA4ObVC5FwLngVtvFsZ4Vd5X9MYc3vJsHjDO3f8snWVucfi+MmKEaYd6BfcX5OhgO6/
	EBevzvTvBdoW1RNgawNs6wIZQDe671pk4BxJv7iFK/m+aFSFD8JfKFL3zuJDrOrUZ4KqSz2sUJp
	UdeGD7El3zua18yFAfGaKxsIfogwl+DBQqJki8FdZdslKjN2o2cf1A6v6GamO1Uj1it3Q4lTHZ3
	3xW9ybzFdiXghMTzimh2c+uD95PEr6oVimJlgfO/7fe+56gMDvu9ziNrZvLuCmLon3ZyVsQKoOU
	qc9UdjizgAOmJizFg0dENNsJGjzdgmvjMwnM3xMX7z9QkbnUBNnRHm6TFpYEkn9v9AWJY6OsmZw
	fwft2rkoQ4eU6osAlo0TTT8Fi9BQgWSUmRy4RejWDjr5gIh5IIfuxtvN8IW2c5+FNIQunCVyrKw
	RLf8m1zgUqj49OyW8gKUgkLpIukkJvRMhFaUPYum1whHw==
X-Received: by 2002:a05:6a00:8c10:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-8415f58d727mr23120877b3a.41.1779920722005;
        Wed, 27 May 2026 15:25:22 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d71f37bcsm3096240b3a.50.2026.05.27.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 15:25:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: ath79: reduce ARCH_DMA_MINALIGN
Date: Wed, 27 May 2026 15:25:04 -0700
Message-ID: <20260527222504.17381-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14808-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 916745EAA75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, ath79 SoCs use the default ARCH_DMA_MINALIGN value of 128
bytes defined in mach-generic. This is excessive for these platforms
and leads to significant memory waste in kmalloc.

Override ARCH_DMA_MINALIGN to use L1_CACHE_BYTES, which is 32 bytes for
ath79 SoCs.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/include/asm/mach-ath79/kmalloc.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ath79/kmalloc.h

diff --git a/arch/mips/include/asm/mach-ath79/kmalloc.h b/arch/mips/include/asm/mach-ath79/kmalloc.h
new file mode 100644
index 000000000000..954f5d6e0dd0
--- /dev/null
+++ b/arch/mips/include/asm/mach-ath79/kmalloc.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_ATH79_KMALLOC_H
+#define __ASM_MACH_ATH79_KMALLOC_H
+
+#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
+
+#endif /* __ASM_MACH_ATH79_KMALLOC_H */
-- 
2.54.0


