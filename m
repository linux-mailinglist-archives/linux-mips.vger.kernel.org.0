Return-Path: <linux-mips+bounces-13749-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPYwHSCzumlWawIAu9opvQ
	(envelope-from <linux-mips+bounces-13749-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 15:13:52 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE4F2BCD0D
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 15:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2DA130E0DCF
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 13:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FE13DA5CA;
	Wed, 18 Mar 2026 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tG0m2dOB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660883DA5BF
	for <linux-mips@vger.kernel.org>; Wed, 18 Mar 2026 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842252; cv=none; b=G3OWjAnT6TT8aCe12XHz7fGYchHctDZMzAsGhQhNbihal+3/aVKgG5juU3zTHAm7xtdrClHD30tKJFmClgGa11QCUHog5uGfQlZG8SQFv30SK4oroBF1fokKnw+yM4y3pdoNaeuOyIqBrpzFMsBN9Bw/m83et9Nscs4DdxQE+n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842252; c=relaxed/simple;
	bh=gnx7uWxAC+gLJ3Mdq7xy1t6BYYdm0AV9Cqp1s3NHoDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvPSSbnymaIfhp/nW4k5GQCdND7iZspd3WnlcsiZSsO7sS1h2C5Hb4kDyhmr//asgwZeOeoJ35Y8ZVmERdAmEsev6Pe6mTNPMKCDWJU+of7GS76DiG2CLTOenOUwRgHdkxmSAmHmAXCMHQ+67RrAMlibWOO5DOO6+nAdl0xhUNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tG0m2dOB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F846C2BCB2
	for <linux-mips@vger.kernel.org>; Wed, 18 Mar 2026 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773842252;
	bh=gnx7uWxAC+gLJ3Mdq7xy1t6BYYdm0AV9Cqp1s3NHoDM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tG0m2dOB3VF+KR4QsAaWd375AEAaHi6goPXz2Rb0W8MyzyhFIxZxh58hjbc5jMyXW
	 nHuf6T5X+HnlEOGoVuSeTmSRWkkTp27jM4oCIYekluJE1SI7Cv6HL9TgPdzGi4ngXT
	 4cu0OV5zU0n/tb17vWImKB40GheDd4ujEFRxbLTd1+Kfq3cKxyOH8pPAC5HwAyDk2t
	 ma0Oz6/AASaFYBJLVKB0qubSU/WVVM6a/L9X20mEqbir9lsr/kXNxv0R3nWCpVROBZ
	 yc14qUDHVkASgLhn83xOX5adYu/xkAmSE62gBJ8iGjR/mOcZWqtruibHfnuDGP4bYf
	 OWvXkCrubRKLQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-666f646f5cfso1541252a12.1
        for <linux-mips@vger.kernel.org>; Wed, 18 Mar 2026 06:57:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXv3gHvkG/p3QonoZw2CK1Cm5F4ijyC0b3YQg6rvFRbhXgqablHOcyHty8HO+po+HyQDu1rVqx826hW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx194IzZMXAktTBlV8EESUnN7HTxijz3hoabuI8kKgLA+f93sXE
	D4UM7qmRcH9yuaxBOT5n9m0Wj1Uw+dr5nhRCyLxeiEbWeVt3dVznaf/2TUW6TjxAKGgrosZA0F7
	ByTxtW5eNUSDwkB6/9AEqMOK/awqOaiQ=
X-Received: by 2002:a17:907:7244:b0:b93:f24a:127 with SMTP id
 a640c23a62f3a-b97d6de76a1mr489038566b.24.1773842250621; Wed, 18 Mar 2026
 06:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Mar 2026 21:57:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4OYVB21jH3PSzOi4GPU+t4LY664Yp=CeDhjFRKf9V07Q@mail.gmail.com>
X-Gm-Features: AaiRm51L7NG5tsCrybND45L_NZrxxhNvUkDMnSa4KOQ_a2hgp11NA1VrtQjPUV4
Message-ID: <CAAhV-H4OYVB21jH3PSzOi4GPU+t4LY664Yp=CeDhjFRKf9V07Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add support for LS7A LPC IRQ for MIPS Loongson systems
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13749-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,iscas.ac.cn:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CE4F2BCD0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Icenowy,

On Sun, Mar 15, 2026 at 12:28=E2=80=AFAM Icenowy Zheng <zhengxingda@iscas.a=
c.cn> wrote:
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
> integrated ones.
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
> Icenowy Zheng (8):
>   MIPS: loongson64: Override arch_dynirq_lower_bound to reserve LPC IRQs
>   LoongArch: Override arch_dynirq_lower_bound to reserve LPC IRQs
Use upper case for the first word, which means....

>   dt-bindings: interrupt-controller: add LS7A PCH LPC
s/add/Add/g

>   irqchip/loongson-pch-lpc: extract non-ACPI-related code from ACPI init
s/extract/Extract/g

>   irqchip/loongson-pch-lpc: add OF init code
s/add/Add/g

>   irqchip/loongson-pch-lpc: enable building on MIPS Loongson64
s/enable/Enable/g

>   MIPS: Loongson64: dts: sort nodes
s/sort/Sort/g

>   MIPS: Loongson64: dts: add node for LS7A PCH LPC
s/add/Add/g

In addition, I think the last two patches should be in another series
because they won't go to the irqchip tree.

Huacai

>
>  .../loongson,pch-lpc.yaml                     | 52 +++++++++++
>  arch/loongarch/kernel/irq.c                   |  6 ++
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     | 17 +++-
>  arch/mips/loongson64/init.c                   |  6 ++
>  drivers/irqchip/Kconfig                       |  1 -
>  drivers/irqchip/irq-loongson-pch-lpc.c        | 87 ++++++++++++++-----
>  6 files changed, 144 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/loongson,pch-lpc.yaml
>
> --
> 2.52.0
>

