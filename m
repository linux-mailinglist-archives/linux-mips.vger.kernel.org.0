Return-Path: <linux-mips+bounces-14757-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJWEAIJnFWqtUwcAu9opvQ
	(envelope-from <linux-mips+bounces-14757-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 11:27:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB105D34A9
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 11:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF802301FF80
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 09:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5082034AAE9;
	Tue, 26 May 2026 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="O2D6H54Y"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A324933F8B2
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787219; cv=none; b=hwf/fem00t+eFnNjBOFrBzKlDpCkdhGoP1qR5rpJonHD00p2raYlWJrRp5eYiKy9VlA6CYYbfu1kgVAoiAL3SJ4Bgr7fsyUcq9UMCBmK9OToN1CI5aaSCJBZwO7Il2hR5EVVFaUAwuw8JIEsw6NNIMzD0OY/KBGLyzlhqik50bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787219; c=relaxed/simple;
	bh=CImFGm/90Ms6MFAUDh6k6PapoRhKGLaFom+/seJQMv0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=pRs5E4x3/nmWUlGz929tkWS6x9zjhL73/LQ50GfFXZIHlW1+OXh+92e9FteKrusEFMIcuWxblPKeOC5TU+4H8CyImyu3/BizLd6etnq3Nl04sui1E/S12Kput3616pcDod/aMybg7JTp4+LU6OloZmsqA76FhGpcSsygvGA9a8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=O2D6H54Y; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49048e043e5so27898945e9.1
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779787216; x=1780392016; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3bSEbQjKgH36Xf4Q1BYUTKv9fzxxL5s+NU5lEV8n1w=;
        b=O2D6H54YxmVpZptABD5Njo40n9FqfwuGtn9X8F+2IuPkBPNliyl6utWW3wslun9Nm7
         oSsRTBD8v2YI9ZOQgtA8IK8AxOT5qrSrhc24rjdqEyNOR0f2Gzc+yQTavrTTKIpwgw0P
         tAxe/rgHlNIBgXRqbiw2znKMjFxwE4cpx3RQurZjYfu0hi3o0LvjAiA4rHn/ndpSbr6l
         g2TQyJK2aMcwmzyky89jBThdU6WNru0Aa5r/Uzvhox6nfEQasnRhGa89axyVFkZTU09d
         JQPjySigRDZgotMBHLqZgwckj63fvhq83EfNY/i8xGNa/HjMGmUjfdtD4ykf5GohGM7K
         nYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779787216; x=1780392016;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k3bSEbQjKgH36Xf4Q1BYUTKv9fzxxL5s+NU5lEV8n1w=;
        b=fORB5AEwa9bo73TQSVXFQQNLio2hfocA/Dp5Va2RPuggT21kFQqmg6k7ASu7R5swbN
         NxrMrv2XjJr5Y5I+oA5LC7q3Jr9I1Hc87ykTPgNVKt8udrHrj+WssiETVN70sjCUMjid
         /lIiHIuftp11RwNALZMttjc+0rmLc3VxOB++Lh8630CZijYEXm5biK8exzU6xE5Zn5pk
         mhrq+3mcYJtS3wbC1Y94n+sd0NLlAklpeWfaSinia4xdKhii9DY3v3e0QIqgtJUadMKb
         4fF4G1LC4JtPZhcrZifsbLzwBxNpWVlbMlgD3878ex3ObvkSkqSmSD/6K6uEKzzIAymH
         N8bQ==
X-Forwarded-Encrypted: i=1; AFNElJ/l8m8gqS5TPLVYBEkFxYFIgwpW3wlZz8nefJRVl3XY4duxpQaDy63fcExPI2oiw8V/NuDUHCDYlyPF@vger.kernel.org
X-Gm-Message-State: AOJu0YzL8YhSX3YxzBCfkwoG6yFDXVxB0s1l5VAgojmz42ELdtpm6m7n
	BTBUH5CZ3l9cmZ78LWaY0vIU8EtgiwipXvLU4bXf6UzsbRuEFIQVTg+USQbfWvLIqZk=
X-Gm-Gg: Acq92OGRZjKtlIQty0UWSClEL/9CJNSxANSAxVhtGripWTWAFlgCZ0SPPPo6l9QMvjZ
	k/Z6Q6o5ydP8w9m8/466HmXPgLr7DTlsSqpuGhQUZUv7SycjIGs0RiOMtYuQ+SW6qJNp56J0u7Z
	YOaC314FKkhSNMztusuyIlowh64mMu3DrfPIDTxGwAZIIEtFIjmgnmZdT7s/lnja/N+qssHg0bV
	oGvOqvAPrasncsY5iD99LI9XfKqwX7nFZL5Xt1MpYLgUbG2iKRxmAw9mNqbvc0wM0lHGmDzE2vV
	yIQE3Yawwm2XGO5buPRJpm/p4livSdj5Y22G+zoTmcWP7m2RPU2fg0LF8Fy1wWbeAtbk3+jg+9+
	X5fAiztas9pq+xwOPBKlU8Yw/uLKYSgHSkdZi3gwD4Cn0qk8fsJSt9QERbWlSlaamq4R+G/A1kr
	w/1V/Cud9xCEoHB9dEskCKCsy/dQVFowjQGZboFSH7y+NJClioxEtH7NFUlFsH7brnbPx6knpNx
	8s/LePVnVk=
X-Received: by 2002:a05:600d:6451:10b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-4904249d11amr211599515e9.7.1779787215732;
        Tue, 26 May 2026 02:20:15 -0700 (PDT)
Received: from [10.202.80.174] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202a789dsm9286804a12.9.2026.05.26.02.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 02:20:14 -0700 (PDT)
Message-ID: <93172f19-9a73-4661-8dad-3dff800c2d54@suse.com>
Date: Tue, 26 May 2026 17:20:09 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: akpm@linux-foundation.org, rppt@kernel.org,
 "Liam R. Howlett" <liam@infradead.org>, catalin.marinas@arm.com,
 jiaxun.yang@flygoat.com, paulburton@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, ydfan@suse.com
From: Yadan Fan <ydfan@suse.com>
Subject: [PATCH v3] MIPS: mm: Fix out-of-bounds write in maar_res_walk()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14757-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ydfan@suse.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3FB105D34A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From 8dda685e7d0d1653cfb2a93d0865a1fa5a561700 Mon Sep 17 00:00:00 2001
From: Yadan Fan <ydfan@suse.com>
Date: Mon, 25 May 2026 12:04:36 +0800
Subject: [PATCH v3] MIPS: mm: Fix out-of-bounds write in maar_res_walk()

maar_res_walk() uses wi->num_cfg as the index into the fixed-size
wi->cfg array, but checks whether the array is full only after it has
filled the selected entry. If walk_system_ram_range() reports more than
16 memory ranges, the overflow call writes one struct maar_config past
the end of the array before WARN_ON() prevents num_cfg from advancing.

Move the full-array check before taking the array slot and return non-zero
when the scratch array is full, so walk_system_ram_range() terminates the
walk instead of invoking the callback for further ranges.

Fixes: a5718fe8f70f ("MIPS: mm: Drop boot_mem_map")

Signed-off-by: Yadan Fan <ydfan@suse.com>
---
Changes in v3:
  - Restore to use WARN_ON() with return -1 to stop
    walk_system_ram_range() walking further

 arch/mips/mm/init.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 55b25e85122a..1c07ca84ee21 100644
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
+	if (WARN_ON(wi->num_cfg >= ARRAY_SIZE(wi->cfg)))
+		return -1;
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

