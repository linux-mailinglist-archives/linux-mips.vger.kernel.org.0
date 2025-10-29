Return-Path: <linux-mips+bounces-11919-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 021C9C1C29E
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 17:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E49631892EEE
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 16:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A3234FF4E;
	Wed, 29 Oct 2025 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ly00Kxs6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C486634C149
	for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 16:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755638; cv=none; b=YL+6OpjxAeBRxKJ6+EhZvR4h38FXxVAKlp+a9te1U23dScqVdyIjytj3Mnp079cRd/SGCyaZ8NYVvl6CjG+d8EvUhWMCg78gGubFXVWit8JFXYQWHM8C7wvwEc7ai3MTHcQmKM1MKUG1gamTTU97mjV0UvYQENFjvdX63rrSjrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755638; c=relaxed/simple;
	bh=oprYoP8yymfB2u4RbgujgsNH+i0ZQOd4dygbCg75p/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBsUOvUoHjx45WZ09t5DyaEp72NQ8uPnMYkoYkH6Z+R6ON+zMIF8ZpYgjuYEls7Jnr+/rR4pNzp8/sUKKjM8KUqDcMOEQkKF9+i2kPu8DB9k7wYLQMpNPnajTTFXBkwSmJEeBfwlVkq97GYD2rn4ZOS48OLHsg7nIWCOewvL464=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ly00Kxs6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3e9d633b78so23512366b.1
        for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 09:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755634; x=1762360434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=;
        b=ly00Kxs6I33Cts0szvsBGq4htnfjRKgDLfJgp+irQhH6eKg2aQ+FeYSXrktnVcZglE
         LS1X8DzpiRogsiDYx1QlAxeVNlePirHa2e0t8myHtbCX7sceXUAroMRjnaP7pZtJAbGa
         ZQzZ7QGt9Cgzf9F2250kNiJs2S8eGvhA39TaZ7wBXvUJagjjHROm1FCFEM7ezV7ijWgH
         yYqbR7ZF6gG5NFwzSbTizMHnnb6tYgQvX8/iw3UfEgYviyLxh7pJ1sBtoXpBN5ZZsY3J
         VUAZn8FHew4EfgiHNxME1+S8wmyvm3kKigBup4ENf8sONeuxDxeoy2tUw78yc1EHNZon
         eVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755634; x=1762360434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=;
        b=X9PoIPXBirGyJ52xfgxCDw2bNiVv3w4ry66JoZa7B3tb5diKRetwbI2GiLJezCfmHt
         JgxFL+twjJo5J6Ngoe//crES7jb6ctaxdAlaeZ0gvNJYejsttzeiky9oVxETSlbSOwRH
         zVY8kNb5IJQ9ZV8z2cOYSLHKKN/2saUMYK0fdEFWTnrDAIKDpXd6Iiy8Fl4rQd4MyuDX
         OHu+FRBdy3H0CVk6g/5RdDdrb/orFfGtBGUD8VvAhw9l3YrgP4Jcjd8MNh9KkfNAfYOm
         vgFq6761N/u6s2k74gCwbm/SMaUMAkleqoeXYnAYgmglsMNBZHOYyL2XUbbxwBkKKxJ/
         Irng==
X-Forwarded-Encrypted: i=1; AJvYcCV7XljYKsu5N0hLcdSBe2PtVePKgOEZN1zPDqQxpI4p2dNwoewRWWa4ejDn4dp9J1NxKJc2tnbAr3G4@vger.kernel.org
X-Gm-Message-State: AOJu0YxThmMJB7UIfCpPCXWUEOv+KDCE9aS0ANIeoWyFEzm4S6elj4Sy
	xxlnOP5IIpV9lc8mGy7B0m8ORetD4kOz0NkNh4GvxYgvdA6pyjdYtUfa
X-Gm-Gg: ASbGnct7W+kSpgPXKzBlrshiT181FpWuQv4+VXJNHrPpg46zy5M07/5MmvX2cL21AIn
	ArBgyaxqrhfgCQ+Lyg59NvgGuJAgnvWIFWLK85sctGOTRROCuCzhi7mUnuLKKH1MoITAqr2C7uP
	8U3LOvKjYZ3hRI8xs0pgENfXn2FJLyuwu5Gg8o4n3N98Hkt0H/VU1nIzPXhjs6an3oYwpcicppM
	oPRQQyMo4IKpN4tYXBOiqqh4ExZH7jAFScKiieuw/4nNreMfqOgFDsLUeGNLDvqsNxuOSH6Vf43
	nG/PYqEOs6qPQcl7y7ZxmcGoabQoQVJ5RkUu/nmQDEFWMfRcDbyH49oX7KUBMz82Z09fuTvQPDq
	zw26I0Nc4GDOpZa23QqYrlnCdVWurWMvss/BjkQkMoP9Pvg3kde3jKSjzllwj9xarnv6nSpwpq6
	EIrG6hU0XzTTZJ+sUe2as5ImzcPrTFSVGOpuQN2/caE7UaT7qU/S4RwxcXtZq477wf+NBc
X-Google-Smtp-Source: AGHT+IGxst0GGPbE3zlpzuYvmZD7MtT+fgNns/2gbspQBUcAcExwpAJ9gNyBIh9hmr+9IwgchPtgzg==
X-Received: by 2002:a17:906:6a21:b0:b3f:f6d:1d9e with SMTP id a640c23a62f3a-b7051f278acmr28890666b.6.1761755633985;
        Wed, 29 Oct 2025 09:33:53 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853696a3sm1468789266b.27.2025.10.29.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] clk: mvebu: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:34 +0100
Message-ID: <20251029163336.2785270-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/clk/mvebu/common.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 5adbbd91a6db..8797de93472c 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,6 +189,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
+	struct syscore syscore;
 	spinlock_t *lock;
 	struct clk **gates;
 	int num_gates;
@@ -196,11 +197,10 @@ struct clk_gating_ctrl {
 	u32 saved_reg;
 };
 
-static struct clk_gating_ctrl *ctrl;
-
 static struct clk *clk_gating_get_src(
 	struct of_phandle_args *clkspec, void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
 	int n;
 
 	if (clkspec->args_count < 1)
@@ -217,12 +217,16 @@ static struct clk *clk_gating_get_src(
 
 static int mvebu_clk_gating_suspend(void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
+
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
 static void mvebu_clk_gating_resume(void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
+
 	writel(ctrl->saved_reg, ctrl->base);
 }
 
@@ -231,13 +235,10 @@ static const struct syscore_ops clk_gate_syscore_ops = {
 	.resume = mvebu_clk_gating_resume,
 };
 
-static struct syscore clk_gate_syscore = {
-	.ops = &clk_gate_syscore_ops,
-};
-
 void __init mvebu_clk_gating_setup(struct device_node *np,
 				   const struct clk_gating_soc_desc *desc)
 {
+	static struct clk_gating_ctrl *ctrl;
 	struct clk *clk;
 	void __iomem *base;
 	const char *default_parent = NULL;
@@ -288,7 +289,9 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 
 	of_clk_add_provider(np, clk_gating_get_src, ctrl);
 
-	register_syscore(&clk_gate_syscore);
+	ctrl->syscore.ops = &clk_gate_syscore_ops;
+	ctrl->syscore.data = ctrl;
+	register_syscore(&ctrl->syscore);
 
 	return;
 gates_out:
-- 
2.51.0


