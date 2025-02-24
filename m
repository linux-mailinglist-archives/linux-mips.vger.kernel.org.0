Return-Path: <linux-mips+bounces-7917-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 970EFA42E40
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2025 21:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D799A189DD74
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2025 20:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA084262D25;
	Mon, 24 Feb 2025 20:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVk1WI+s"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B0615CD4A;
	Mon, 24 Feb 2025 20:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740429985; cv=none; b=BPLybwKh1CGdWa9AeHWhSbM8gJveAToWRvLM9UHoET2UyjIjDs+aSmwX4+0Zt6tHJm64u7R9cxsZaarJaDxsvibyC0G0UPlLAA4Px3Tr+FHSPEhnoTc9BZB73AfrqLKkkJo+B8m0StQCxinfxuGC2ficolaxEW2h2LUhKR+Yi4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740429985; c=relaxed/simple;
	bh=hUv1hk7zXQcirkLW/BE6pQWUvjtRc/0AMY1anONs3d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYFaA30m/kd7ijRwZULKTVYvmD3jmFHxbhoLRytksiFXVj3GLYWfme3/RF7XpW4MM7SVQp53TTxeJGNbBCYrvwXZJHg00eef5Ca9cMU5epWpK6hgAcB69SbW3i30S/qtI98dVD55il+UWjnxYWQu7szJfVbjdJT97EehxbIHS7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVk1WI+s; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so797504066b.3;
        Mon, 24 Feb 2025 12:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740429982; x=1741034782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDG3XmQgyobllXgthBtbsJKHryuNGH1saHslupz9mQI=;
        b=ZVk1WI+sBCmqn2mS5jFJhOESHpLdhd1bKgf6xj+glotJBBN3EVeg5bWGaPQW2HYauO
         X8REeGKYABbal18yMX6CpUZKNLQBYsC0ykqJ0mj3mTCgHO1kr4Jw90inTaXdDiJRAHza
         1mUxZE289+dzlDGV1vfvpRxwMcjhYyf5GRK2wweQkbNmSL3Mv78OFEh9XsGwlUtKKGeh
         kpt0DDbm/xNf4kGl5zmsjYafZTzidsF12LpWLybG/J3qxqpJojNpkBLambGhBI7U0pUp
         HIo6fBq0zpJLnEvwvgQKqRAeCSSkad+VMB3eRQ1iNWi8HTS1/+J+QuV2MhnfSumwoP9n
         WDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740429982; x=1741034782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDG3XmQgyobllXgthBtbsJKHryuNGH1saHslupz9mQI=;
        b=dGEk/fTy8zkP23YQdFp3TTMvFlE3k+NJVjYiUTM94yJlDaNtvYSwkvcv/3LPKLFSbZ
         YqBDXl/96WqAkBtBI/nIcDSgFpxDTK2rFDTtCeB/V9UUCspMrQMmITOWHTpB3MI3leSo
         HMZUF6Siohdx5q1TUIL7mPHT6JnHLynoYSuXQDuyxOFbG0d1Hmj/77CT9iXxqiuGD6So
         d3vg4Up4RuX9CfodH89ahXQbaXvkLDU6RF5cKyLX3LdoaW+OSBmgwp6GWySHGC4iTvAJ
         VClDTx7IN1PmfEp9CikjgIYQn20XK0kqr7TyXUaz97K2J8/S7jyHjVTkIiSCPAzqolXH
         +RIw==
X-Forwarded-Encrypted: i=1; AJvYcCV3egz7dVPtUCodz+TuhayiD5Oh1xYw+BEvNo2yk3RRLoGRBi7HFhq7RJTsmps3UB5oxRvSEtOsodRN@vger.kernel.org
X-Gm-Message-State: AOJu0YzYV8wAENJHysFca2wqiK1LAXNwE+0LgBNpb/GxOTDBVcfGrP8Q
	/Pnms0Vn+B2W876ahLCv/sP2UGBDS6XOt22aC/sXIAcOpoYovAsPqxZuIulC
X-Gm-Gg: ASbGncvitzTOASY1YkPVsFkLKrIGY8eDM9vW2mYO5CqDm7oFirnuMcnPL/+rt3l2qQC
	J9phPZIcocGojqvtAVEFepBiCNLNyy+u47QQ+cg5eToPYpSQQtHNIR4P7EDHmdLhwB2mXJcB40R
	eTQPjM6zyveGkU2wmL0dqbHM6938UgOetUR9vRlQixS6cHoAXPfqWSRFBLg2EpOc54FO7NSnG9B
	9C9eARP2ms0NtLBEAhWNoOj0OM05+8lt8V4nyRFeFzK12dpYx/kEMHt8jEsTXXjkBoM6pkTTACQ
	zpzLulbTzfaVgp0mHz8DXLLqF27dVx9bBoSfHd3Gn5nsjYXRS/bH0A==
X-Google-Smtp-Source: AGHT+IGz1z19f3cpcOw+udVzAb/6AqifA+2EQT+vEVWzFrbUkUiXmnN5kkiCHHXe5LXBcinTkHwZvg==
X-Received: by 2002:a17:907:7254:b0:ab3:76fb:96ab with SMTP id a640c23a62f3a-abc09c29705mr1503502166b.57.1740429981965;
        Mon, 24 Feb 2025 12:46:21 -0800 (PST)
Received: from localhost.localdomain ([2a02:2f0e:c501:f600:21cb:f6d7:4e65:6e28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20121cesm18552066b.123.2025.02.24.12.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 12:46:21 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: fancer.lancer@gmail.com,
	linux-mips@vger.kernel.org,
	tsbogend@alpha.franken.de,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 2/2] bus: bt1-apb: use dev_groups to register attribute groups
Date: Mon, 24 Feb 2025 22:46:00 +0200
Message-ID: <20250224204600.3138007-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224204600.3138007-1-ovidiu.panait.oss@gmail.com>
References: <20250224204600.3138007-1-ovidiu.panait.oss@gmail.com>
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
 drivers/bus/bt1-apb.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
index 7463124b6dd9..ca4b6b1f896f 100644
--- a/drivers/bus/bt1-apb.c
+++ b/drivers/bus/bt1-apb.c
@@ -321,30 +321,6 @@ static struct attribute *bt1_apb_sysfs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(bt1_apb_sysfs);
 
-static void bt1_apb_remove_sysfs(void *data)
-{
-	struct bt1_apb *apb = data;
-
-	device_remove_groups(apb->dev, bt1_apb_sysfs_groups);
-}
-
-static int bt1_apb_init_sysfs(struct bt1_apb *apb)
-{
-	int ret;
-
-	ret = device_add_groups(apb->dev, bt1_apb_sysfs_groups);
-	if (ret) {
-		dev_err(apb->dev, "Failed to create EHB APB sysfs nodes\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(apb->dev, bt1_apb_remove_sysfs, apb);
-	if (ret)
-		dev_err(apb->dev, "Can't add APB EHB sysfs remove action\n");
-
-	return ret;
-}
-
 static int bt1_apb_probe(struct platform_device *pdev)
 {
 	struct bt1_apb *apb;
@@ -370,10 +346,6 @@ static int bt1_apb_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = bt1_apb_init_sysfs(apb);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -387,7 +359,8 @@ static struct platform_driver bt1_apb_driver = {
 	.probe = bt1_apb_probe,
 	.driver = {
 		.name = "bt1-apb",
-		.of_match_table = bt1_apb_of_match
+		.of_match_table = bt1_apb_of_match,
+		.dev_groups = bt1_apb_sysfs_groups,
 	}
 };
 module_platform_driver(bt1_apb_driver);
-- 
2.48.1


