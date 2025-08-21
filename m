Return-Path: <linux-mips+bounces-10414-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE20B30459
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED51D3BEEDC
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F493313551;
	Thu, 21 Aug 2025 20:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E76ZkZGK"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00C434DCF5
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806861; cv=none; b=C3zj+BwgChNDTFU3YBLUzx2tBHhLewbeojquUK7F/vxPPvVXzN3JjZcqfdw+DIrapGt894HEro5pWxKkil3FYuE5+W3XvtwCT2kRIQpKQFL6lksOjqbBkKru70CdBlZ5QGDfP1ydKgOALA/5pVO6YM7v6Ttfj1XIg1HbM5FPfHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806861; c=relaxed/simple;
	bh=I7luCT+CObepmsBOKpah/UXsbrY2375DH2pptgGLgo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAkHEDpegvUsTVfWGYJkftpKz9qkrK4jmw5x/DCy0vCqMzNYVvHQjlC8PexUTMMPdgXFZ39XKeTmwcLAZr2F4W3igBhwEMGfZVXVefOHXn70HnYqG+Xeobn6nIUhTDtex1MdEsjnVrtyKzvrHIoGGUBGGkweARcbRXR7cVihgZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E76ZkZGK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fXj+9vT03G0X8fnCGUCy6hSTWwnZnWm2sdD6cJzGZDI=;
	b=E76ZkZGKXz7Oe4zTUhHQ2YRrjXFs61NGyIPJIW/rP4LSZxOBqWGur3HlpGshJCS2DIbUC0
	0og2Ilc9RQ1AXPGAfeIsOtPJ1M6he5aTIh2U3nATZ5qdbV2POXmoECxt9yzDcLv5wkKHQI
	tRCSlheuICpq2wHeMFyW3ds+G7bNHTQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-It_QxB-6Nnmi_eCTz6ZWCw-1; Thu, 21 Aug 2025 16:07:36 -0400
X-MC-Unique: It_QxB-6Nnmi_eCTz6ZWCw-1
X-Mimecast-MFC-AGG-ID: It_QxB-6Nnmi_eCTz6ZWCw_1755806855
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b9e418a883so795573f8f.3
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806855; x=1756411655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXj+9vT03G0X8fnCGUCy6hSTWwnZnWm2sdD6cJzGZDI=;
        b=fLv21h36X2G77Ro4Gp7FC19L1HQS6DaTgSd8BBTYJsSDHhQevXMBYSRj263vtLHLdL
         yg2GDCaf5Ygut/4ICVBatL1GGJ1YfFk9M6ucaXeqhxqViDdTWKoxJvu82b10TNTyj68i
         /a8boDYR2qO4JBsFWTN++LK5UZkOwtG1P3oeCN3JGwv1toRAS/t2+HOAj0crAukMaN/o
         66cUwGOMF5dSQaB1jAm6ZLh7Uv50VgUecZZr/XB8o/y4xfyxXsWxOWmD/WZp4yy/oUXs
         5fnI+4WZurcbwGVTD8I+xxbUcDsNmU4NYsjx6/s8dRZ7VGwnBO2BAl3ojfFjlKdD/TU6
         Md9g==
X-Forwarded-Encrypted: i=1; AJvYcCXM0MVlx3vEVTcn7AB7PUs8gJr3AqgpmhWCE9tr9GvwQ9wyK3HAewZdmf3Fk3Zuf41DNI/X6KFto2Ii@vger.kernel.org
X-Gm-Message-State: AOJu0YwIWX73AoMR6e4ApsESuOQCdfk1YJiZd5qnadSdFMu/C5cyQYXQ
	7jxOadfE8OuxkgxJXm1T8beYgX9I9Tv7/uN2vSiOBbmMFtXHjE3I+sbwsnUPAyerEHlqrNM+p+b
	BthUdj1IH2GPJq43oJmZov+nmtWn9hT/zJalr85+uYUE0LGRXhEMq7SLpQjM7EYo=
X-Gm-Gg: ASbGnctgcTTlDWYVy0LQTN6qGKaiPGSzXAsUpB8JLXjeCZMWPT+U6qLY3p1RuQX3bN5
	9oKayQ5c0TJcKfJ3rq3iyL73URU9Rl3iAlBxoCq1pugZZB/D5unwFZ95P1eoH0oUilQ5JoVWphW
	UQmZPqMXztopFpxxoe2FNNJ+b5QTwlUGZ0s9oobfAAegL3PVKmNXGDpuCFb9By38rgYB87fnWDE
	AGAQS7DGD8i49XlZccO3+5izUPpT9fc+pHlhKnkfjhcjFqdtXNTPiItLf0FZg0R7X/7VBzzbmLL
	VAUAGK/0N3Dpg3lu1UxI3PgtmsqDeSpvb4/BUwR2KVz0wPZh4fjEqxXZjD83mAtnwdCtys2rFvZ
	GxldgajdLJKoHNAGL4EY71Q==
X-Received: by 2002:a05:6000:2303:b0:3b8:d893:5230 with SMTP id ffacd0b85a97d-3c5ddd7f36emr169082f8f.47.1755806855291;
        Thu, 21 Aug 2025 13:07:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbzCbSL6MUAhNqtGz96KSex+k6XoYEx77XRmSFhqyAAErvnD4a434thNrJcfmyX2YJjFDsxQ==
X-Received: by 2002:a05:6000:2303:b0:3b8:d893:5230 with SMTP id ffacd0b85a97d-3c5ddd7f36emr169035f8f.47.1755806854709;
        Thu, 21 Aug 2025 13:07:34 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077788b39sm12802789f8f.47.2025.08.21.13.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:34 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 10/35] mm/hugetlb: cleanup hugetlb_folio_init_tail_vmemmap()
Date: Thu, 21 Aug 2025 22:06:36 +0200
Message-ID: <20250821200701.1329277-11-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All pages were already initialized and set to PageReserved() with a
refcount of 1 by MM init code.

In fact, by using __init_single_page(), we will be setting the refcount to
1 just to freeze it again immediately afterwards.

So drop the __init_single_page() and use __ClearPageReserved() instead.
Adjust the comments to highlight that we are dealing with an open-coded
prep_compound_page() variant.

Further, as we can now safely iterate over all pages in a folio, let's
avoid the page-pfn dance and just iterate the pages directly.

Note that the current code was likely problematic, but we never ran into
it: prep_compound_tail() would have been called with an offset that might
exceed a memory section, and prep_compound_tail() would have simply
added that offset to the page pointer -- which would not have done the
right thing on sparsemem without vmemmap.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/hugetlb.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index d12a9d5146af4..ae82a845b14ad 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3235,17 +3235,14 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 					unsigned long start_page_number,
 					unsigned long end_page_number)
 {
-	enum zone_type zone = zone_idx(folio_zone(folio));
-	int nid = folio_nid(folio);
-	unsigned long head_pfn = folio_pfn(folio);
-	unsigned long pfn, end_pfn = head_pfn + end_page_number;
+	struct page *head_page = folio_page(folio, 0);
+	struct page *page = folio_page(folio, start_page_number);
+	unsigned long i;
 	int ret;
 
-	for (pfn = head_pfn + start_page_number; pfn < end_pfn; pfn++) {
-		struct page *page = pfn_to_page(pfn);
-
-		__init_single_page(page, pfn, zone, nid);
-		prep_compound_tail((struct page *)folio, pfn - head_pfn);
+	for (i = start_page_number; i < end_page_number; i++, page++) {
+		__ClearPageReserved(page);
+		prep_compound_tail(head_page, i);
 		ret = page_ref_freeze(page, 1);
 		VM_BUG_ON(!ret);
 	}
@@ -3257,12 +3254,14 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
 {
 	int ret;
 
-	/* Prepare folio head */
+	/*
+	 * This is an open-coded prep_compound_page() whereby we avoid
+	 * walking pages twice by preparing+freezing them in the same go.
+	 */
 	__folio_clear_reserved(folio);
 	__folio_set_head(folio);
 	ret = folio_ref_freeze(folio, 1);
 	VM_BUG_ON(!ret);
-	/* Initialize the necessary tail struct pages */
 	hugetlb_folio_init_tail_vmemmap(folio, 1, nr_pages);
 	prep_compound_head((struct page *)folio, huge_page_order(h));
 }
-- 
2.50.1


