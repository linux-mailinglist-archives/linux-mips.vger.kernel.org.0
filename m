Return-Path: <linux-mips+bounces-10415-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF3DB3044C
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C0031C215B5
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618AB34A32D;
	Thu, 21 Aug 2025 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YBm9EXR/"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539C2313554
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806865; cv=none; b=fn7lUn+HmChMUF0vGV1zxiwcYSf7ZTHeJAVg3dNPR+HGM5UYJhKPWzyp1aE7/R/WehwUT8j/PnzQQ5H3dXp9Yp9NMHDmvbDnmlwAAz5UAgo9CZ2RRzOLlm9bfUCKmNRTH2GpsM4ZQWTBNfX/MymsFlKMvFnktv+aqHiwo0yIIg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806865; c=relaxed/simple;
	bh=XmsSbVhT3dGsaRmtyroJ024d7WMqPWbEWQJfIPHhOJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urrHbmPar6KQ82RkVDQpsdk8R6YkdnP2TJcJI43O4QkD/MOTr3EDVzaQYJ6X8io4PpjRgHtAD4kXfdvAj63h2p/551KQQuk5kMxQcoRu7cQKQ2GZK7Cqk4avcrgZgmA9nH8/Zt9kaMares3xG8Q0rLI6MOzrixo3TvRaFaVIEHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YBm9EXR/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=;
	b=YBm9EXR/HmeipwW4WmVjWe76Aap9pkGcP63uHwl13JHG9suLg1dqim3KR7+bY3tx3LEkhm
	dZ6wjHWQ/HFKpCpHwmYFVRsGVUvJZMyxr4YyQxRNmFP3dfuEk/jhnd1rN725RUcDE55n7u
	eem5OiDiPB92SRaHf2cXz/8+Kq42t40=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-1VOwZCndOk2FKJ3hOFjPTQ-1; Thu, 21 Aug 2025 16:07:39 -0400
X-MC-Unique: 1VOwZCndOk2FKJ3hOFjPTQ-1
X-Mimecast-MFC-AGG-ID: 1VOwZCndOk2FKJ3hOFjPTQ_1755806858
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45a1b0c5366so7717875e9.3
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806858; x=1756411658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=;
        b=OZ40t4m/BILTFofN77wu5uHstoaA/ER6mImsQIYDYEj5zSHjzKo6CUyLCeSACuOZOr
         pMHkodyAbJiU1WOQypypbOruZjeiHiGElnVOK2DneQoKJQjERIoTV6YpurhZBOlEXqCr
         aOV1ds911KWccIs7a01JrwmZny2LPvX9gq2bSQHCeLkwufy730bK+BdVGu5pHNOslfBu
         4mfG9n974eE2ah24CCJMS2SgwG9R+gv2fl+ei58g8YLpU9PP4uZaodf8mUyjsw8gbwTq
         pS7WVKaGURHwG4W+3Tho4Lif3FGHbvL9QnVLZPcpT1QRoH0RwzJ0UZiwALjMtf/+4+rN
         2NRA==
X-Forwarded-Encrypted: i=1; AJvYcCWgOdiiAOuZSoyngar/tyvKaHs+dUoxCsXGiRxgq5KHsjrV0VMTxuX73N7TjgQu+AyouhOSonRVoUhe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxqh4Up0h15YhQ+2B2EjA2ELgqU4s3GXC2rd5PqKq0W/UBg+0J
	5Vm2ijpz+wmio/4iMF2kyJ2xnPMvWTuDal9LJCcAtlI46lps5JQv9/AIJDu+2AnTgtCTm+I7VDx
	1oizVfLAEmC57XIGKiFmTOBq/INrUcieAoWTV5TOS39JaURUkd8TpHtFKQbMyfn0=
X-Gm-Gg: ASbGnctU14YpjQWtGuUdIhgPUDQLcnzkPaFW+StYkqsi7d8XBcX2PIj/jnRJMOYKrPX
	U+ScSby2uL+RpHPZbk4p0T5qvyoKx45OFHic5QIVqFmSDTGVRQM9qiQ2bJeUGUVfEXAvq65MHI7
	XwBJOFbk+joVqArb7R91zXwgfgezIr0gbGj4/95T1n/iiGMkO7kOSc8jlSRBDKdHhcXl5dxaZEw
	DkvfIJ2HSOXDIHyGAxRI0mU8FSzYMmPaJfvvstZ1eJB8kDmiLdWgnwHQkOJV0k4Q9DFYoLLb+WT
	nY0fVdTIq96w5PTup+CO23AXtcWHDV8TUKkvmGbiXA3t8b0SL1G7FwrZHmBiaKah5g8WJvbj7rm
	Sp4eMOMvGiB0XNJkJP8U7Rg==
X-Received: by 2002:a05:600c:5251:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-45b517ca54cmr2646815e9.18.1755806857908;
        Thu, 21 Aug 2025 13:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlSU80KqPPviGOLp6CI40u/NjPujjG4FLCG6NoakJIlvY80lRDOTTm20w50mEKFuk0YjVSLQ==
X-Received: by 2002:a05:600c:5251:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-45b517ca54cmr2646245e9.18.1755806857378;
        Thu, 21 Aug 2025 13:07:37 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4e87858asm18672185e9.3.2025.08.21.13.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:36 -0700 (PDT)
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
Subject: [PATCH RFC 11/35] mm: sanity-check maximum folio size in folio_set_order()
Date: Thu, 21 Aug 2025 22:06:37 +0200
Message-ID: <20250821200701.1329277-12-david@redhat.com>
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

Let's sanity-check in folio_set_order() whether we would be trying to
create a folio with an order that would make it exceed MAX_FOLIO_ORDER.

This will enable the check whenever a folio/compound page is initialized
through prepare_compound_head() / prepare_compound_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/internal.h b/mm/internal.h
index 45b725c3dc030..946ce97036d67 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -755,6 +755,7 @@ static inline void folio_set_order(struct folio *folio, unsigned int order)
 {
 	if (WARN_ON_ONCE(!order || !folio_test_large(folio)))
 		return;
+	VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
 
 	folio->_flags_1 = (folio->_flags_1 & ~0xffUL) | order;
 #ifdef NR_PAGES_IN_LARGE_FOLIO
-- 
2.50.1


