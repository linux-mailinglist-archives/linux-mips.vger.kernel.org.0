Return-Path: <linux-mips+bounces-10413-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5E4B3043F
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81EEA18935F4
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8612FC033;
	Thu, 21 Aug 2025 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RC9GhAy0"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4866834DCF6
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806859; cv=none; b=nlM2DiIVu79aZgAGEOEEzUpNYzvjTyqWk48Z5xs3hWRCqXfQ3ZPiLTxxVZUjEthvjyEt/hbAEvgPQAHplwLprWjFNtyFN+gjKUVw+GbU1b6X+42kkfoGLS8xeajQBQs1dWBZ7WWuEOUP5eOA5gsAmNbiZJHl51B32iQb/JWyWfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806859; c=relaxed/simple;
	bh=+tsaq0kMmRCBgLfPZThux65EZrTtOKARiF8G7W5lNZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qd28tKxyozM8amxr33A0YbptU88Wrh4/3I+4pW2ljUKaGkHjyhuxhV4LySZj/EVOPSRIVP86H1D/Go+96Rk7/NdqJ3YJQwmjPnIj/71yGkz0LS+LEIk9r0N2b8TygeqdgUFCsNbl0GaZFDAsrswpqFbaThOE0nbZHDe138a5hb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RC9GhAy0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/kmddABpvZJu5K+QD662cz6jOGE1r8xokeQdlRgepQ=;
	b=RC9GhAy0Ari/wIzH1+vnrQdidp8XhGEojweP+kuUlme+rPT+dy2a+yPynzkKcWR7/EN9lr
	2UqAKEyzOfAq94O6JNrx2jVCvfbVMWfV99uIbnEGyS0FS7Kf7fEVTQ5ea0FgM3hisUXfoP
	jBuX0655SWNAygvc1ZAd6brApYSgKaU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-7ccYYZdxPe2cZWyrHHl_tA-1; Thu, 21 Aug 2025 16:07:34 -0400
X-MC-Unique: 7ccYYZdxPe2cZWyrHHl_tA-1
X-Mimecast-MFC-AGG-ID: 7ccYYZdxPe2cZWyrHHl_tA_1755806853
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b9e4157303so922428f8f.2
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806853; x=1756411653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/kmddABpvZJu5K+QD662cz6jOGE1r8xokeQdlRgepQ=;
        b=ZOHKz7vFYm95djiZtw0E6yZAymr6G2b0WFmm3/u/G4eYizHeTI/2mvYnIN7M5hh+6h
         pG0H12XCS+0WyQWoCAtoWIo5R3Qqo8A9ADNyqrFe2sWYLbvXvVNQXr+zjW3uaGCHZICh
         ghjyBv0FzHrCPtlzaCRDrs0XOqo5dylOeBeyO/Y6/9AE8R7nrvlcJH8zKiMo69qOt4sV
         /aHeGDiqLyjoax5FRGm15uqviwSnuJTF3Y9YNfEKQyfphWJ59NhNMSwgPRN0iEH6LEUh
         rSA9ZgVCcuRFwteXD4bCf4KYHIQ5PK1npSFoNvF8CzCXkCAOnmEg0MKOjmJ+ONBFDSA5
         Z4BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNwEo3twP14rA1L4XvJsusM5AgtHxdOMdwodP2wV4aTHF90ynh/h1bdbptd2SvJKgxHGQoYCqflFzM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ICpWzRr5rsXT4fexcuDxnR8L2ZV79l2vlzVheQxhwUTq4FeV
	Owdf7CQLDQbJdSst7/e63AYNeJGYRTAnfgZcrXgHchg/eMmvURSPtw9D7g+do55RoiFvHdE+Pa2
	OHAntDdoEuzuoStwdASLU+qKWYjnYnYuBJyP9yw52kAsQCKEaFgmr9yJ9ky4Pq3k=
X-Gm-Gg: ASbGnctBgJV51TttoiCWHLJ9BeKeqOdZr3XDhwsV8CMxQQ+U51HsxjVDAywQmFc8lsb
	6whly7W/ZLoc2KAxLgnRaSewvvG6mmCVsRW0bpmIlntdxAtysrAlIaYvGHOsuYkSA8VRGMwQFGZ
	DLMbdrRfJyqSm3u7RiQZMGcfH7JPLjDJWMPQZSnOfk0voQ8uInGcsOpTykQoNlKyVFmhSYxBiCY
	yZa1fVtr+3HVkTITO+CqzuBWddd9Yfe6Wm+6iH3ybn40Ulmb4TpnV6B4QIztNLQ9gdLrawq3F/Y
	NbTZVHiXxvQ0o5G/rbYU2Oo0djx7YaN9gS51XlCwH5Ld7h37WY9x7WQMwkL9vvqdgvBzv7Mg1by
	vNGWC2yivgQvHKxC2oVx7Aw==
X-Received: by 2002:a05:6000:2dc7:b0:3b9:15eb:6464 with SMTP id ffacd0b85a97d-3c5daefa9e0mr244718f8f.15.1755806852625;
        Thu, 21 Aug 2025 13:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbqF8V2lF/CygktHxSJZNB7+pmyneW6nxhnLwTxWefpTwvecQ9FG1LkYH8lxi0WUYYPrMQFQ==
X-Received: by 2002:a05:6000:2dc7:b0:3b9:15eb:6464 with SMTP id ffacd0b85a97d-3c5daefa9e0mr244660f8f.15.1755806852102;
        Thu, 21 Aug 2025 13:07:32 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077789c92sm12629958f8f.52.2025.08.21.13.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:31 -0700 (PDT)
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
Subject: [PATCH RFC 09/35] mm/mm_init: make memmap_init_compound() look more like prep_compound_page()
Date: Thu, 21 Aug 2025 22:06:35 +0200
Message-ID: <20250821200701.1329277-10-david@redhat.com>
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

Grepping for "prep_compound_page" leaves on clueless how devdax gets its
compound pages initialized.

Let's add a comment that might help finding this open-coded
prep_compound_page() initialization more easily.

Further, let's be less smart about the ordering of initialization and just
perform the prep_compound_head() call after all tail pages were
initialized: just like prep_compound_page() does.

No need for a lengthy comment then: again, just like prep_compound_page().

Note that prep_compound_head() already does initialize stuff in page[2]
through prep_compound_head() that successive tail page initialization
will overwrite: _deferred_list, and on 32bit _entire_mapcount and
_pincount. Very likely 32bit does not apply, and likely nobody ever ends
up testing whether the _deferred_list is empty.

So it shouldn't be a fix at this point, but certainly something to clean
up.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/mm_init.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 5c21b3af216b2..708466c5b2cc9 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1091,6 +1091,10 @@ static void __ref memmap_init_compound(struct page *head,
 	unsigned long pfn, end_pfn = head_pfn + nr_pages;
 	unsigned int order = pgmap->vmemmap_shift;
 
+	/*
+	 * This is an open-coded prep_compound_page() whereby we avoid
+	 * walking pages twice by initializing them in the same go.
+	 */
 	__SetPageHead(head);
 	for (pfn = head_pfn + 1; pfn < end_pfn; pfn++) {
 		struct page *page = pfn_to_page(pfn);
@@ -1098,15 +1102,8 @@ static void __ref memmap_init_compound(struct page *head,
 		__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
 		prep_compound_tail(head, pfn - head_pfn);
 		set_page_count(page, 0);
-
-		/*
-		 * The first tail page stores important compound page info.
-		 * Call prep_compound_head() after the first tail page has
-		 * been initialized, to not have the data overwritten.
-		 */
-		if (pfn == head_pfn + 1)
-			prep_compound_head(head, order);
 	}
+	prep_compound_head(head, order);
 }
 
 void __ref memmap_init_zone_device(struct zone *zone,
-- 
2.50.1


