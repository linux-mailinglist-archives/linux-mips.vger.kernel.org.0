Return-Path: <linux-mips+bounces-10438-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE65B3055C
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD2201C876B6
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180BE381004;
	Thu, 21 Aug 2025 20:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gfRnDWql"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041DE37FBC0
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806929; cv=none; b=XTCovUkTuSaVQeTm5tRtqtKAmZnmwDKkHcDaN+TG2tiSIhLXdFAqkTXuqD4U6ezz32s1E9TrMaugiynAPOuSH8ZhSOwl8zTwi6iWRgiB23yRFEBnRvIs9doWZCuNf5Nhls6fTA6BaiGwL6HnasXcg8NSgAYAiaE0x7stFWu1G9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806929; c=relaxed/simple;
	bh=izYuZWtM9expuJ4aw1W3JEFW5k9djBINp3Pti4HydYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SNAGz+dyRl/Dth80sbTSD58wezNH2x5H1kCcOTwq/HZ5Y+Ow9MUDybTINaAuDbieXD1Y9KTdsLoGgG5WJdPBoxy+IFRldg10UO7gV5hWknloJIGI9Tt9CQbK1S9Qwpaouz+IiAym/IPioEbFC/IiveggEqKke5jIuMiAiLsHXdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gfRnDWql; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
	b=gfRnDWqleQo/tZ4QAtrPQMKR/aUg3yes98cmHPGjoTSRneXIVL//IQrG0SWTbax/+5Iz/9
	ozw1hgbIbhMaJIcm3hzSqiWVfzGZ7WLufLzSMczJFDkBKFPEMw5zlWpb1ZFHB2I2YPlnlr
	vg9CY6UzsMjU9WGLhao23urW1yfcuAI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-hR3pJ4L-Nmu2M8mvSFzL4Q-1; Thu, 21 Aug 2025 16:08:44 -0400
X-MC-Unique: hR3pJ4L-Nmu2M8mvSFzL4Q-1
X-Mimecast-MFC-AGG-ID: hR3pJ4L-Nmu2M8mvSFzL4Q_1755806923
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3c380aa1ac0so519651f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806923; x=1756411723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
        b=HcXZfbGTD9KkKgewGbnZGmx/YRLjKSb270IfMJdx847Jh1g3TCIyyZseYq14YJZdaN
         fWii7Al9QXVd/6wf38/3lfJHP+bCwk+TZU5sGptzTLte4Rq9dT5+xLQBiFNAYwwEu/He
         HYmMtWO/phy+8hAa1AUPO8fBFGmhOBJlcnVfCow53ORzCJAblfFCZ4+gcyRUHAACF2Zg
         A+8EQEv0KMIGK64V2R8MIidbMd/LR2UMlJyOAh/EwXSTQ38L0MLbOni7v5lYHR1erMZw
         7niTjGZafuaElMq7e3+83dLoskvFfmGy3/7QOdG4l/7tKU2MHnPVIfpnCIEkWUi+RRmx
         iwww==
X-Forwarded-Encrypted: i=1; AJvYcCXMChLJhP87QyTisqfXLPkcOx/9fQKVzTT3InOMSNdBrvHlPkaCTgT2wcvibu44jJCPcq+2Gw65/V7R@vger.kernel.org
X-Gm-Message-State: AOJu0YzLXY+S+mfFenxduUm0NHnhlNHGKoN+N31a7hn6G7FIGCjcORP3
	yD3UrqfyqoDbxqnRWkqqO55nd8o0KfA5RX/oXeTi66y459Xy61gHUdFSaII+k1v0Y2pyfRD3SYs
	YX90u56u8UXypjdLErZvC9EBaaOa5bBNBshg83AikOJMynQApOnyIXwXlVzXySn8=
X-Gm-Gg: ASbGncuKCLoDELnw7Z2Be+sU5vQilIKJk1A2L0wLbWSL1H5lNzWXu6/yfUvEd5VOhU7
	zYC+78KtO0z0QD6YUtVBxbnuBeaJZd/zMF8XQTFP0xQHBJmWKyxZueJstSHw2U54NDQ6i1Wk9bZ
	Pti+ZWeO0ddrmO2CT59kQnHWfcLdrzuQi3jq5PBB66DZkRHglKU6DuWDntA5J6/sm8SGKPAht4t
	hlxLvSMiAr+9hwnPpsp0ai349auS3SS1oVTa7pLc6JHk1ZWMa+ykR6Fy7mM5YhDE574DPwkqzqS
	Yo2igmWDfT/7/EhbWe/r9szQe7af8YBjtZR9K9ThjRztFcaT04Fual8yu+FEUiWPFPDfYmvhihR
	LLr0eUA7V9t13YWOdrXF3aw==
X-Received: by 2002:a5d:64ed:0:b0:3b5:dafc:1525 with SMTP id ffacd0b85a97d-3c5dc7313famr204695f8f.33.1755806922963;
        Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnHzRKC08dohUKQD/XdldMc6IWYVddiLtTh8Yidep5vx+5++gzVG23SiimMwYZ+HldR36Zkg==
X-Received: by 2002:a5d:64ed:0:b0:3b5:dafc:1525 with SMTP id ffacd0b85a97d-3c5dc7313famr204645f8f.33.1755806922505;
        Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50e3a587sm10028205e9.18.2025.08.21.13.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
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
Subject: [PATCH RFC 34/35] block: update comment of "struct bio_vec" regarding nth_page()
Date: Thu, 21 Aug 2025 22:07:00 +0200
Message-ID: <20250821200701.1329277-35-david@redhat.com>
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

Ever since commit 858c708d9efb ("block: move the bi_size update out of
__bio_try_merge_page"), page_is_mergeable() no longer exists, and the
logic in bvec_try_merge_page() is now a simple page pointer
comparison.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/bvec.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/linux/bvec.h b/include/linux/bvec.h
index 0a80e1f9aa201..3fc0efa0825b1 100644
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@ -22,11 +22,8 @@ struct page;
  * @bv_len:    Number of bytes in the address range.
  * @bv_offset: Start of the address range relative to the start of @bv_page.
  *
- * The following holds for a bvec if n * PAGE_SIZE < bv_offset + bv_len:
- *
- *   nth_page(@bv_page, n) == @bv_page + n
- *
- * This holds because page_is_mergeable() checks the above property.
+ * All pages within a bio_vec starting from @bv_page are contiguous and
+ * can simply be iterated (see bvec_advance()).
  */
 struct bio_vec {
 	struct page	*bv_page;
-- 
2.50.1


