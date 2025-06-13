Return-Path: <linux-mips+bounces-9288-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC406AD8D4E
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 15:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6D0F189FD44
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 13:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE9C191F8C;
	Fri, 13 Jun 2025 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LuubT669"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9145E1922FD
	for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822084; cv=none; b=Xdrda9uCr1gW2Jkdl1Q9zDTh+IDb781+32ir+wAUROSLNsed9ZjJYTsaVO7mKXT6cwNxXZ4aSHebjSAmD1nszfVYma9DjP1Uly8DfTisWtAZjOiv6BVQoQ9xePrm6lmvtxN6b1V4RN2I+kiOq3pTnA08ixYgh+4AP794u0VcJzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822084; c=relaxed/simple;
	bh=oBujyHW3fR3UArBsFd0eQdvuPTosgfHx6P9PRFKYox8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ufqELV+GzsH2tTFjgXcOn9Z2uUSl3xnrmjN0S/L8UdcFrAtl9WtywsbWKKUG/7B6m3F5vb3uVsWd+jFn22enCPenMY19/o9Ly4V9gQAYJsRRsGbzQHGmjCRxNwvPX39JmVl+lyhOf2CO19GjdHSQjBPEdUs9wIECRWrTE66IK8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LuubT669; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749822081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CurRk13BLi453FdNUVmvRv3/1kchAf7liLqepSAurz8=;
	b=LuubT669ueDH/xKrJFloiM00Z9RVEWMQ+DYwBJW+PkN4UWUbkjK9mDQA1y04bySSLHTipq
	GPZG++dULivASt9Lf7maMkjfFC052twrT/+FqM+239BPt+LKGlrdM7QXhDqo+A6d9gElaX
	DIVWbJCwJczl5YnsRCehZtOtyn4A4Cs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-57O0JQ1sPUaOVRv6QpGgKw-1; Fri, 13 Jun 2025 09:41:20 -0400
X-MC-Unique: 57O0JQ1sPUaOVRv6QpGgKw-1
X-Mimecast-MFC-AGG-ID: 57O0JQ1sPUaOVRv6QpGgKw_1749822080
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53e316734so399483985a.2
        for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 06:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822079; x=1750426879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CurRk13BLi453FdNUVmvRv3/1kchAf7liLqepSAurz8=;
        b=RpfBWv/UgCAvHe4lTxu3esCT7kXDRkv1bATpmb8OYwqF8MEqw1LYJEz2Yx8n46mSFH
         GAYLk358hyqCIKPGkjyqCuJKUk9iA0Lt2s2nV0PQHUzVQYfTQtOf81AZvY6HCn7PawUz
         RXXjvGI+lta8vzjIvLnkN/wlYnh3NVEb2qXPJWDTHZ7cl/MXDpDPZHnLV8fxj3hR3600
         3HuFuprL9B2w2pcDiTCRS8mjbYMnkNaQOvSbGVqtwzVL4rWFU/nTlvReN6kKLMJc7xkp
         jRSt3Fs5CMgYQQm5iG+bZLzdBXI8G8DWnRyFPFy//WH0zMTz7GzgQ1KHsy3IeMZAmLON
         ep0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWf9P0JlZrhVEKi0CvJ1rPTdJ5VStHTQ39JHeUC7DcM3JhjSR065SuMfjA1FjpNKUyl+8T7m9o9Yb57@vger.kernel.org
X-Gm-Message-State: AOJu0YxNDqdhNAi0ntkBgfOL5ze60IqnrfljzjxFHx0+xK1yU4JASC6N
	J9cFtzHd2W+TwCxcjGfQohW71y0O0ip+M6TrdTYq5GtwSVNInBY/m9Jj7gXQxnocqqiTQGtqFXc
	nSEborjuQ1Ji3TGwtWDyH1+VyWraDp3/bXu7vqMaylx8oXfpqAIPmGrgEr3fijjp+FSdY/7Y=
X-Gm-Gg: ASbGncvHD2Qrmsj9ZuecElSGYAcCXfEhD+Zn08CkDGUIG3RjiLQqvYOn8TCD3K+pdfy
	3mL+qRRq9uOgZd55YwOFZfXTvkbQQKSTtyPawrFBPXcgj1CXqAe3s1YPoxR4GL/u/HvbWUxe8Nl
	4ytQ1nJF//euJZZEJHzL51iVJD2HAW79yX8PyK0GNGqE7ojWVh4JTUPBbEQp0nb6jpuPYsuIyck
	yKFiqz+O4p/72WttZZSDtqELhPLIv2/ER3CY5hLKVEIBs1ScQawI/gXmMIYOPtww93m6Bq6rd+J
	yCyz4cmuPNw=
X-Received: by 2002:a05:620a:44d0:b0:7d2:27ff:2133 with SMTP id af79cd13be357-7d3bc3b0704mr463527885a.1.1749822079289;
        Fri, 13 Jun 2025 06:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmKoTuxvL7ffTQWjIUtdV/ylXkzGCctDnDjUG//mfabF7LSk4R8g8f8pkMatkvnCJNdWJBNQ==
X-Received: by 2002:a05:620a:44d0:b0:7d2:27ff:2133 with SMTP id af79cd13be357-7d3bc3b0704mr463525385a.1.1749822078879;
        Fri, 13 Jun 2025 06:41:18 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ee3f72sm171519285a.94.2025.06.13.06.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:41:18 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>,
	peterx@redhat.com,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: [PATCH 2/5] mm/hugetlb: Remove prepare_hugepage_range()
Date: Fri, 13 Jun 2025 09:41:08 -0400
Message-ID: <20250613134111.469884-3-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134111.469884-1-peterx@redhat.com>
References: <20250613134111.469884-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only mips and loongarch implemented this API, however what it does was
checking against stack overflow for either len or addr.  That's already
done in arch's arch_get_unmapped_area*() functions, hence not needed.

It means the whole API is pretty much obsolete at least now, remove it
completely.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/loongarch/include/asm/hugetlb.h | 14 --------------
 arch/mips/include/asm/hugetlb.h      | 14 --------------
 fs/hugetlbfs/inode.c                 |  8 ++------
 include/asm-generic/hugetlb.h        |  8 --------
 include/linux/hugetlb.h              |  6 ------
 5 files changed, 2 insertions(+), 48 deletions(-)

diff --git a/arch/loongarch/include/asm/hugetlb.h b/arch/loongarch/include/asm/hugetlb.h
index 4dc4b3e04225..ab68b594f889 100644
--- a/arch/loongarch/include/asm/hugetlb.h
+++ b/arch/loongarch/include/asm/hugetlb.h
@@ -10,20 +10,6 @@
 
 uint64_t pmd_to_entrylo(unsigned long pmd_val);
 
-#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
-static inline int prepare_hugepage_range(struct file *file,
-					 unsigned long addr,
-					 unsigned long len)
-{
-	unsigned long task_size = STACK_TOP;
-
-	if (len > task_size)
-		return -ENOMEM;
-	if (task_size - len < addr)
-		return -EINVAL;
-	return 0;
-}
-
 #define __HAVE_ARCH_HUGE_PTE_CLEAR
 static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 				  pte_t *ptep, unsigned long sz)
diff --git a/arch/mips/include/asm/hugetlb.h b/arch/mips/include/asm/hugetlb.h
index fbc71ddcf0f6..8c460ce01ffe 100644
--- a/arch/mips/include/asm/hugetlb.h
+++ b/arch/mips/include/asm/hugetlb.h
@@ -11,20 +11,6 @@
 
 #include <asm/page.h>
 
-#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
-static inline int prepare_hugepage_range(struct file *file,
-					 unsigned long addr,
-					 unsigned long len)
-{
-	unsigned long task_size = STACK_TOP;
-
-	if (len > task_size)
-		return -ENOMEM;
-	if (task_size - len < addr)
-		return -EINVAL;
-	return 0;
-}
-
 #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
 static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pte_t *ptep,
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index fc03dd541b4d..32dff13463d2 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -179,12 +179,8 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 
 	if (len & ~huge_page_mask(h))
 		return -EINVAL;
-	if (flags & MAP_FIXED) {
-		if (addr & ~huge_page_mask(h))
-			return -EINVAL;
-		if (prepare_hugepage_range(file, addr, len))
-			return -EINVAL;
-	}
+	if ((flags & MAP_FIXED) && (addr & ~huge_page_mask(h)))
+		return -EINVAL;
 	if (addr)
 		addr0 = ALIGN(addr, huge_page_size(h));
 
diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
index 3e0a8fe9b108..4bce4f07f44f 100644
--- a/include/asm-generic/hugetlb.h
+++ b/include/asm-generic/hugetlb.h
@@ -114,14 +114,6 @@ static inline int huge_pte_none_mostly(pte_t pte)
 }
 #endif
 
-#ifndef __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
-static inline int prepare_hugepage_range(struct file *file,
-		unsigned long addr, unsigned long len)
-{
-	return 0;
-}
-#endif
-
 #ifndef __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
 static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 		unsigned long addr, pte_t *ptep)
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 42f374e828a2..85acdfdbe9f0 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -359,12 +359,6 @@ static inline void hugetlb_show_meminfo_node(int nid)
 {
 }
 
-static inline int prepare_hugepage_range(struct file *file,
-				unsigned long addr, unsigned long len)
-{
-	return -EINVAL;
-}
-
 static inline void hugetlb_vma_lock_read(struct vm_area_struct *vma)
 {
 }
-- 
2.49.0


