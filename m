Return-Path: <linux-mips+bounces-14166-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOmKHXSO4Gl6jwAAu9opvQ
	(envelope-from <linux-mips+bounces-14166-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 09:23:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3F140AFDC
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 09:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F1763019531
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 07:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6914338657A;
	Thu, 16 Apr 2026 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="MQwu36y1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64756379980
	for <linux-mips@vger.kernel.org>; Thu, 16 Apr 2026 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776324021; cv=none; b=LQM5Fmj/LxwycJLvxhrIuvnHvpnzP5LKW+EktfJSUtkLbt2PRb009v8XptoCYnRAC5Foz60wuuIt1AKPW+69bJF/VEsHsIauI0GlleVdX7Uk0IyhIbctbgdqXHsdZDSSXNc42VL1drBFVu7K4cyZTD5V0DMATngnEI8CPUbgb7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776324021; c=relaxed/simple;
	bh=2leeVpgyLPwASky/Yop0Iuo/ADClfnGz/9CpgzIvk+Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZEoxu0tjiCCYhQSd9TsRdryZxsIY93mty69lliDZJ7Kq3qvTWLa0oCHcZslEGNVw6Tgpren3+75kNKWaNTBXBamiDcZDxCI/b8xUlCY/aSHziwB5q6RwSm9E7UNTUmqwnWMSn36W2HPhs0fxIaG3qVM29Sebl3e9L5HGWvmzPZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=MQwu36y1; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1776324011; x=1776583211;
	bh=TZCjlK5hHtVsCucnYEDyzZ5YQED9QNOF9aMEcyB8log=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MQwu36y1cUX1rpoZGIJYgTk54ZEn9XHuXfAxW1Q6tQAwru7Dswd0KJZ7xoNdNlgkx
	 Y0yp+PK7hJCoVjkuWCMiDNiu9yBkxgJyo7J5FaKx3tiU/Ws7qsOWJiF8BL02e0qE3u
	 hwhUVnD3ui00m8JEOJpJbdgJYRepyDRxPyx1/AMloCfLolVxaMuD+abM3D6b6j3K4Z
	 8uQJUlA6t3dwajcXKFCHQMdO8pflv+pZLdwbGytvcvhTj7628OKtXbSRE0LCIePAlm
	 wLp6DHAJAWpsgeyhuLw3ujDtkcPk6OMYXa8JKTuttMu8+vk4tbwBfZKjgZjKgNyRKH
	 87Bp6WWj4G1gA==
Date: Thu, 16 Apr 2026 07:20:06 +0000
To: "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>
From: kpursoty@proton.me
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "cjd@cjdns.fr" <cjd@cjdns.fr>
Subject: Re: [PATCH] mips: econet: add EN751627 SoC Kconfig entry
Message-ID: <-sv9JxeX2cGKwZjY8mDH4WskIKOXfbsD_7ZcziekWVCIS83Lu7MjK_baP7ycyvzHkWx9B6SQyxiaCJ37G8B-YCi-Vxy_9fdbeaYIMwF1pew=@proton.me>
In-Reply-To: <E5Pgm6Vp9MRV0KHJ_KOh8hEjTukhx1F2X5nlmbJeG-EW0j44NRslk1EuiB6AQt7zLQykmY_QzPU0haPtiH7Yb3fd7QhMFxWBxxx4_2684RA=@proton.me>
References: <E5Pgm6Vp9MRV0KHJ_KOh8hEjTukhx1F2X5nlmbJeG-EW0j44NRslk1EuiB6AQt7zLQykmY_QzPU0haPtiH7Yb3fd7QhMFxWBxxx4_2684RA=@proton.me>
Feedback-ID: 133470881:user:proton
X-Pm-Message-ID: 928c08e46ba8842bc9397d4731799f216d8ad4bc
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14166-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[proton.me:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kpursoty@proton.me,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,proton.me:dkim,proton.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6E3F140AFDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks for your notes. Patch withdrawn.

On Wednesday, 15 April 2026 at 20:48, kpursoty@proton.me <kpursoty@proton.m=
e> wrote:

>
> The EN751627 family (EN7516 DSL, EN7527 xPON) is a big-endian dual-core
> MIPS 1004Kc SoC (2 VPEs per core, NR_CPUS=3D4) used in DSL/WiFi gateway
> devices such as the ZyXEL EX3301-T0. It shares the MIPS GIC interrupt
> controller with EN7528 but is big-endian.
>
> Key differences from existing SoCs:
> - EN751221: BE, single-core 34Kc, custom INTC
> - EN7528:   LE, dual-core 1004Kc, MIPS GIC
> - EN751627: BE, dual-core 2-VPE 1004Kc, MIPS GIC
>
> The SMP plumbing (CM/CPC probe + CPS SMP ops) is shared with EN7528 and
> lives in patch 100 (device_tree_init). This patch adds only the Kconfig
> entry.
>
> Note: on EN751627, mips_cpc_probe() must be called before
> register_cps_smp_ops(). Without it, core 1 never comes online because
> write_gcr_co_reset_release(0) is insufficient on this SoC. This is
> different from EN7528 where CPC probe behaves identically. Both SoCs
> are covered by the shared #if in device_tree_init().
>
> Signed-off-by: Kervin Pursoty <kpursoty@proton.me>
> ---
>  arch/mips/econet/Kconfig | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
> --- a/arch/mips/econet/Kconfig
> +++ b/arch/mips/econet/Kconfig
> @@ -41,3 +41,28 @@ choice
>  =09=09  The EN7528 family with dual-core MIPS 1004Kc.
>  =09=09  Requires MIPS_RAW_APPENDED_DTB=3Dy for boot.
> +
> +=09config SOC_ECONET_EN751627
> +=09=09bool "EN751627 family"
> +=09=09select COMMON_CLK
> +=09=09select CPU_BIG_ENDIAN
> +=09=09select HAVE_PCI
> +=09=09select IRQ_MIPS_CPU
> +=09=09select MIPS_CM
> +=09=09select MIPS_CPC
> +=09=09select MIPS_CPS
> +=09=09select MIPS_CPU_SCACHE
> +=09=09select MIPS_GIC
> +=09=09select MIPS_MT_SMP
> +=09=09select PCI_DRIVERS_GENERIC
> +=09=09select SMP
> +=09=09select SMP_UP
> +=09=09select SYS_SUPPORTS_HIGHMEM
> +=09=09select SYS_SUPPORTS_MIPS_CPS
> +=09=09select SYS_SUPPORTS_MULTITHREADING
> +=09=09select SYS_SUPPORTS_SMP
> +=09=09help
> +=09=09  The EN751627 family (EN7516 DSL, EN7527 xPON) with big-endian
> +=09=09  dual-core, 2-VPE-per-core MIPS 1004Kc and MIPS GIC. Used in
> +=09=09  DSL+WiFi gateways. Requires MIPS_RAW_APPENDED_DTB=3Dy for boot.
>  endchoice
>

