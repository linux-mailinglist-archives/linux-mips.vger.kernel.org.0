Return-Path: <linux-mips+bounces-13860-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNJKJ9mKvmkOSQMAu9opvQ
	(envelope-from <linux-mips+bounces-13860-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 13:11:05 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A862E53AE
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 13:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6A21300A395
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 12:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C09D28851C;
	Sat, 21 Mar 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YElIJbbT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5632C028F
	for <linux-mips@vger.kernel.org>; Sat, 21 Mar 2026 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774095053; cv=none; b=n/cBs1n25LUf4T2pjSdjZoXCHiIrPcGUvd6XB+1rk/PgzYCiQ2nsWDYwBDxyAP3nz5I+rqOl48dxbw82pFtckZ5TNy5CI4v7ZwugjKmJ+I3fDx8iU9LuHp37MuEesSR6J4sD5Nk9iSXc/CJl/qrpBlc+D7Yl7xJ+7vMQBaUyyrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774095053; c=relaxed/simple;
	bh=Me8RHncuorU5Bnt1FGpeDdkHmkRj0Akc3sb0Vai9Ye8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WqmizRBg3zWyG7H1pbVoH+6dO6jd6oCbovOnAEHsLpC81q/PnEL+U0va2e+AxmykJKYrvGtfQ42K3U/SHK8M8YQq9lF1beG8+PlvMw2Da3EnHohm3RCbMBCetUNlo4sdieQRvq61VAtZZyu7KpW8TXzKItnex7Pn5aBbOLg8OIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YElIJbbT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976F9C2BCB2
	for <linux-mips@vger.kernel.org>; Sat, 21 Mar 2026 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774095053;
	bh=Me8RHncuorU5Bnt1FGpeDdkHmkRj0Akc3sb0Vai9Ye8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YElIJbbTM4SUHYA3k3q3h3OFGJq44TdRrR7BfwD3RsTmbuhE3ljw4Cdcsok/zv1N4
	 M/+lijNybtEVbPTIwQBqJeZfeJkhJZJAQEKu9Pq7laYy1bKxUXkTmzbOKUb1BdHm9g
	 vyhoWrJv62U1IZqqH0Row2GFdXVwIB9nGr2zaKqaBPiZtUt+2Ig74F6sTvIzM88OaL
	 slM8d81Xi9R8zZ/cnUFz0kmi7MoXuIMjmM+EdBMwTgnqj1B9e9q735uqhGqC6UJ1RJ
	 cCeV740581Gsf2i6897bCl+TWf19IhinkLsjGELaxvEcLj673KgfZj09bJAlIrf2l6
	 0XD9bAdsfGL7Q==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-667f8794e97so4914624a12.2
        for <linux-mips@vger.kernel.org>; Sat, 21 Mar 2026 05:10:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTmqqqT1zDcusXryUYBozay7wf6DJFNDvtSBWHErNERwNbcCpCRDk0k5lIrZO7wunkcIKyp/o2htbU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8AdttUV1jP/lNzjVm/9L9sEgj7Y1WynN7u4cDf47b0n559vcK
	pI+RwGP1CMz8Uc/COIh0wvPNwjQiJKK8nmrK5uwFaQM4gN0oLgMF94Ru1NQPVI5SHNWbnxM5k1R
	lrb70cYG8uqkgnRo1jqIqDxziO4HAKfE=
X-Received: by 2002:a17:906:13c2:b0:b97:61d7:793f with SMTP id
 a640c23a62f3a-b982f282a9fmr347730566b.24.1774095052107; Sat, 21 Mar 2026
 05:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 21 Mar 2026 20:10:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6pcwfFPK_FRaXMa-h=aqEmJoLv7wUtG43WrbfHDZGYuw@mail.gmail.com>
X-Gm-Features: AaiRm508So21GaidqT3MorXZv8b1sxmEw5OwaNquBRDd5F5Ghrpf6T2HDO4BAPo
Message-ID: <CAAhV-H6pcwfFPK_FRaXMa-h=aqEmJoLv7wUtG43WrbfHDZGYuw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Add support for LS7A LPC IRQ for MIPS Loongson systems
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Icenowy Zheng <uwu@icenowy.me>, Yao Zi <me@ziyao.cc>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13860-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,loongson.cn:email,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 02A862E53AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For the whole series:

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>


On Sat, Mar 21, 2026 at 5:20=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> From: Icenowy Zheng <uwu@icenowy.me>
>
> This patchset tries to add support for Loongson 7A1000 PCH's LPC
> interrupt controller to MIPS-based Loongson systems.
>
> LPC, from software's perspective of view, is just ISA, so the interrupts
> should be handled as legacy ones occupying the lowest 0-15 IRQ numbers.
> Despite the current PCH LPC driver for ACPI-based LoongArch Loongson
> machines handled it, the setup is fragile and depends on its specific
> setup sequence (allocating the LPC IRQs first, and then allocate the
> parent IRQ at PCH PIC). The refactor of extracting parent IRQ allocation
> breaks this fragile sequence, so the first two commits is created to
> address this issue (by reserving ISA interrupts from the dynamic
> allocation space).
>
> Then the remaining commits are just adding OF(DT) based initialization
> of PCH LPC interrupt controller, like what happened on PCH PIC.
>
> Tested on a Haier Boyue G51 system with legacy i8042 keyboard/mouse as
> integrated ones, with some additional patches adding the PCH LPC device
> node to the ls7a-pch.dtsi file.
>
> Changes in v4:
> - Removed "IRQ" acronym from detailed commit messages (but still kept
>   in summary phrases for the length constraint).
> - Re-format some patch to utilize 100 columns instead of 80.
> - Temporarily removed the DT patches for fitting the whole patchset into
>   the irqchip tree.
>
> Changes in v3:
> - Override arch_dynirq_lower_bound() in MIPS Loongson64 / LoongArch
>   instead of modifying the global version of function.
> - Added Rob's R-b to the binding patch.
>
> Changes in v2:
> - Rebased on top of `irq-drivers-2026-02-09` tag.
> - Compatible changed to `loongson,ls7a-lpc` .
> - Merged the patch for conditionally build of ACPI code to the patch
>   introducing OF code.
> - Sorted function variable definitions.
> - Reworded some commit messages as Thomas Glexiner suggests.
> - Added __init to the LPC irqchip OF initialization code to prevent
>   section mismatch.
>
> Icenowy Zheng (6):
>   MIPS: loongson64: Override arch_dynirq_lower_bound to reserve LPC IRQs
>   LoongArch: Override arch_dynirq_lower_bound to reserve LPC IRQs
>   dt-bindings: interrupt-controller: add LS7A PCH LPC
>   irqchip/loongson-pch-lpc: Extract non-ACPI-related code from ACPI init
>   irqchip/loongson-pch-lpc: Add OF init code
>   irqchip/loongson-pch-lpc: Enable building on MIPS Loongson64
>
>  .../loongson,pch-lpc.yaml                     | 52 +++++++++++
>  arch/loongarch/kernel/irq.c                   |  6 ++
>  arch/mips/loongson64/init.c                   |  6 ++
>  drivers/irqchip/Kconfig                       |  1 -
>  drivers/irqchip/irq-loongson-pch-lpc.c        | 92 +++++++++++++++----
>  5 files changed, 136 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/loongson,pch-lpc.yaml
>
> --
> 2.52.0
>
>

