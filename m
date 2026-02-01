Return-Path: <linux-mips+bounces-13078-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UONNFTwlf2nHkgIAu9opvQ
	(envelope-from <linux-mips+bounces-13078-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 01 Feb 2026 11:04:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A21AC565B
	for <lists+linux-mips@lfdr.de>; Sun, 01 Feb 2026 11:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFF653010BAA
	for <lists+linux-mips@lfdr.de>; Sun,  1 Feb 2026 09:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0D5320CB6;
	Sun,  1 Feb 2026 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="dx7l8HvN"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8760307AD5;
	Sun,  1 Feb 2026 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769939899; cv=pass; b=EbB2F5ESJVvRR3qUapD4b4YbeUkq6fRiplNTa+DduuP1HV1UG7LXaFxFC6lA0NOVq5Cf3Bhyhx6ONPfqDWkOhtmCCOOMgT1q4ay25b8ve2ngTOy3UQdlnwkKT3iUlMtuW/+A3Y7gCdMttfBsHBWt1TQuBdNmAyKCD8yuw8/RSEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769939899; c=relaxed/simple;
	bh=SyZ862r8egUQ+PLwO/HVIclfWIhrbhNieK7VmqFffV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmDOEb+RKM34I8mfsEfQY9HS92+WSacDl/xGlanBipYbq+0N09HIGE3ZYRCOmdliCWaOv76TthmhPfp/N+jnSwABNHyRwfFNcDrBCwqfkyebpkgA5r3zYoAUd8NPy80TcDGMLepUet5tXjybyPeLCcKTLk1eHduHYIl1TnQ8O8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=dx7l8HvN; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
ARC-Seal: i=1; a=rsa-sha256; t=1769939880; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D6wSWuBp/riAZKXDyVoDMkGQA/0OBw5wO1iBKQ6TPad2twJss7BJ/hR/R5mayGW5PkgKhZtZHao7N+psCg0kjLh0cUlpqzJyUMjXGIKRwTCdySUhYsxPOmJA7GzIi/0T7PiE3a16j6THrsuaY+LkjAaM0f82n8s2TVrwuFwDR5g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769939880; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1jNbGCcYgWGU3sfbSU1ooO1S553rJA1jU86fpokkzZY=; 
	b=NpIaCQ2SHH2hvN1N5PSG7RrDlPjwnVTjImvZsq6fHID6VD7aIZKKBrRubdF2UKuXEShlSyotEoIs/GKYlaFbcJHE/ZiFvjU9mJPCm9Lnu8cLdjnbzEQ2MuhsuHgMna2apV3v2nstyQYt/sX4vZKIN/4zZH9kpePO4IUrWmR/Qzw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769939880;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=1jNbGCcYgWGU3sfbSU1ooO1S553rJA1jU86fpokkzZY=;
	b=dx7l8HvNnOzv1iscDKBKaf5whu3gvC64/Bj2qLux8yIlPdrddOOgAql612Lc7pTm
	gJq3mBwv2/uvXN8nYml7TZcZjHqTRL+VwT+tawAuGuag2vFs/SUC0RThuae0GNlaC3G
	FneCkbxXL6OEXOD6x1A2/ldcYmhQNSPyRI1UXLlg=
Received: by mx.zohomail.com with SMTPS id 1769939878219710.5215253382021;
	Sun, 1 Feb 2026 01:57:58 -0800 (PST)
Date: Sun, 1 Feb 2026 09:57:34 +0000
From: Yao Zi <me@ziyao.cc>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/8] Add support for LS7A LPC IRQ for MIPS Loongson
 systems
Message-ID: <aX8jjqxrl2ccN1lA@pie>
References: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [9.34 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email,ziyao.cc:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13078-lists,linux-mips=lfdr.de];
	R_DKIM_ALLOW(0.00)[ziyao.cc:s=zmail];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ziyao.cc,quarantine];
	DKIM_TRACE(0.00)[ziyao.cc:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@ziyao.cc,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.851];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ziyao.cc:email,ziyao.cc:dkim]
X-Rspamd-Queue-Id: 0A21AC565B
X-Rspamd-Action: add header
X-Spam: Yes

On Sat, Jan 31, 2026 at 05:45:39PM +0800, Icenowy Zheng wrote:
> This patchset tries to add support for Loongson 7A1000 PCH's LPC IRQ
> controller to MIPS-based Loongson systems.
> 
> LPC, from software's perspective of view, is just ISA, so the IRQs
> should be handled as legacy ones occupying the lowest 0-15 IRQ numbers.
> Despite the current PCH LPC driver for ACPI-based LoongArch Loongson
> machines handled it, the setup is fragile and depends on its specific
> setup sequence (allocating the LPC IRQs first, and then allocate the
> parent IRQ at PCH PIC). The refactor of extracting parent IRQ allocation
> breaks this fragile sequence, so the first commit is created to address
> for this issue (by reserving ISA IRQs from the dynamic IRQ allocation
> space).
> 
> Then the remaining commits are just adding OF(DT) based initialization
> of PCH LPC IRQ controller, like what happened on PCH PIC.
> 
> Tested on a Haier Boyue G51 system with legacy i8042 keyboard/mouse as
> integrated ones. I don't own a LoongArch-based device with LPC
> peripherals, so test on LoongArch machines are welcomed.

Tested on TongFang L860-T2 system, which is LoongArch-based and exposes
keyboard and mouse as i8042, too. Nothing breaks with this series,

$ cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
  1:        606          0          0          0  PCH LPC   1  i8042
 12:        645          0          0          0  PCH LPC  12  i8042
 20:      16393      14853      15443      17386  CPUINTC  12  IPI
 21:       4515       4154       3756       3701  CPUINTC  11  timer
 22:          0          0          0          0  PCH PIC   1  acpi
 28:          0          0          0          0  PCH PIC   7  loongson-alarm
 29:          0          0          0          0  PCH PIC   8  ls2x-i2c, ls2x-i2c, ls2x-i2c, ls2x-i2c, ls2x-i2c, ls2x-i2c
 37:          0          0          0          0 PCH-PCI-MSI-0000:00:09.0   0  PCIe bwctrl
 39:          0          0          0          0 PCH-PCI-MSI-0000:00:0a.0   0  PCIe bwctrl
 41:          0          0          0          0 PCH-PCI-MSI-0000:00:0b.0   0  PCIe bwctrl
 43:          0          0          0          0 PCH-PCI-MSI-0000:00:0c.0   0  PCIe bwctrl
 45:          0          0          0          0 PCH-PCI-MSI-0000:00:0d.0   0  PCIe bwctrl
 47:          0          0          0          0 PCH-PCI-MSI-0000:00:11.0   0  PCIe bwctrl
 49:          0          0          0          0 PCH-PCI-MSI-0000:00:13.0   0  PCIe bwctrl
 50:          0          0          0          0  PCH PIC  21  ahci[0000:00:08.0]
 51:         14          0          0          0 PCH-PCI-MSIX-0000:06:00.0   0  nvme0q0
 52:          0          0          0          0  PCH PIC  22  ahci[0000:00:08.1]
 53:          0          0          0          0  PCH PIC  23  ahci[0000:00:08.2]
 54:          0          0          0          0 PCH-PCI-MSI-0000:04:00.0   0  ahci[0000:04:00.0]
 55:        952          0          0          0 PCH-PCI-MSIX-0000:06:00.0   1  nvme0q1
 56:          0       1590          0          0 PCH-PCI-MSIX-0000:06:00.0   2  nvme0q2
 57:          0          0        916          0 PCH-PCI-MSIX-0000:06:00.0   3  nvme0q3
 58:          0          0          0       3836 PCH-PCI-MSIX-0000:06:00.0   4  nvme0q4
 61:       2649          0          0          0 PCH-PCI-MSI-0000:07:00.0   0  amdgpu
 62:       2561          0          0          0 PCH-PCI-MSI-0000:01:00.0   0  iwlwifi
IPI0:        350        507        573        311 LoongArch  1  Rescheduling interrupts
IPI1:      16044      14345      14870      17074 LoongArch  2  Function call interrupts
IPI2:          0          0          0          0 LoongArch  3  IRQ work interrupts
IPI3:          0          0          0          0 LoongArch  4  Clear vector interrupts
ERR:         12

Tested-by: Yao Zi <me@ziyao.cc>

Thanks for your work!

Regards,
Yao Zi

