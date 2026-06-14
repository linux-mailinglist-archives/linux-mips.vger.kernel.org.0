Return-Path: <linux-mips+bounces-15063-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fvM1K7nTLmq93wQAu9opvQ
	(envelope-from <linux-mips+bounces-15063-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2026 18:15:53 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C66817F6
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2026 18:15:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CamkcpR7;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15063-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15063-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D32403007F69
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2026 16:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736F0317162;
	Sun, 14 Jun 2026 16:15:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9F62472A6
	for <linux-mips@vger.kernel.org>; Sun, 14 Jun 2026 16:15:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453749; cv=none; b=Yfff8Cef2jTSwrsevUQWNkE4z/3JiLqqdgopY7wIfIuGgaDVilEq5X3TeBkcim0mYniMGiGiAD4Cu9lpM56y4qbmYfgsDq0MwuV7z6o1Bew1ajxZY3D8XkE+kReYG3+I8TdxcOaFniM/TUlQwOr2O1kbdohzw6HDPhN9+PF/1ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453749; c=relaxed/simple;
	bh=f9WmRG917lwuOo8YitFWlgl0yJ3KRNNh9qbjKjNywos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XyCuNcFM1mJP2ZXgmvJgktgybL8iQYg+UFc6vy5umx28Gn6BDA2v8zrMnuU/sM6b8Y1iFfoY1Gvx9mlG+Cg2z1RVyvTPscZPq3Rxgsy6cuetgv5Bg6JZfe6Fl8bpN5aqMaIZF9+seVOcKKNNvxkH2oszvyW9Yp/iN8fxnWaOddE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CamkcpR7; arc=none smtp.client-ip=209.85.215.171
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so1768698a12.1
        for <linux-mips@vger.kernel.org>; Sun, 14 Jun 2026 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453747; x=1782058547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZZ7P1jGg6gmmhunWNSiUTGdr5N9WczZ+9YDzkn+QNU=;
        b=CamkcpR7OZ73ieDWfCcJYD7MRPTUGXhuTr7f1329UhwDqEiSmwPMvtiRCmCeQeXAOz
         ljrBX7N+F9iEzO0ry1bWidzJPql9eDBQfBg81H4N4Y5kfQCyKlI92lop/9VUCcj2fhri
         5tk63gicBHHwb507RAZZlafnD1tgisDM011AV1+Vh1phKe3WewnpZUtx0PxmhY0Vn2Hn
         QvTq3CDJMkLCRhHkqxGgY+QZMdi9sIY46/9mwgefHFZWiXJVprXc4ZawNhA289PjMKbz
         89PmCo5hTRVEQ+HnEru121dFBDGaadG+Fz8fiRt7c+w9OHQ1IjSTzBQH8EOU9cOvWH+H
         O5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453747; x=1782058547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ZZ7P1jGg6gmmhunWNSiUTGdr5N9WczZ+9YDzkn+QNU=;
        b=IxdJkjLtLbypiS1DjzVexkAM1NbeHI4pN6hgF9TvKUcvffCf2v5I7CTaos/SQEZhp3
         JkqFydMKP5CtSM8jLEe7qpQ2p0SfWK3/rXTmKbyCbMzHtHqx9swpxG3n1c6D+HaQRk6O
         Lwhd+IYwfnuWVCAG+SX5ejih7Vt/hZ9bVjHxYsb7jyCRwIvYpPvK/wxwGQiN694evgqW
         N5ZJiclnEKuJFNZtf3a0yWW5yJWO9U9R7vDz4t57I8LThJLIcSoN05T7SYZJQVy4Xtxh
         NIUu1D225WWg0ZTApOcgtfJg2aUBQP5F09nXCtywzBsIHq6v7n7cveCV8lpI9eTLsnxV
         iYfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DwYjb9IFM/5K8s0wi0KJXD5d1VNMMc5Z6lkH524Jmfk2upbm9sebybXyYXq6YbDWbP8rHH+lovG7P@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/tJ5Jh+KXon4bYXNFVQ3p0b5+9fF67w9wYi7/EqYFuXsWgZa
	nM2Fum2aZNDC2J3mmhhf+W/1KwLtl/TuPgRtvR0uMH32lkkjFuilGmN7
X-Gm-Gg: Acq92OF5kccFhBGT0+uizv+S4aWR/kjIBNKFHm/i/T2lfnjvN126qmDSKHqp4EX0Nh7
	+DjHxUqu999WF4qCNNrFtpBoYHLCxzZDwW6torF20122g2buTjD3UX9cAM9UZn3oWzYLTAwvxEc
	mdZWK3FaXoxMV1ermsOIYI6dwOFS1oMDbVE7fKVzJ3FT1QfzmUAWwc56G4dDHYvMpXeS6hHYy1V
	9P4gHIy8KlksfQ8RJLBzXHcfkzs9/PwDwEr1UguzlK35mYctBpCB74Hv14ZLj9p0Mhc3pz7xmgA
	jAmd49wM7VSmtiTRJ5Xp5EuF5QLUeDDz0XOnJG1Dr9nIHRt2dnhjm/FNVqiTkY46R+/xRo188yl
	Xr9aXKTpTTxJgT0gPyllLutZvyMetHEWsoSIiMr62GdzQmxQijz558DM1tA5PpM6K12XEUQ/xsQ
	jULNAssCPmz++H8kWwneK9qlBeiFnZ
X-Received: by 2002:a05:6a21:3115:b0:39b:9644:6e94 with SMTP id adf61e73a8af0-3b783c76cf4mr13112661637.9.1781453747617;
        Sun, 14 Jun 2026 09:15:47 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm6505293a12.11.2026.06.14.09.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:15:47 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH 1/3] of/fdt: fix misleading elfcorehdr reservation success message
Date: Mon, 15 Jun 2026 01:15:01 +0900
Message-ID: <20260614161503.2219681-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614161503.2219681-1-ekffu200098@gmail.com>
References: <20260614161503.2219681-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15063-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:saravanak@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:devicetree@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:ekffu200098@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ekffu200098@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekffu200098@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C8C66817F6

fdt_reserve_elfcorehdr() does not check the return value of
memblock_reserve(), so a success message is falsely printed when the
reservation fails.

Check the return value and warn on failure instead.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/of/fdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 26f66046cc32..d985c07d7c5c 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -479,7 +479,10 @@ static void __init fdt_reserve_elfcorehdr(void)
 		return;
 	}
 
-	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
+	if (memblock_reserve(elfcorehdr_addr, elfcorehdr_size)) {
+		pr_warn("Failed to reserve memory for elfcorehdr\n");
+		return;
+	}
 
 	pr_info("Reserving %llu KiB of memory at 0x%llx for elfcorehdr\n",
 		elfcorehdr_size >> 10, elfcorehdr_addr);
-- 
2.43.0


