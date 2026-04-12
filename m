Return-Path: <linux-mips+bounces-14101-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI+iHlqT22lVDgkAu9opvQ
	(envelope-from <linux-mips+bounces-14101-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 12 Apr 2026 14:43:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBEC3E3D16
	for <lists+linux-mips@lfdr.de>; Sun, 12 Apr 2026 14:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B06F300EF43
	for <lists+linux-mips@lfdr.de>; Sun, 12 Apr 2026 12:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFE3274B44;
	Sun, 12 Apr 2026 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKUdFXdD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C51271A94
	for <linux-mips@vger.kernel.org>; Sun, 12 Apr 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775997783; cv=none; b=u1bk9ViM8qdgVM0NYAOINd9WXUarcuKJIXs1qLKPf7z55T1BKaZO7EgcwLmwqtWmhKQXWvY0NucWO0NnvMwArfxMOAOGQ/n9fT2fd09N1EykAmjBIt9NSntT+lg+sCR2M+lQmAIgllxyfH9LX+oCUy0Z9o7OMCea1FBxjVzanIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775997783; c=relaxed/simple;
	bh=j/V6kvnhuhlsoN7ZuzaHKSXaC7u5794AySSBjPax8WU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NPtLAG2acCrk9AyVHhFn3q/v0GqXEB16inguvraOZqaT0vg5sM4ZhGlucP9+HQz8m4KoLF0jI/yu0azqIEOorMyFkdh48HOhdmli6+2980C+8F1hgA29DZRdoHnpSRPqe0NUZfQ6+ScvPt9/ourZco9lASHNTt6itzqF2/c6tCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKUdFXdD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b24fdac394so32301665ad.3
        for <linux-mips@vger.kernel.org>; Sun, 12 Apr 2026 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775997782; x=1776602582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7QWVaN0FaywpyGDYy623KiFtyqheURnD6LA050XwQY=;
        b=pKUdFXdDd9q4VYszMsiDUGcF60PQh6qKswjLPkSMlAdwpTumb7hBDM9nM1xAOWlpNg
         JHdZbEYtoP3RXLuqOa//BpETu6XROLM4eq7gRgx6bqTidkCfj2cG2m8SSFAevw4/OsJm
         A9nmPFkleI+inT0oeVFyGPMFmKiSleyaD0BKwHkEZd8SXJ27jdFabHBztzrDVArRE7Dj
         KDQd1aHfERhHU5Sic5cdQC/pGmhOrZvDIOu99PEwj5iJ9jIEjhilG7Q6mCOQbp164rT4
         N5xzCdUGiwMDly+W+ZmUKujm57pdVcq28M9htwxnIqKf6xNCf/9EMbZVjyr2RMSC2Vbi
         GweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775997782; x=1776602582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7QWVaN0FaywpyGDYy623KiFtyqheURnD6LA050XwQY=;
        b=X5FJqwHHsenPNdo2bX5o7ArXdcaq7lW8goOAB+QLVah+fHiRHGOZZyjaHbWplRst2i
         raW3lj48hmbqyhNvp2DlH944sR+w6vm/7JWS6LmOZ66gItUX63DQh9wH/LmcZQuN3w8n
         cLJebehUCNHqeLpXIzA07BGRj2uxcN8EJ4dqknnSeaoZmpch7gjw1OpbJUxzS8gHYsL1
         K5nJfWWccu1Ghjn+t6Ehmod/cGhW2R9DqzrY6Po/aZeWHvJw6nWWX+HoU6RnxwYdZh/u
         CI81m4oXSknij+0/GvaTlk7VJ+FkvuUBmr6WLa56rX19qF9DD5c58McXDftkFYieC/nM
         0ANQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KfzJFRnXFNa8qwNlIcAzqwHggq+gd534RlEUxyqoos6jQAo1oDAQ8LauQlAwocAGjrDg7rqcfHrCC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp69LJ0YMVcVVN6UMvHWZLWtYZyIk6BRBo6Aq9SgNnAOtp+Szo
	Jh64ZRG3tfGiqPOO2bblq/xjbNDNhbhE2mQO4DR/J3W/vpAIqJCh3QJW
X-Gm-Gg: AeBDiesKulmH20Chb0XGcJ16QAlClEFnjs2sdPhEOdibpXE9eEDnEapuYdV21VyiXT6
	GbhjCoLc68l9AmEwukzrwVs40jL58zGPSzbUeyYKNIHLr1zhYK8Up57GAaY5Tz5zpgj6Ycjad0g
	DJ0g5xX3X/TUA4qCHSv44Xb8CdxDetP3M1E8Yw10sugF1LS5FkNWFki3UDH0Gsk44aAkPiithS4
	Sy6UgeMJyMoOHghPn6ftgcL3KQEccyB4HbuA/J2ZWSUQrftW+etCAGXekFWivHaLqavW1pzKT+t
	obbMkzhxsurIVKM65nllA3LdyMST0v5YbAq0HYHtgYXBKAHr/SU+hYkaHRLpEMQqUbDRqWX07RR
	fxiREuINSod1B904iM0pKHfGj2qtM2YdCDC5pOi/dumPSX+Ra7buHh9gC5ogVfibDbtNxCK3/T0
	lN7yXQEX4XLF2b7A==
X-Received: by 2002:a17:903:40c6:b0:2b4:5ddf:24f with SMTP id d9443c01a7336-2b45ddf0454mr4606985ad.10.1775997781786;
        Sun, 12 Apr 2026 05:43:01 -0700 (PDT)
Received: from lgs.. ([101.32.189.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45cbf0f87sm7731895ad.6.2026.04.12.05.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 05:43:01 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create() error path
Date: Sun, 12 Apr 2026 20:42:46 +0800
Message-ID: <20260412124247.2494971-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14101-lists,linux-mips=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-mips];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CBBEC3E3D16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

eqc_auxdev_create() allocates an auxiliary_device with kzalloc() before
calling auxiliary_device_init().

When auxiliary_device_init() returns an error, the function exits
without freeing adev. Since the release callback is only expected to
handle cleanup after successful initialization, adev should be freed
explicitly in this path.

Add the missing kfree(adev) before returning from the
auxiliary_device_init() error path.

Fixes: 25d904946a0b ("clk: eyeq: add driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/clk/clk-eyeq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index ea1c3d78e7cd..a48ecec4c9a5 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -346,8 +346,10 @@ static int eqc_auxdev_create(struct device *dev, void __iomem *base,
 	adev->id = id;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		kfree(adev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret)
-- 
2.43.0


