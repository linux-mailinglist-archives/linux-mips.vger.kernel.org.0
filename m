Return-Path: <linux-mips+bounces-6611-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C539B957C
	for <lists+linux-mips@lfdr.de>; Fri,  1 Nov 2024 17:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B1F028259D
	for <lists+linux-mips@lfdr.de>; Fri,  1 Nov 2024 16:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1581C9ED6;
	Fri,  1 Nov 2024 16:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ty6dMvF9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3931DA53;
	Fri,  1 Nov 2024 16:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730478846; cv=none; b=ATkP38g0YpnF9GDRjchF/StvHBeiUQ9QBAf/XUOTRkFxeR1jPsmsuVZ8qsm0co+U5lD8frQU86ca+psF2wfR2PRajgS5ZvAgKIva12scK4UTmoEY7lRuNrf/Xz8raF2E3sso5Ws/dMkNqopyWHkvoUAsBy9Jol3xvve4NXQk2jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730478846; c=relaxed/simple;
	bh=Ikj84yJ51LEfFhFpQlvLIMVUXtEQQsi5c2QpoOJD3yE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N1dKvH+gZw4+Iuf3K7EnPtMxsHngpH7j4nmHVeczYNGKRCUMtrazI93Aw7TUSR0VVP42f9eTH2RsqUiblFG9T32j96QvSWDlpkkSKSrW8Vk2a0P0ImaN/EqI6tBh/ni7xSvN7hSlqyRvrVVz+vXzvU8kDnoke9xG8/OzifZnSwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ty6dMvF9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3EBC4CED3;
	Fri,  1 Nov 2024 16:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730478846;
	bh=Ikj84yJ51LEfFhFpQlvLIMVUXtEQQsi5c2QpoOJD3yE=;
	h=From:Date:Subject:To:Cc:From;
	b=ty6dMvF9oGRTyguG7cHtfdEXLJjzpcKMMqAhtDhup6paN5AL8zciCIpR9wg45uaFp
	 sJyPwMq3iB9nqEMQoa7Jp7ePy3511YeA2k8IhnXaVYx+B+kx/3Jv+tKSCjhn8ThbLg
	 C9fIyW3YNAMoYPqDX2nn8jQ7KfJ7/fMMLZSAolsAbwhRC7FWCrI/Dqv4SlfotuxHvk
	 guYBa5onaoUYDvK6/fDG/lHbUbMz3KA0Vnp+MK9qNGLcjtZj6NXOd8DiKYVEkEn4lg
	 /2A/gkL8ezRzfflPG0lVPSMS2JEhgOf418v34/GL7TW/RYZOWQtCHpDVzDhYoo//nq
	 HH3r8A0hAMz2A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 01 Nov 2024 09:33:05 -0700
Subject: [PATCH] irqchip/mips-gic: Fix selection of
 GENERIC_IRQ_EFFECTIVE_AFF_MASK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-mips-fix-generic_irq_effective_aff_mask-select-v1-1-d94db6e0de0d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMACJWcC/x2N0QrCMBAEf6Xcswe5IH3wV0RCSDf10MaakyKU/
 ruHj7MwszsZusLoMuzUsanpqznIaaByz20G6+RMMcSzSBBedDWu+uUZzdWStL8TakX56IaUa01
 Ltgcbnj7xOIYMiVMRieTRtcPl/+H1dhw/OePV/oAAAAA=
X-Change-ID: 20241101-mips-fix-generic_irq_effective_aff_mask-select-660ae12dc112
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Chao-ying Fu <cfu@wavecomp.com>, Paul Burton <paulburton@kernel.org>, 
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, 
 Aleksandar Rikalo <arikalo@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Ikj84yJ51LEfFhFpQlvLIMVUXtEQQsi5c2QpoOJD3yE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOmqTH9lrFZw6poycItPd/0S/SvczPTXvBWm593WzLQR5
 KnhY/PrKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABN5qcfwV6677P+V6lL1Qif3
 lh0VLJG1javf7Sqzns5X489YmNr4gZHhoOhX7ufZPXUS2fffbAjgC3np4iFdcUb3Meel2Qv5vsR
 zAgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Without SMP enabled (such as in allnoconfig), there is a Kconfig warning
because CONFIG_IRQ_EFFECTIVE_AFF_MASK is unconditionally selected by
CONFIG_MIPS_GIC:

  WARNING: unmet direct dependencies detected for GENERIC_IRQ_EFFECTIVE_AFF_MASK
    Depends on [n]: SMP [=n]
    Selected by [y]:
    - MIPS_GIC [=y]

Add a dependency on SMP to the selection, which matches all other
selections of CONFIG_IRQ_EFFECTIVE_AFF_MASK.

Fixes: 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/irqchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f20adf759d401089576ef963437017d4f1f495de..ef0fa6975dab9502efda80cdc0c5e21c251f4abd 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -352,7 +352,7 @@ config KEYSTONE_IRQ
 
 config MIPS_GIC
 	bool
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 	select GENERIC_IRQ_IPI if SMP
 	select IRQ_DOMAIN_HIERARCHY
 	select MIPS_CM

---
base-commit: d1cb1437b785f312d63f447e2e79ff768e7ccc29
change-id: 20241101-mips-fix-generic_irq_effective_aff_mask-select-660ae12dc112

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


