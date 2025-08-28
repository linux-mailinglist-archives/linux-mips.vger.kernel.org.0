Return-Path: <linux-mips+bounces-10743-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0C2B3A536
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 18:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68F47160E81
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 16:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9C5261595;
	Thu, 28 Aug 2025 16:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ou8cg0pX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8B5257AC2
	for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396829; cv=none; b=VGLUdBiIHD5GxDdzX3BiXiBVvM8QRXMwE/Ql982Dg7I8VWkD00G83ZqjhvezHg/0I9bYEblumkmy+s+t6M6I4V6Kojc7xCTFBi7OOOItQU5Rcy1WMruJfg45ZfpSOv9r04NNqDmtdlKtNjQNAet95eK6wE+gwh3blZYwsSW6xI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396829; c=relaxed/simple;
	bh=eVcvBqQdVPNTqpfIQ1uOcWvSP+NDojr9eRpy6to1igk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0YdOnShwlemC5RuGpGxuqtaRe2q53PDuGhPkg7qucozlUw7/6CWrg2jAz/p9ZAPWodkkm2fh3pOs1AOxKqCvhTipNvZZpH0//g3z7mBy2vUgbcUcDstx8GzIeOSQCgbfMngIDYAenohLh+DrfHyMW4Fvh3DmSUvXwtmzSBXlCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ou8cg0pX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso8224005e9.1
        for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396823; x=1757001623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ojzj3QqHYKTtweaj0hMdOf0hJWBOPE6yGgnAHCkCHqs=;
        b=ou8cg0pXW17tnWdruFEhJ8VjTb+vYHSTynJdvw5zx/uw9y8chRtFtZDATLILjDadDj
         fC9Rt2R++nuHAnu5sUZE0BApuf0ke9cIWE83pvTFbGz3tXfAzlA7o14B42uwp8spzfAK
         7egySCB+PwqQExqFlif/gKGNoaKsX4yFqv8u3/OK7Ghpth0k46aM1q0sUyI4aIp84QwA
         rW/tgmiws3yZgtE3Ky5X/gUGFNnuikKjpoS7XEkmEaWfdVuR5CenRmTu/csq/16Wbjay
         4kINrumqruZsdx/WFkbQvH2lQyEZf3Fy+xgQ9rVLlq1x2ZV5l1Lt6VkdVorRVcm5L1/O
         u+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396823; x=1757001623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ojzj3QqHYKTtweaj0hMdOf0hJWBOPE6yGgnAHCkCHqs=;
        b=QKVdli6Do6Sg3SMaLFc+4sSIudOSrFijrFVav9hMD0Vhgp4IL9IRqPfKfen1RhjN0k
         qgLOpE9ztoZWRTiJof/kD5m5O9TVa8r9gos+YM7Ws15kylIi5k2A2R++xskhVPuowlfB
         u7MyaOQz3YfQ3SFj81QLauL1T9bUrtxxMYQ3YWefsIeGy9FANgdEa0AM2ws9H48W/U2L
         rLIy5oLa9vFB9bJQCz0HrW9QZeJwHf6D36BSVjLOuSALja1NrOrj+EPtOxe7hmmNTtGh
         FGZfKamB9YnJSeN4BdMPLAVU3oPTX/AFfMTL3ieGGTOXflUUtSdJAHa31lw7x2EmLs0a
         NtPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCALRijzddCf5ncvldbuRhZn78jTX4TwBVZQoFG90Q1nZkATjlEr+fhbbipI4bjAmTcpXG1MtR6JIK@vger.kernel.org
X-Gm-Message-State: AOJu0YzQuAusEQV+bH85ocKlV+wSo5o+KOvXsCLJ+lapdUTImk2Bkv+e
	7KYgnY7LWJxcQU98rrL/s/+BMsiuOedszz3/2LK07BZkpijdpLiAJ9akoKLTm+W7lA4=
X-Gm-Gg: ASbGncuaxzdhoQ50/uwGq08gBKTO/VW4sELbeLxDbGB7jPQ7UcI5U2NVcM/RR5NFaxQ
	5Tq5+5EDdWVJy2ghAIhK6HsouNpfzWgkd/5oD4J99Z0U2Wykgc/1IORkCGL9S7y9o9Cpq02ikL3
	JY/nb04i0sDH5hJUZXG9EybmEKFnMLM2VC6QNXuW8jTnuibNiKOVqYBz58gP7d5LY65jWysQ71r
	vQsb+Urq91OaiOw86/bg6SVgxBuBjkrzDW0n07aJkhGlbTq66yBNRbOPJwvk4eoKY1zQT3K3D/X
	r6b5Jv6cz5KZ1/Y5TzWVo/FPmFpQXvSGtt9idqhSfyXskLxNenBgkb3uG4GBYdjreWjkOXyXZWS
	+4eiwxOURXb1G069CGQ==
X-Google-Smtp-Source: AGHT+IER87jaQoeShvQsyVmSj0aSvRTPhiF3pGP4th0wCUHmIaEcNjSjK3S9hh6ajKAZPWgkTqzJEw==
X-Received: by 2002:a05:600c:3baa:b0:45b:7699:fe6d with SMTP id 5b1f17b1804b1-45b7699ff37mr39397625e9.17.1756396823201;
        Thu, 28 Aug 2025 09:00:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:11 +0200
Subject: [PATCH v6 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-3-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Q2YZTvBFgTu9mhuvELDYkYIT0089SG8/1kg34izHMkM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0NV9d/sWbKuAEo7ou0UURrmodfCJaO+QJj+
 5MPwqZx43yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DQAKCRARpy6gFHHX
 ctzoEADbwEMqx2TH4E23rUTlqfPLcS3fHDWD+epEgWLvTddWUX8zN0lfF4FdFwiys7ELKxR/XwG
 QQO9szL6/l5nLBeTUoJNYd+5mk/+O8TNscJuBmxuWHrkFdS502g9bhW1ECKt6zIdhveGlnOpm6G
 uWluWMTXPYbpEuB7ezYm2R757utNZGn9oMoJOpgFXPoJpfivFPV/oumKI4k9Iy7QThSAon5HZt2
 k0tpgOUW/dRXd3NjVgKI2HKa5db6VTmGO8HljSZgVCiftk7ncKE2Mm9a9iq2oYrDJ1Z2Ht+o+IW
 Rd4fsCsXHoTWenwwIarjTfN8fSBhFWsfQzLZ9eGffhMOkn4HvMkKuthX9hXJN9441LES8oK0K5K
 yeDSnZWt+aqfrHK1oiGHZn3GJaKmOFDdvceLg/lUpV8R2Dc4DUY4yA2lX8NRgTXEawWajpJWElG
 +V2pCZfQmQvH/AixL165s4kQj9MSQUgT7j4g+0QiP9H27ht7qfkRBvNOcSb7LEA+D69MtA9t5wQ
 wQCWYtmFXFIyEttClIKmrjfl0UkXbMWiXX0OdeYgNoIkDG2wJb4jxQFXh9Ck7T9zC7KQrWhrnNX
 IXfuwfBD4wDRjDnT6qJc2SAi7vZcnjaZE1OR00slPWK0bn9dRYLmlRGy3EYl/+YjsktwDYpm1wB
 0XpX32OnfZ6PasQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5f1ec9e0de213d587b68f41d3458cf504ee1b21f..eb6cd27955fbe462f479fbe92c785588caee5ebd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -35,13 +35,8 @@
 
 #define PINCTRL_FUNC_DESC(id)						\
 	{								\
-		.desc = {						\
-			.func = {					\
-				.name = #id,				\
-				.groups = id##_groups,			\
-				.ngroups = ARRAY_SIZE(id##_groups),	\
-			}						\
-		},							\
+		.desc = PINCTRL_PINFUNCTION(#id, id##_groups,		\
+					    ARRAY_SIZE(id##_groups)),	\
 		.groups = id##_func_group,				\
 		.group_size = ARRAY_SIZE(id##_func_group),		\
 	}
@@ -334,7 +329,7 @@ struct airoha_pinctrl_func_group {
 };
 
 struct airoha_pinctrl_func {
-	const struct function_desc desc;
+	const struct pinfunction desc;
 	const struct airoha_pinctrl_func_group *groups;
 	u8 group_size;
 };
@@ -2908,11 +2903,11 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
 		func = &airoha_pinctrl_funcs[i];
 		err = pinmux_generic_add_pinfunction(pinctrl->ctrl,
-						     &func->desc.func,
+						     &func->desc,
 						     (void *)func);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n",
-				func->desc.func.name);
+				func->desc.name);
 			return err;
 		}
 	}

-- 
2.48.1


