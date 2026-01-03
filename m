Return-Path: <linux-mips+bounces-12726-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1034CCEFCF6
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 09:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07B7730019CF
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 08:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6673A262FFF;
	Sat,  3 Jan 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StVzVyqQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C7D17A316
	for <linux-mips@vger.kernel.org>; Sat,  3 Jan 2026 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767430079; cv=none; b=lTc6T8ZW26PxZwb4m59RiWDhvDf0KFNDolYtIHOJa/0K3Fe0VUYh+IFZTw50p3LWnIvJ2swqnnSoLxDIYc1ABO7AtuWAM6gcllI4TAvFGgjAa6Jmuca64iq3n9gaErcKfH5bwEWjrAgzdfgrJfkmR+VOaG9qGGkuleRWSwmkGaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767430079; c=relaxed/simple;
	bh=zLuwregW6aPF+bcK9tNXHz3bXvv4OHq25g7xGPW1gMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FQPXiMsuCSXWHPIu4YdClhxWltZe/mqURMojJZfBhLj3O3p2AZbIBsmkJTNXFJRHZ5x+DkpuzHP1y+P2+qooirL29uZhE2zkhsWrCFrtOnhs5WITM15xmuDMmwMUziusVWENVwjbr5mWUDOMJv9PW086CNKsNnkYUUf4e9PYpPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StVzVyqQ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c9edf63a7so13753653a91.1
        for <linux-mips@vger.kernel.org>; Sat, 03 Jan 2026 00:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430077; x=1768034877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqmOWnbBqbw0qz0iwR261elwKrPwnP+8eo7jB++6bUk=;
        b=StVzVyqQZAfVw0hUZpSHha0ZTFztw5w/soY9ezi5zRjaTHQlKogJ2nk1KvEo+2Tupz
         /Ajc6DAxP9dQIUrnj0wgIo4kf3qSjDb8pgncyvkQmUuWUeBXmK5rLFaee2OI4qYuitQl
         xFT9Rg202ZgJfswhpQbfjR8hNPyU5lpLro5a0d4xLA9v9EVoPEdZfHpazxrndbdTmCGC
         cFMoNQinGQuiH2VGtW61o5vCF5ed9eGWVpfNvFjOxWYUMwIZjGwfRigFglhBqjEYRueg
         jCkFvheyYai5qoqzfs0L4lGYsSPUOfZg+Y02ui5y6Rv1Ur+Q2Ql8ZdDfhqMKSSNdo972
         SgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430077; x=1768034877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqmOWnbBqbw0qz0iwR261elwKrPwnP+8eo7jB++6bUk=;
        b=MvxmX9cK7iUjga9D2k/p7RmjuCi4fS2mTKRXHZH1UPv0drBpzfgQRjXKG53QdjK2Dl
         GSzIrhWxjeuuqql+j0DxScmhr5uoYxWIyf2D3mbN9VjPR3KwkuTh2+Io7dcQbV2GNEoY
         MKFtyXE8Dz9gQCp9d+GgGziADVuI3C8E/46nxMNhxD8oEsSZDkD0a/3C78Zje8kQZo+A
         XS3LNA7i7oeEVrFWlxMP8Q0vDYvMlTjDCqdV8yrpA5nSxzyChqfid9ewsXR2jzogJ/RD
         8MLBcjRmzGM+s052rLjxHC7Q7BcL2BycWZNgiWN36N3PZEeLryt0EjqTXZqVtpxuMIHw
         jT5A==
X-Forwarded-Encrypted: i=1; AJvYcCWLddv5QJBeyQzfTixHpN0tf6wgBBaMpoiQw8i8HpEtOHdkUF1oMZXtJKgamD4fbwmkHj6ho+4WTw1X@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw3YqwaX778XCb5Bu51E4RJ1vrSuqcvDNcSY1OSgOD37IFX/AY
	Ocm07IPopeAIfGkSqJX7DWoMbbWR7yD1DOqdYna9XxIrW72YYpLOvpST
X-Gm-Gg: AY/fxX6w6DY7uVF3iNA2BrDu1Ph44E36E2Xg6xx8f/iasehVUrjfWRHFrUHxydkQCtd
	vRoEwbVa0aSMm11gMNZz8eJl5w+pXJYq//NLh20IG8lwXCvj4XhH5+lbxY3HHTAcTFFqZlKdm4C
	8nfc0mu6AdFNNqwoSmXUWr1sx5qYktpDlWM09rJ4hPjkLTiasgYGPltJd0vbDzwtykHOsT02LiS
	ZJwrMQtcEr0dUo1J3au4RLWDV6lzhGWnAGG1H25rMAz6/vLMN6vucdI1ccIDRDruBWCmKcDh0K6
	R2JwK2GRX503j2IlElEoS+803lk/1murprbKyVhYT9xvSSZ7r/wXPiEzvNW42d7f+tnMQh4FSIq
	vX656Wl32lrCWuArcOzGJ+lTFzEjKf3f50y5ASPTmwkOK/DpyaFzJRMHxXgURK2FG/duD5wmKJx
	i1GzatWsoFFzvnPCWaJNwjFlvWpMA5uQ13pns=
X-Google-Smtp-Source: AGHT+IH4FDI6MNb+jt4Z9VqoK4GzC1dQlMhMQECNsnvlTczu/ydbQzhhClMmRjiO1aySaBttAjLuTQ==
X-Received: by 2002:a17:90b:548c:b0:330:a454:c31a with SMTP id 98e67ed59e1d1-34e921e90e0mr31635393a91.32.1767430077312;
        Sat, 03 Jan 2026 00:47:57 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:47:56 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 2/5] arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:40 +0800
Message-ID: <20260103084243.195125-3-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace deprecated kmap_atomic() with kmap_local_page().

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 arch/arm64/kernel/probes/uprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
index 941668800aea..4c55bf832ec3 100644
--- a/arch/arm64/kernel/probes/uprobes.c
+++ b/arch/arm64/kernel/probes/uprobes.c
@@ -15,7 +15,7 @@
 void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 		void *src, unsigned long len)
 {
-	void *xol_page_kaddr = kmap_atomic(page);
+	void *xol_page_kaddr = kmap_local_page(page);
 	void *dst = xol_page_kaddr + (vaddr & ~PAGE_MASK);
 
 	/*
@@ -32,7 +32,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	sync_icache_aliases((unsigned long)dst, (unsigned long)dst + len);
 
 done:
-	kunmap_atomic(xol_page_kaddr);
+	kunmap_local(xol_page_kaddr);
 }
 
 unsigned long uprobe_get_swbp_addr(struct pt_regs *regs)
-- 
2.43.0


