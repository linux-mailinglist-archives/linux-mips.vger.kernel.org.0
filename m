Return-Path: <linux-mips+bounces-12725-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F573CEFCF0
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 09:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB5A5301E6FE
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 08:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B403017A316;
	Sat,  3 Jan 2026 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgDqA+FQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32667298CC0
	for <linux-mips@vger.kernel.org>; Sat,  3 Jan 2026 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767430074; cv=none; b=J/9vpE3eolD50myPmbNMhQtWaR9TdtCB6bs3LV16/cv9OkyaIMViw962bh7MrarRlJxQD+Qltbl6ByImobjOHD+WsHW7NcqRGRWS0peS1Ra8i6OjRBBKRJp5C7BzCwluzKWyzzM0BlgEpYhBOkp2jmcIi1VeYNloTBGqQdmZnJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767430074; c=relaxed/simple;
	bh=iTYbGlbd0WfjgajAU0khl46xvYSC9oXnQ3HkejxUQc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzzHt/qWh18BieyCiFQTgv+PCV2nhICo9HsMwgY06xtbBkiN7+m/X5v1nQlesTRmgOpWEVjV1HY/F0Oseq4eV5bsyii4cO8allTPZOh1RDSlI9Uy7xwwVzxes9rlorioScR7DrMNcVu0gTN43gYcqabcbAH1aEG0ssgiI1R+xR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgDqA+FQ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-803474aaa8bso241904b3a.0
        for <linux-mips@vger.kernel.org>; Sat, 03 Jan 2026 00:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430072; x=1768034872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sa14InhCOXebwmWDP7ecBkutspm2W7OpFimtcnzXp3w=;
        b=XgDqA+FQhtRYBBW9jtqVZwzk//76ieIC64Vab2DbizJZ/IWlwJOwp+yGnpd7VXvKVm
         bKQ8L3mXDLriKjflCfUqogiXRwiy/FXkIY8fUXLn60F+wbzyerIfTEi9RW0yvT9hHxcZ
         ZJiPExY0z2jYWFHuxvCGC+Vw6f3MmFF0kc1MTFXyBtHxdVUol3lh2vHGnQ+S3v++DMa+
         PfrYf3IxA+h0uyrtnwu2+vg/R7W+RKcoTxhFR7lPs1PX1ZGBSoyhCc5X2AEER/HftsDq
         C7lu8OfIMh3KVsOq8egW0WFONk93vZS7LshO6jsNS5OZLtcSgk5A1G16GmEvZsgjaPUQ
         H1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430072; x=1768034872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sa14InhCOXebwmWDP7ecBkutspm2W7OpFimtcnzXp3w=;
        b=Xv6UXJmy8z3HVswnURRk+KTL9xYWNqMrpnXJyiWxvBBtOEiqtjhUPvQqvqmWcmXPIR
         JiFdtFyKWS3aJO+tjCDMMjpqQ6WaCmhkZx7bGG+DNh7KzudkiTtcvstQ/cdjxdS30RAW
         Fi27sGERQfpRc9pitZfFYNK8jMjLPqIuGR/gWL7kXBwxnKiHXZAhagYJQWTa6f0BSR1x
         5qNsVn6CITeM4YY52cC4C9Ns8X4MHmJKagxYA/aixP7IjkkCUl+rMZ8rNUr/QBlkIEIo
         AkDh5RVs4Cwyytxq7+uL0Z9ZMrhyhVhUcnn0h+edd++ZpnaNPHBy6JUFQdPHvnSsXr7Q
         jznw==
X-Forwarded-Encrypted: i=1; AJvYcCXcnSADDTfxabBmTRHz1YZko0PvfCOl9pUfZS8O8e9cIlFCIyNN8c4o5M4Ags13x8M4Ky0vg4nD0n9Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWvc4XRh98/DeXFAEbnXaqB+xPaU3I61TJafsjx1JO+OUHUoP
	BFziPfkN9Xyjn6AnR6fM9aFxCP/rsxKteVBdyaEW0lI1NuJFoOyiYYuQ
X-Gm-Gg: AY/fxX71MDABPq4UbAQSU1XDBdyB6mlhMixXAKAifjO6PfJ4ixG5f4LZDW45s4tZhOC
	I8o7tZFotXgj1y+nWy6kpcx5bkiZMP6pnTfppOE9OoNDMRkXA79D+a/rKdJL7oD3ykpzHYftd9d
	ZLZfdzkOE+ocdXjdM/MNs0o36nKwkvqipdMAfS12sG0HhcWnGrH58LF+cdseyYMylGcjVuVH4Mt
	XwOJbQGsR4KvFPoKbubIf2ledMRI1ddzmIvmIWIPPcvlc/FZ+hejz1v+O/Sz2OKlpALdvMJd1g6
	9NPB2SjFxJJpl9/BSXGMCXBOvt4VuniWrUZO7L5y/9c5sXuo71qN81DgLejwRgtrig+aZVXknM1
	rmOHiSB4COqRotQNzRhczJxH3xsOnqXKpSJG875gwGq1MzVt7vl0HvdOYQbmqpGoXBuFb7eq1gD
	7tO04zXAaD3fDaFj+AKsG0vXCh4HPy9FGf2RY=
X-Google-Smtp-Source: AGHT+IEE/qkOzQdehsR4JxutS5UUMjtZZSX5KqQIX0KxALxL/oRTRg+GqK0LQ65hB9xD4RLyoqIiJw==
X-Received: by 2002:a05:6a00:1f04:b0:7e8:3fcb:bc46 with SMTP id d2e1a72fcca58-8148b5212bdmr1895799b3a.27.1767430072502;
        Sat, 03 Jan 2026 00:47:52 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:47:52 -0800 (PST)
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
Subject: [PATCH 1/5] riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:39 +0800
Message-ID: <20260103084243.195125-2-ming.jvle@gmail.com>
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
 arch/riscv/kernel/probes/uprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index cc15f7ca6cc1..f0d0691a8688 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -165,7 +165,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 			   void *src, unsigned long len)
 {
 	/* Initialize the slot */
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	void *dst = kaddr + (vaddr & ~PAGE_MASK);
 	unsigned long start = (unsigned long)dst;
 
@@ -178,5 +178,5 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	}
 
 	flush_icache_range(start, start + len);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
-- 
2.43.0


