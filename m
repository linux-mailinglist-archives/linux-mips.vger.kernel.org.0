Return-Path: <linux-mips+bounces-10425-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA12B304E5
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE9D722EBB
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6896536CC88;
	Thu, 21 Aug 2025 20:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iy3wgKBi"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169636C07E
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806894; cv=none; b=omYt/1FNZWSsudbMUqmyPu0K04YPjvO3hgdDrXPp92h+AeJ86PJQwsXGiFn3cDNTYo3qPFxHwiLHufWZ2ZWnBQ9dvYBufH1aY+uj+SuqkpKxHUlcWHDtV+Ws3iiRfbhSiaQWdHGBr+CXtQrYBpg89sMWN/X9Frzu54GLFvalJ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806894; c=relaxed/simple;
	bh=35i5s1BcLEONuxohRPeqiFHOreLIpfTF289+ZIXZu/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0Tw0eKOwZ4vcEw7/bapGVEhxMboptOV4mS+jGGUK2uZWzwRRREE9xj5DLd9BHB+YhvRLoqvOIs3hBdhmLef7ogPDFHimbOmJm6Hysp8TGXIz4I2JVJPbKMDTmgUJn9Xm3e04ItH349ZCJrQL50+8Jcfp0+gLzeqXpKbVX+UfIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iy3wgKBi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
	b=iy3wgKBi03EyZ3sRdRWSgr84psZuJtpBypQHP7law3eYFY+FVr08x31c3sGqpwjxqAGmTX
	xqBGUqiu8RyAPg93w1dvnEzol1HjwjQI/m6o382BgrH/D7lRFhyqnnqDsexkYq33pFBhbr
	yj7lMaG4r48RcxYaH/qGbQzbdKtKz3w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-Fu1p6z9rPrKRv0z44BgtdQ-1; Thu, 21 Aug 2025 16:08:10 -0400
X-MC-Unique: Fu1p6z9rPrKRv0z44BgtdQ-1
X-Mimecast-MFC-AGG-ID: Fu1p6z9rPrKRv0z44BgtdQ_1755806889
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b9d41b88ffso838236f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806889; x=1756411689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
        b=Dse8EEaz4XcoPYsYLbOCN5L3NrmLpwDecuzgxM4HnaQKJGRmKlCn7A14kCS3u7amvT
         P9WA0VRsC3L1/fAy9KTSrb5rQa0JEYZ09d0jgLW+7WxqjUEYHhmCFhC6oThoKeGkiYLz
         ILUsI29tXsq0FNsjdxPC4s3wbjoFcvVa4G20xwSryojEJS3VlvTqxu0hmw5aMLvF9yFG
         /47WlRPz/gtIJJVdRXfkt/GaOHkkqwPBarqDIFlUYMgVdLVPLDt9ZhVgAruH9VsxUo7P
         2YMb5+EteJzMmUQvtVxERC7o+L/SoHQENWpTViYpn8krAX0r36ljhmMu9SpnwGhfhFpJ
         z3ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjhyGOEbIPjTvSlLJESAL7IQtX7tdNkemz5bopggdxhp5oJMFfudG3ZAJfFT5cJ2pcjpSD1qj+hCI5@vger.kernel.org
X-Gm-Message-State: AOJu0YxhTf2ZDhN12G0KWN1vD1eILqNP/SvxQLjtHe1TLpaKzKg3Qd0n
	SWt9iWmjGVyB73BbJTQawCqukz6rx1s69JAsv1yDNOv63P8DYCojuy81Z88PSsEc9SQtxM5AgXa
	KXiP/MEIzo/9nvkbKSCe84PODfnoEeL9pXSMB1UDQi5tWjlBuw3ZYwVTlFZL4TR4=
X-Gm-Gg: ASbGncuiI3e6K0uV8Zn5xmFpPmNHbkpYYFQth4KJ72I/Qo/QUv/9WQjADeOWToye+PB
	M9cEM32DBhitdJwweolnasxXAQvWdvuMbBImxjSVD8WohLKpTNSTpkGMM3brAS37pAFnftvqw0c
	2eVOeC2n/wrP4aGs+UaEYX4FIWQdet+bfWjVxqtdmmw/wXNRN0F0ECs6aVNUdsmLgNwCKParoXN
	Xii6itLjmiNaySRErdE+58drIdeKh73onNXE2t00Kh/PiTTN1Ua4PecTKUcep3f9HenbvgtMSsu
	3onZ9uBw9Z3fIO2DtAs/0gcNry7ibG+tdHuChMLSVtWaNMTcwr6DsI2qo7Fi3YkTHG1gT2ImYH3
	2+i4OGDfY+gnGKNBFSjTRiQ==
X-Received: by 2002:a05:6000:40c9:b0:3b7:911c:83f with SMTP id ffacd0b85a97d-3c5da83bf5bmr151958f8f.9.1755806888898;
        Thu, 21 Aug 2025 13:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeHEkncn914iQLB6IDJFbFllUgyuseH1VcCPvg+Bdgchh7CcvmYDhAXktPsYS0hqHcr6hQuQ==
X-Received: by 2002:a05:6000:40c9:b0:3b7:911c:83f with SMTP id ffacd0b85a97d-3c5da83bf5bmr151916f8f.9.1755806888456;
        Thu, 21 Aug 2025 13:08:08 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4e2790a8sm21120815e9.1.2025.08.21.13.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:07 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
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
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 22/35] dma-remap: drop nth_page() in dma_common_contiguous_remap()
Date: Thu, 21 Aug 2025 22:06:48 +0200
Message-ID: <20250821200701.1329277-23-david@redhat.com>
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

dma_common_contiguous_remap() is used to remap an "allocated contiguous
region". Within a single allocation, there is no need to use nth_page()
anymore.

Neither the buddy, nor hugetlb, nor CMA will hand out problematic page
ranges.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 kernel/dma/remap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index 9e2afad1c6152..b7c1c0c92d0c8 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -49,7 +49,7 @@ void *dma_common_contiguous_remap(struct page *page, size_t size,
 	if (!pages)
 		return NULL;
 	for (i = 0; i < count; i++)
-		pages[i] = nth_page(page, i);
+		pages[i] = page++;
 	vaddr = vmap(pages, count, VM_DMA_COHERENT, prot);
 	kvfree(pages);
 
-- 
2.50.1


