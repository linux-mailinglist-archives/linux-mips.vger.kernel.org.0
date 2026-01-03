Return-Path: <linux-mips+bounces-12728-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C830BCEFCF9
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 09:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 738C43010666
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 08:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D0C2F5461;
	Sat,  3 Jan 2026 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOPsDNsh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC55298CC0
	for <linux-mips@vger.kernel.org>; Sat,  3 Jan 2026 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767430089; cv=none; b=RvKnjVgP8PdYwwRNsp7hQp178mFN0HzZ7GHD50pu3DAcqzVWnajfg8+mVJYoH1irxAqM2TPvnTfrbCa/9hQRiQf9SL1G34KUkkg+F6U6GksHw4mtl+cflPmc+qCIYRgtU4dpNRra189IPQZr1Wj+93uyYzM6+3jQ/ibdG3q1Ugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767430089; c=relaxed/simple;
	bh=xm/rDkVpNNqDrniaXUpYpfdxQGvr5ncLeT+0eKBuOOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DioVWwu7bC4Q3wwjWGZnXfaVQEc4/ZkYQw5hmT2rj+TuMfNlDAPoxk26JDl+FQwpKz/42ZvFeQMEq/NGFIWkxejlsovGjON+Rld7hlrP8IE6OugDIn8BvFJp7PWuJuvEY5HrzqQ6Mu+NyyNen7XvckVQuyvxij7mdlZYHuxfO9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOPsDNsh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7f651586be1so232660b3a.1
        for <linux-mips@vger.kernel.org>; Sat, 03 Jan 2026 00:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430087; x=1768034887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHUhniRWcOleZ/LWsZA4B498/r40yHnXuPYvUqkOFcY=;
        b=XOPsDNshZSFjL7QX1dgFmnLo5Di9/jKQLul/j0coKTsqBeX6Z/Gv7l0eBc/KiwcA0h
         dbek4L4GZpR/fs6Ys25KUX0jgs1tDCvq7ceXUwsH6we4vRwOe7R/JzyU9bjTOXN2ii+R
         yoP1sdw2rV3+Is5OrYbp26zHoDP1sm//LtkKKSdnV6Q6lph2qwHsLaFGr07/HcQRYKwx
         blzU0KAh/ky8OFoWLplwnfNVHEKVK8GhYUfmTDhFqXZe17FG7IF3LU9NkHQxR193qo7t
         t3ApRuP9GiYssNQq5CQthnGwUvMJsVpB8850tGpFQkRFHiG/HVvZPWt0hX0rBl/BSsk6
         oCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430087; x=1768034887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JHUhniRWcOleZ/LWsZA4B498/r40yHnXuPYvUqkOFcY=;
        b=i/GCqu7VpvsrTlLYp1rcoxPau1Cr4nkqi1SwNZZkltJ7ZG/Hj+vqZGx6Th4+G1lSvD
         P3FigUlpeh3NSUym7IMVBIdO0GRol8UX5A5hsFada3oQrPoi6TounPDp0tIeZqvbg0x9
         IPrhxLMKdPOtpIQHKi8tY7U5NOyD+RE6XV2qwMlJHTOGqXECefMIKF8m0OeMtickcr5A
         cBPOfTCPu/u6wGTO0yuQgDOKrldlEO7/c2xsqH8XY8xZZBVi8BQ5QEYiILcKC/WjvqLK
         a91JG2pROXl62HK+bg6apAZHynrPsXUSWvCXnDv24qzI+z8Plj+EnQzWDHqprgvxWZkv
         Qw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFvyrOk/LFcJ2u96ymh4CXAL+5Lreb2L0KbpnXZPjRR+4uAgMVpLPll8GDEfLdP/icZppvIfjdPgRa@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2SQ8aiEq8qd80mCJPBSUNdhfuMkGdXD8mPv0lMz3/3euBVSZ
	simOwixi+9KkiJq0B3sLSg3ipQSvEYiYGmAG4Trjt74xFGHAj4IpJcYy
X-Gm-Gg: AY/fxX7l+j7XkvPgw0mWqu1i7b5mIRxDONQbh8Yi5gURVb2I75F+YfMZr39dxiqyooC
	WyvWT7HPrHc5PqHo2SnSyzoukks1mk4sOlhLILkq2yTx0psSI7MhNpebkn55tBVAy6apZsvmbW7
	MUhSDw7lRE4JRl+8lRmxe60jBU/28Jkq2Ftsga9cfBkU69sp31FdPpZ8dX9zE6qCWiUmEShGoSN
	iKOefQyLZ0RX+zXSsPfgUlisDvd918SU80OSJPAmL5XHVpwB2r/uBdqt6679FchrDSzLoIB1Qwl
	tINASpilZqKrLhxkBKhTEfPZwyRpzh0WMRTVk9NPv4pVA0XOTs9tS24V8ei6MP66/asuAGlczEh
	5cu/0mWOxUj7O57Dc1uFOchz59VSheBj1tNMEdHHtrTKznjutDacOpMi5jTOfyoSAWOomFWwrqb
	eRdqUVoh7tj9OTiKzroYD+bJhiAPQkKu5z/JM=
X-Google-Smtp-Source: AGHT+IFoiqDv7u4QVwPAsnB9Ilz+AGYXHXN7Krwf9OXzvHcyBpVKkqOp/lFBq/KGwKuFExK695g6Ag==
X-Received: by 2002:a05:6a00:4895:b0:7e8:3fcb:9afc with SMTP id d2e1a72fcca58-8148ba1ab36mr1175712b3a.18.1767430087435;
        Sat, 03 Jan 2026 00:48:07 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:07 -0800 (PST)
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
Subject: [PATCH 4/5] arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:42 +0800
Message-ID: <20260103084243.195125-5-ming.jvle@gmail.com>
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
 arch/arm/probes/uprobes/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/probes/uprobes/core.c b/arch/arm/probes/uprobes/core.c
index 3d96fb41d624..0e1c6b9e7e54 100644
--- a/arch/arm/probes/uprobes/core.c
+++ b/arch/arm/probes/uprobes/core.c
@@ -113,7 +113,7 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe, struct mm_struct *mm,
 void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 			   void *src, unsigned long len)
 {
-	void *xol_page_kaddr = kmap_atomic(page);
+	void *xol_page_kaddr = kmap_local_page(page);
 	void *dst = xol_page_kaddr + (vaddr & ~PAGE_MASK);
 
 	preempt_disable();
@@ -126,7 +126,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 
 	preempt_enable();
 
-	kunmap_atomic(xol_page_kaddr);
+	kunmap_local(xol_page_kaddr);
 }
 
 
-- 
2.43.0


