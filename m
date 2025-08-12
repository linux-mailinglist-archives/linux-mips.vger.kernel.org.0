Return-Path: <linux-mips+bounces-10222-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4866B220E0
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 10:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22D7B1AA52E4
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 08:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719AE2E7162;
	Tue, 12 Aug 2025 08:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HXz7v8ma"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD932E7167
	for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987251; cv=none; b=Lgx28HxEtseDjc4OXtaSkwG/xNKtyTorr1CGeSjvqroeD3+3OfEcuXRpMqZWOBuiIQR6puaO9fOLtQOAw113TXuo5meQ+9aHN4cQfP2RAA727EDNWgBIffolZKAvfwfzaCX+T9xHWhkRsYuh7CjDDuvhqB8CwxPT0Y17lNhzBAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987251; c=relaxed/simple;
	bh=CuTz49b4GPinE1YCg+1bwJMe4eCZYLSKcvxUHG9oTsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DXK7qGeCj+A9yJgdKG3WfmuJicZ8NUkIvBtmw+O63bNqgMraLnJ8jVUyewgCEuV9OBIcswuWMshMIzBpxEKcJC2BoF0QcdIM68tdpByWEY6XzLlIqg6zMnL71d00+0sGabQwfGN7WN5SCFtqswHgzBk+FBCdZCDPsp0gNmScae0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HXz7v8ma; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b79bddd604so3029374f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 01:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987245; x=1755592045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YbWc4IE0U5a+ObdUmLxRXb/F+0HhyYqNMK8nrf3mHI=;
        b=HXz7v8maekSQIBY/++UzdgLpMmPm9kpA+mBSiJCoGI7SOtNl1fYLkwMAbjfZQvpy8c
         vOWTmnu4VBDWlyGByJq/wDgFqF2b9/FocUfKA/HGCMipb3bzGup1L0RCV8xjR5JbvjCn
         gBzGbYdzJxGFmiEBLXrBCqlL0RVEhUnzFtlx3IjFkuVlByjoplfVl1H8q4h53d6FT2yP
         ERb38gPILpnAbMRWblirPoX7U9grerT1pih3WAb2XCaywmMfy96z+Kw7Y2eu64pLreAb
         uSyYBZjDQaYzss88sQhxru57uJn+CFjBPz7LUlrQYktxgdi2Qw9y0iF2/UCtxTgTIOFw
         T7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987246; x=1755592046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YbWc4IE0U5a+ObdUmLxRXb/F+0HhyYqNMK8nrf3mHI=;
        b=RfZ+W4oeYCeWdR3VlcfK2Yp8rXSzFnNO7fM0hbS+xX43WCXF7G5dKaHla73ZbH0fRT
         nD+N6sum4vG/IniRY5CtTblHGOwRrqApGrjztLV+eArOns4BU/4KK2hGSi1czdUfAfIz
         +nm1jsw7o08ddniETprbEL9khBUlsQ3yuq6saE4Pk5xopgUhDOVw22GvlkmTNmACUfUU
         LM+kSr+cdDphGUD8cvyRJDobyZaNC1tlA/FU+KjVLq9GZeaYP7lI41sWRETECYpbj1y9
         jRzsKh+lK9wOJJRRWdPFRpCr6NWdDsWmDcIgovsXfDQREd1zzodIpcpLbrbck+2o+weT
         x2gg==
X-Forwarded-Encrypted: i=1; AJvYcCVFFJrkCfRCfSlMPqRjdRsY11e7/rB0oq2Hq4ygeX1R0qIvE+Qhr+ySzM4QmHZiENAAGjSZA2VLK8uj@vger.kernel.org
X-Gm-Message-State: AOJu0YzSF9mrfaRE9+UKpS/bkBmQ3z4yTgbHBgu+fCv/+qPxqoufWWCk
	b8V8u9UEPyPXh9mX4C85+tIKulHf9axLRbhTrPXrU4wt3xjc6hwBTLBFDVgT3JFYO1g=
X-Gm-Gg: ASbGncv1QUmRkynaK91JijK2LPbtVCVuHTcMapg7U3c1ntfzvBk5qLMv1yIWLpDX4Cw
	vilitqyLaTISOJfg9VWaBLAX7pz+jwWbRnqRHIicEAQIM0jULvIsflrvoxpooxHyezJnGlSjdkC
	TddORR6ZfK0Ku9+DJ4l+LucZOOPk16pAwDMt/QeMn/xkq74jo6WeLysDM5uXK20uV1s/KqSaiAQ
	lEXcGnWRv15CsSHy+De66PZF4+r7q2Jsd6yBPUrxTzh7ve/q8zWj3SwbzFbOUjKRyshE38ZaBcU
	+u1qItMcMs8JkGHTUw4UnUhxGUEEXgXAwEQzvcfQTyPLm2qp0oQPctmxivsvA99ThJn85icxZvU
	S+8uGVQHRaOfBi6U=
X-Google-Smtp-Source: AGHT+IGi/j7vvT//K1tjjQhALtCZbmyRmQbp5AQVO+ecrZR25VCoPGpFE1cdkaigLNYXu36RBE9/0w==
X-Received: by 2002:a05:6000:2f86:b0:3b8:d79a:6a60 with SMTP id ffacd0b85a97d-3b910fd0192mr2025994f8f.3.1754987245402;
        Tue, 12 Aug 2025 01:27:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:09 +0200
Subject: [PATCH v4 10/15] pinctrl: make struct pinfunction a pointer in
 struct function_desc
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-10-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5244;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=eGspcjc2EAjWh0rFUcHzIQ10C9gfQYuw/lhLS4OYQVY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrYMe2y4vEPLm1kTppjWmg41eG4qsgyU3HfC
 0ktdKcA63iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62AAKCRARpy6gFHHX
 cgKuD/wL8IqveDOLws25gTN8uwaorjKGDFIvwi7VZNqVZ/hIyoeWKzjAK50/Voty9yhKi4Ld4Wv
 oWFw87sa48nxfIJnwVS8gzTcvWdSjcaR84jX0VpuIVa+fjyLzgnU0dcOwTV8zQhMg2Jc6lSkycy
 MOiQbuAZkcFQDmWe7xCQsUv0TYotfNPfHAw1HxytCwGs4ye1aDqiWacHAfizNJQT6WYRM8OOFwz
 Q+WtQHuM+3Eo6sGbj6kItR2CNMUg02Oal6VkreWZ8UhJ7lcHwrsGLPw9PCynOHmMo4WxvY3mDPh
 GtriQxOgBOxNLQPICuDdryD40vO8u/Bn1nmchxgo7skPK0/AC2SHreltuLzoaD+lkM/87au5j1h
 pTsqBZQBiGWfsfJYGS6jZWsLms9hmtVfrNyI3jQtX9IYmDBjpf/HcJN0gNyevodIPVMCtcNhycA
 E+MpTrh9F+daADG/PwKcNtDduobVUoJBLy22CdiL4i4+elQlNAdtzTmDFX7TAUODSArn2uLI7is
 uE6vdK4NKaVbHe6vEuZfKxzyf86wy+yuMU1m/rcWIN2Euey0LR197WJkHtSiB4x3fYMJlx6u4U6
 0OR+My49drC5JYj3Ac0HX392d1wUcLysY9U4dsYnqySzLVVuTRHU3oyz6+Oo+csnKugonlolxPw
 00T8opFSZuQHT2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently duplicate the entire struct pinfunction object in
pinmux_generic_add_pinfunction(). While this is inevitable when the
arguments come in split through pinmux_generic_add_function(), users of
pinmux_generic_add_pinfunction() will typically pass addresses of
structures in .rodata, meaning we can try to avoid the duplication with
the help from kmemdup_const(). To that end: don't wrap the entire struct
pinfunction in struct function_desc but rather just store the address.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c |  2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c         |  2 +-
 drivers/pinctrl/pinmux.c                  | 18 ++++++++++++++----
 drivers/pinctrl/pinmux.h                  |  2 +-
 6 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9ed84479a5b43871861f46fe1326f1dfadc7f63c..0df7eba8ccd3209fbc4b2e67ffdea12b77b90858 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -266,7 +266,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	npins = grp->grp.npins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < npins; i++) {
 		/*
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 61aecc3555837ddada3bab9d7f28a6af7afdd3b3..33421dabaaac597382e75c4e5ab009390a2eb1e4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2459,7 +2459,7 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 		return -EINVAL;
 
 	dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
-		desc->func.name, grp->grp.name);
+		desc->func->name, grp->grp.name);
 
 	func = desc->data;
 	for (i = 0; i < func->group_size; i++) {
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 17a08c73423fd089066e4894d2307c852bbbb661..11dc525eb3a2dc8ceabf2278ee1a2abaa425eec1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -56,7 +56,7 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < grp->grp.npins; i++) {
 		const struct mtk_pin_desc *desc;
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index e13ef07850386e70cffc83011589ceaf70a70a41..e5b24fab12e11e443df25ffeb7b70d7c1a03c6bc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4015,7 +4015,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	mode = (uintptr_t)grp->data;
 	if (mode <= 3) {
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 62bd4aa53b2b22cb09eacfb05398205f2fe391b9..6f5e3ede972bbfa78e279790df359632e2d63485 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -810,7 +810,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 	if (!function)
 		return NULL;
 
-	return function->func.name;
+	return function->func->name;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
 
@@ -835,8 +835,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 			__func__, selector);
 		return -EINVAL;
 	}
-	*groups = function->func.groups;
-	*ngroups = function->func.ngroups;
+	*groups = function->func->groups;
+	*ngroups = function->func->ngroups;
 
 	return 0;
 }
@@ -903,7 +903,17 @@ int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->func = *func;
+	/*
+	 * FIXME: It's generally a bad idea to use devres in subsystem core
+	 * code - managed interfaces are aimed at drivers - but pinctrl already
+	 * uses it all over the place so it's a larger piece of technical debt
+	 * to fix.
+	 */
+	function->func = devm_kmemdup_const(pctldev->dev, func,
+					    sizeof(*func), GFP_KERNEL);
+	if (!function->func)
+		return -ENOMEM;
+
 	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 549ab10f7afbda32fadf4ad151401180bed2064f..653684290666d78fd725febb5f8bc987b66a1afb 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -137,7 +137,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
  * @data: pin controller driver specific data
  */
 struct function_desc {
-	struct pinfunction func;
+	const struct pinfunction *func;
 	void *data;
 };
 

-- 
2.48.1


