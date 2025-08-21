Return-Path: <linux-mips+bounces-10433-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F7CB3051F
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74B601CE36D2
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A5537D5C4;
	Thu, 21 Aug 2025 20:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BS9nNoxB"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2061937CCBB
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806915; cv=none; b=qNrqoci4HKLfSo/veVSvOvInw6x9G7RJ4RkNyMnrInnZbhYuDKb1y0W6Ol773tmVGy4o16GyaJW667fkRWa5mvH4k2qpc7ZXWT6P8Foy1No40/wLd2nHo9B93YfaD7exHMdOKYg2Vcetbc1y33MxOLUjP/oIkDot1hfwV/1I2WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806915; c=relaxed/simple;
	bh=nQnlX0DDaNxbga/DhB7JLie8Amiy5HfSv4XT65Hn/xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jlix/SbGT5vhjZr2FhlzWS9TqfSgiDsWOv44qj8nt3HiHl4gkBIP7pHcWNX8qFqWWP/qMejNng87XmEaVw00yEUlTsBz/TqTEoImNyhJcPvDRSaxDediVl4FDWAXzFcH58EvRFzdWDywLnp118f1SA51zEanNjaIjFUNgk4c0/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BS9nNoxB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kuJ+10C4pYxyWPcGDJkWqMBAcRGmXje5KFYns7NWu0=;
	b=BS9nNoxB9LNSSPFEYuIj6zIvn4r+TeaO6EcutLDAI2N+TZRjgxtYH5/wZLG1XTFMzzLgb6
	EVdjKc95wOia8wCAcAI3BDFaX9voriZlZB0yk8WLb0quE56mnpxcq+hajTKfdNVPbVOL/B
	ZejxY1PnDdaiW1QnL91ujH/ddUtzGnw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-T15VFgtqPxW8gB9kOO6oAQ-1; Thu, 21 Aug 2025 16:08:31 -0400
X-MC-Unique: T15VFgtqPxW8gB9kOO6oAQ-1
X-Mimecast-MFC-AGG-ID: T15VFgtqPxW8gB9kOO6oAQ_1755806910
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b9e41475edso915774f8f.2
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806910; x=1756411710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kuJ+10C4pYxyWPcGDJkWqMBAcRGmXje5KFYns7NWu0=;
        b=E2AHK+LAzkbd1gplM7UwQLwKFhV6/2KoFQ9XAfVKhP+oTD/O4hVYnOQOHjOJUU0+20
         320jBIj+wju+ic1UwuA3kFesY+olg25DUfXzOs+eSS1Ra+KjQolIoqvTIDu9solz4kYk
         vLXPN+AQmHxIjiRFaF2GrwptcbiwaZiTdYpLjeT+tXZjFgIhjMGDuPLJEzhgzp2fZk7J
         JfySdhBC+CyPEBgHMMbRTqMwf+EADR3YrXM9jDlnqIiSCeLTCGDOwT+5djr6eG+kEMMT
         yBswXIFbJcH3rLhTMSjC9CY7C5se68AKMnzs9dAEF54qU7VfpMmH6AK2d25IbL5YAFmu
         o2dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvyYsWCsNHsr1TuWSx3Znahsyj26DZinzp8XTiEq50mTP6q8YcsrB/BNpmkVVw3qOjjjPPFd4keWtd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmo2WzQ+zQ5iMvXA8zJbW/6OK0jQ1K5pOmtUOU9SBzobN41o9r
	RauKpdFzOb06D6rO38X3vBeQ88WwJPK30Ip/jwqIn+CG6UZeS6OnxYMn/kCkkTsGmK0HfvJO6wH
	2BT/dqBvNtF0s5dWFI7QcX20DX5dIIk5EwVWXRFHPwPVd1b/YLPIHdvHFflvKBIc=
X-Gm-Gg: ASbGncsP9TEqXzDB6LS2hwiQJyP9WS27rHPQn1cdHhFnA38VMf+vdrSsIzGDN6vu430
	eKWwBWVyHLk6uPaps/U8dYZbA2W/GfCUvp53mQqX0OZ9b28DRieH5G+8r9pxbgawuQvfNX6+qsV
	MCLnzMQTD5eVWpbRezpSHGduRPQr1xDLAjSjd2wTTMwfM6DMLbGTujP1E3z2YBxcuAu6wsKmIoJ
	EEapaa6Qk8I9/fV/lISEzlHKwBXJTWmF67ir2g7mSZg3P3UXXeFf66FiDDuZzI7BpoI4qZe8/xl
	LQC/4Iy2G41pEcQC5ay9gkr9ZDQfSFEP7LOBgpgRgaS3e5TirFFVAuT3eoRe6eP97P3GK8hGNhj
	aXD2xakjhOCKSHyKZn41kzA==
X-Received: by 2002:a05:6000:18a6:b0:3b9:48f:4967 with SMTP id ffacd0b85a97d-3c5dd6bbb33mr155539f8f.56.1755806909664;
        Thu, 21 Aug 2025 13:08:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRykwWh31JVJGBkobbD9YNZEskJV981iF0h0FASAg1XfgxaqZA4MQnDyPntA4/emfIOpWurA==
X-Received: by 2002:a05:6000:18a6:b0:3b9:48f:4967 with SMTP id ffacd0b85a97d-3c5dd6bbb33mr155476f8f.56.1755806908930;
        Thu, 21 Aug 2025 13:08:28 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c5317abe83sm2432791f8f.40.2025.08.21.13.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:28 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Doug Gilbert <dgilbert@interlog.com>,
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
Subject: [PATCH RFC 29/35] scsi: core: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:55 +0200
Message-ID: <20250821200701.1329277-30-david@redhat.com>
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

Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Doug Gilbert <dgilbert@interlog.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/scsi/scsi_lib.c | 3 +--
 drivers/scsi/sg.c       | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 0c65ecfedfbd6..f523f85828b89 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -3148,8 +3148,7 @@ void *scsi_kmap_atomic_sg(struct scatterlist *sgl, int sg_count,
 	/* Offset starting from the beginning of first page in this sg-entry */
 	*offset = *offset - len_complete + sg->offset;
 
-	/* Assumption: contiguous pages can be accessed as "page + i" */
-	page = nth_page(sg_page(sg), (*offset >> PAGE_SHIFT));
+	page = sg_page(sg) + *offset / PAGE_SIZE;
 	*offset &= ~PAGE_MASK;
 
 	/* Bytes in this sg-entry from *offset to the end of the page */
diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 3c02a5f7b5f39..2c653f2b21133 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -1235,8 +1235,7 @@ sg_vma_fault(struct vm_fault *vmf)
 		len = vma->vm_end - sa;
 		len = (len < length) ? len : length;
 		if (offset < len) {
-			struct page *page = nth_page(rsv_schp->pages[k],
-						     offset >> PAGE_SHIFT);
+			struct page *page = rsv_schp->pages[k] + offset / PAGE_SIZE;
 			get_page(page);	/* increment page count */
 			vmf->page = page;
 			return 0; /* success */
-- 
2.50.1


