Return-Path: <linux-mips+bounces-12805-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B7010D0B55C
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37DF33028733
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34A1364E97;
	Fri,  9 Jan 2026 16:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WC2E78kv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k6OB1OqE"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088CD3644C9
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976966; cv=none; b=LxEZglYtrCIAlojXM+l9n1QG0xwk4Kk7X345HzQNlQQgAfI47MOy87sAJQZIaWm5EmEqF51clw2BUpQn8B+YwSI4uuFrAyYNPnphElW2mlGJCaeQffO0KeUtIul7Cn4w0Muo8aI5XHuHqKnbyEe19fmEa/pUPtqrR+pw1P7ijfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976966; c=relaxed/simple;
	bh=y5Wna2uuT+TyZLNT2wjyR7itI0mAOICA1O/5yDz9N8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkZU+dSkQ9QEHpZpGBZPTmoKvKkTLpcM+1PmoFgj7y0HwgJWoUx928/Tyob69gRtRe0TuVAj90ZMm3MyWmjouz3H7fj7m0JiMLUikTd5pMs4EVGZbnzBEaA+vU0UKhWwE+IXOvCs81dxU1PG4Y6PL6+xyqxHN08zM2xX9V7FhZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WC2E78kv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k6OB1OqE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7A0SVSsJLLrH3UzeGVYQj7XUlswlx8l5i5D50nZwrq0=;
	b=WC2E78kvO6sTx5G7/wez2G2cJy8/FSOvuFAGW+RjB+/r+tM9v2i4P19Yz+m5vnASj7k18m
	kb2Rafgb/X8Xi2pLnpDeM3WQaDBdOYXqP+LPxoXOIVO/G12Rk/qDNnw0ROPKfPeH0qkdtB
	lrMeMpWvZ3VJSP4fms7n7Z5zZ4FTRvE=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-ckInPws8O5yNYb0dynYpqA-1; Fri, 09 Jan 2026 11:42:40 -0500
X-MC-Unique: ckInPws8O5yNYb0dynYpqA-1
X-Mimecast-MFC-AGG-ID: ckInPws8O5yNYb0dynYpqA_1767976959
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56346eb4afeso2226887e0c.1
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976959; x=1768581759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7A0SVSsJLLrH3UzeGVYQj7XUlswlx8l5i5D50nZwrq0=;
        b=k6OB1OqEOSf6beho1ldQ9OeNHEbSxdMaBb9fAfJrxxHnJ3zOCwTlMT8LDe260D01EV
         Aco4UxodfoAIFkBdtTmn/N1gxgxTajXfMnSGx5SRTbVomCiqkjXjVPbN9MbEk9Og9Bgd
         c2TbjCFEJ4jJpKEofdQHftubkcoprs+C6hQGb1LUu4ztwEwVCFHZ2znpAmSelyengHbf
         oFEPKhnUdafHNRKKhz+8oKIwBYfSBWx62nQEzaRlOw229+16q6jEtZkCCEqApV5AR+zt
         pOxvXyvSUfakHNaNNca0TFTFD9LwBALP0r1hFSfu4+yPcjifDQt9qrTi2AYAPM8elytc
         El8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976959; x=1768581759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7A0SVSsJLLrH3UzeGVYQj7XUlswlx8l5i5D50nZwrq0=;
        b=JX6FrbTYCZspc7vo7Kf2X+0JOzM1df9djuKLSPY/YGtcsX1MlgvNR/9NVZmf0v1MJy
         7eUWB6dmjHfiYS9rTzYHCsO57uFBgquaRY7x4x6FG8aJ6JWX6sIxx1P6qvuuF/AxDt18
         sRVpbCwbPZeKYCEj8uaCbdoEc5tAJbf1/qTj9f6/8H9D3K8TWgFwYVjJEGU/FBo9DGRC
         H+YosqRERgMPX/m1vJOCJKH1hPAGmmJRwz7uN8bkRyPFO3wnwXmUaPXycaGR18QxUj16
         +HRMHv3X+bj9kzgrk/aYtzkWRzbDk5twnL4LoWRbcOm50YCB/4jnD96Xpm4Nd6lajMd5
         Z7BQ==
X-Gm-Message-State: AOJu0Yw+EPvipesf3gG0pZhVSSkwCQDXvVdOBeCshnlSxm0DPtmQnuk9
	849cD8uBCVjW6cgRSlwc3VrAINoTy5jp+3DycSaRHqBpp3TpFVr2HtFZLOxKKh/ASVaMlQd4z2d
	/WJSYWDG12Vou+Ux1DCx7KDTIYyf3MujlvC1o8FdGttrWDJD8OE87sOJKbCeQae4=
X-Gm-Gg: AY/fxX4H7GdoQVj4Dy9La05Z5cumgrNsgKNBwbygv/3cHKQcH//PahjgPLzBBnuQB4m
	kRIZ0gM+bDeDa8nZ5MOi1BOO+ohd2tAPKFnXvXwmKDMRyOmwAXMLUmM5kpged5HwMmhBFO0qIlz
	u2cOeGqoJh1uPKl3TWOW1R3tUcmqxdGjbhEUpF54Uz5ntEbyGa8fdJl7Le06hI0oDCXP6AUQ9VU
	/rTAcl+TXmTnj43ZzK/xtdVHpbRbuLXY7/2R/kAtw9VqzmOfz1kw+CPyqCjVXeNySz+Wks9R/BH
	kV0sLgAePi+T1VQhqrFSh/rdTv+it66qyGT10f660zGYMbNTS0e1CWhb3He3kHv/Ci/O+FVXtu9
	qRbrGYYyZpEGqLwJr1vhmOn54kLE89si373Ky8x6Ot21GYXpx
X-Received: by 2002:a05:6122:9001:b0:54a:721a:e4db with SMTP id 71dfb90a1353d-56347c2dd4bmr3914921e0c.3.1767976959399;
        Fri, 09 Jan 2026 08:42:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJZfDuXwb+miLpR98+49SXHQt8lhYkMxJKQiFPAELqpF136U6IBPhdPXrGcs+iek854k4JIA==
X-Received: by 2002:a05:6122:9001:b0:54a:721a:e4db with SMTP id 71dfb90a1353d-56347c2dd4bmr3914904e0c.3.1767976958934;
        Fri, 09 Jan 2026 08:42:38 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:38 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:26 -0500
Subject: [PATCH 13/13] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
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
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y9O482SvrL1tfTJpCab6vciztK9s09URkddX3mg2
 mBWerpXRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABPZtZqRYfGLSU/Ng+84fV/1
 Vm2/Y/VCu/Mf1zSXT9/RmH3oy6LmHzEM/x1yP6/0CX43233WtsX7LcQVzrl7exzl1Zt9vWpV7Jf
 FDBwA
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


