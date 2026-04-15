Return-Path: <linux-mips+bounces-14161-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NsBGKnr32m/aQAAu9opvQ
	(envelope-from <linux-mips+bounces-14161-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 21:48:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 016A94076E5
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 21:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 132583042391
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 19:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B8013DDA4;
	Wed, 15 Apr 2026 19:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gU6dfNL6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A773090D9
	for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 19:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776282533; cv=none; b=DLjBw/19DgPpwSroUGvThxOTJW6NWjSFTbVwt/1fbQKhCEJuYFq21W6ctqxq28owjPbOCkdCxMxcMAWloz0LDLVGMKE2QIQ/nSobpKDrqpeKyNyRe4gZiQhiqjcSZYdiwidIG5k5mj3dpv88ni8pjiJiiaKdmx0hrB6tCLbUQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776282533; c=relaxed/simple;
	bh=hdtID7yAC1FF82zLPXyM3bNFP3eb9HeHJkiu7XzULMU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ICR5XZaYEL0lWdX6Gae1zBjpAzVyDe4c39V7qPy6bnd/VuI+P4vNb9OXP4l+Vgiijl9WjwZ6kmePUIA6Z2ZeBRNLo91UH2P3wwUJ6xTdUTaJE+ZpcpT2BD3MKGoL/37J1eXxiv/HlmwqqLIpo/AEedb3WvzuU9FasGCqq/H8k5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gU6dfNL6; arc=none smtp.client-ip=79.135.106.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1776282521; x=1776541721;
	bh=/kTtC+TC32NWYr+4OixgMYOkG40+XyIDHTPjwk+esB4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gU6dfNL6w0ROGU2qmP1CpC6o+4yM29eAxus5Ti8LpXeMjQUcJlVYogINw2rnKyuQw
	 UKRx8olUPkzv52WSW5/iCE9oWnlor42VMjy83ARW1paPBnwAmlq1xfLX2sozbIbgCi
	 ai04MoXcGpBtqaYyD9nYR7g/ut57YZwQr3T0dnPup3RSyfN/WCSUjtdpxdRuDx6q8a
	 PaL0r3rAxcfxjmO2bp/bNVwmhZKUeErItySR657WTnxGC9WYJhjMODcX9uhCSB2wED
	 CZTdaydqAIA04wAMCIvfN3Tzh10QLSGCLSpd5qRn/tKLkRWSuD43quzsBkZPPUznOp
	 +9o5t3v98FPHg==
Date: Wed, 15 Apr 2026 19:48:35 +0000
To: "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>
From: kpursoty@proton.me
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "cjd@cjdns.fr" <cjd@cjdns.fr>
Subject: [PATCH] mips: econet: add EN751627 SoC Kconfig entry
Message-ID: <E5Pgm6Vp9MRV0KHJ_KOh8hEjTukhx1F2X5nlmbJeG-EW0j44NRslk1EuiB6AQt7zLQykmY_QzPU0haPtiH7Yb3fd7QhMFxWBxxx4_2684RA=@proton.me>
Feedback-ID: 133470881:user:proton
X-Pm-Message-ID: 68c5da9132949abb36e1d18bf5147f91154bb8aa
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[kpursoty@proton.me,linux-mips@vger.kernel.org];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	TAGGED_FROM(0.00)[bounces-14161-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,proton.me:dkim,proton.me:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 016A94076E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The EN751627 family (EN7516 DSL, EN7527 xPON) is a big-endian dual-core
MIPS 1004Kc SoC (2 VPEs per core, NR_CPUS=3D4) used in DSL/WiFi gateway
devices such as the ZyXEL EX3301-T0. It shares the MIPS GIC interrupt
controller with EN7528 but is big-endian.

Key differences from existing SoCs:
- EN751221: BE, single-core 34Kc, custom INTC
- EN7528:   LE, dual-core 1004Kc, MIPS GIC
- EN751627: BE, dual-core 2-VPE 1004Kc, MIPS GIC

The SMP plumbing (CM/CPC probe + CPS SMP ops) is shared with EN7528 and
lives in patch 100 (device_tree_init). This patch adds only the Kconfig
entry.

Note: on EN751627, mips_cpc_probe() must be called before
register_cps_smp_ops(). Without it, core 1 never comes online because
write_gcr_co_reset_release(0) is insufficient on this SoC. This is
different from EN7528 where CPC probe behaves identically. Both SoCs
are covered by the shared #if in device_tree_init().

Signed-off-by: Kervin Pursoty <kpursoty@proton.me>
---
 arch/mips/econet/Kconfig | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
--- a/arch/mips/econet/Kconfig
+++ b/arch/mips/econet/Kconfig
@@ -41,3 +41,28 @@ choice
 =09=09  The EN7528 family with dual-core MIPS 1004Kc.
 =09=09  Requires MIPS_RAW_APPENDED_DTB=3Dy for boot.
+
+=09config SOC_ECONET_EN751627
+=09=09bool "EN751627 family"
+=09=09select COMMON_CLK
+=09=09select CPU_BIG_ENDIAN
+=09=09select HAVE_PCI
+=09=09select IRQ_MIPS_CPU
+=09=09select MIPS_CM
+=09=09select MIPS_CPC
+=09=09select MIPS_CPS
+=09=09select MIPS_CPU_SCACHE
+=09=09select MIPS_GIC
+=09=09select MIPS_MT_SMP
+=09=09select PCI_DRIVERS_GENERIC
+=09=09select SMP
+=09=09select SMP_UP
+=09=09select SYS_SUPPORTS_HIGHMEM
+=09=09select SYS_SUPPORTS_MIPS_CPS
+=09=09select SYS_SUPPORTS_MULTITHREADING
+=09=09select SYS_SUPPORTS_SMP
+=09=09help
+=09=09  The EN751627 family (EN7516 DSL, EN7527 xPON) with big-endian
+=09=09  dual-core, 2-VPE-per-core MIPS 1004Kc and MIPS GIC. Used in
+=09=09  DSL+WiFi gateways. Requires MIPS_RAW_APPENDED_DTB=3Dy for boot.
 endchoice


