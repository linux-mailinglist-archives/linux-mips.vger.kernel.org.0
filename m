Return-Path: <linux-mips+bounces-14734-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJmVMn8uFGpgKgcAu9opvQ
	(envelope-from <linux-mips+bounces-14734-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 13:11:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B965C9BD8
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 13:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8414F30037DB
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 11:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDC425B085;
	Mon, 25 May 2026 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SwKrDtn3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D73837BE9B
	for <linux-mips@vger.kernel.org>; Mon, 25 May 2026 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707210; cv=none; b=IfPVAwF1CJXBsgkIq43umn4d14oRuVbhWIIeWqSbRg4qaQrhdDnQLpyjsABNkwTGr9UogQOscY+QedImgy13g2d9jS52oDCyq+Amo4pVEJLyZDuMKMxUSNY8l2x/POBkk99o1YT7nKMKzviQywc7UpxB4Znmu0Nl1onZPiUeo8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707210; c=relaxed/simple;
	bh=Hax8VooZrtwD2aQESjIacvvKDCVqLv0XNU1lfP1Pzoo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=gQK4kCGzJdX6HXElR+0xeHz6HmsFoc66179z3gJXteTxqF90m7Lx1I8LrvGcEV5a5jjIyL+fRJN2WAno5HdqeAEYgO9qiN6CaccVwEmuPM+cRgM11uw+AZj628OnmdR1fENzVPMjp6EbsP2d6VAk+x4u7mcpp2pzzAdjZoFNBws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SwKrDtn3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49040362e4aso38022445e9.0
        for <linux-mips@vger.kernel.org>; Mon, 25 May 2026 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779707207; x=1780312007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwUZScGZA6MrKQaydcq3YFzk7PLxDYRJx/KEWYeVpWQ=;
        b=SwKrDtn3gG123MWh4ApX+GGcZ2y8/VRjBg3lP/q8q0NHTmGOkGcy9JyE05xxtpaxdc
         z22PvCZkpcZ63YJr8z2l+ygAXc9UMC1D++rohVDor+vNcZ6p5Giz6mszelCc+zjHYXGR
         2zkFJtZ4K9+0BmGua3GXjfh29SYV5iynZ2FDQmbwPFBog/BZXDgkpWaQ7Od4kg8mVCJC
         VBrtwyugTRLnYujsbzUZ2YP6TsWgNfOQACvD7FcmsdDC9HJhmt/mEsSP+2OM8GeVa6yS
         ZKsQOcG5wXNHPqwjukfAKsPar3gJ3SuC445avNWc1Ipc0LrNkMS7PDZXw74DY2+IpfBR
         wgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707207; x=1780312007;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwUZScGZA6MrKQaydcq3YFzk7PLxDYRJx/KEWYeVpWQ=;
        b=g9SuAuItguHvjQyqxkl1P7KuMFXsuq7479biEufQui6OI6CMK5ylSPfP+bSZETTBe3
         si1gRDwRfEZvg3UmuJyC6T52Xa9+v5DT0XZReptmK968X9NfLjalGoNK50kIvu6t3wba
         01i59nln/yZ5AgXWx7gNCpn69yFLsyc2NqDrH7mKrCKjJAMnmxxSPVJiUYEuFUCP8T59
         WfQnfQ569I0b/MKKEXiH1IkmycdCoAdc9lMQxrZQRT3+hyqMXNYtEDHzSzAF+FtboJrj
         NfEoUCqOuUvl0/I/BnQ+7xppB6MBs4B6ioXPhJJLjtfGLWaPXFFfmunwMfSJg7DK5wfL
         LHqw==
X-Forwarded-Encrypted: i=1; AFNElJ9oxINkvAe5WD6tcO0eDn+M8xtBgrXJcuyk7FDaVFohwa/Msss33uS+E8IdMUIlUBUW/pKE2QUGITMz@vger.kernel.org
X-Gm-Message-State: AOJu0YxXZNFoY1zmzlxx47JdXETvUWN2b63XqZW6gHDO7ILt6H8twnoS
	+MSTkiSuyqqRvN9jHYfu5xdnBXFI29M8jxKrfxIUDshCraGS866/HzIDGMFKJmaWxMQ=
X-Gm-Gg: Acq92OFct2leWSk4bfE4jZPw81rSpDORHzW/HL9k41tXHaHj1khMZswvT0/j5vK0MoT
	icElTosIjGGfozFp74dA3W4eTnPrDsz25y/8QMFnsqABTxeAWtfCNNkkeIhPPfetf4dQOM7lDLW
	OxsP5pKwGT0x3L9Nwbr1IWF+oScdWM/1/lgHVIsSuwoQ0UpA7sbybdQ2LCCZ8l/B1L+4JQD51za
	PjQ8+k0D/E2EEJzmvTwR+q+GlGuqui6K/8WTM+AfX8SAty96xvgBMts9C5fHtaKEDdb38E84Rbd
	kqXOaX9c5Ivo4BMuvTu4oJpdMIPG05QSSX4RwDoLZmslOr/iiNwQ9B/AiRmbTXFnnnRdGDkcZjZ
	p1H/iQRe43vh8sXyv1Q/wLJdUVqYX4L61nvbnuXl0M6F8qrXM3UYrPBCVQz/1e2Mx22IO++U4zo
	PvE0lOWp0JhY6R2qPNAo4t/hvHsVjCIEvT31JU9oXeJiitMFgaBXcGUE6zCtWFQIuaUo3Gd/okG
	wWPtveDsKk=
X-Received: by 2002:a05:600c:6995:b0:490:482c:4384 with SMTP id 5b1f17b1804b1-490482c44ddmr220756545e9.24.1779707206511;
        Mon, 25 May 2026 04:06:46 -0700 (PDT)
Received: from [10.202.80.174] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d944c4sm9054125a91.1.2026.05.25.04.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 04:06:45 -0700 (PDT)
Message-ID: <d060de27-6fdb-452b-95f3-dbcc48db17ff@suse.com>
Date: Mon, 25 May 2026 19:06:40 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Yadan Fan <ydfan@suse.com>
Subject: MIPS: mm: Fix out-of-bounds write in maar_res_walk()
To: tsbogend@alpha.franken.de
Cc: akpm@linux-foundation.org, rppt@kernel.org, liam@infradead.org,
 catalin.marinas@arm.com, jiaxun.yang@flygoat.com, paulburton@kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, ydfan@suse.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_FROM(0.00)[bounces-14734-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ydfan@suse.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.com:email,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 34B965C9BD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

maar_res_walk() uses wi->num_cfg as the index into the fixed-size
wi->cfg array, but checks whether the array is full only after it has
filled the selected entry. If walk_system_ram_range() reports more than
16 memory ranges, the overflow call writes one struct maar_config past
the end of the array before WARN_ON() prevents num_cfg from advancing.

Move the full-array check before taking the array slot. Keep the
existing behavior of warning and returning 0 when the scratch array has
no room left.

Fixes: a5718fe8f70f ("MIPS: mm: Drop boot_mem_map")
Signed-off-by: Yadan Fan <ydfan@suse.com>
---
 arch/mips/mm/init.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 55b25e85122a..0ba958b7ffa5 100644
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

