Return-Path: <linux-mips+bounces-3325-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B78CF76A
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 04:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 915851F213F5
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 02:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419D51FAA;
	Mon, 27 May 2024 02:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksYQ7rkd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A090E38C;
	Mon, 27 May 2024 02:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716776462; cv=none; b=JkX0PD+qLpLLNHaxTVE+bwa9BoRPt2wQZRmcW/+yLZttHC/7HgkYoiy2dyGCetba/jgPqoXo0dNb+aWWuCdFedDLUK9r3rBxbumClH08W08/wUWheo1Zlyo2r4NadKtQCRUutmgZ4WMN566nAMogrBIG2opdBe5n8PiZ7e+Rwco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716776462; c=relaxed/simple;
	bh=8xvabG6/BcJ5K1hea946q4r4qo0WFZdduPQJhPCnuzE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DTJnp6V7OVd9bSnE0q9MujxN1cjZwb3aKwgT1rdmdqwduiXc4u6VrcLAMcnqCYoIXBYxpgzu9E6+iJz4qN32/zLS7Qqgors6O+2eYohRhv1hSQECCsmuIERctM3sZy9kgiMMfQjw6QnJe7Uft+7z6PlqR12+kwsiwzEFrwmRql0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksYQ7rkd; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f6bddf57f6so5993811b3a.0;
        Sun, 26 May 2024 19:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716776460; x=1717381260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kTCB9YMJ5c3P04qp9UfuZvhdVWxo9nPAMP6wDm7zFWI=;
        b=ksYQ7rkdFyptdrIG/G9PMKTJw/avs8M5F3bUzJx2D+sVcsAyDu17K516PAovP34fFq
         yw5eeZqXuXVw4ZxJkA0ATuUAIDbcGaFmE63OaKR0gfaEEkLdHzGIiTs8jx4ndxvcEYsy
         1nYMC/A0s0REjKY/EwZbp7yl6YWjbLskvh6w28f35TAdGXoFyFhonQEI0KeOc0/E5g4c
         1iXeUSZW8ZaBTIJ8XRjFuyajL+vmytI1VSnG9JMrrFJAPbCLiWwry7hwRry8SDZhfEkI
         kDsQvHn22ZL+VqZQj7xSt5BXmy0Mk7+rZ5zlFlUKwdE5/khWpVSFOwgoWaLa78EcAWtD
         504A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716776460; x=1717381260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTCB9YMJ5c3P04qp9UfuZvhdVWxo9nPAMP6wDm7zFWI=;
        b=nHcIr3nT8RxP0zIzsSeO3xdH9vmXcAZ/Ht8wOIiP83O6D3yY3SnPv8btR7v6z6AB7u
         WTBNFPhPLuzNjsPRtNr4H2Tuia6Xu6VVlXXN+dhz6uRgvejYhjdeX5r+0E4/wfwej0I7
         +pw3/flitSI5vGvqNloBJ1JpZ23JfmQ1mcim+i68KUOiUp09BG0mpKAyavbi+cSOxqHI
         22AY6TxVdjlHpQCi9kbQgJFWIzw/UhTA70P9aTYmy4hxZDUoqMQc4ePLKbKM6bhLYwbv
         2fICrYq6b59SY80WZHPuw3cjC/k+lS2+99Z5fhkOfQmGmkHODM7WM9edc677u95JH4CO
         VCdg==
X-Forwarded-Encrypted: i=1; AJvYcCUXUf7wz9WtL4oHiovimU6w/jakABiuZMrcOsQpIeac+vL062MU8peLiBsatVE8ozJQwqyKWYiIRKHE3Qdxed9XrMztQCSR67MVR8qBfifcCxpIMkrLhaNDNa+de5vRdJV4mAiBntNbdw==
X-Gm-Message-State: AOJu0YwNYltSC+QBx9AzXQ+Zk7zo0vwKZAJNvPJTjWmeX+rKtVcYZkVF
	3FeA5zZyWzUBSKdRzPsiaaYB55yEeLjw1JwrJaR/d7EqeeJpbn4N
X-Google-Smtp-Source: AGHT+IHIpbifuhRbtMptst2IR+v5hq6qg/hEKOC0HACV/2qiQJwQlm1FgP1fRHAPgl4u3HkI4dBG/A==
X-Received: by 2002:aa7:9302:0:b0:6f3:f30a:19b with SMTP id d2e1a72fcca58-6f8f38010f7mr7553576b3a.18.1716776459707;
        Sun, 26 May 2024 19:20:59 -0700 (PDT)
Received: from localhost.localdomain ([36.112.179.1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6822198a705sm5004137a12.36.2024.05.26.19.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 19:20:59 -0700 (PDT)
From: liweihao <cn.liweihao@gmail.com>
X-Google-Original-From: liweihao <liweihao@loongson-pc>
To: arinc.unal@arinc9.com,
	sergio.paracuellos@gmail.com,
	sean.wang@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weihao Li <cn.liweihao@gmail.com>
Subject: [PATCH] pinctrl: ralink: mt76x8: fix pinmux function
Date: Mon, 27 May 2024 10:20:36 +0800
Message-Id: <20240527022036.31985-1-user@blabla>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weihao Li <cn.liweihao@gmail.com>

The current version of the pinctrl driver has some issues:

1. Duplicated "gpio" pmx function

The common code will add a "gpio" pmx functon to every pin group, so
it's not necessary to define a separate "gpio" pmx function in pin
groups.

2. Duplicated pmx function name

There are some same function name in different pin groups, which will
cause some problems. For example, when we want to use PAD_GPIO0 as
refclk output function, the common clk framework code will search the
entire pin function lists, then return the first one matched, in this
case the matched function list only include the PAD_CO_CLKO pin group
because there are three "refclk" pin function, which is added by
refclk_grp, spi_cs1_grp and gpio_grp.

To solve this problem, a simple way is just add a pingrp refix to
function name like mt7620 pinctrl driver does.

3. Useless "-" or "rsvd" functon

It's really unnecessary to add a reserved pin mux function to the
function lists, because we never use it.

Signed-off-by: Weihao Li <cn.liweihao@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c | 88 +++++++----------------
 1 file changed, 27 insertions(+), 61 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
index e7d6ad2f62e4e..2bc8d4409ca27 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
@@ -37,36 +37,30 @@
 
 static struct mtmips_pmx_func pwm1_grp[] = {
 	FUNC("sdxc d6", 3, 19, 1),
-	FUNC("utif", 2, 19, 1),
-	FUNC("gpio", 1, 19, 1),
+	FUNC("pwm1 utif", 2, 19, 1),
 	FUNC("pwm1", 0, 19, 1),
 };
 
 static struct mtmips_pmx_func pwm0_grp[] = {
 	FUNC("sdxc d7", 3, 18, 1),
-	FUNC("utif", 2, 18, 1),
-	FUNC("gpio", 1, 18, 1),
+	FUNC("pwm0 utif", 2, 18, 1),
 	FUNC("pwm0", 0, 18, 1),
 };
 
 static struct mtmips_pmx_func uart2_grp[] = {
 	FUNC("sdxc d5 d4", 3, 20, 2),
-	FUNC("pwm", 2, 20, 2),
-	FUNC("gpio", 1, 20, 2),
+	FUNC("uart2 pwm", 2, 20, 2),
 	FUNC("uart2", 0, 20, 2),
 };
 
 static struct mtmips_pmx_func uart1_grp[] = {
 	FUNC("sw_r", 3, 45, 2),
-	FUNC("pwm", 2, 45, 2),
-	FUNC("gpio", 1, 45, 2),
+	FUNC("uart1 pwm", 2, 45, 2),
 	FUNC("uart1", 0, 45, 2),
 };
 
 static struct mtmips_pmx_func i2c_grp[] = {
-	FUNC("-", 3, 4, 2),
 	FUNC("debug", 2, 4, 2),
-	FUNC("gpio", 1, 4, 2),
 	FUNC("i2c", 0, 4, 2),
 };
 
@@ -76,128 +70,100 @@ static struct mtmips_pmx_func wdt_grp[] = { FUNC("wdt", 0, 38, 1) };
 static struct mtmips_pmx_func spi_grp[] = { FUNC("spi", 0, 7, 4) };
 
 static struct mtmips_pmx_func sd_mode_grp[] = {
-	FUNC("jtag", 3, 22, 8),
-	FUNC("utif", 2, 22, 8),
-	FUNC("gpio", 1, 22, 8),
+	FUNC("sdxc jtag", 3, 22, 8),
+	FUNC("sdxc utif", 2, 22, 8),
 	FUNC("sdxc", 0, 22, 8),
 };
 
 static struct mtmips_pmx_func uart0_grp[] = {
-	FUNC("-", 3, 12, 2),
-	FUNC("-", 2, 12, 2),
-	FUNC("gpio", 1, 12, 2),
 	FUNC("uart0", 0, 12, 2),
 };
 
 static struct mtmips_pmx_func i2s_grp[] = {
 	FUNC("antenna", 3, 0, 4),
 	FUNC("pcm", 2, 0, 4),
-	FUNC("gpio", 1, 0, 4),
 	FUNC("i2s", 0, 0, 4),
 };
 
 static struct mtmips_pmx_func spi_cs1_grp[] = {
-	FUNC("-", 3, 6, 1),
-	FUNC("refclk", 2, 6, 1),
-	FUNC("gpio", 1, 6, 1),
+	FUNC("spi refclk", 2, 6, 1),
 	FUNC("spi cs1", 0, 6, 1),
 };
 
 static struct mtmips_pmx_func spis_grp[] = {
 	FUNC("pwm_uart2", 3, 14, 4),
-	FUNC("utif", 2, 14, 4),
-	FUNC("gpio", 1, 14, 4),
+	FUNC("spis utif", 2, 14, 4),
 	FUNC("spis", 0, 14, 4),
 };
 
 static struct mtmips_pmx_func gpio_grp[] = {
 	FUNC("pcie", 3, 11, 1),
-	FUNC("refclk", 2, 11, 1),
-	FUNC("gpio", 1, 11, 1),
-	FUNC("gpio", 0, 11, 1),
+	FUNC("gpio refclk", 2, 11, 1),
 };
 
 static struct mtmips_pmx_func p4led_kn_grp[] = {
-	FUNC("jtag", 3, 30, 1),
-	FUNC("utif", 2, 30, 1),
-	FUNC("gpio", 1, 30, 1),
+	FUNC("p4led_kn jtag", 3, 30, 1),
+	FUNC("p4led_kn utif", 2, 30, 1),
 	FUNC("p4led_kn", 0, 30, 1),
 };
 
 static struct mtmips_pmx_func p3led_kn_grp[] = {
-	FUNC("jtag", 3, 31, 1),
-	FUNC("utif", 2, 31, 1),
-	FUNC("gpio", 1, 31, 1),
+	FUNC("p3led_kn jtag", 3, 31, 1),
+	FUNC("p3led_kn utif", 2, 31, 1),
 	FUNC("p3led_kn", 0, 31, 1),
 };
 
 static struct mtmips_pmx_func p2led_kn_grp[] = {
-	FUNC("jtag", 3, 32, 1),
-	FUNC("utif", 2, 32, 1),
-	FUNC("gpio", 1, 32, 1),
+	FUNC("p2led_kn jtag", 3, 32, 1),
+	FUNC("p2led_kn utif", 2, 32, 1),
 	FUNC("p2led_kn", 0, 32, 1),
 };
 
 static struct mtmips_pmx_func p1led_kn_grp[] = {
-	FUNC("jtag", 3, 33, 1),
-	FUNC("utif", 2, 33, 1),
-	FUNC("gpio", 1, 33, 1),
+	FUNC("p1led_kn jtag", 3, 33, 1),
+	FUNC("p1led_kn utif", 2, 33, 1),
 	FUNC("p1led_kn", 0, 33, 1),
 };
 
 static struct mtmips_pmx_func p0led_kn_grp[] = {
-	FUNC("jtag", 3, 34, 1),
-	FUNC("rsvd", 2, 34, 1),
-	FUNC("gpio", 1, 34, 1),
+	FUNC("p0led_kn jtag", 3, 34, 1),
 	FUNC("p0led_kn", 0, 34, 1),
 };
 
 static struct mtmips_pmx_func wled_kn_grp[] = {
-	FUNC("rsvd", 3, 35, 1),
-	FUNC("rsvd", 2, 35, 1),
-	FUNC("gpio", 1, 35, 1),
 	FUNC("wled_kn", 0, 35, 1),
 };
 
 static struct mtmips_pmx_func p4led_an_grp[] = {
-	FUNC("jtag", 3, 39, 1),
-	FUNC("utif", 2, 39, 1),
-	FUNC("gpio", 1, 39, 1),
+	FUNC("p4led_an jtag", 3, 39, 1),
+	FUNC("p4led_an utif", 2, 39, 1),
 	FUNC("p4led_an", 0, 39, 1),
 };
 
 static struct mtmips_pmx_func p3led_an_grp[] = {
-	FUNC("jtag", 3, 40, 1),
-	FUNC("utif", 2, 40, 1),
-	FUNC("gpio", 1, 40, 1),
+	FUNC("p3led_an jtag", 3, 40, 1),
+	FUNC("p3led_an utif", 2, 40, 1),
 	FUNC("p3led_an", 0, 40, 1),
 };
 
 static struct mtmips_pmx_func p2led_an_grp[] = {
-	FUNC("jtag", 3, 41, 1),
-	FUNC("utif", 2, 41, 1),
-	FUNC("gpio", 1, 41, 1),
+	FUNC("p2led_an jtag", 3, 41, 1),
+	FUNC("p2led_an utif", 2, 41, 1),
 	FUNC("p2led_an", 0, 41, 1),
 };
 
 static struct mtmips_pmx_func p1led_an_grp[] = {
-	FUNC("jtag", 3, 42, 1),
-	FUNC("utif", 2, 42, 1),
-	FUNC("gpio", 1, 42, 1),
+	FUNC("p1led_an jtag", 3, 42, 1),
+	FUNC("p1led_an utif", 2, 42, 1),
 	FUNC("p1led_an", 0, 42, 1),
 };
 
 static struct mtmips_pmx_func p0led_an_grp[] = {
-	FUNC("jtag", 3, 43, 1),
-	FUNC("rsvd", 2, 43, 1),
-	FUNC("gpio", 1, 43, 1),
+	FUNC("p0led_an jtag", 3, 43, 1),
 	FUNC("p0led_an", 0, 43, 1),
 };
 
 static struct mtmips_pmx_func wled_an_grp[] = {
-	FUNC("rsvd", 3, 44, 1),
-	FUNC("rsvd", 2, 44, 1),
-	FUNC("gpio", 1, 44, 1),
 	FUNC("wled_an", 0, 44, 1),
 };
 
-- 
2.39.2


