Return-Path: <linux-mips+bounces-15043-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NStHIO/eKWruegMAu9opvQ
	(envelope-from <linux-mips+bounces-15043-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 00:02:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB19E66D25E
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 00:02:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Fwyn8Jzh;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15043-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15043-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7275B30F8081
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 22:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38A453E0B;
	Wed, 10 Jun 2026 22:01:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A009C2868AB
	for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2026 22:01:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781128899; cv=none; b=hRc8BKe2MVYqKjHkHlIktzA0V4E36T1wjKS4OOWz9ZvOcgCPLv7gIuwMvJ45DT73CaG4oQ7cP/yeBIUVzWTuSVCaVUJN5oASUWXDrKKkygQQUvtxZuUHdNEWosJq1Xtso6RGkcr1jwmaph3Ru7S8AGgMXBmgkaZ5xhoXjl/tWXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781128899; c=relaxed/simple;
	bh=MtftER4GyhXNpJS5j2KzNmXuOVUm/wn7DmIOlEHYkvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X9VZ9XiORwGLphyavQJNu7QUyNq+FcFyQo9r2Sr/m7UeL6q7HXnC6YbkbUR6t1Tl37ImTW0VeWd1sd+eKnXpoEtcd0FkdXDW9kai0CFek7HuVWF//rj5w1Y0tkbnuoowUvlOc6X5fcINJnYwBUjen/4tuKrC4KfK0kyGfTzwJEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fwyn8Jzh; arc=none smtp.client-ip=74.125.82.68
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1383e116edfso950402c88.0
        for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2026 15:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781128898; x=1781733698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cuto5QkWyb+3sYrGFAvnggNgDeDBh0GblGiP1IC8BWs=;
        b=Fwyn8JzhVPe1QXjibsjcC5FzEENDQyj9AfoaTFBB0XUjir2PS5iFucJoZ3CtyTxeDD
         0jcTRHvh/kAO3Zme72VoQO2nCuWyk/ZFN3seAIKiRTA24RCMHqrkBpqYiqZD7hqUPYTL
         FuDBlzGLI+iwYv+reywtVsPwOdIA8OgkQDI9qVadUX1Ct7r5e7dMQWO30c/Ih4N+rO4i
         0ix59xPd+9wrp0ZDMsDDjXrzkPcDtcb9oOZpltYkHnPK12IiI7pLV4QFLvdKPoatpoHs
         Id0ijxzTL+YnZDjf1GQMgV0Wnhp5k71nkBl87Yo79xCTBUzuBp/n912/bVjqLz/J3kdB
         khdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781128898; x=1781733698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cuto5QkWyb+3sYrGFAvnggNgDeDBh0GblGiP1IC8BWs=;
        b=l+gIJDKl34/JcKksvhG5EbLIIgbsy1V4d5gaMn4awJQcJZIpFRSeyAfQZwjkpZcqwf
         IBIEKut+m5Z32m4hyZQ3+fLonikxoCICowTDmwUgI7LxCWy7Q5M3u+/WAwx2vTqHUURx
         AK9a7CsLL9RQoFIHIzTcKjjuxeNgZu0aZBUZt6NslDrSXKRktggstTZMCMVX2+zyv2dc
         m8kMXNN25kQItXEOsWvXi1luTamxOHPeypJJAPmtNPbTytWNFgX8OXnwHj1ovN6D4kqb
         CbJzldsCcSIQZp8OynEz0bLKf4MbUmmffnTtRMW5kBftK7r9thHOLzOv6lChGgfqXofM
         jbYA==
X-Forwarded-Encrypted: i=1; AFNElJ9l9Jd48uBAyube53wxepB5NPBrNiwlGIQa0NxT0dya7lje1q+r7Y7F/UilhgcZtpsmroUUYKN0xeTf@vger.kernel.org
X-Gm-Message-State: AOJu0YzXRNm8oT9HGDKQ8/QW24fSYlxjExEAaE8zU1IPDFUF3wu1+adG
	9y3q0wlrM1sNvEgj/qYtigACL8Roq/ft7aELNhCXcVIefBGHZAYJpR9LIplC7K+Q
X-Gm-Gg: Acq92OHbgncJVqrbxkk3ZAHB6rjI2Nss0v4KIr8E+pe9rYDUvOWpEb9uVci4KWMjFXU
	sn/vQcaI2IxAXRoT1UZNVhDqR0E/pwdFz9yXH6+5HdGkFL/NRLCC87UHWBrkRbLZPiUM36CrreZ
	QrAUjDo2j8YdNjk3nAlaMBaswsjfIv83HNqDgWsohefBCMYVOjvBaoPrYoxXgWplAS5P9AjKnUu
	0rhAQqWk2A8ORTILVpeeSBTYBYka3TyGzWNLMEsSG098a4OoPrruA3yp2PTHr1XEyUVObHyiGV7
	dWbDu5F196EL1B7Z2J5rg6GdTmVgdLNMQo3SboXENBSpfoSE5GuffJ4fyAuLuO64pASw2QRgFEA
	wv/LORBDravlp1RcOD75dSdA9Fbr2q7Anj+T+td3Duuc8uv6sIuK6zJpqR9r3QUlhmMshl2Uz71
	8X5KC5oG6luuLBdpw/b3grYqXZ/KMeDei9pVPCf82LuYdThSvo6XwUcN7IFkN8ucrVqdUq9Uuw2
	vGGlIDo/BJckGeCt72tycNP9TYDe8M2gS3BXjO7KgZYddTBDe2v9dQzDZWCwQFTT/91wlyPEvdc
	XxtIER4KEvXMsPHdLcN6BAk6l7PFUFc0cyLGs6c=
X-Received: by 2002:a05:7022:ec17:b0:137:ae1d:5b5c with SMTP id a92af1059eb24-138421bde75mr13300c88.22.1781128897733;
        Wed, 10 Jun 2026 15:01:37 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f548ade9sm19117761c88.2.2026.06.10.15.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:01:37 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] MIPS: mm: remove comment referring to removed CONFIG_MIPS_CMP
Date: Wed, 10 Jun 2026 15:01:22 -0700
Message-ID: <20260610220124.97261-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15043-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:linux-mips@vger.kernel.org,m:tsbogend@alpha.franken.de,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB19E66D25E

CMP support was removed in commit 7fb6f7b0af67 ("MIPS: Remove
deprecated CONFIG_MIPS_CMP"), but a comment referring to it remained in
arch/mips/mm/c-r4k.c. Remove it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/mips/mm/c-r4k.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 10413b6f6662..d8aadd3dc057 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1757,11 +1757,6 @@ void r4k_cache_init(void)
 	build_clear_page();
 	build_copy_page();
 
-	/*
-	 * We want to run CMP kernels on core with and without coherent
-	 * caches. Therefore, do not use CONFIG_MIPS_CMP to decide whether
-	 * or not to flush caches.
-	 */
 	local_r4k___flush_cache_all(NULL);
 
 	coherency_setup();
-- 
2.43.0


