Return-Path: <linux-mips+bounces-7209-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F739FE4A3
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2024 10:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EDA918829B7
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2024 09:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002DF1A9B49;
	Mon, 30 Dec 2024 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dMGXvhJm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B281A2C0B
	for <linux-mips@vger.kernel.org>; Mon, 30 Dec 2024 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549897; cv=none; b=ukrQhajvg0wa21FmBWj18IUkpHl/axGjhyBYkqlotx/6qCQcTklRzXu17/m5fWOg5PsJJ8JZLTZoAYceVcQELX9WjnUF8MXtbW9PwQvqNNj0mBA+zO4UB0PPQ5mEjeH1ZkqQJM0+oi6dTowDq+wetQ4OREsAElPj7v4xE4orWec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549897; c=relaxed/simple;
	bh=AOHzYz3e0W68bypaywk5PqwWiTbsh7X+wa84FHfFzTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P8382/qePinJs2nEtikd9mmcTpfbcR/z/6SvC/1v4yj5dR0OFZb4qPSxCWIWq+rblYHVFxcTrdnIV2KkpYcYOtjW4v4hNKXUbhVpaTUMjZOjsLInST6ZegykN+sConWECZB5Cs1kuaRFF27gt6R42GIjm7tzS1M/U3ULu1PpRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dMGXvhJm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166022c5caso101220425ad.2
        for <linux-mips@vger.kernel.org>; Mon, 30 Dec 2024 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549894; x=1736154694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=dMGXvhJmZw4f/XjeFPAOypYaJ1AeNxzuqtsV2p6mWczJPmfm9zdYnU3ZIXB8Y9vMeH
         ywM+JXATE4QRUnmfoMuK10N2mg9FnJkSay3ado5+OllS9iSY83jaERVs+Njr7nlkoIIp
         UygK4eILQ2UWIoPeQNeeWAlAY/Ya8/yMig+Z6V1ZJitEJKinQWfYiq+YSRG8izLJnDpD
         O7F2H8ddG4ikswjzAZ8Pfccf0A8fyI6BPEemW2TroujdF+t417cgbJriclhuXcz6lpgC
         EpOiL2JktxJkYb4K8498bnh+BfXaitQX0eJMMBMnmcuIQLF0Gh4Ci+zvCFyDYphl89fT
         14NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549894; x=1736154694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=WwHLYUEV9DiR/dtyTnYHNX8ZREXiGrk7jOQGtyzLLxLXFcTp6AKGIyS6cE6NvJVlA/
         0wpoYQfpqpd8qOxP/3wcXZbPhExDwIKe3xPnqRrPHmYhT12wKqFzNCMT3rSiQ8JUfw1W
         Ebp3zigmfvCpL0qddfilr3pIaagFc4V6YOOq4MQAyB4mGQM6NhOzh1QHNrAtE2D3eyNK
         GluLT2dtaxjF4+GU/KdRFS6kcYdr3ugRlBBL7tnas0vnekEOi9Brh4X4VfwM311L/Ysq
         LNHR2p93xwVbYOx4SH0RHhppeVpvf8ejFNW4WGfzpaIfIiJL+9IVFdqbJDWSe/Kck074
         x1Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXNF0AftvGkDgUBCjnr/pouhpRq63i9nt1bTudwSh4v8B1gdO+sV1OkPeJBBI4a5yuCUKhohQM3iaqk@vger.kernel.org
X-Gm-Message-State: AOJu0YzA5rqm3Oth4wGTjXZxWVXP1W49yH0fY1MQLMOg+DYAnFv8rAnD
	B/l/lN6mdeRnia4NLz348uQP8Uk3rp0MEOcJOyuqfk2AKBxLZWafzqhdQMzTDL8=
X-Gm-Gg: ASbGncsBbSDISWKkE6WeF4X3V1TMV8m5K82erqaRanybiQqcD5VuVmr0Y7jAsRZXeoy
	TMQoc0XUcG460Jp43vpb+hqGYZCtlCM4eXFK21bf7PeknOsDLA9D34IwjC0QzEaByqxd37yaVe0
	wUaE7KdHkGEco5n4XLfnqWdu7xn8+ONNIVAkcxfM3QzoyfOm+mOv7CeSjm1mRrtnl11qj+G8s+w
	F2lL0NUupzGwE7F+isrYUczVAoXLnh2GzQ1D+niCa0L9V2gOv4WT2UCt7sFwgUhzta295gtaIb+
	n7RrkRDznpxkBU63QV+ljQ==
X-Google-Smtp-Source: AGHT+IF2zawjY8HUYTCaMJHzWmoJ2TNFStaqczmOTvWfDCo9S9fZfm/YNlaFMm14SUWbTnX0T2oRFg==
X-Received: by 2002:a05:6a00:600c:b0:728:b601:86ee with SMTP id d2e1a72fcca58-72abde82a17mr50548930b3a.16.1735549894520;
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 14/15] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Mon, 30 Dec 2024 17:07:49 +0800
Message-Id: <286e9777dd266dc610de20120fae453b84d3a868.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __tlb_remove_table_one() in x86 does not contain architecture-specific
content, so move it to the generic file.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/include/asm/tlb.h | 19 -------------------
 mm/mmu_gather.c            | 20 ++++++++++++++++++--
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 3858dbf75880e..77f52bc1578a7 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -20,25 +20,6 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm_range(tlb->mm, start, end, stride_shift, tlb->freed_tables);
 }
 
-#ifdef CONFIG_PT_RECLAIM
-static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	__tlb_remove_table(ptdesc);
-}
-
-static inline void __tlb_remove_table_one(void *table)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = table;
-	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
-}
-#define __tlb_remove_table_one __tlb_remove_table_one
-#endif /* CONFIG_PT_RECLAIM */
-
 static inline void invlpg(unsigned long addr)
 {
 	asm volatile("invlpg (%0)" ::"r" (addr) : "memory");
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 1e21022bcf339..7aa6f18c500b2 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -311,13 +311,29 @@ static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 	}
 }
 
-#ifndef __tlb_remove_table_one
+#ifdef CONFIG_PT_RECLAIM
+static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
+}
+
+static inline void __tlb_remove_table_one(void *table)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
+}
+#else
 static inline void __tlb_remove_table_one(void *table)
 {
 	tlb_remove_table_sync_one();
 	__tlb_remove_table(table);
 }
-#endif
+#endif /* CONFIG_PT_RECLAIM */
 
 static void tlb_remove_table_one(void *table)
 {
-- 
2.20.1


