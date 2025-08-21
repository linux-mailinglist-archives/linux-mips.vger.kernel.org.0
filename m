Return-Path: <linux-mips+bounces-10430-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A46C2B30513
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27952AE4B8A
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3122A371EAE;
	Thu, 21 Aug 2025 20:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iR/oSPSg"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0CF370591
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806906; cv=none; b=SH/cPFmMUUOLEL4sCoRnODHHxGrxrFcVJ/ffHGwlRc1EftO7yMHSWnl8AxnnDodYdtRELqeIqp0hiSOs213pfjThmf1STn3g9J4E2eFCad+iQvKb6s29jda+yH1NuOKb3txSOI6Jy5nGefWHcDFyjsHtfEhL68uQveNLokhl4s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806906; c=relaxed/simple;
	bh=sP22NtXAK7RUwr0f+hWxIzaLt9EECIyrZ2EEKfR5Am4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/lUuxtPTRNdvT2o5N09yWOfs4br44byvRKxrTzDrPGzfZOQydJVIR4ourpp115SCTgYVFghdfG/ON4VHhRSVoEY6H7T+laAUt2ZoGULLvRwtWqjXLYPoCXC9o2KuyuhqUIhbH6eQ95pa7uHOBASDynq9Ls/5hSlh1qG/7MRvKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iR/oSPSg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5m4ogAvLOK+AKMqlHwhkjmyVbS/4gGgmBykcdwEFmjg=;
	b=iR/oSPSgotn3w7gSZ8IN65NugEH7zKymwEGExo73kIyx4LvVBZOIOc/ya0c0PEjV6+4A3E
	Od/E1wJsSFywd4SfXXGIU7VWbOiP9y6Hd/5K3vin39dj7b2jDVC8PdKpp+bppsJZVTmIQB
	O8IAiquQYtXosa19I2ZbFoxbK696qzU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-RQr7kV9rNQCumf69hsQeTQ-1; Thu, 21 Aug 2025 16:08:21 -0400
X-MC-Unique: RQr7kV9rNQCumf69hsQeTQ-1
X-Mimecast-MFC-AGG-ID: RQr7kV9rNQCumf69hsQeTQ_1755806900
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b05b15eso10523135e9.1
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806900; x=1756411700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5m4ogAvLOK+AKMqlHwhkjmyVbS/4gGgmBykcdwEFmjg=;
        b=ciJJBS+aVdekGtY2GQn52JW9wK5yYB3KtSS87WA3CjRlgUcxUDooJtpXNPmN3evWD+
         bw7ykcC5d1Uj01KUdtVjkyUmv/aWUvO6r3EfKwOgpHG4nFwssIXvWE5C/77ECeyLZyE8
         CVaqA2lfSVkiDDQEozOfKzuI9AUqZMgF83N6rn9h1ML4CEV1QtNJysqkS317Mh1PFUla
         onM2zistqX9Deag5/LC4EPycWCjYzRpC61EFlMSRcyu7QObs6jd9z05feRc5Q0pw26Yf
         1TQCQH1uBgQhaqik0p43TiVsZukpLh6JY/aRwUgvtZo71Ju2m+Ot5Vb9jI4UPmq4EwpM
         x80A==
X-Forwarded-Encrypted: i=1; AJvYcCWfCcdkgjsvF+/87gBa8puS6Qy+Wn6J7C34bgSkrn8n9KsTfDTcizgQDyltmv5sQZh6M2LENuAVOsPb@vger.kernel.org
X-Gm-Message-State: AOJu0YwrFJLDxYcYuKGUHG4XAy0Jns04GoxTj7vKZ3Fko+BKA3icLM5Q
	zYYXLPPK72J6+uUnVoCu8L3xI6mztkyDAzws+Vb2mfKFOJPgM4+Zs5KO74UrITycQeUEraoqdU4
	CjprttjdCqIPLhXt9up90JQhLYp4X5suun0urlc1NUtg+wwetY9gQjCrsWeCYMTo=
X-Gm-Gg: ASbGncvm1GN1W1qSURSCvtMWtF1wI1HKFKkTkHh/A2FnNXw2HRrZiUuwBy0qjTT0vID
	HsZbVWH+vfjthf2xXurKgdMcy5DByV6gdFKF5drOi/FupIP+CiU1j2DAQHPz5oZmVi4pBZ1uDaY
	/IZgPGV+jpye7/0cqAvuOXx1JAAFnQzmlg45wXkou0PGI+30AU23TPwhsStWfY1XgeK08F3Q1EZ
	qcZz36zYypSX6gWEJDz1/+C0kRPJWFHmarnEOy/OaNw8xlLng8mlQtJPfekmEfJmBU7wIqci5Qi
	0vHnGUVY/ysyf1XADGPTvpUeeLvGiuCBJYnAYr+GZchitUQFLL7JB8BgXBPhf+pFgJ5xtYZn4uj
	Ef6sXml+TguS3xjWFsVndmg==
X-Received: by 2002:a05:600d:15a:10b0:458:bc3f:6a77 with SMTP id 5b1f17b1804b1-45b51f2fe8dmr510385e9.2.1755806900295;
        Thu, 21 Aug 2025 13:08:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpV2b3uhR/IYbmrTMgtg0gx1wkF4+JdBDenNBBSMhYf9nynPUCNMa8PTADPxo4/liFiw6TqA==
X-Received: by 2002:a05:600d:15a:10b0:458:bc3f:6a77 with SMTP id 5b1f17b1804b1-45b51f2fe8dmr509915e9.2.1755806899756;
        Thu, 21 Aug 2025 13:08:19 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c07487986fsm13999227f8f.1.2025.08.21.13.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:19 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
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
Subject: [PATCH RFC 26/35] mspro_block: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:52 +0200
Message-ID: <20250821200701.1329277-27-david@redhat.com>
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

Cc: Maxim Levitsky <maximlevitsky@gmail.com>
Cc: Alex Dubov <oakad@yahoo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/memstick/core/mspro_block.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index c9853d887d282..985cfca3f6944 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -560,8 +560,7 @@ static int h_mspro_block_transfer_data(struct memstick_dev *card,
 		t_offset += msb->current_page * msb->page_size;
 
 		sg_set_page(&t_sg,
-			    nth_page(sg_page(&(msb->req_sg[msb->current_seg])),
-				     t_offset >> PAGE_SHIFT),
+			    sg_page(&(msb->req_sg[msb->current_seg])) + t_offset / PAGE_SIZE,
 			    msb->page_size, offset_in_page(t_offset));
 
 		memstick_init_req_sg(*mrq, msb->data_dir == READ
-- 
2.50.1


