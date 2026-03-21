Return-Path: <linux-mips+bounces-13849-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E0xJDNevmnxNgMAu9opvQ
	(envelope-from <linux-mips+bounces-13849-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 10:00:35 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3C42E44A5
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 10:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03AB5301CC7C
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 09:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6E131714F;
	Sat, 21 Mar 2026 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="QwcXmStO"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1DA2DF13F;
	Sat, 21 Mar 2026 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774083632; cv=pass; b=Sf1cqxkOaOzadnKCawHlB0WahDtj/3IoZ/IzH/Y8rG1Z/yNbVJAf+rPgkivdKHZ2vxn6sBMsDPQ8OTpfZIBijUDeqJ+UfZJfWkU6bme8yM4D2r17gliABoucEogtkJhTLU8gccg+ChY6pdlCMjKXDVe3PEdy4m3HwkEdXRDllJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774083632; c=relaxed/simple;
	bh=rTcWNakVaJJVbrHqXnf7QiogK0qrtyXNTagfHigTJwM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TgYNa1h01vDk9ylVuov9QO7apGEOlWh4ggB5AZ+3hJDnLDXGE3ZHbNqWAic1xo88yJ5KR55l7fBXLO26Z3h267VpV4QOnNv6pjmASK6zzeiDuo2SpfLBUZUlncn6oUD2KNVSBHBNnVouSASIqCVFWjsnXU7ny40LfFCnYyDNu0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=QwcXmStO; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1774083607; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BNqT/XkZh6XrdTFjCOM1Ip0a/2pnil1DBZMirBSAHdchN3iSjkTrK6HpW4ir6i8zM2Eoi+mVL6jfMcKKYdCLj3f1Znci4+2ATQB9niLtHDzYMFluwANZxQ6VvQrYnVVlExicsCp7DMjOHrVxXsCRuH7g7VF8vmtvFDKVZg5/vmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774083607; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w5SjMy6b6bimW70XjXDfCDcAfH3Ea5Tq2LlOvJguidc=; 
	b=Ct4Tbk3jDFaFdmPACWQGj7dPHDCy04S7c94qLvC+57VAwVgRynSIedvSrI24SuZHqdOd2qckZhuHKUPccgAz9JYae8utFwx+6e+6m2uooWqA2pKlk2KbJN/N/MbPihVFrzfk7zzpvnvVYJICFpACdflFyhldHfnQvBzU+CsS8Y4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774083607;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=w5SjMy6b6bimW70XjXDfCDcAfH3Ea5Tq2LlOvJguidc=;
	b=QwcXmStOyA3+Z6Fi46gNc4yzgffM3hehYUwynkJok4P3+okKbA/BPCPQfKyQMZ2E
	Vo1dlVGjqkeazOrueegpAG60/0gci1GDKJNm/xipKvXO+dEm1uA4OxsdltU/6smBEcs
	SXCELmxCDsx/+yMIAD1Zmq/Vqs6kQbBhtBqjkSLesYF8Oudz6FpOmFDY36YkXMbpD7o
	R7xcSyu9vRhNbPYGnMue5UBHh6Of5eotTslc+kn2scFPANw3bur14XZ2uO4yeK/M6Xm
	FFqSpn89vrYLofAPOJSdEGzEWgZlw/qVOSHarYfecR9HT07lJs1vuBmHVGpevTdQYWH
	0yqteChmTw==
Received: by mx.zohomail.com with SMTPS id 1774083604413447.2192070793784;
	Sat, 21 Mar 2026 02:00:04 -0700 (PDT)
Message-ID: <87f24e166c931d0040e7b838785e7b360cbc7c6a.camel@icenowy.me>
Subject: Re: [PATCH v3 0/8] Add support for LS7A LPC IRQ for MIPS Loongson
 systems
From: Icenowy Zheng <uwu@icenowy.me>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, WANG Xuerui	 <kernel@xen0n.name>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Yao Zi <me@ziyao.cc>,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 loongarch@lists.linux.dev, 	linux-mips@vger.kernel.org
Date: Sat, 21 Mar 2026 16:59:55 +0800
In-Reply-To: <CAAhV-H4OYVB21jH3PSzOi4GPU+t4LY664Yp=CeDhjFRKf9V07Q@mail.gmail.com>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
	 <CAAhV-H4OYVB21jH3PSzOi4GPU+t4LY664Yp=CeDhjFRKf9V07Q@mail.gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13849-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C3C42E44A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=E5=9C=A8 2026-03-18=E4=B8=89=E7=9A=84 21:57 +0800=EF=BC=8CHuacai Chen=E5=
=86=99=E9=81=93=EF=BC=9A
> Hi, Icenowy,
>=20
> On Sun, Mar 15, 2026 at 12:28=E2=80=AFAM Icenowy Zheng
> <zhengxingda@iscas.ac.cn> wrote:
> >=20
> > This patchset tries to add support for Loongson 7A1000 PCH's LPC
> > interrupt controller to MIPS-based Loongson systems.
> >=20
> > LPC, from software's perspective of view, is just ISA, so the
> > interrupts
> > should be handled as legacy ones occupying the lowest 0-15 IRQ
> > numbers.
> > Despite the current PCH LPC driver for ACPI-based LoongArch
> > Loongson
> > machines handled it, the setup is fragile and depends on its
> > specific
> > setup sequence (allocating the LPC IRQs first, and then allocate
> > the
> > parent IRQ at PCH PIC). The refactor of extracting parent IRQ
> > allocation
> > breaks this fragile sequence, so the first two commits is created
> > to
> > address this issue (by reserving ISA interrupts from the dynamic
> > allocation space).
> >=20
> > Then the remaining commits are just adding OF(DT) based
> > initialization
> > of PCH LPC interrupt controller, like what happened on PCH PIC.
> >=20
> > Tested on a Haier Boyue G51 system with legacy i8042 keyboard/mouse
> > as
> > integrated ones.
> >=20
> > Changes in v3:
> > - Override arch_dynirq_lower_bound() in MIPS Loongson64 / LoongArch
> > =C2=A0 instead of modifying the global version of function.
> > - Added Rob's R-b to the binding patch.
> >=20
> > Changes in v2:
> > - Rebased on top of `irq-drivers-2026-02-09` tag.
> > - Compatible changed to `loongson,ls7a-lpc` .
> > - Merged the patch for conditionally build of ACPI code to the
> > patch
> > =C2=A0 introducing OF code.
> > - Sorted function variable definitions.
> > - Reworded some commit messages as Thomas Glexiner suggests.
> > - Added __init to the LPC irqchip OF initialization code to prevent
> > =C2=A0 section mismatch.
> >=20
> > Icenowy Zheng (8):
> > =C2=A0 MIPS: loongson64: Override arch_dynirq_lower_bound to reserve LP=
C
> > IRQs
> > =C2=A0 LoongArch: Override arch_dynirq_lower_bound to reserve LPC IRQs
> Use upper case for the first word, which means....

I'm going to change this for your preference, but please note that
there's no requirement of using upper case for `summary phrase` in the
Documentation/process/submitting-patches.rst document.

The examples in that document even include both examples with first
words being either upper case and lower case, which indicates both
should be acceptable:

```
Here are some good example Subjects::

    Subject: [PATCH 2/5] ext2: improve scalability of bitmap searching
    Subject: [PATCH v2 01/27] x86: fix eflags tracking
    Subject: [PATCH v2] sub/sys: Condensed patch summary
    Subject: [PATCH v2 M/N] sub/sys: Condensed patch summary
```

Thanks,
Icenowy

>=20
> > =C2=A0 dt-bindings: interrupt-controller: add LS7A PCH LPC
> s/add/Add/g
>=20
> > =C2=A0 irqchip/loongson-pch-lpc: extract non-ACPI-related code from ACP=
I
> > init
> s/extract/Extract/g
>=20
> > =C2=A0 irqchip/loongson-pch-lpc: add OF init code
> s/add/Add/g
>=20
> > =C2=A0 irqchip/loongson-pch-lpc: enable building on MIPS Loongson64
> s/enable/Enable/g
>=20
> > =C2=A0 MIPS: Loongson64: dts: sort nodes
> s/sort/Sort/g
>=20
> > =C2=A0 MIPS: Loongson64: dts: add node for LS7A PCH LPC
> s/add/Add/g
>=20
> In addition, I think the last two patches should be in another series
> because they won't go to the irqchip tree.
>=20
> Huacai
>=20
> >=20
> > =C2=A0.../loongson,pch-lpc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 52 +++++++++++
> > =C2=A0arch/loongarch/kernel/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 ++
> > =C2=A0arch/mips/boot/dts/loongson/ls7a-pch.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
 | 17 +++-
> > =C2=A0arch/mips/loongson64/init.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 ++
> > =C2=A0drivers/irqchip/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 -
> > =C2=A0drivers/irqchip/irq-loongson-pch-lpc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 87 ++++++++++++++-
> > ----
> > =C2=A06 files changed, 144 insertions(+), 25 deletions(-)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/interrupt-
> > controller/loongson,pch-lpc.yaml
> >=20
> > --
> > 2.52.0
> >=20

