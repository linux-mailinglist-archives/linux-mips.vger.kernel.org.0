Return-Path: <linux-mips+bounces-10436-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC63B30551
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6050D1701D1
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769C935336C;
	Thu, 21 Aug 2025 20:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eKP7XMSr"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FA637E91C
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806924; cv=none; b=tNEyEj73/7NtCB7HNeL+auzykOtxYPDqFdzPsOesuAohrHxPAYn/R5ljqiid+XyxG/5W7TVEYGs7aeNj6QPbYNqQAFW8+4K4fzbDZcGkNiSNCdG1TaB8DhR2Mj2S/qyWU1ImYMvkL/PSKnc8p3Rnt3snnsdAgA24JQPJtOjtD9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806924; c=relaxed/simple;
	bh=tCsSQl+WRq69JZRVPLbubBOBHgSgQIUjNop92vdLyr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NNpNuE23bX6XkqXWOcjIJ1kvhTlAWxcsNu5m61hur3afWEJsvZSvXuO6txV3QpnfRhZ+eFl1rmbReS6o6VKW0mefCM/pjhwVvM5rgjCLYKHJkv8awaCKNiESv7T0n/UWmO4U8Ysud2qDTPAON6AXmO6tzCZvGLOkv7O2KCybp7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eKP7XMSr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
	b=eKP7XMSr7KOy3dO032vYUt593uSWd/F/NgSxCRL7ugc7RzVdNtzgoYDWE2MHUU3NJEpF+o
	kIc2CH/FvdUqBCduP4M73YGPZzf/qA1Qrzx0BD2ULlPYxpJ68JyOBHU6esM2Bra9vpWqZx
	tXg38RZ1YIHgczQCx7JdPrFm+l9AUko=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-s4yR353wOuCUDJzpn-cfqg-1; Thu, 21 Aug 2025 16:08:39 -0400
X-MC-Unique: s4yR353wOuCUDJzpn-cfqg-1
X-Mimecast-MFC-AGG-ID: s4yR353wOuCUDJzpn-cfqg_1755806918
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b9dc5c2820so445755f8f.1
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806918; x=1756411718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
        b=KNebIQKGE2aByqIfrcDDHRAwPIeCtEEkML+c9QgA2bUfQwbp12GyWRQgAHIiXCJFgQ
         3ZKcG25Fzpx4dzTmUpoya1GGdwxin0QfClQXxpeH4EJSythsC1Ad/KLcoA5iVhLIacsN
         Tw5WR25AA7+gTbjOs8oDLMJbmvZkYHWG/3VidlTQjUAFQAnA0m8WiyVSu6HE+OzN9qLZ
         7JDTss5OAP6RIS4VtRvpT9Obi9+vNcx+Pye4eFOAyz31ms6qrHoejQ6bHgn3BK9cOfAk
         2bKga4aK0y4a7e13T7srpLRl4okJfzpFdZ014HvAW4MJgHtDEZbl9tkE0uaLhT/tNe3k
         42Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVNVw+1HA+3YryTlMvuuE5rNQsfmX6C3r8C5KhSyXDF6/rt1Ie46jZgeAktEWIDujLnw1E7es8e7tL5@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQJES9t/JrY+0Pyxlxnnnq5V5eWQDzC1K7Ulz/umCLCOZwzYt
	oZ6x/VxbJvsqRlUTLem3EbyoqLOjWAOtOLqFRlmXIc0/3f3DQSmpuJVQMxWgvJiod7U4MXvF6pH
	LvbTTz/rYcIwquQpcXsHglbiSJks1Krmln/EhhPRhsQB5nhS0Gggavpn8F2WwH6Y=
X-Gm-Gg: ASbGnctzdLKMvZA7p8W20iwA8OkGDnxVNnFsjT3Kjv/bQWrbFbkTHZDGTg64av7mhgm
	5Rxw8kN+eKnzqZ4WVHXaKItmID+fAaLcjy7CwJjDvAzNnUMqnq/jfckYuy5Yc+mqRtWnGj+NI7M
	zDEXEffkIBd+jUZjolRkktRdlidFdkE5VCh0sXkVje9fA6+/b1Oby/gr7osMhecJhkPurqq/IrO
	joGQuP0l9DVH40fwRWDnUPkCvfNisUd9b0Qcmax800hIxwTviDOH8ifn9xYFO4NMxzdGwZSTr8o
	pkVklAUUpzSWamAzu7y8nqorWHYaCP4wsxp/YRuDHrL6Iu9Y2ARigBMgKwZ3eHraEeUYRaQuLIp
	1a0oYwDiqF4Z7VmjyvH7Pzg==
X-Received: by 2002:a5d:64e9:0:b0:3b8:d7c7:62d7 with SMTP id ffacd0b85a97d-3c5daefc298mr218307f8f.16.1755806917852;
        Thu, 21 Aug 2025 13:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETBfJ8klmP3LMs+G3FmlUfLKA9Qlb/rzelQ5gyETYamNwKefh2PCq6Da3p1XS4Ia+K1NPGrw==
X-Received: by 2002:a5d:64e9:0:b0:3b8:d7c7:62d7 with SMTP id ffacd0b85a97d-3c5daefc298mr218279f8f.16.1755806917364;
        Thu, 21 Aug 2025 13:08:37 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c4ccbf04fasm3355197f8f.7.2025.08.21.13.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:36 -0700 (PDT)
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
Subject: [PATCH RFC 32/35] mm/gup: drop nth_page() usage in unpin_user_page_range_dirty_lock()
Date: Thu, 21 Aug 2025 22:06:58 +0200
Message-ID: <20250821200701.1329277-33-david@redhat.com>
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

There is the concern that unpin_user_page_range_dirty_lock() might do
some weird merging of PFN ranges -- either now or in the future -- such
that PFN range is contiguous but the page range might not be.

Let's sanity-check for that and drop the nth_page() usage.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index f017ff6d7d61a..0a669a766204b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -237,7 +237,7 @@ void folio_add_pin(struct folio *folio)
 static inline struct folio *gup_folio_range_next(struct page *start,
 		unsigned long npages, unsigned long i, unsigned int *ntails)
 {
-	struct page *next = nth_page(start, i);
+	struct page *next = start + i;
 	struct folio *folio = page_folio(next);
 	unsigned int nr = 1;
 
@@ -342,6 +342,9 @@ EXPORT_SYMBOL(unpin_user_pages_dirty_lock);
  * "gup-pinned page range" refers to a range of pages that has had one of the
  * pin_user_pages() variants called on that page.
  *
+ * The page range must be truly contiguous: the page range corresponds
+ * to a contiguous PFN range and all pages can be iterated naturally.
+ *
  * For the page ranges defined by [page .. page+npages], make that range (or
  * its head pages, if a compound page) dirty, if @make_dirty is true, and if the
  * page range was previously listed as clean.
@@ -359,6 +362,8 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 	struct folio *folio;
 	unsigned int nr;
 
+	VM_WARN_ON_ONCE(!page_range_contiguous(page, npages));
+
 	for (i = 0; i < npages; i += nr) {
 		folio = gup_folio_range_next(page, npages, i, &nr);
 		if (make_dirty && !folio_test_dirty(folio)) {
-- 
2.50.1


