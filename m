Return-Path: <linux-mips+bounces-9538-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1411AEBCCE
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 18:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60B3A7AC3C7
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 16:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A402E973C;
	Fri, 27 Jun 2025 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ui1Gsy17"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235572D9EDE
	for <linux-mips@vger.kernel.org>; Fri, 27 Jun 2025 16:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040435; cv=none; b=Pf4+p98D+7C3N/vbx+mMH9P2zIc0ovVGpTyS+L0jwBRjWdRVWckwtpse3KuiCRcdRbzbGU94MVfL2Z2qvKjf3srdwcV9rzS0uomEQVH3N950EmtQk0vpWYamRyDAH8cvCpDubCjYUptKMMzOOJxwI40E5i1dXSp6pnWc+P+9ayM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040435; c=relaxed/simple;
	bh=Tdpe6JDS+rR3v1xR5w42iqwYeD9PI+17P546Ndy04J8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V4LtgBxo1IDUKokofUHS1HWiMo5+RI97Nm9DJSpF/WfGxVDmcexmxaClCg7FZK6i5xR+Y+iSg6Ca0/xG7w1l2tpRl/oqraqMrb38kC6qCOrS2iEPkyrKDbdJuazJzr8pfKSVh6dn0E66BZlgy55HfHYiBP72BwqF+ncDLezaCDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ui1Gsy17; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751040433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/xy96KI8UDKszt96CyDW7op5ryIeAmzp/OyFji+BJh8=;
	b=Ui1Gsy17GX+FpVKa2Rkr1ERTsyxgb+HDWiNML1i/G3KwbN0JMNfKdxJGdQ3y7qYeY4HuqU
	Lqsp0+UHtnJkPsOEW0ZD8wqa7hgj/UAe+Wwbuk3/+98aTv8E4uKZ9nX3QSEKZKv4kTKeOb
	2R91HiffBwb2AwVy5IqUELA0yd9c6Wc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-5XIyR_OOMl-J7FMpl8R7sQ-1; Fri, 27 Jun 2025 12:07:11 -0400
X-MC-Unique: 5XIyR_OOMl-J7FMpl8R7sQ-1
X-Mimecast-MFC-AGG-ID: 5XIyR_OOMl-J7FMpl8R7sQ_1751040431
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fad2a25b65so38337086d6.3
        for <linux-mips@vger.kernel.org>; Fri, 27 Jun 2025 09:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040431; x=1751645231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xy96KI8UDKszt96CyDW7op5ryIeAmzp/OyFji+BJh8=;
        b=sOZUVLJHaV7TjnF0/a5YNn8L7RglbvKWHtQRUGDQtwx3Sgwkf85im4FHVTrGMIu5Nh
         d6O9Zp0mh+XPZOUZ/Uog/dnm86RuN2AzytqvKEnOEWWNBTfCiSDO3h0N7m/y5zIb+xRO
         HAt/HBUaov3qTrLU4fmuOcXJhIsEOlgHmPYsBZxZUmFD6XlCkZX0zRwbA+fZpJp9/3Zv
         SbJGJ5yWqrvcPYJHtd56p1oTtbz/RNr8DVeUdrN8K5kXTZCXkdrnDgjhNnPc5SOe1EXi
         3E+7FtNibq9+7M01F3uIKy5nrOVWCdq5id+tnpnJ1Pv35a4bJi0FUJ529qBbHlmvrZPT
         jdsg==
X-Forwarded-Encrypted: i=1; AJvYcCWOAJjQtwycOXSQ7nW/1MLCTWMd9iRCU6PPt7FKiCogtyVdbTXNy+zI0qLZdFLf5GkXw6A9RXf+B5EE@vger.kernel.org
X-Gm-Message-State: AOJu0YxqD4FccPpDeX6BE1oTljDeXqtOxIFir00jc4HiMEHxxMrZc8Km
	S/3iC9Q7r4dl+j7HSXaqy/CNIebyorbPJJ8C7qYaJdI4/wC6YA4uvSA1OMnJNh6+bCCdNvPm5SW
	5SOSROuyfk4vGlH+cR70f6IzwWCxbzAkyrqOYyHjbizbVmJ4H4uSbbH6duSNOPLE=
X-Gm-Gg: ASbGncuCnxjtkELrPbGnPiS2mcxRnDHQ58OBLYNTCZVYcne4ldz/MvLGQNFD06bAR5D
	fXiDXSHkH7F35D2PjWZFyDFnGrnHFK2lCHufM8liGEpfTXbzKuYalZqLfYmobtz9xamdpzhX6y9
	yf5OU+ayxMRXLmEZiQdfeSVx1nZWzxamnXVNcMX8IrYpyrnonoN2xs399azkai4gttUFZqbXlsp
	MOO2zOSqpDNNXIPOwLR/BADE3QmaTkCQ+F9gAuEs4CuJHtdx0tVseTBcZh5Unv+Vti+vMVqOQxZ
	qvrvckOSye0=
X-Received: by 2002:a05:6214:405:b0:6fd:24:b0e0 with SMTP id 6a1803df08f44-7000252f09fmr61586346d6.6.1751040431134;
        Fri, 27 Jun 2025 09:07:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpI3B+sCb86YFp8sTXjrVwNo2dAmF8TVfkL08aeMHEOdDuhipHJHbQBBG3CZhrBLuzvp45Qw==
X-Received: by 2002:a05:6214:405:b0:6fd:24:b0e0 with SMTP id 6a1803df08f44-7000252f09fmr61585916d6.6.1751040430641;
        Fri, 27 Jun 2025 09:07:10 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd76e74372sm22805016d6.0.2025.06.27.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:07:10 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	peterx@redhat.com,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH] mm/hugetlb: Remove prepare_hugepage_range()
Date: Fri, 27 Jun 2025 12:07:07 -0400
Message-ID: <20250627160707.2124580-1-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only mips and loongarch implemented this API, however what it does was
checking against stack overflow for either len or addr.  That's already
done in arch's arch_get_unmapped_area*() functions, even though it may not
be 100% identical checks.

For example, for both of the architectures, there will be a trivial
difference on how stack top was defined.  The old code uses STACK_TOP which
may be slightly smaller than TASK_SIZE on either of them, but the hope is
that shouldn't be a problem.

It means the whole API is pretty much obsolete at least now, remove it
completely.

Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
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
index 00b2d1a032fd..81a6acddd690 100644
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
index c6c87eae4a8d..474de8e2a8f2 100644
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


