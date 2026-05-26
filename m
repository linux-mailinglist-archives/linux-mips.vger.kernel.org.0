Return-Path: <linux-mips+bounces-14737-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGKcCrf6FGpcSAcAu9opvQ
	(envelope-from <linux-mips+bounces-14737-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:43:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6395CF7B3
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96A49300752D
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 01:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E7C2D8DDB;
	Tue, 26 May 2026 01:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e52laO6h"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B14F292B2E
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 01:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779759794; cv=none; b=ZEuTAEBXgLq8pCuIir7YtIZnF1Y9BFgrXbU8jmq5UQT1AoxzK9cg2Qej151SgqppQlXhTTdV5YlyiFenpdYgqM22ejRfpI2auU+4FZ3XpUdNgiU0Vq5mMXXRpymhuB2NTjGVpRoqEfBXG4y1RvMIFHFTVrzyHvswGp+j/GZK0TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779759794; c=relaxed/simple;
	bh=VI0zks62ggJ5bvW95gYdfr9+mtw6zW6UrSfv2UUKqdo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=S3GFdYPsT1c1cTTKPNVnSyQW7Hv4dQrleO8D0BG/5tysWIAQ4/2CEDl3Hn0qSTyKsJSLwRfW9OUSNNT4a8SzQSGxDW3XnGLW8B6jPfc6UYaPUCk2FEHSDGoqzhjSCj8IvQzmq07NLI+jKjzlGg+8E9DpC10p129zd4YJEigNTBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e52laO6h; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso22473195e9.1
        for <linux-mips@vger.kernel.org>; Mon, 25 May 2026 18:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779759791; x=1780364591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j59hUSTZurEDKvIQbdcrfyIgjdV/+zUjcYg0DUWUwo0=;
        b=e52laO6hhVAvFGC+Lt+jYCW7DT+bhOPn+YWu2vadegKya8QWamPXmZwlS9LAA2AS9T
         wiB9tCaib7rctnwmtN60JfNS1g1uMH6HolTah8yOpe+LmxukG0dmhtr53eR19uissypt
         2xW7mD11zeWeT8+Ek9gBElygch3Z9lrLcZ3rfwMIIYDLHQwS9F7rFXIvBGn+UgdLublB
         5MYZ+V5IWIsNNwnt8nngL28NcgpBQ18RgFL3p+mb2e2RmUrt5rVsPKyvK2dr9LY8QO3y
         CwOeecBjwx4x5gpHcRbJAlegLDIYLIXGwpYETAeBD8tPlYbl2nh/4lf7qtgrrIh/rPwB
         BmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779759791; x=1780364591;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j59hUSTZurEDKvIQbdcrfyIgjdV/+zUjcYg0DUWUwo0=;
        b=KBLGvE1rcwTPjZGIqykjl4bVLQ5UBWZE5b4kTSFdw4UQUo0W8RmkdHi4ETgU+u/FGW
         cuMQxmUNjrJ7Yex1gr/B2qWfdAjbtwneALxuDSmBKb95j1uM6nkCJFdQeN/xkNmjWhKF
         4nB8GQtGonfIlG8nW/kWn9f+ZpArrmolrtvI9T2XmH88cbTLWAgEdh8r3FW8zs9TXcyK
         ddBuf8QZ9oTrbjbf/wXFYWH7lnqOir8TjorUsanVOIuvhILeXrCC5cQLU1wuCYHub0AZ
         /LKq7C2FRt5AS6HjdGTs+AjUuMUQeO3aKOU3A1ILdcK+H9bLTPndQeFImW0VbAhOFlmE
         bKiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Hbemg8W+8fdZX1D3/1gqvLT8M08Ebc7OpafKgKeXuj/wFtZcRSCsgpr1U/A0ZLvqzAxu5NC/SUQyO@vger.kernel.org
X-Gm-Message-State: AOJu0YzVWedmPZYirMVDvRoe2uwn7yQJTWHSAaALg9MNTafcF4XB8B8G
	IJ6KSZIAJ0BYAxW81SIf+a8LXHTYOq/kLHK4JL5fV6w3WFuvOU1br8FpKxrwBM2lAl1R8r2sVEJ
	EERa12J4=
X-Gm-Gg: Acq92OEjXZ3zn0t2FOTd8BdDbGJn+6dwz7qantURdsDf0hjxuKAvd+GLwkH7xiO7Q6c
	QKMcSs6sH5a8XXB90/h/TVfovrgVPoIiZg8tbmhK6+EaJfTqcG5ewSnY8J6FTra0+h0E1Vkm8Kd
	yaidN4qe5PAIj0iCspwR/CLSce7u0jgGnb4A7z7ppbbC3TqcvE78dLJ/3/r0yUuU9JdBAgYXlI2
	xxd5TgdC9rTT01E69uw9ScVxCxJucE2r4ZMCAKFwX4ZFv3HI4HHOlrU3yEHcPMhla36ou+xie6T
	C9xbG+9lyrhfLhKvl8On4tZ2AcOEhxss4bh2zJ3/OkM6gm6cAwMHihnFDNHJWl3atQ5cAxw+gmT
	yK7anjN/ggYSIT9WQ/z1SqVw1CphiRwD/sItfZd7ODQYPQZ7z/DJvU5IO3Ir94zlxc+9Ch+sOHy
	SHkPGuF/EP8N4ykLF7/ERVAxJtJnE0p6oOSxnr/PybQM0mhCMUYneRq1EVjUMeYaAcm1igjHj86
	nUx4t5kZwY=
X-Received: by 2002:a05:600c:444b:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-490424aa04fmr276878725e9.11.1779759790398;
        Mon, 25 May 2026 18:43:10 -0700 (PDT)
Received: from [10.202.80.174] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm12764683b3a.60.2026.05.25.18.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 18:43:08 -0700 (PDT)
Message-ID: <c66ee1bd-0a2f-4ffc-9e92-5ed07485ce42@suse.com>
Date: Tue, 26 May 2026 09:42:46 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Yadan Fan <ydfan@suse.com>
Subject: [PATCH v2] MIPS: mm: Fix out-of-bounds write in maar_res_walk()
To: tsbogend@alpha.franken.de
Cc: akpm@linux-foundation.org, rppt@kernel.org,
 "Liam R. Howlett" <liam@infradead.org>, catalin.marinas@arm.com,
 jiaxun.yang@flygoat.com, paulburton@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, ydfan@suse.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14737-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ydfan@suse.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BF6395CF7B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From 6496b7e4d61ce77ff3723054f807888f1bffddc4 Mon Sep 17 00:00:00 2001
From: Yadan Fan <ydfan@suse.com>
Date: Mon, 25 May 2026 12:04:36 +0800
Subject: [PATCH] MIPS: mm: Fix out-of-bounds write in maar_res_walk()

maar_res_walk() uses wi->num_cfg as the index into the fixed-size
wi->cfg array, but checks whether the array is full only after it has
filled the selected entry. If walk_system_ram_range() reports more than
16 memory ranges, the overflow call writes one struct maar_config past
the end of the array before WARN_ON() prevents num_cfg from advancing.

Move the full-array check before taking the array slot and use
WARN_ON_ONCE(), since the guard now runs before every later range once
the scratch array is full. After the array fills, further ranges are
ignored instead of attempting to store them. The previous code
effectively tried to keep overwriting an out-of-bounds slot, which could
not preserve those ranges safely.

Fixes: a5718fe8f70f ("MIPS: mm: Drop boot_mem_map")

Signed-off-by: Yadan Fan <ydfan@suse.com>
---
Changes in v2:
  - Use WARN_ON_ONCE() for the full-array guard.
  - Update the commit log to state that later ranges are ignored once the
    scratch array is full, instead of claiming unchanged behavior.

 arch/mips/mm/init.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 55b25e85122a..4b7db3f7c8a7 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -272,9 +272,15 @@ static int maar_res_walk(unsigned long start_pfn, unsigned long nr_pages,
 			 void *data)
 {
 	struct maar_walk_info *wi = data;
-	struct maar_config *cfg = &wi->cfg[wi->num_cfg];
+	struct maar_config *cfg;
 	unsigned int maar_align;
 
+	/* Ensure we don't overflow the cfg array */
+	if (WARN_ON_ONCE(wi->num_cfg >= ARRAY_SIZE(wi->cfg)))
+		return 0;
+
+	cfg = &wi->cfg[wi->num_cfg];
+
 	/* MAAR registers hold physical addresses right shifted by 4 bits */
 	maar_align = BIT(MIPS_MAAR_ADDR_SHIFT + 4);
 
@@ -283,9 +289,7 @@ static int maar_res_walk(unsigned long start_pfn, unsigned long nr_pages,
 	cfg->upper = ALIGN_DOWN(PFN_PHYS(start_pfn + nr_pages), maar_align) - 1;
 	cfg->attrs = MIPS_MAAR_S;
 
-	/* Ensure we don't overflow the cfg array */
-	if (!WARN_ON(wi->num_cfg >= ARRAY_SIZE(wi->cfg)))
-		wi->num_cfg++;
+	wi->num_cfg++;
 
 	return 0;
 }
-- 
2.51.0


