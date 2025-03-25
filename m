Return-Path: <linux-mips+bounces-8359-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287FA70B50
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 21:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E34D919A0EEF
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 20:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D53826A0CF;
	Tue, 25 Mar 2025 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tinyisr.com header.i=@tinyisr.com header.b="XaHOJrr7";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="vFHyoIXv"
X-Original-To: linux-mips@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2988C26A0B7
	for <linux-mips@vger.kernel.org>; Tue, 25 Mar 2025 20:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742933288; cv=none; b=KrOS3F+23VQwDSJz1f5XZT33vCrWnuh6UlvDlq2E8P67b+Uvm/xdZAnqGlleUaUMsFxVzA92xGyU3O0n/MYmfJMGqSioO+O6+F1bQzpHvofXUsOiTNpUIxBMtgujzDAX4WNWZ3z4RJjZVDzrk2P8FwZJeXetgAQ1o/tWAineQfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742933288; c=relaxed/simple;
	bh=axHeYh82FnmL3Mvaq93DdDkfSLDATa+JSmLV7KCGp6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AQce4dQDJdZ8rd64Rzi3TV3WLzIqLQ6BrUzYKFwHUAHPBYOC7G6jhK1zWlnGCA7/DgotG2fYdXswjxyREcjCkbVbygz5hDAbbZfsni/+HCqYor2wPlMGAcrw/hotWLpCA0A5cl2S+7NGHc24B7/a7FAHR66xckWL4l5nJgipemU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tinyisr.com; spf=pass smtp.mailfrom=tinyisr.com; dkim=pass (2048-bit key) header.d=tinyisr.com header.i=@tinyisr.com header.b=XaHOJrr7; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=vFHyoIXv; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tinyisr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tinyisr.com
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=XaHOJrr773SBESouMitN2Ge7LGhhGcnYRH4q5xVK6SCMWCw+crk8MqJUckz+L9OFidAHVgPG0RU7xVcxQbdBsnNsMH4FLsgzqMJTiwOD1V7WXFBbpABg/CrPmBK/tASktzCyIkUqQx5LyT7hpUad6lVuLWbs5VaJ9ws2KVUGsnHcJmxPB6mEP0qVMka8bkF5+pBP4hgZWbkTWCjf8Al1gwN+sjMWyEOwoX7c/MjSP5fnUArg6exbkN5XdO3lVEjK2Z5ektia651eR3AIDd3XPYpH1Hl/uXwMvwEWK3NiKIEW6GbXgRH4bHVqLr3NMnQqRtmA8ftFbJ69Asjt21w9Sw==; s=purelymail3; d=tinyisr.com; v=1; bh=axHeYh82FnmL3Mvaq93DdDkfSLDATa+JSmLV7KCGp6w=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=vFHyoIXvWY3LMI5JQqF1xMYDr4FwTtDG/r7D+33JuKNzwa0dpjqAoObKxvEA1Ky3ZN9kOQz99YwUQDkULTXAM5gSqnRagnU+XB5IbPVDb5MdaOBQCFnQSRBbqHxtWcwi2sP+zTgFQkcGowZd5ts5CHHARsihRotHFfLJQJXf4QoGgT4SwpYBC9tGCsVZA6ltfktWhV4Pnxy4MUr3S/rFB/QY718bsjh+CxTX60VTL9TNU7hab00ZZnZhz8dvk0DE2eJI2SS8fYFDBDeHXhMGLQecyeVIHCWV0fLD10WkWBNaZ9mDtHFx/ZCU1CKa4gF70Qr7MlqExcjYeX7sLB5rSg==; s=purelymail3; d=purelymail.com; v=1; bh=axHeYh82FnmL3Mvaq93DdDkfSLDATa+JSmLV7KCGp6w=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 99681:12517:null:purelymail
X-Pm-Original-To: linux-mips@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -897923758;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 25 Mar 2025 20:07:54 +0000 (UTC)
From: Joris Vaisvila <joey@tinyisr.com>
To: harveyhuntnexus@gmail.com
Cc: tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	Joris Vaisvila <joey@tinyisr.com>
Subject: [PATCH] MIPS: config: omega2+, vocore2: enable CLK_MTMIPS
Date: Tue, 25 Mar 2025 22:07:51 +0200
Message-ID: <20250325200751.2763618-1-joey@tinyisr.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

This commit enables the CLK_MTMIPS driver for omega2+ and vocore2
devices. This driver is required for these devices to boot properly.
Without it, the devices fail to obtain the CPU clock, resulting in a
kernel panic.

Signed-off-by: Joris Vaisvila <joey@tinyisr.com>
---
 arch/mips/configs/omega2p_defconfig | 1 +
 arch/mips/configs/vocore2_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/configs/omega2p_defconfig b/arch/mips/configs/omega2=
p_defconfig
index 7c1c1b974d8f..128f9abab7fc 100644
--- a/arch/mips/configs/omega2p_defconfig
+++ b/arch/mips/configs/omega2p_defconfig
@@ -61,6 +61,7 @@ CONFIG_USB=3Dy
 CONFIG_USB_EHCI_HCD=3Dy
 CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
 CONFIG_MMC=3Dy
+CONFIG_CLK_MTMIPS=3Dy
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_MEMORY=3Dy
 CONFIG_PHY_RALINK_USB=3Dy
diff --git a/arch/mips/configs/vocore2_defconfig b/arch/mips/configs/vocore=
2_defconfig
index 7c8ebb1b56da..917967fed45f 100644
--- a/arch/mips/configs/vocore2_defconfig
+++ b/arch/mips/configs/vocore2_defconfig
@@ -61,6 +61,7 @@ CONFIG_USB=3Dy
 CONFIG_USB_EHCI_HCD=3Dy
 CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
 CONFIG_MMC=3Dy
+CONFIG_CLK_MTMIPS=3Dy
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_MEMORY=3Dy
 CONFIG_PHY_RALINK_USB=3Dy
--=20
2.48.1


