Return-Path: <linux-mips+bounces-15738-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /5SLJx+tUGoh3QIAu9opvQ
	(envelope-from <linux-mips+bounces-15738-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 10:28:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0744E738738
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 10:28:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=ZU3Fu7Lp;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15738-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15738-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B30BF307F9CE
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 08:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056003F0752;
	Fri, 10 Jul 2026 08:24:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17AE3EFFAE
	for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 08:24:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783671872; cv=none; b=mNCr652lZrvNh112gjwnw9H0eMST9ZKfvDEDQdYp+87BSjSxXNTtUPhKGlJ+dU0ucAbkppdO3HWbjYTVhMlcltoGOZ91BjfH+94yvpGIIakBztD3E0GUWgdVKN/9xNt4CE0wxJ4WHdno8nU7jVi/iaczYeFX3MNMoXS/tqEAyMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783671872; c=relaxed/simple;
	bh=N76DgDuRJSj3z/EKmSWh7+xBObCzUl0H9UGO8Fa7q48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B9phd+HBFX7jzCOtuM0isn1ndcjU34xqmPLdr6isNIIEI+ycbAdf28iH0Zy7+h/nbp8iD8A5DVXg1/EWcf4R+D4ZgJkKcZBRDSZhD0ZO/EhhOZeQ3DoR2ev5+9+2rXGKQQGtK/N1MbpzejabNZEGOyxLgtJa0qlZWczEuyMWL+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZU3Fu7Lp; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so4630095e9.2
        for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 01:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783671867; x=1784276667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iFyvX2TSvIxP4UAitDFY8K+Bnc0wYJbsh9Xk9xExDRY=;
        b=ZU3Fu7LpIrP/zfxeurmyDoo913fB+iunJHjcV/0MW42lN+XdfCNju7D46oonrVtnuw
         eIzjM73QPDR2aams9SYFGVm8yj6os0g+l4KLqC5QR9znqwDmuXWtS4xfKIP1pziaSLj8
         BVbBG/xFxvpGtjuK3fV8bnHzwkZtd1pdELAIRnnhNuFyflgQsjywxdBHi8uwJdx67RpA
         A7zRNEPacYpSlFObeRGeWoUEiz0gq7OuimQiPXB1CD58EJI+h+a6koOPMsfp/kdmgrah
         BDxODGzNnQeCPYB8DWbo8wdSE20dyc6CHgQj0Bdq1nw5gTk7XMqQrB3MyG/Sl+EgKp4/
         g6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783671867; x=1784276667;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iFyvX2TSvIxP4UAitDFY8K+Bnc0wYJbsh9Xk9xExDRY=;
        b=ejFwdvZ5kJbqpLmrH9ynr7+XdtKinyhutVeA9xGNA1ql/d3o/oAMQyCenShSonl/Ei
         ivWAK40RFsJzD22Z80tbnsl4ElpKO9PtaV9+cJrgDoK5JcM3/hvNWJdRAYraBk6IkiCU
         ktZ395MOjnYThKLHtvqc7imbV3aLCQu1xazXgtkvxVBi5hDGLdxHiUNeOPXOBTTQ9DO7
         /2zvClTKerVIa4MWgzrsnSVdguYpdt0IKG9LqFro4nYn0+vJduoTrN3KBylJdleXtwnF
         /KgXCkL84kpjimA5gK7m+48h0mRH8rOMJKyVgwm2WQm5F0S4SFucrz9h/lI06CZoi/V3
         mNVA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0aR6vpmaHUxpvyVXAvY0AxvoU7tPxP6pUeol5xUuzRIon9iglonj8YldI/mNh/jsGaX34u6usl7BF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9954fFI2fHDV7MURrsPIEmimcL5tDu0mHBzLBrOZQVLA/JZ8M
	gtFqW8qH9KMwCTY40FdgAntB1aYdQ7y55D/9Rxc30fKWEbSXa5mQERDIIQQrQM4rujJMBtDkAd4
	+vFIS9MY=
X-Gm-Gg: AfdE7cnkThI3Y5QD8S/Cd0cUwcNBL3GWkDHiqVlnGvakZLFFgxnNJ05NkQgAKKMSqC+
	XyT+SdIgUTU2WVnFLoQEiMFi0OQo8N1sLKMMKZ8vUhs3jucrEMN1+LUYgFTdnBWvVrhwu+x0WbD
	tD5NRLShUSjF5v7bbN9c4MjybfzQu4EUp5eYrkh7zdLuBfwH6j9nHO7qdmWi4sAKVsKA5PJDjXS
	EBbG85O6Yr6wlm0UheSactxrm85Prhq8uzYHGOyG016ZQh50yUjxtRf3QJk7IhTcSps3gk6RV2z
	lrwZ7/veXKoTfp/0cdPol1cgntju/63+2zq4IHa958xmIO8dRTMaHLzop3NGubDqhSO6GGvWtPS
	r/fce6SXZX9P3Jr5jQ7bJ58Mr7hZHoSt+a1OFsBUJUGJgV9BUa+pKyt2M4EsRTcFH8zqDJrZkNq
	kmzQM+s9RVFQFFpNEmQHmaTBLugTIZ3Y4LE6KX89b2ba09CYHwrbwN2CXAlApn+V+HZ433Glt2m
	ZdT
X-Received: by 2002:a05:600c:a016:b0:493:f6c0:2e1d with SMTP id 5b1f17b1804b1-493f6c02fc4mr1257885e9.39.1783671867238;
        Fri, 10 Jul 2026 01:24:27 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6df6d9sm133921845e9.7.2026.07.10.01.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:24:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Johan Hovold <johan@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] MIPS: ip22-gio: Drop #include of <linux/mod_devicetable.h>
Date: Fri, 10 Jul 2026 10:24:12 +0200
Message-ID:  <d90003bf53495591a15a5854fa2845fdee8f8d11.1783671791.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=N76DgDuRJSj3z/EKmSWh7+xBObCzUl0H9UGO8Fa7q48=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqUKwsRLBDj+tKJ7uDzyg3LttN50wH2ekuNa1Q4 ZXqP+b4chaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalCsLAAKCRCPgPtYfRL+ TminB/93MaGvbtwFEdDTQ/qHjN0O/Mq3PWDvNjcDEF9o15d5fUXLKDnOZ2PMzlu8M7oMVB2F74J jKsUc6rrt1hyr8J7qAizISJB2dtAMJ4+Ol3ZFxFavAEPCBzDBvYKlE8fb6XsAU4S7eMk7+5NW4v J8I1u07NIVtfv8nxMwzFl1T4PQT+fX1c5fJcqUBSU18XzKv/LUSfKU2PeCYXfkq3PsjSv/+BC3n iYmqIw74Xzv85KBe5wesVsAjFTp+SEPE8utCZ2f/N0sOX917/B70A+oxB81I+s3pIlnyzFvLeCB BUwcBjYKQ7WK97KTmtofHmwXMmPV5svsOrT1u4fc4DhB8RP5
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:johan@kernel.org,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15738-lists,linux-mips=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:email,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0744E738738

That header doesn't use any device id provided by
<linux/mod_devicetable.h>. Also the users of <asm/gio_device.h> (i.e.
arch/mips/sgi-ip22/ip22-gio.c and drivers/video/console/newport_con.c)
don't use any of them and they compile fine in a mips allmodconfig.

So drop the unused include that only yields unnecessary recompilations
when a device id struct changes.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 arch/mips/include/asm/gio_device.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/include/asm/gio_device.h b/arch/mips/include/asm/gio_device.h
index f9c102f038d6..6e9d2897347d 100644
--- a/arch/mips/include/asm/gio_device.h
+++ b/arch/mips/include/asm/gio_device.h
@@ -1,6 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/device.h>
-#include <linux/mod_devicetable.h>
 
 struct gio_device_id {
 	__u8 id;

base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
-- 
2.55.0.11.g153666a7d9bb


