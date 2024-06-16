Return-Path: <linux-mips+bounces-3696-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D902909FCC
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 23:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D0891F2107C
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 21:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A3247A62;
	Sun, 16 Jun 2024 21:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="aKmP/iHU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qIsFOpvc"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1423D8462;
	Sun, 16 Jun 2024 21:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718571812; cv=none; b=hO3vMh4+mgdaH5IMJsTRUjO7qJGxqT5MA0JRyzQQOjGu9T8UQg3rmsATuN08K851ZsumbdCEDPpy7WVZ6FGlDoaotU3ckGJtQwybLQ/7QVl9LDvb6wZNBs22C8KhUvNDuEpwVFWZ+GEIgYZ1LR54MF57APqRiCtXKGsteinISr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718571812; c=relaxed/simple;
	bh=X16cS9a/L7NsDy4taesqayQMqsULzc5GrtFlN2wl2OY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=blxLaY6MBtg0aJQHSLA4BLDUwmsGVj2RH6jeeINEU8lSJBorDrovHvioZ7Uo8euNaKkpkIuyrv1L6eGE82g6wI/msSUcgfhnSkogiEZ1Jzvv1wAmPO6vmaNUeh1h/eL4nbGFRQwFwEE0mGIn2OQQxQR8Np4ZnuvKYsCb4HDegGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=aKmP/iHU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qIsFOpvc; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 820941C00096;
	Sun, 16 Jun 2024 17:03:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 16 Jun 2024 17:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1718571809; x=1718658209; bh=tH
	kz+tqADZwei30zueVWO8gMG2ykRjij8iuylzvjBK8=; b=aKmP/iHUQkOi5PnIRp
	INQujggGUsxaVx6GQ/WQcAxEcPew6v7LHR+1rMwlJz1BbbQxxO78VUeFP1jN279H
	UM3Z5ALfPJXXhQl98OKl+M/T3syV2esJVa6/LXExdnCB71GHgPqb+mOiwltR15xI
	fHeB2OjE5qcEFDYCY+BSCMtehNkZ8Bo32ag7QiY83qDFsEBVzxwZUJZHrGAUgHi7
	MXWeHeP5XBXq9LfGE6yTLqe7xjXB6OgX55IoDk/SVYQ6mzOdEBYTLITuWj6rW+ko
	8LL+KyCKQCzIgpwR03eGgyniyZguT6w5vthQ9CykFFwT6xxbeU25EuU4YP6KrkAE
	0HKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718571809; x=1718658209; bh=tHkz+tqADZwei
	30zueVWO8gMG2ykRjij8iuylzvjBK8=; b=qIsFOpvcZM7RAxvrdOYgeUsuLvojR
	H0etkP7AUul4Kf8tZ/5dm+FUsCqxxoVvrjFQAeDKBtzMpqHPuOOfoRPkRQV8NtUy
	UvcvEacM6V7E5iyqsWhvnPKbJumFZ1M8z02c+tamjIcGqwfEk+jdaLsvZuZHqY1K
	APxiCGfZRGXBzfxinzfvdO3TJGfTZFoBJpiLbqKZ1R6SfX8IXFnX5QDj7CXoe/TR
	IlmivQtRMNJ0K7xEOG7kp3rBOV1xGjlwF6YTEBXmMKR8PjL/BXI1gjClL9iybBQL
	YQRT06tkpye/WdcPA+Eum883B3CmJjEUMJNIgEOJ9wtGfCZ27Dgm/sZHw==
X-ME-Sender: <xms:IFNvZj2ceebmJXGDPkGnMdWDW59WQ4hG4WsySY8xXWWnxdrVpEI8Cg>
    <xme:IFNvZiFwWJq-Ge9GL522_ugEA-WT0MXCGdwvpFyiw6wLN8l6KCplGWhjdmne7LcdZ
    bqhSBs1lXYhdkWuPLo>
X-ME-Received: <xmr:IFNvZj68MSDLggnfQxbV9KJV8W3ljsB74Wzk4xoroAlN9pfoYuqgN8Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedufffffffhueehvefhgfelveekueegteefgeeiieejheefkeeh
    keevudevieegueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:IFNvZo1GWPZTaOrzkrNduNv2ipwk_KX6eH_6MKPLF_Dyn4MtpVUenQ>
    <xmx:IFNvZmF8OL8iVpRA8fkqNABT4awFSo7q-TJ2pLUBsLJ2r8FVchqjmA>
    <xmx:IFNvZp-3HnMx72EFb88-unj3LKbZaiGba0GOQQ_1HxvcmSTJcYjzcQ>
    <xmx:IFNvZjmaPjiY8-SkBd4AgrCt6ie2PZViOvfx6QEO9wa1FLfWjc96yw>
    <xmx:IVNvZu_oqkremJgmObGg_b0qmHX_UYcXHvrLkBomYeLhQTZXAHPhpoR0>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 17:03:27 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 00/10] MIPS: IPI Improvements
Date: Sun, 16 Jun 2024 22:03:04 +0100
Message-Id: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAhTb2YC/x3MQQ5AMBBG4avIrE2iIiWuIhbU4F+0mo6IRNxdY
 /kt3ntIJUGU+uKhJBcUR8gwZUFun8ImjCWb6qpuKmsszw17RGVEMHxMxyVewqm8dq6zs1mcbVv
 KeUyy4v7Xw/i+H52FCCZqAAAA
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2546;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=X16cS9a/L7NsDy4taesqayQMqsULzc5GrtFlN2wl2OY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrT8YHl9KYOLQjXdrNnbdp9smzjj+d9tDQ+WfX3cJy5xc
 U3FKSfNjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjI8+mMDC+eihTFNafxsLWL
 VnLdC9/IbqZfXf5hZvLTnjur6oSc2RkZ/nNn/v1co8LrPvuv2N0jjb0cd9w2T+VpaY/n4Lg+t+0
 8CwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This series improved general handling to MIPS IPI interrupts, made
IPI numbers scalable, and switch to IPI-MUX for all GERNERIC_IPI
users on mux.

It is a prerequisite for enabling IRQ_WORK for MIPS.

It has been tested on MIPS Boston I6500, malta SOC-It, Loongson-2K,
Cavium CN7130 (EdgeRouter 4), and an unannounced interaptiv UP MT
platform with EIC.

I don't really know broadcom platforms and SGI platforms well so
changes to those platforms are kept minimal (no functional change).

Please review.
Thanks

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Jiaxun Yang (10):
      MIPS: smp: Make IPI interrupts scalable
      MIPS: smp: Manage IPI interrupts as percpu_devid interrupts
      MIPS: smp: Provide platform IPI virq & domain hooks
      MIPS: Move mips_smp_ipi_init call after prepare_cpus
      MIPS: smp: Implement IPI stats
      irqchip: irq-mips-gic: Switch to ipi_mux
      MIPS: Implement get_mips_sw_int hook
      MIPS: GIC: Implement get_sw_int hook
      irqchip: irq-mips-cpu: Rework software IRQ handling flow
      MIPS: smp-mt: Rework IPI functions

 arch/mips/Kconfig                |   2 +
 arch/mips/cavium-octeon/smp.c    | 109 +++++++-------------
 arch/mips/generic/irq.c          |  15 +++
 arch/mips/include/asm/ipi.h      |  71 +++++++++++++
 arch/mips/include/asm/irq.h      |   1 +
 arch/mips/include/asm/irq_cpu.h  |   3 +
 arch/mips/include/asm/mips-gic.h |  10 ++
 arch/mips/include/asm/smp-ops.h  |   8 +-
 arch/mips/include/asm/smp.h      |  42 +++-----
 arch/mips/kernel/irq.c           |  21 ++++
 arch/mips/kernel/smp-bmips.c     |  43 ++++----
 arch/mips/kernel/smp-cps.c       |   1 +
 arch/mips/kernel/smp-mt.c        |  70 +++++++++++++
 arch/mips/kernel/smp.c           | 216 ++++++++++++++++++++++++---------------
 arch/mips/loongson64/smp.c       |  51 ++++-----
 arch/mips/mm/c-octeon.c          |   2 +-
 arch/mips/sgi-ip27/ip27-smp.c    |  15 +--
 arch/mips/sgi-ip30/ip30-smp.c    |  15 +--
 arch/mips/sibyte/bcm1480/smp.c   |  19 ++--
 arch/mips/sibyte/sb1250/smp.c    |  13 +--
 drivers/irqchip/Kconfig          |   2 +-
 drivers/irqchip/irq-mips-cpu.c   | 180 +++++++++-----------------------
 drivers/irqchip/irq-mips-gic.c   | 213 ++++++++++++++------------------------
 23 files changed, 594 insertions(+), 528 deletions(-)
---
base-commit: a2a47d53ca1f74f60931487c27eeba3c17fb69c9
change-id: 20240616-b4-mips-ipi-improvements-f8c86b1dc677

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


