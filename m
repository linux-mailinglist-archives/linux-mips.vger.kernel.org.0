Return-Path: <linux-mips+bounces-6891-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3C9E5645
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 14:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B67F3168CF3
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 13:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AB71A8F80;
	Thu,  5 Dec 2024 13:13:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D2E56C
	for <linux-mips@vger.kernel.org>; Thu,  5 Dec 2024 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733404401; cv=none; b=PRdLpGz09/OKCPXvWJBvInx7LZVmsz1OrpdDNbMXZmvwS5euISrsDkHjaX9oPV0BDIUPwpTlcpf1TWGgof+VRKdBgL/1itjAa5aQjmt9M2OfQwVSHnFpvMqtQMNHhhdKIQS/TJml9Sjocqrnf/KBr07qhmYAwtRq66jgMwXmyzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733404401; c=relaxed/simple;
	bh=dDbW9KLhmOx+wIfqjCyw7iAjYkiy4o2x6EZyg8tiVXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GK+1Jj35IW2Xx0jPb5rbK/I9E08mhNOvix3vlvosCVv0EanEOjyLXhBEd6cOf+aVejU/yBf4YECnWvZU+VUVzXhbwllb29jYNnJi7rnDgindxVbzizRyoBIk9cucWs6Zmc3ebcLFXtelYzyJXc7zh4u6jkOXxlmUeSDOMBOAV9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by andre.telenet-ops.be with cmsmtp
	id l1DB2D0063EEtj2011DBbV; Thu, 05 Dec 2024 14:13:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBfK-000LQH-Dq;
	Thu, 05 Dec 2024 14:13:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBfL-00EQXW-5Z;
	Thu, 05 Dec 2024 14:13:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Cercueil <paul@crapouillou.net>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: ingenic: Replace seq_printf() by seq_puts()
Date: Thu,  5 Dec 2024 14:13:10 +0100
Message-Id: <9a5b38027ed674ca773fe28a3b3246631eae8834.1733404358.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify "seq_printf(p, "%s", ...)" to "seq_puts(p, ...)".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/pinctrl/pinctrl-ingenic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 31703737731bd0ee..bc7ee54e062b5b85 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3699,7 +3699,7 @@ static void ingenic_gpio_irq_print_chip(struct irq_data *data, struct seq_file *
 {
 	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
 
-	seq_printf(p, "%s", gpio_chip->label);
+	seq_puts(p, gpio_chip->label);
 }
 
 static const struct irq_chip ingenic_gpio_irqchip = {
-- 
2.34.1


