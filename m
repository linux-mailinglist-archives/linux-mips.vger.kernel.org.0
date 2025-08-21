Return-Path: <linux-mips+bounces-10419-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3778B30493
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9255A3AB422
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EFE35FC2E;
	Thu, 21 Aug 2025 20:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aF4HxFg5"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66E35E4E4
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806880; cv=none; b=K5APVoqSeRH5Edb8cd+t3yiFNBmYx5zuWBcQP8JOK+8KJM/je7+vJ+U7oqvjVhtpWnBiXZYLQRZSsl9oCD2ICw7fcSh/ByAzdxeZmoFmqp7in4Wwq3+42A8g+hY/8QaFH057Hf9OclNTRIv9ezsEP/PYm/00ul8c4lcKYCYV+g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806880; c=relaxed/simple;
	bh=jeuBd6AEd//7dLky0U/9/K8CcfgAIF74DmeLEQ7xh6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzf4qT4eLFy47oo8P/gk5pmD6Vqpx5tS0TqMDqlTztN57XKoS/5MN+98UPGfGyxEcG++8o5WdR4ei8LuKN4BcopEhsP0RUu2+nHvfjV7K+1j9Yn6ENxdvv4uIhv9tdFkTAlTrGHZ2ITpsrhn1GcGZCn6zMSQ1+l1vO32AKaVpTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aF4HxFg5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=;
	b=aF4HxFg5JpXNVeLFIw/OyHbb2D9mmnfx5a8LqUFhXI/7ebtYoPoJwpgfA7mJDYQhTXCXmU
	DYgYfvUFxxAKS6LcrbfmGHWzYOb248B7yUp7f5ejrYXDWfNsNabMRylz1fmQOpYvDl8/nE
	13Q5MXPSHqaRtyiK5AfLCwk1fLYn9a0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-b14qVgjoPiqZps05g-nVow-1; Thu, 21 Aug 2025 16:07:55 -0400
X-MC-Unique: b14qVgjoPiqZps05g-nVow-1
X-Mimecast-MFC-AGG-ID: b14qVgjoPiqZps05g-nVow_1755806874
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b0caae1so7449315e9.3
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806874; x=1756411674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=;
        b=uqvLMoQZ91l7sD4DLcOei5WW02FiIawwFEDryvBSo5cpuyRYEPIYTpK7jNo8GgcbjI
         WFthcNG+fUXXAKXH4bJSwi61bMV6VhN4XdyA7PoI3dfv75OUjhTE+X0LyoCa1KbwfkY7
         Xo1QCmigHS/tLO23MxsVYQnGYjcbDfytSfK3kouKLtoPlznwAInFirusWWGfs0wDFfEQ
         DlRN5ZLmn6Q6k/FfZsS+ebwl5YsXOTzVJ32F0eQ2hEmAkZLX0UwQmO/4w7wnazURLf7w
         iLl+sjNw9UuPAB+mdXd4ye3ukdOj5odA4l7/mPe+tFXL6RcIrnH3jZXFoZm1+ljvmxW3
         ZLgw==
X-Forwarded-Encrypted: i=1; AJvYcCVRrjvzLPBIO2M4eewAMmbOW6cRVreG8IMEjXjPkXf1gWrlVtZ9B6KiRb3u+pxfLvIabj3eQQSlQgRJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwOBnFh4QFzHnkWVMZBFGMpRx3pq95VClcY0ZnZvSAC4r8RruqJ
	KorkPNgNw4U9DPyLrqJdPFrSheBLlmIBNus048kW1o/SpCmW4KBjHjbUKPfwRlLKaMZMBvk+v3l
	abMZ4MvT87TO0Qj7TqtOcVEqF4P1ZcfasY2OX7FDMC5gRF9/XURJjfUh2e1ErRnk=
X-Gm-Gg: ASbGncvOoifsxR6iLfPG3arBgQr97g75plbr13omlUg1fa3R1w/fV6FXGEP+SS4A2rn
	HrdD/ORrniSuEeESNCcOIafm9AKYQCMs5RPZNcwAwFm7jSoHb+1p0h1H7Q/ow3WUtCQ6v9lHlKI
	R15eo9e9xHrFLhYzfAC6Q5W7cNpuyo92pHhvv3YZcgc61vNIVOw7H9QFxQHpnTAx4SlDXbIHg4O
	rp1tjuXp7hoTQUsV8hUePLwKkmmAUGma0PDLLA8rDG0EAeqC3P3Sq9Mm8Tr//ShEGyY5qf6pDu3
	Cr4dZ7URR6L0wSadjA24GIE/CygPRgmu7RoBHMSifwrJqknwHgfkfygspFDIB9ZyPat0c8bAR5h
	TdXjfLBV523a+WYClHt9I/Q==
X-Received: by 2002:a05:600c:1388:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-45b517d40f2mr2554315e9.24.1755806874317;
        Thu, 21 Aug 2025 13:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo8ikhW4DoWVw60oDeAXqMRvn4UERlcVawLCjGel2pacwRc1R1ONhYVQm5EzuW0YIJQT4FDg==
X-Received: by 2002:a05:600c:1388:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-45b517d40f2mr2553905e9.24.1755806873856;
        Thu, 21 Aug 2025 13:07:53 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c07487a009sm12690403f8f.11.2025.08.21.13.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:53 -0700 (PDT)
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
Subject: [PATCH RFC 17/35] mm/gup: drop nth_page() usage within folio when recording subpages
Date: Thu, 21 Aug 2025 22:06:43 +0200
Message-ID: <20250821200701.1329277-18-david@redhat.com>
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

nth_page() is no longer required when iterating over pages within a
single folio, so let's just drop it when recording subpages.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index b2a78f0291273..f017ff6d7d61a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -491,9 +491,9 @@ static int record_subpages(struct page *page, unsigned long sz,
 	struct page *start_page;
 	int nr;
 
-	start_page = nth_page(page, (addr & (sz - 1)) >> PAGE_SHIFT);
+	start_page = page + ((addr & (sz - 1)) >> PAGE_SHIFT);
 	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
-		pages[nr] = nth_page(start_page, nr);
+		pages[nr] = start_page + nr;
 
 	return nr;
 }
@@ -1512,7 +1512,7 @@ static long __get_user_pages(struct mm_struct *mm,
 			}
 
 			for (j = 0; j < page_increm; j++) {
-				subpage = nth_page(page, j);
+				subpage = page + j;
 				pages[i + j] = subpage;
 				flush_anon_page(vma, subpage, start + j * PAGE_SIZE);
 				flush_dcache_page(subpage);
-- 
2.50.1


