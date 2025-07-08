Return-Path: <linux-mips+bounces-9658-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C32AFC654
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 10:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2A273A9006
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 08:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E932218845;
	Tue,  8 Jul 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q597ERJK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456631D5150;
	Tue,  8 Jul 2025 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965000; cv=none; b=T5YFk/a6kMIGGt9D9cQ0ZxnkqOU1yW6BOyN9ugADNS+eRoWj3ROUgbDH3l1GCHQb1U91JOa+eaPEUjJ3FOaqCcKU/5vqZNa2WpIzrlKNaT31icnskXPJZmLZuocYxBqfeDlIYPCbeUt5w1qjHQrDeEWWrNcl1S7NQyI4UmeNSPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965000; c=relaxed/simple;
	bh=jVeU/Aqjln3fLCA6Ax+qBHjjU3PAAeYBKzZ1p6qf+ko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sIdCjjioETsDq7WhgASEtmtBVrFEEUxIqSkcavWaWcbGXM7auVni/UYL7lsUFRc5UUa/audelaOwcgSRfin19YFpI//V2AIFmKRLp1Q8MQIi1QmpZlX8HNZllQRj7SQkiQLlpNoLJksmRQfrVBn1io46OLZAO+cEYG4U68BSitY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q597ERJK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF39EC4CEED;
	Tue,  8 Jul 2025 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751964998;
	bh=jVeU/Aqjln3fLCA6Ax+qBHjjU3PAAeYBKzZ1p6qf+ko=;
	h=From:To:Cc:Subject:Date:From;
	b=q597ERJKuVl37lKf0Fyh85894iLsQwmWcs9hj4ELH3V5Vw3vfAKB/xkhJGAs0RUa/
	 rTtJW9yp0GDVhjDSFWdDGcaueJE0tSTSH13OKPi6oa2cxiz47ZS9gsGuvknRS5qnWy
	 aGeaCpo2Lss3mVzJuNOfb9u1FQqtO4/4y1XpAxN2vRjntpj9pTMduY+AJk5RkUsYk0
	 /LEj7glfanoiu3UZsQ9dHN7SvXJNnISMvBerZztE0AOYS1doGbgb8cHiqAl3CWxs5Z
	 vPHsTpAJ77NbupoOYZPpAdNFFT9d1DCvSl5qwMPdoslQdWEPm4UWOSk2Uyis16INfL
	 WyD2paJAZZaCw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uZ47q-0000000047f-2jJL;
	Tue, 08 Jul 2025 10:56:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] reset: eyeq: fix OF node leak
Date: Tue,  8 Jul 2025 10:56:13 +0200
Message-ID: <20250708085613.15823-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make sure to drop the OF node reference taken when probing the auxiliary
device when the device is later unbound.

Fixes: 487b1b32e317 ("reset: eyeq: add platform driver")
Cc: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/reset/reset-eyeq.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 02d50041048b..2d3998368a1c 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -410,6 +410,13 @@ static int eqr_of_xlate_twocells(struct reset_controller_dev *rcdev,
 	return eqr_of_xlate_internal(rcdev, reset_spec->args[0], reset_spec->args[1]);
 }
 
+static void eqr_of_node_put(void *_dev)
+{
+	struct device *dev = _dev;
+
+	of_node_put(dev->of_node);
+}
+
 static int eqr_probe(struct auxiliary_device *adev,
 		     const struct auxiliary_device_id *id)
 {
@@ -428,6 +435,10 @@ static int eqr_probe(struct auxiliary_device *adev,
 	if (!dev->of_node)
 		return -ENODEV;
 
+	ret = devm_add_action_or_reset(dev, eqr_of_node_put, dev);
+	if (ret)
+		return ret;
+
 	/*
 	 * Using our newfound OF node, we can get match data. We cannot use
 	 * device_get_match_data() because it does not match reused OF nodes.
-- 
2.49.0


