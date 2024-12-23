Return-Path: <linux-mips+bounces-7175-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B049FACB6
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2024 10:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23FDA160FFD
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2024 09:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B924194C78;
	Mon, 23 Dec 2024 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jCnmVm/T"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AA919F101
	for <linux-mips@vger.kernel.org>; Mon, 23 Dec 2024 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947164; cv=none; b=H34UHTf4Hv996nfexfftSUBGNmF4fFi6VJJryDOwr8dYiuOGG7AHocOLxhngDN71lbvL0VBnKYQy+nuavJSU4SBhsCt2Y7Yp1WOhIyV/xARuGZgfb5kuNUEDAO0/WDRae/65fe7F97VTjFSSC3Ye/gPiAPLH+rWkuSsvnbwYSkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947164; c=relaxed/simple;
	bh=AOHzYz3e0W68bypaywk5PqwWiTbsh7X+wa84FHfFzTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NYRb2+mY3DXTSASdwyht29x1rrEwlqqcygc8vhkh3isORgHA3ZcKVweqlMqHwGxmGsp6ARh4eylnSwhSIYMXh7PsLVMhdyy+LCIuEASCYns5ZgrDojGDEXgg+FFYs3D+EPnKwzORehdjYasYs1mHh6JhAbFxMecsNBS0f3LLoDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jCnmVm/T; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea9739647bso2564713a12.0
        for <linux-mips@vger.kernel.org>; Mon, 23 Dec 2024 01:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947162; x=1735551962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=jCnmVm/TIkWfMytO3QSvme+fClSmAs5pduO/mAkMupwhIOpUfFfT0a3ztDvuFTYn5X
         xT2uM1aGyiOwIR+C9EaLYuyPxt2SR/yGOOBAUlRT65QH2trNelA5QjzYqPSWsJMv/i/d
         l4xnCtTVB5DF9mzcFgJjM0DMcPXqsEH/UO4gwmjhAOJMRBiue2pkcDHI1Rg/S7WuRQDa
         ihyfSL5wA9wS6NUaqQOQzoMWsZcVdkfUZeATeboLiBmZk0Po2kUCbCy0SrDbrr/RRcPi
         +Yq4JF0UJqbtc7vn6uPNiBws5Y7vMX6ew/SjBHUnM/zACZH0GvcMphrcUP3vLj0GTQg4
         b5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947162; x=1735551962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=nd4HjItm0Sh1+HqFRxDMfajhAQb1xn8NLOTjLQjxp2QMzagFScC73o3Msu4HJUeFUI
         /EEgYIEtG9UGkzRYQc57dp8mZyq4oI408DP/sZGwrELssjioaLZmcXEbegn3tEbCego3
         fFjXZTElJD9g8ALcp5MjxzbXlQHjXdRBdzzGpWoH+8Xvc+SNyxctwN9s+Hzcc61DRjPL
         9CaC9j8JQFUJMri43a6Cz7Oxb0ppTj/WNjK9yF7beVpUBjin7olKJCueQ84v+JCyB371
         BNXXyQgky21hxgnSSamzcS9ip+aR/MXtfXDSrBYd+xULrQLspRFkMI2XKlXhBGlJnipA
         5CnA==
X-Forwarded-Encrypted: i=1; AJvYcCXUIXBlmQB2ERzyLc3HKAfy+v7v2St6fUmBGYOKIJoGEq5PAOUeAJMT/PJLK1qydC9kd0eggeJ2aD7O@vger.kernel.org
X-Gm-Message-State: AOJu0YxkKXYl6CUSSrPJCuEGgVBpjF/Skdd8KFZZaB908bWwIL4n0WTD
	NpKpYwnYabFCjEKwyhZj3r6trQZoe3WlXUgQRpcYOuFdmNb4SB0rKVuawu219po=
X-Gm-Gg: ASbGncvl+idHv+nYEkuyiaYU+8mEH4tbXxMYpgqcaJNR3dQCQSRTA5VU6eX3jq7PE/t
	JC3xxXeZzzMSuZ6lXk58yyhXwBX5subb+uI10sJJ/HPFQqrca07+cVGG1+DnMlZ0u+jihK9jdsP
	YFa7dA2xY1l0ZKOhWrFWfHryVT0BYclGXXHkLMlKGLg5LqLejXAtMFoE0o9CfJc1yT5fpsRERXp
	JRXdBqN9hReQ4lXUl29Lh0Z6jDoVuDNuy4RmMto9+AI5rKQxoU0v8OKpTwTHl42fcFFLxU/38G1
	wP+CDppzj3Ci/LRLzflhNw==
X-Google-Smtp-Source: AGHT+IEiKQiNoCztX+vEmXJ78+SVJHcoRjQcReSYKDpgexw8hG6RQW+fGx0o5GN+OmUz8JwpFgmgkg==
X-Received: by 2002:a05:6a20:c88f:b0:1d5:10d6:92b9 with SMTP id adf61e73a8af0-1e5e07f88demr18787949637.30.1734947161832;
        Mon, 23 Dec 2024 01:46:01 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:46:01 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 14/17] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Mon, 23 Dec 2024 17:41:00 +0800
Message-Id: <286e9777dd266dc610de20120fae453b84d3a868.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
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


