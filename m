Return-Path: <linux-mips+bounces-13100-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FpPMCS6gWm7JAMAu9opvQ
	(envelope-from <linux-mips+bounces-13100-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 10:04:36 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FCDD68C5
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 10:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15B9B30D2E7D
	for <lists+linux-mips@lfdr.de>; Tue,  3 Feb 2026 09:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798F830CD95;
	Tue,  3 Feb 2026 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fypj3eF0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVgsiqeQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E8C2E03E4
	for <linux-mips@vger.kernel.org>; Tue,  3 Feb 2026 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109269; cv=none; b=P3wVZcUcUtL8jhVk6gJGqxJdv5ZmNQDw4HwMF+rokWM3W6WIOGm2Myxd71vKe33dUZjXgSY/9giFREOh/wk88rK9UkI0+0OO8Jxa38uLbpaEOrANxcukrOtmTCEyWBgMIOxcDTKz2LrCtTEBz+qtnmZYyX/UKKeOTyV0F7aHPQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109269; c=relaxed/simple;
	bh=HQZAdepWAAG05MGOKGf2DOLqH7+vCZeV4b/mfyGkkQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=me1pxKAz1BwyAgGCapHbI7iTirobHmVJS0miNFzGEiVdjTWIkz34Gmwz4iv457xS9EWYhdNKN6T1tCVDmJ2+zNXRGmofsH+Yl70fZgSPa2zDhT9ZYUbBcSfpCeRyjSqXYn98JvjiKZwDi/WtkmMoaen6L1nJeg81tr//UYFkHW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fypj3eF0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVgsiqeQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770109267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SAv0azhvB0PmgRRTCM2jkuECPq9Iw8iyDp3gTHX+1tM=;
	b=Fypj3eF0ks2fTaLtBo2EUSea29fLBrysPX6IGY3TKvTY9duOQcoUr9cExEeHy8VJWwP2bE
	QtD3AKwE3ppSlTsKoOeFApXP/z9CkFzld+XN5RdfkLhT0VjColYCDSE9Gnxi2l5SQ6Njtx
	GdoJ+hFsXnrt4Qgj8dUhXOoifWamoGY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-cVMWV4gjPUCBWG3noZjYDQ-1; Tue, 03 Feb 2026 04:01:05 -0500
X-MC-Unique: cVMWV4gjPUCBWG3noZjYDQ-1
X-Mimecast-MFC-AGG-ID: cVMWV4gjPUCBWG3noZjYDQ_1770109265
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-430fcf10287so4937324f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 03 Feb 2026 01:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770109265; x=1770714065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAv0azhvB0PmgRRTCM2jkuECPq9Iw8iyDp3gTHX+1tM=;
        b=UVgsiqeQLXUtbq/xlyg6Jkhi8eBsrMPB52HRom8wnDd9f+i83JNctmOu+YuwEL3W4N
         nVl/USyprhlDE9LUkgztcF7RhSpNyPF3UVrje7hulFceW0OsJl4idJmBQjeVDVJ3rI9J
         ONkoqmbAHCOkvQWWu/ZNSsnqnHTibkpar3LfbV66Yi/yU0iZVePqWgMSGwRSBLs9bew2
         HdpaWQ0jGulQN/GcXnExxcTxQIYjSfbghb/sv4W3+uO4Uyxg+ZnyjZ7ttAhLG8iMsge5
         SRwJVgq/8/lbyDl1xP8GHSyIE9KQc75BJYrIwYMet5tmp9J1XPqJVW4/3U7i3DSbYExy
         5eUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109265; x=1770714065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAv0azhvB0PmgRRTCM2jkuECPq9Iw8iyDp3gTHX+1tM=;
        b=r932GGAntu/Bu3AbfUXEy1Jeqn0Nzl7N98Tfe7SKb1idndutHkw0GysE+iBh8cvGG3
         w1MvsMU4v+DhcT2lC11bCzJ+lX6wnS393UB8csjzEShEsPUj1aqTHdTsrzH7GSIsLKo5
         ykUXfIMVGjjsmf4EhrR0hWlZlEEBVp7btMMAWhtl2Dwr5CMgEhBGJNJ1f8rGJoQBMHjd
         9qZJobYKXef3gCGDwoW7ZB4EZDlyE4NzfcnXuJHva9faELjfrazyelAXS2+1VKsPYxkJ
         fuBcf0P6xOhNuo5sGLNxCGEg32lIUCx9nKirfl9POml0+lfOoZPW1ReUNo642mmsUXCT
         HLGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXngQuHNKnkM6PAiKzQVhGpskzRhixchH+/ES68yY9hY1kfOJm9GCa8oU1k38QBk1b/Z9Z3t4/YgllA@vger.kernel.org
X-Gm-Message-State: AOJu0YyF2ZkhuGA8MPZZZgn27Z+KMqcw1dINPLv+nEVm3EmezTmANDmZ
	Ffw/kfhJ3cO54ChM4hywHU+itZSSZej6OdRSVf3Ny9+2isvrfknAwjlAIYEe6wnQFsyyAtBD7fg
	W1mFQCvZY4nV8TUx1A+J29hzIadGW2bK4EzGyY1QJBCZAP/Lny8H0iannzSI1ONY=
X-Gm-Gg: AZuq6aK37DOp+HwF24qWt1MXOoY/tH33xrO07Z9cbcB4w9oj5zH/k/TfQW6G8bPyWK9
	FtOObzZQtZiYZ8AOAz1OiZhy7C/KMDSqic3i5lxblOg+l4yLq3n+bRBUMizYzyu2CcKlPcNZ3sb
	pYzBKV/7pbJEVNEIGpkkbrlmxJW50xCXzOjHGwW4vFaft5U6cOIU5SKfjAU4KMFY0N/QG1t+aCP
	bw3j3cF6W7FZ4G+I+71dM7IpWMC6ITI59U5POmIXothqI780vR+PXqsEbu2aG5Olzk7Nk9FoV/n
	p8xqQ+oLmyRVxu1kYrCEmdXm1RCohHhcn8IeOiNAh9rjA1icX9KXG+xtcD2ZmuigTWASy1eEei9
	xPvW33z3/GMPMQkoGmRo1uEBpNgyZKcRMq0CXrwZFsXa5xaIWnXp//pXNPMc=
X-Received: by 2002:a05:600c:a00e:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-482db481bffmr202564145e9.17.1770109264459;
        Tue, 03 Feb 2026 01:01:04 -0800 (PST)
X-Received: by 2002:a05:600c:a00e:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-482db481bffmr202563795e9.17.1770109263990;
        Tue, 03 Feb 2026 01:01:03 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132368csm46856093f8f.31.2026.02.03.01.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:01:03 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Brian Masney <bmasney@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: microchip: fix typo in reference to a config option
Date: Tue,  3 Feb 2026 10:01:01 +0100
Message-ID: <20260203090101.348879-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[lbulwahn@redhat.com,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13100-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32FCDD68C5
X-Rspamd-Action: no action

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled
with COMPILE_TEST") introduces a typo when referring to a config option in
an ifdef directive.

Fix this typo.

Fixes: 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled with COMPILE_TEST")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/microchip/clk-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index 509cdc060c34..b764ca059e68 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -74,7 +74,7 @@
 /* SoC specific clock needed during SPLL clock rate switch */
 static struct clk_hw *pic32_sclk_hw;
 
-#ifdef CONFIG_MATCH_PIC32
+#ifdef CONFIG_MACH_PIC32
 /* add instruction pipeline delay while CPU clock is in-transition. */
 #define cpu_nop5()			\
 do {					\
-- 
2.52.0


