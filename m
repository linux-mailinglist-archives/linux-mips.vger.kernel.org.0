Return-Path: <linux-mips+bounces-4691-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA83C946843
	for <lists+linux-mips@lfdr.de>; Sat,  3 Aug 2024 08:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E05ABB21543
	for <lists+linux-mips@lfdr.de>; Sat,  3 Aug 2024 06:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B0B3FB96;
	Sat,  3 Aug 2024 06:52:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD3C23CB
	for <linux-mips@vger.kernel.org>; Sat,  3 Aug 2024 06:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722667957; cv=none; b=WtSD8oSwO+3BkNKKE7Jq2rViWO7aJ4pNmMR+/yd3RU0Vjm8RiL3JQg84fCK7Bok6y1TRjNR+fopC1Br3CDzdA7XC1QSGz9twa0OmADp3w1VDMBqcO+0BXPpSvBqEYVXu9P6WqAVeM4DFsWGrWAKuS4zbJ75PNTSGK/Htnv1CLbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722667957; c=relaxed/simple;
	bh=1DY401B4mAmeI7RkI6wxUAGc+iZy2w9L+ESbYN/4JSU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GBCiwN+rfsAS4KmmUQpyzKIVjAlgrznNobhkG+W0qzZobPzCVKVH7XAnscGEPP9ZNasatRMohbAXCfUn8Zjaj9CqSYR0rhsWOYKA8hMurEQDxQ4BAvyBej4x0LGMEgnfPnM3OE6v0min+cnzB2q9knjFZZr7RowMCc/mYRgRbPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WbYDp4JSGzQnhP
	for <linux-mips@vger.kernel.org>; Sat,  3 Aug 2024 14:48:10 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id B0D7F1800A4
	for <linux-mips@vger.kernel.org>; Sat,  3 Aug 2024 14:52:32 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 3 Aug 2024 14:52:32 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <fancer.lancer@gmail.com>, <cuigaosheng1@huawei.com>
CC: <linux-mips@vger.kernel.org>
Subject: [PATCH -next] bus: bt1-apb: Add missing clk_disable_unprepare in bt1_apb_request_clk
Date: Sat, 3 Aug 2024 14:52:31 +0800
Message-ID: <20240803065231.342695-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200011.china.huawei.com (7.221.188.251)

Add the missing clk_disable_unprepare() before return in
bt1_apb_request_clk().

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/bus/bt1-apb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
index 595fb22b73e0..244f03988545 100644
--- a/drivers/bus/bt1-apb.c
+++ b/drivers/bus/bt1-apb.c
@@ -210,12 +210,14 @@ static int bt1_apb_request_clk(struct bt1_apb *apb)
 	ret = devm_add_action_or_reset(apb->dev, bt1_apb_disable_clk, apb);
 	if (ret) {
 		dev_err(apb->dev, "Can't add APB EHB clocks disable action\n");
+		clk_disable_unprepare(apb->pclk);
 		return ret;
 	}
 
 	apb->rate = clk_get_rate(apb->pclk);
 	if (!apb->rate) {
 		dev_err(apb->dev, "Invalid clock rate\n");
+		clk_disable_unprepare(apb->pclk);
 		return -EINVAL;
 	}
 
-- 
2.25.1


