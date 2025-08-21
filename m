Return-Path: <linux-mips+bounces-10428-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6DFB304F8
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 060291881F94
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA381371EAA;
	Thu, 21 Aug 2025 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YRfBkWAe"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B45934DCE6
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806901; cv=none; b=FJZCG/t2obYyU6+zmSQy549sfEnfJpUezRB8a6uPUDjPV5u3jRxcdKQXjI90hgVp6do3KE6ai9laiMBgCkgUMvK0NqN5vaVTImFIHSwKE1KFY3Wwv13TeMrmDm+nPETr7VY/LBlp1vQ8KVpLCJEHS+4vpxy1R0WJi49FZofpqpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806901; c=relaxed/simple;
	bh=o0B/aIsMAhafmNCelOfWp+ALdEBw0Dyti3dxNNba1Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPHzc4A5t51XhikvOk1xPbp0rUkTVDODrtqtvF2T3Z601AtAWlv28W+pvtXoKj72ribpovaCG2QWEEqD+MYSWodcwLbnPqCfSfpF0Ye54FHeWVfl4+0IYnNPdYu3kXwHESsbw/bjZmKxYLbeti1+Z3u9bgm4dfBOC72s0yhfCz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YRfBkWAe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEz5al18caSg7WeU7/xaDhHrA43/vq8xaUIrOF+uMyw=;
	b=YRfBkWAeztOL1Q/SKT11ysj2K0fkgzFy4T9p1VCsn2hYwldVT+WCG/qOFuae39hBoXitjl
	2615ANOaT6SXZHc9usYxcLtHIP/MddL++5E1zeuZX5WlTJrgA6OKdmaR4MDwl5hXuVgErr
	mody1e/b18kv/G+NGAQs78nd6sckoLU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-WfMOH5fnPt-6EJr-BLI6hQ-1; Thu, 21 Aug 2025 16:08:15 -0400
X-MC-Unique: WfMOH5fnPt-6EJr-BLI6hQ-1
X-Mimecast-MFC-AGG-ID: WfMOH5fnPt-6EJr-BLI6hQ_1755806895
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b00352eso7029605e9.0
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806894; x=1756411694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEz5al18caSg7WeU7/xaDhHrA43/vq8xaUIrOF+uMyw=;
        b=MVTfyIhegKP3QOuAsVNYojeFS60ktgGyaU4I0paIXcWeC94wzU9turVTkHCdFALyS1
         sM3z41RBhFFxxFGDmP5JJ5JPdRRNYNrooF4uqEGTbI6cKaUx+FmtY/QiifGpo3LC4uIW
         j+SlFZms9dP73lOVq3Ud9ifCnNPpM9DEyrj1zosjVdGKUWG/RD+QFOZ1uUwgSTxHRrxo
         hNQAuhwQ/uJFs2lrLO/0hFLJrBAJRNX1LkaStvmftyTs7DEOyka4fRRNv012V7PiwUm7
         cqOiOyFn1E8my5dZ9a0dhCNQkTcMDn1g3r5U0gq3gKzJP0U6mi1XcfpyCaa/jfzedhIV
         9QSw==
X-Forwarded-Encrypted: i=1; AJvYcCX6wu+y04KSsnZtGxlyS5GCKQAPBsK8s85DxJ0cxHvGpM5j/2+ePihPEmFV849iBnEqMf8e5iVMaGbE@vger.kernel.org
X-Gm-Message-State: AOJu0YzWo7YmH+fTcyUsmkNz/Z7smubi90ZbwtGNIVpsu6bXnfSTi6/k
	hCiFuutAL1Qdn7OXYFniMBA1x8IVG/XWvo1/C6kMDwfespat2TwCAoka5pG1P0qsy0qg3zB1TQJ
	HkwF9EZSAQz5tUSQ7n8RO35DCZFGnPl6TTX8txxDUpy55mOMoYCSymjMjqYd8gOw=
X-Gm-Gg: ASbGncse2f/ToG7APnLbZuPjtu6xAShvFIb6B+1mEURi1H2en7Sx7ZsbFzovENKtSI5
	OPtvzwrhT93f+3e6jPNQg2ki2So/aiFUNHGJ0CovZ4kFM3aGmDoCPIYgiADkG61a99zFbwlj89b
	ygUfQp3MJCj1FM/U4hPHwLnSLamfnthKA40fyg06N3zPIlrRNJPJmxdDv/vzxcsj3sc5wB/gu3t
	0YPJoksg+1ETENC4ejxWpK4T5+FqwZ7XroTkKTJkJnczkE1jH2UbXxxM4Eeny3Ti/d+5cDkoHwq
	RuqPE3ikZZABJoxyg/LuAKIzLRFT5nIkSM6xZHNArmaAAAl3micPzMDD2J+UoUEboupo2leesD+
	j2Xd4zO6TdE73l320pQtePA==
X-Received: by 2002:a05:6000:18ad:b0:3b7:9c79:32bb with SMTP id ffacd0b85a97d-3c5dcdf9bd9mr215849f8f.44.1755806894497;
        Thu, 21 Aug 2025 13:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYrE9N2OTZOZSEOVxEUY9xhX4UsF8UOhI+5wOqBRpd/3VSIxUjVMLdiea20BiXkc+w3FSZ8A==
X-Received: by 2002:a05:6000:18ad:b0:3b7:9c79:32bb with SMTP id ffacd0b85a97d-3c5dcdf9bd9mr215789f8f.44.1755806894010;
        Thu, 21 Aug 2025 13:08:14 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074e38d65sm12982954f8f.27.2025.08.21.13.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:13 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
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
Subject: [PATCH RFC 24/35] ata: libata-eh: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:50 +0200
Message-ID: <20250821200701.1329277-25-david@redhat.com>
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

It's no longer required to use nth_page() when iterating pages within a
single SG entry, so let's drop the nth_page() usage.

Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/ata/libata-sff.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index 7fc407255eb46..9f5d0f9f6d686 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -614,7 +614,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 	offset = qc->cursg->offset + qc->cursg_ofs;
 
 	/* get the current page and offset */
-	page = nth_page(page, (offset >> PAGE_SHIFT));
+	page += offset / PAGE_SHIFT;
 	offset %= PAGE_SIZE;
 
 	/* don't overrun current sg */
@@ -631,7 +631,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 		unsigned int split_len = PAGE_SIZE - offset;
 
 		ata_pio_xfer(qc, page, offset, split_len);
-		ata_pio_xfer(qc, nth_page(page, 1), 0, count - split_len);
+		ata_pio_xfer(qc, page + 1, 0, count - split_len);
 	} else {
 		ata_pio_xfer(qc, page, offset, count);
 	}
@@ -751,7 +751,7 @@ static int __atapi_pio_bytes(struct ata_queued_cmd *qc, unsigned int bytes)
 	offset = sg->offset + qc->cursg_ofs;
 
 	/* get the current page and offset */
-	page = nth_page(page, (offset >> PAGE_SHIFT));
+	page += offset / PAGE_SIZE;
 	offset %= PAGE_SIZE;
 
 	/* don't overrun current sg */
-- 
2.50.1


