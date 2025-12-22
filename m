Return-Path: <linux-mips+bounces-12540-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C36CD532A
	for <lists+linux-mips@lfdr.de>; Mon, 22 Dec 2025 09:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE50D30530AE
	for <lists+linux-mips@lfdr.de>; Mon, 22 Dec 2025 08:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B816332EC1;
	Mon, 22 Dec 2025 08:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RI+dxFoZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GrhQIe51"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02534332EB3;
	Mon, 22 Dec 2025 08:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392131; cv=none; b=Pu0HDiqkAgSWsUI0YoenuVjXyGFiXKSBn64ahS5a035S+71ztFabXKNp36P813bKFz0cs5JagbdRP3jUDpImKVb4HSjUTfdh8dg5Xbq+sxxPAu2HISZdbh3FyZQ1chN9miYd3UxTWlUOSxf2fweopSW7oh6OonAIvzQwNruxWTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392131; c=relaxed/simple;
	bh=ePBzG1Q2mFcGDIBYLqmLQz+fYXBZ3XfhIHkVeXna+yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ohgWea02F0KAKu5LveCGvf2xofDYzfoyOCdem67s+QtrOAv7TK2XHdZfbAgrWTi+P3w97zAfA2ygTytf6OATBSgI/a0vnAUDnVh59Hayqyh+/pDXvagFGj+fxGl6/INUSXGajXzIpfeAtPWhC0rKU/b65sNkm+YKSTry3zhQkrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RI+dxFoZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GrhQIe51; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766392127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c2oLujfiVCx35LbPHWmwsawiMKAJ4KKgxkljrqJpSu8=;
	b=RI+dxFoZLUX8KcYH56GSOBEhmwMzMyCaPJXw/vCX7QxVjkaroA7hwEvxV8li+KIQUx5F/L
	cAkwgtuQOJNWPulhwpUrV7KsjEf0Dbhfvcko25hJ9+Xbww9X3sXeVFJb1xI3o1F6okZGbn
	kL4c/W6qC1O9rqgQNGynqx36gmKD+tOFQighZlj84Dz9LICYKaF/EQgxiyzfui5NKv+9SU
	jYMK4mIbsjiQ8d6JHVEkEW2YEBTZEeRaLQCevABbJ/BPlS8muoHWieJJNtanwfpK6biRtk
	u8W42bgagwmljeqWPnGXX2vcwSk0wcDm6f6J2+xNmjnPqchkI60di7Dz5fy9QQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766392127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c2oLujfiVCx35LbPHWmwsawiMKAJ4KKgxkljrqJpSu8=;
	b=GrhQIe51VtPk2qmXzeErSGE52scyRmLWt9TOKtgJ6YZhCvYoQkRt/asbZFZ4DM60xmcDFl
	T+8VwGYWOs5BTgCw==
Date: Mon, 22 Dec 2025 09:28:47 +0100
Subject: [PATCH] MIPS: Implement ARCH_HAS_CC_CAN_LINK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-cc-can-link-mips-v1-1-6d87a8afe442@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAD4BSWkC/x3MMQqAMAxA0atIZgNtQEWvIg4aUw1qlRZEKN7d4
 viG/xNECSoRuiJBkFujnj7DlgXwOvpFUOdsIEOVJSJkRh497uo3PPSKyC0bMfVUW9dAzq4gTp9
 /2Q/v+wGa6NEXYgAAAA==
X-Change-ID: 20251222-cc-can-link-mips-c9c0e06b61f7
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766392127; l=1703;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ePBzG1Q2mFcGDIBYLqmLQz+fYXBZ3XfhIHkVeXna+yc=;
 b=33ZXwy9eDFmFsbMg0G2kBziufefv79oaY8zh1E7cwla9j9TZ215ZYgMiUSbN/vUNdsU0ynOl9
 DjRLxhu/erZCHza174CM3d3Lc+TbA1SdYf8HzGnKuf3NIsbCN1A+Bdo
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic CC_CAN_LINK detection does not handle different byte orders.
This may lead to userprogs which are not actually runnable on the target
kernel.

Use architecture-specific logic supporting byte orders instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b88b97139fa8..316e3c29c431 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -4,6 +4,7 @@ config MIPS
 	default y
 	select ARCH_32BIT_OFF_T if !64BIT
 	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CURRENT_STACK_POINTER
@@ -3126,6 +3127,20 @@ config CC_HAS_MNO_BRANCH_LIKELY
 config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
 	def_bool y if CC_IS_CLANG
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-m64 -EL) if 64BIT && CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-m64 -EB) if 64BIT && CPU_BIG_ENDIAN
+	default $(cc_can_link_user,-m32 -EL) if CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-m32 -EB) if CPU_BIG_ENDIAN
+
+config ARCH_USERFLAGS
+	string
+	default "-m64 -EL" if 64BIT && CPU_LITTLE_ENDIAN
+	default "-m64 -EB" if 64BIT && CPU_BIG_ENDIAN
+	default "-m32 -EL" if CPU_LITTLE_ENDIAN
+	default "-m32 -EB" if CPU_BIG_ENDIAN
+
 menu "Power management options"
 
 config ARCH_HIBERNATION_POSSIBLE

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cc-can-link-mips-c9c0e06b61f7

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


