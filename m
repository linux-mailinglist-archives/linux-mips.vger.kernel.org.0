Return-Path: <linux-mips+bounces-7916-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CD3A42E3A
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2025 21:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 561331787CB
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2025 20:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B456925A34D;
	Mon, 24 Feb 2025 20:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJL9MVSo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9AC15530B;
	Mon, 24 Feb 2025 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740429984; cv=none; b=Vhyb+lX14pqCOU/KWrbX4vWfaLDHHpn2U+UpCrCYSD+HIKmKmBnXziEXCXco31KmRuh/gg3uNZ/pdpNsjxddCKFAFhhjlYN/3ILx3POL63Vk2CBLxEYHm6j6tcTCQ6ZuZvpMuuxZmiedgKAJY8iq0t7hPtLVPVl+hWDkX9RxOvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740429984; c=relaxed/simple;
	bh=88cPN3H6gcbNZ7ktabvYE+Q+qFCiyRzXjcPlY/U7yFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z0T6YUel3ZDnSYqs33XN3LLXw7Vl7YAMLEVuQ18QMdBIVbJf74ZI/WIqrcADrdgMxVzcpTCwvjnu8qwUIRtRQ5UNMz75Az3Iwsd0KDMQ0hUu0m9vzU3gHs/smNuhobgFLeSD6ua69gbBziRq4znvvxQBFgaL0gLHS1eg2Vhizxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJL9MVSo; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abba1b74586so717959066b.2;
        Mon, 24 Feb 2025 12:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740429981; x=1741034781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnATVFUsEgdsCcxA642xL3YTLh2IS1ygGW5/sam4Cx4=;
        b=EJL9MVSo9tsjOmYJIfMBOSufKP0r7PgM/Qzrs6N23CEzNkxLSB5bfJKIwJhmRDPs4K
         0uuh+AR+kdP3gnqPdc0tvxqkkvjufEOkFhHxs8EbRXmA0K1km3PQAFRO0kO5pCdrsbOi
         jhVcjB5ScfM9WQlQhGQ8WV7LCsB4/hI/U6ywTMI+Cymg7/a1whYumeNqeLolZzMVPfIL
         OTeJBrrGui02ZL/DsfB0lrlQbqI2qYPTl/GaY3QQCq2yX6r5eDG8+BE5Isos8Ht6W2dp
         xcNWFOwKv9XjnhTv1wEJI8DKJvuyD1eZDwkJHpQEnDmemsao8s3kdV5/chKXftC//cAP
         ciNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740429981; x=1741034781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnATVFUsEgdsCcxA642xL3YTLh2IS1ygGW5/sam4Cx4=;
        b=Ots7nPLlYiRGfWCNGTLZAQCHpS0UqajTSo+q8f2kxb5njxVstDjBa1GP75xO5HC9xR
         QMCT3K57QtBGryrrS9ILSKwT9QfdrPDapKU2lm65oSruFDhqXwpXVZv2oOyiA7vbATaC
         jwUZTbQPzi/IOeFGRk/FaFgKAG4t42G9e8agyga1zdbGOL39kyVTZf3bnfPlUjFWKMPT
         mN0gtQanwX1YFHm2+RZpyLAYQ0rO9jkPuzwDLuwPpwHZ+hYZ8z2OxQ5L5V/Tlbkai7Fh
         a3Y8qSUlGQLAfgQXcVDX6zpOjaYSHmi5lzzv8Fyy6Nrgqtm9AuB4OY87BFKjwvnlze3i
         1Tqg==
X-Forwarded-Encrypted: i=1; AJvYcCXutuKKueZ4DBryUjESs4CDNWDHpgxkmA4SqgGRPawcHwk0LogTbh78gIKT+jopPd5lJxenURIHD2Kd@vger.kernel.org
X-Gm-Message-State: AOJu0YwR+IaB2VUxiQVyMxAhFLyR6sBtFSa8S8URfDvzAIOoeFGrvZdy
	45p2h/poQRhHGXH6amK69lmUIEDsg8DVIqmD8ziWTYU+QPov7PF+bV7kzNEr
X-Gm-Gg: ASbGnctiCGwPalRfLQPm/ufc+g+/3R7bKoxwh1sC3hNiAAJEeUYWVwui+2VWJxgU5kC
	V9/YfgxixDagV6MYgqVFHfLE4lRBPEmlHYODLeVtMNRrcaFZvsh4VLB+EyNVWSfFDZDKudGx9Ys
	cwxl2u9C3FKnExhhhrz7DQvPg67IcqDcA/8eLIi2uN8cFbcDnHr17X0HOsBtE2+MqXsAfMjUOLX
	LtYdBQX6cUtSAOcJYKeQZQMuaCbY4JYw8upgNkq1MEG1z8L9xh6qPvK7sJxmGCodLjDuQc8MXX+
	dqIlJlzEoUvHj/IF9uHKzkNoGmWZSfAaodHc4UQ0CyzsCvI/0IxFGQ==
X-Google-Smtp-Source: AGHT+IFz8EibD8cFZsxZkeUBGSTCzZoxJOWTKbiqu/ZhC4xrkBB/fdNGLPHSRVaeTuOGFYwsqWpa5w==
X-Received: by 2002:a17:906:31c6:b0:aa6:9461:a186 with SMTP id a640c23a62f3a-abed1016d48mr50375266b.46.1740429981001;
        Mon, 24 Feb 2025 12:46:21 -0800 (PST)
Received: from localhost.localdomain ([2a02:2f0e:c501:f600:21cb:f6d7:4e65:6e28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20121cesm18552066b.123.2025.02.24.12.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 12:46:20 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: fancer.lancer@gmail.com,
	linux-mips@vger.kernel.org,
	tsbogend@alpha.franken.de,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 1/2] bus: bt1-axi: use dev_groups to register attribute groups
Date: Mon, 24 Feb 2025 22:45:59 +0200
Message-ID: <20250224204600.3138007-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of manually adding/removing attribute groups, set dev_groups
pointer to have the driver core do it.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/bus/bt1-axi.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/bus/bt1-axi.c b/drivers/bus/bt1-axi.c
index a5254c73bf43..240c7e77b35e 100644
--- a/drivers/bus/bt1-axi.c
+++ b/drivers/bus/bt1-axi.c
@@ -217,30 +217,6 @@ static struct attribute *bt1_axi_sysfs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(bt1_axi_sysfs);
 
-static void bt1_axi_remove_sysfs(void *data)
-{
-	struct bt1_axi *axi = data;
-
-	device_remove_groups(axi->dev, bt1_axi_sysfs_groups);
-}
-
-static int bt1_axi_init_sysfs(struct bt1_axi *axi)
-{
-	int ret;
-
-	ret = device_add_groups(axi->dev, bt1_axi_sysfs_groups);
-	if (ret) {
-		dev_err(axi->dev, "Failed to add sysfs files group\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(axi->dev, bt1_axi_remove_sysfs, axi);
-	if (ret)
-		dev_err(axi->dev, "Can't add AXI EHB sysfs remove action\n");
-
-	return ret;
-}
-
 static int bt1_axi_probe(struct platform_device *pdev)
 {
 	struct bt1_axi *axi;
@@ -266,10 +242,6 @@ static int bt1_axi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = bt1_axi_init_sysfs(axi);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -283,7 +255,8 @@ static struct platform_driver bt1_axi_driver = {
 	.probe = bt1_axi_probe,
 	.driver = {
 		.name = "bt1-axi",
-		.of_match_table = bt1_axi_of_match
+		.of_match_table = bt1_axi_of_match,
+		.dev_groups =  bt1_axi_sysfs_groups,
 	}
 };
 module_platform_driver(bt1_axi_driver);
-- 
2.48.1


