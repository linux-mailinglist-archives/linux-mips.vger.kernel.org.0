Return-Path: <linux-mips+bounces-7051-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553A9F37AD
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 18:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53F7A1674A9
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 17:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3265A206F17;
	Mon, 16 Dec 2024 17:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="MSxLuYEp"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E38E2063E3;
	Mon, 16 Dec 2024 17:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734370568; cv=pass; b=hHvLzex43ZjeOHPnIxV3lgi8+vXM0PYTKk1VlyLvNpOqJzc0Tu49g2LoHNMV8lFJCyy1Gtx4H+hkRPsbZMwfcxndRUZFjn9AOpSW1uh82j8ug8++VTJVy39a5agjjYlREYe2gRe4cIVC2gw3wKo/Q/oemwhfIYBVt7Bj5NYJyWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734370568; c=relaxed/simple;
	bh=4uLbzSoIoihEXjiVN7XdeY2bXtTwXBtAxxgJ+Vhg0QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GnuMpuHm0O4redncHkwPu/r8xalPJZuhFiEgiIhPQ9zev7BokpPoM9vMogmJQqkx16sVFJ1xmy0rzrPtw+ZpCwtL2vtO/18LGgnTpWqMSakKlDH2Y8o26mA/gFvHP3X3OTcqyim1wBvIrUaWO0qNkfavqPcL/0GF/aBotZqd3SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=MSxLuYEp; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1734370532; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vp0Iu6WdbMoF1nXM5SnCyiFrgm+BDTTNnovEHr3eLz0NQKz/zfx5bJiDUaqTLXmjF/IrctuEI+gH9FH2yuTHr4mKE8vjWNgQLdOCcNLlLWX+VuREs3+vFPezAQ+a5uG0QzMVqUs7PHKCSEJaPqKy8BNTNMxyxicXMqB09eHc/6E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734370532; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4+hbfmOKjnlASf4EoCiuUoXr7Qw32w/Un/7tGNMOLBU=; 
	b=HQDuLCTZ4BGk/ey1MN57Y7Uzrf95t624UDRepS6W8RrQVfOU9woYFYU0R3qBb0gOXyNncdwA0eqyXxb9oCR31KMAlDpIzGDGEafpS98PielASxILX6jmfdmIdN6TK+rtOTHo79tGZKKWCn9IXklj8/zyig50B8OqEbNnYVnPasU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734370532;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4+hbfmOKjnlASf4EoCiuUoXr7Qw32w/Un/7tGNMOLBU=;
	b=MSxLuYEpwZ0O8h0j+Rypp0FGvTc0pvs9ZgT8QwNZx7mgRBcUDkFoHWWd74rwVB+v
	39XLkxIwAO6l4YoVHfRwn4Szqs4S1o9C8AvY0DNWbzlw+QbSluj72kknxpDK4vd0HsW
	RlsqBp4epFR4A7FlQHsZf009W4uGWKV48qja8Y5XdL+0r/vGdV73AJE9PQq8LKQQpy5
	BfjICz3nSFvNtAfyZhW5vRsvjc+VWJLE+h6hTX9leRL+rMI+IL86anX1HpdP6svU7Kr
	JLDL/FWN8jViUZgWBukOTqDWUJLKQsIuvI1jx1nggx9XNk9/ALdSIayuGvyj02fadTf
	z+qwqyv/Vw==
Received: by mx.zohomail.com with SMTPS id 1734370530165398.6022361701732;
	Mon, 16 Dec 2024 09:35:30 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] mips: disable CRASH_DUMP by default
Date: Tue, 17 Dec 2024 01:35:14 +0800
Message-ID: <20241216173514.495638-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On MIPS, the space of a crash dump kernel needs to be manually specified
by both the debugee and the crash dump kernel PHYSICAL_START config
option, and the default PHYSICAL_START config will make the kernel
load quite higher, which isn't acceptable when using as a daily use
kernel (and will even confuse some naive Loongson-3 bootloaders).

So I don't think a MIPS kernel should be built as a crash dump kernel by
default, therefore this patch disables selecting CRASH_DUMP by default.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/mips/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a33f05e1ad6d3..f80ea80d792f5 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2873,9 +2873,6 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
-config ARCH_DEFAULT_CRASH_DUMP
-	def_bool y
-
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded"
 	default "0xffffffff84000000"
-- 
2.47.1


