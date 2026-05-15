Return-Path: <linux-mips+bounces-14601-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAGDMDZrB2oJ2QIAu9opvQ
	(envelope-from <linux-mips+bounces-14601-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2026 20:51:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E34855681F
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2026 20:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4359F30053F9
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2026 18:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92613859CB;
	Fri, 15 May 2026 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AshN5w/F";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VmlYk8l1"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011B937DAD7
	for <linux-mips@vger.kernel.org>; Fri, 15 May 2026 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778871073; cv=none; b=jX669rNpkzCt4QNZobTlNc0MkXjbm+7cOCmAIxqSy12wZk8kx1Yr5JeLebsDZkJN0SAXplt9ReoW/dEUdkrYxBlZN8LTHmq5KDia68ILPM2xdnlMJASKed1hyThAKuO9y6inrObKX0zeW7TYXRMIsMkl+PegSPBwlc9s5ifom/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778871073; c=relaxed/simple;
	bh=WxhLrdxWoS3p0+Dx0yvDZ4xjG2ikKQkrruoWOpoCTqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VP5KhqEEh2NGbLCI9RtqSrjzBd54jcucR1AvGASbmNHB8vdK6efjWH883ZAKPOvFpuqhLoliSA9Ov9EnmDGXdOpQm4jZVxuU4r8OU/hJP6/76htS5Zlu0DqehD4gxFLcQKG3HUNuLpZoFqdiFvVR5y76eKGQJfgOuhgPr5OHSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AshN5w/F; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VmlYk8l1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778871067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uhprfnNhUrNF5Py1hQunNOKUDjGww1uCDzfWCNs8mHo=;
	b=AshN5w/FZ9Eq28zZRvpmZ2QOQTDr8o06jAkXwfSsg5KGOlNjaT2awvHRW0TWlxncCmRgRG
	LP/CuSs/kiEMKjUh3nu3AXYGPzl8L+aXybV4v9InTft00gmGBlDrxKWYJbJ06lyg+Uag0N
	w0HjAu4z0URwsJgr/9a5B6fefpK7ANo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-a4llzljPP0-n41aH_L70fw-1; Fri, 15 May 2026 14:51:05 -0400
X-MC-Unique: a4llzljPP0-n41aH_L70fw-1
X-Mimecast-MFC-AGG-ID: a4llzljPP0-n41aH_L70fw_1778871064
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-44d68ed8f95so26468f8f.1
        for <linux-mips@vger.kernel.org>; Fri, 15 May 2026 11:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778871064; x=1779475864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uhprfnNhUrNF5Py1hQunNOKUDjGww1uCDzfWCNs8mHo=;
        b=VmlYk8l1/k+UOLhtbsrQJ/iCSibhxaKUBOknaMLh5CgWgIoxTVFgP9vhsqD6/cul5H
         H659ejEVDSBoX3ar3ex+vdsp1Ng2x6ikTuqY41IINtHYlZO3rjWcPRYnEI/AOS0x5Oxx
         XB+Qhr3Rj/zqCuO5TzDCQzYtyyzm1haFhrenPsWLVOvAK51+SE+Og/g1P/eSRbDqATZq
         92kfjrD3fFzAuDGcZZ2VU47XDHzWQNjBQnQyUMDm4itYD+UWZXORZc0Seu3Wm8dNEz0E
         3PvQvBCbyL1OAj2ayMS6TgBGGbRNt0LiDUdDTiErO3u/wg0tpBke9RAuRVUoDzSei/i2
         Dlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778871064; x=1779475864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhprfnNhUrNF5Py1hQunNOKUDjGww1uCDzfWCNs8mHo=;
        b=LSXgUZuBMKxNskOdQ6haDTh1/e738D+m/o9RRY29kQiLAd0nMfgDl6GxackJbQUv5l
         yTRJ2W98GxYluTKwwHg0qhKlN48ABZ92arf/XPmHY0RH9JRXMAlLmtcDkyUMJKv6wJDr
         d3IrIx5rLKnySpcmortWNojcDWJOxYaw3YvkI+cSZce39IxcsJG6W6U4ONUg+OQTBJso
         jgJ2+2brZzx0k7tKg3oZ4JDjS3PCtHQKjokIR+fBU9UgL1F6P39vqaOmpvyatpFBMV24
         3IpaLWmojRJVw0XZqkKy1SKC4zWB7J3yi+b+nZH97zY/ZQKsJb/vcuhmBIME5CAc1V+K
         ie6Q==
X-Gm-Message-State: AOJu0YzzgJtNd3u/eZ52YY3KqZC0Ndsl40l4ySI8NOjy1mmmh6XaLnm9
	Xz9bzr3pkPZ4WULlIHONka72aRpFP7xYts6g1jgML0JtP/ERblFEzvBa+2t/I9bXmKKSh7HM+Wr
	6dPBIm9O4k6cbzOQT9CK44n9nRKTod35NJGMcl2dpxFjNOapXEVvLXHEEOhUgu3Q=
X-Gm-Gg: Acq92OHIRAmeSGNSSuqRmWEQsJ3nebD574b2xyPtw8TeA9ycpq5ZltKMPLYF6wqJN4S
	SM3RcSFIyTNok37fb1D/R7TIRbEd+IXvhs/65YApqKsthxFf+69L3DpJPSthAlUfK0lCfE6vaJy
	1Z0SxzV5Ur8B7ACVU4ieMcpY4+VOykU5B3eMZv8uBqHhcbp2nj6ycZgv6RH6AziucdmGA8srbFt
	n3hsG3JspQ696TwJnjdQdZfYGSGy6sOgRHkjDO5JMEbWHfSPp5Dmn6IeF7psCqr3njkk+AP5K37
	6+RFxOFqkflpvs4v2X9Y/PvqDN7gFeFIqhk7bp3XgdCO5QA/X/lLQ4QQTBejqB0b/RQBq+r0LMY
	9GM8lxuPT0D8KiRrGvyCo2HM8egomXdEmylA=
X-Received: by 2002:a05:6000:4b07:b0:44f:69f4:39b5 with SMTP id ffacd0b85a97d-45d9502e84dmr14791853f8f.29.1778871064228;
        Fri, 15 May 2026 11:51:04 -0700 (PDT)
X-Received: by 2002:a05:6000:4b07:b0:44f:69f4:39b5 with SMTP id ffacd0b85a97d-45d9502e84dmr14791826f8f.29.1778871063793;
        Fri, 15 May 2026 11:51:03 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm17740021f8f.18.2026.05.15.11.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 11:51:03 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Paul Cercueil <paul@crapouillou.net>,
	Sebastian Reichel <sre@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] include: Remove unused jz4740-battery.h
Date: Fri, 15 May 2026 21:50:41 +0300
Message-ID: <20260515185043.1523363-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2E34855681F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14601-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[costa.shul@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The last user was removed in commit aea12071d6fc
("power/supply: Drop obsolete JZ4740 driver") and replaced by
a self-contained IIO-based driver. No file includes this header.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 include/linux/power/jz4740-battery.h | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 include/linux/power/jz4740-battery.h

diff --git a/include/linux/power/jz4740-battery.h b/include/linux/power/jz4740-battery.h
deleted file mode 100644
index 10da211678c8..000000000000
--- a/include/linux/power/jz4740-battery.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  Copyright (C) 2009, Jiejing Zhang <kzjeef@gmail.com>
- */
-
-#ifndef __JZ4740_BATTERY_H
-#define __JZ4740_BATTERY_H
-
-struct jz_battery_platform_data {
-	struct power_supply_info info;
-	int gpio_charge;	/* GPIO port of Charger state */
-	int gpio_charge_active_low;
-};
-
-#endif
-- 
2.53.0


