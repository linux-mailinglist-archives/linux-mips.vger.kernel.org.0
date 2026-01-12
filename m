Return-Path: <linux-mips+bounces-12884-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B394ED15A55
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AED48304F507
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392562C0263;
	Mon, 12 Jan 2026 22:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHYW99BB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TV3iiGQz"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F73285068
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258169; cv=none; b=XCefpcLVxmWEyVlXJxkNrEHizXOr+56oqbV13cSElq+I4ffNTBrNKqFoOHpRM3qHlyoLunndhKadbFI7Ag2iepONh292vvSeDmS1mgNNLCyVq0y8VoG7BS4rX2QDfsfN21djPs2fckorTbKi/aArFwfEXCFRyMcJq5XiTtG7pYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258169; c=relaxed/simple;
	bh=y5Wna2uuT+TyZLNT2wjyR7itI0mAOICA1O/5yDz9N8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxyMXLsTnCufTHZvnBZdEQIx7mpeLtOnkF6hXKTH3qGP9xdlI0IHHRVHe3BVarvLYlNb0bpXk00A+w06Y9Sn5OB8XCxhV5VqeWkMueFJ6JnJuLPRCgrlmlQjqd5AGlzgHdKWz8Ixo6pt7Em7dHl60s4osQYmvVLTHrBx/CeDYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHYW99BB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TV3iiGQz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7A0SVSsJLLrH3UzeGVYQj7XUlswlx8l5i5D50nZwrq0=;
	b=gHYW99BBeq3L+xCp4MmxvmAljREpWowDqSynjx2I0Yw3YWOKgLbjf4RjKzTC+3rdcaMqRR
	oEhZs4yvMiPjeD3kndtCCM8ounzWpbG97llBo57ACxqQhSvNkJtaZxZbYSjz+ssfY5Vdwp
	is8dahRDY2FmUu5WJwPDv9su7Y3c0S4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-gL6y34t5NEe_n6P9FPNY0w-1; Mon, 12 Jan 2026 17:49:13 -0500
X-MC-Unique: gL6y34t5NEe_n6P9FPNY0w-1
X-Mimecast-MFC-AGG-ID: gL6y34t5NEe_n6P9FPNY0w_1768258153
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b8738fb141so1569180485a.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258153; x=1768862953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7A0SVSsJLLrH3UzeGVYQj7XUlswlx8l5i5D50nZwrq0=;
        b=TV3iiGQz0R7JgZd89j+9FyaG9xABwtFuZry6vhvCuLxYEtg87MZzCIbYkM6aHixe6P
         KkM3vX+riBAI71lZlmGUfcaxXAG6TNRjO+eMhWeQ8T2Rhj6Jg+HqXnk/FzfchTAHQFcT
         wrIqYQu6ZT2EuosvDyblkHw8OtfOTSl9gmxjiiRQmyJrjI+cvXwpsEmk21+kkwYqMOax
         +n69EUVDDyNHkAZx0jlNmNdJ8rO4dRBGEPc7XvANeuH9rbnaYe2RRk39eghcBlc4aV1p
         9Rm4FVS+17Qc4eM+mpBV8+NA24TkKdWc9OTF5IFX3Il9vO3DZW9/qe70ndy4woOnl141
         v+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258153; x=1768862953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7A0SVSsJLLrH3UzeGVYQj7XUlswlx8l5i5D50nZwrq0=;
        b=PcTjsPa1GgB3kEydESsfdtdxEiFGZnUpw8bydR8/vRe5LdBx3zjMFZINC/hYtv4lCC
         hfnFzXeT8AJ7AC3yuTXR8FceWzeP7mhNyun/Y2M9pB/+YVaXRFyOyGIMbuDk0xe3WoCO
         SiIXHCpk8jbsIGs83w4qFTH91iWndPp7PZj2D3f1SXeP1N1VzzskzyhmprvQP5+naFbT
         iBEeA7mOvpV1k+cEXYLpf8VTdPWI6ueV/r8y2vEdlFJgSxYQRo9DSEwKxgCYhcdjcxA1
         zPz5A0HyXenlcLhqxl03KqFx4HxqEDZuCoSN0p0/nRCs3i97t28axVWLBoWeWesCnMNZ
         G9WQ==
X-Gm-Message-State: AOJu0YyG+sUT5TwgDA/4b1FW7DycoZGr5vT5RSatSnNXMeph0YZ4ouO6
	MjeMoLoNLdTTpAqnYp+pL82Zay922RCstFJw1tdGPyx0A3zmyxu3iROGhDm2DR4A7eXs9jzxdUa
	WJqWTpwStGkhbESILivBBGDyiJxM8nPIqzShPSMaOZe92XB787rLPgRyPJZlUh8U=
X-Gm-Gg: AY/fxX5zUMyVPPHt5+TNzs7ON2pHKvDkK6BRfM1gZFROnFGDSn5W7lTNWEM/n2UzgJ6
	8eSqY7Z6rwIACq+b+fHu4Ec83Dy3zS5TSrfcHUY+Cp3g/xkgYeIbviXMblLikPoTIys2ycmI+8a
	Li/abi1apb/8K3fgnO0RWpp4uhOii0RRw5cOYkxd9kNN6il8m97r8fTBI6qR5i6aA05bexqhXkd
	CwSojaTt8iaI0MESyhVe1AfgSarV3PqyT8Kqey6uwEEzsaxYWWlb0r/w4fJZmdO1G2fugJLpnD5
	HkNkt4jJh92vsu7BEEWJIPX/GcicuZj9Jop138SbUYdWG4QF6Pkt12wA7p8EhMjsh+rr9W52Cky
	5lGlHBosNYlS7KKD/cnAv64f6pTKewyaufQbYWYh+UwjrB+NRaQ==
X-Received: by 2002:a05:620a:1aa5:b0:8b2:eb66:c5a with SMTP id af79cd13be357-8c520853b0fmr169185785a.14.1768258152836;
        Mon, 12 Jan 2026 14:49:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsvdQxsJHG2m65/05EJas3YECRu5U/ohT03pVCcHZAYUWvkJzij70G8F+gUsd10k7nKvHn0w==
X-Received: by 2002:a05:620a:1aa5:b0:8b2:eb66:c5a with SMTP id af79cd13be357-8c520853b0fmr169183385a.14.1768258152479;
        Mon, 12 Jan 2026 14:49:12 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:49:11 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:10 -0500
Subject: [PATCH v2 16/16] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-16-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=y5Wna2uuT+TyZLNT2wjyR7itI0mAOICA1O/5yDz9N8g=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq3w+aoiaxxYk/RI6FBPPdl5i5Yqyy2JZNYL7NznJm
 cn+mKDXUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwERiuxkZLrQu/HPO+Ija7pkb
 7nEkO1d1zhdYHHHFOPypg7y0T2GENSPDqjq55tapiuklgjtd3BaWhxeJhW6tDn2QFVhi7fxH2J0
 XAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This driver currently only supports builds against a PIC32 target. To
avoid future breakage in the future, let's update the Kconfig and the
driver so that it can be built with CONFIG_COMPILE_TEST enabled.

Note that with the existing asm calls is not how I'd want to do this
today if this was a new driver, however I don't have access to this
hardware. To avoid any breakage, let's keep the existing behavior.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/microchip/Kconfig    | 2 +-
 drivers/clk/microchip/clk-core.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index 1b9e43eb54976b219a0277cc971f353fd6af226a..1e56a057319d97e20440fe4e107d26fa85c95ab1 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config COMMON_CLK_PIC32
-	def_bool COMMON_CLK && MACH_PIC32
+	def_bool (COMMON_CLK && MACH_PIC32) || COMPILE_TEST
 
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index 891bec5fe1bedea826ff9c3bd4099c90e2528ff9..ce3a24e061d145934c84843008efadc3b0e2cffa 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -75,6 +75,7 @@
 /* SoC specific clock needed during SPLL clock rate switch */
 static struct clk_hw *pic32_sclk_hw;
 
+#ifdef CONFIG_MATCH_PIC32
 /* add instruction pipeline delay while CPU clock is in-transition. */
 #define cpu_nop5()			\
 do {					\
@@ -84,6 +85,9 @@ do {					\
 	__asm__ __volatile__("nop");	\
 	__asm__ __volatile__("nop");	\
 } while (0)
+#else
+#define cpu_nop5()
+#endif
 
 /* Perpheral bus clocks */
 struct pic32_periph_clk {

-- 
2.52.0


