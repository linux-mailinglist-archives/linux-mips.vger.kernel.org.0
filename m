Return-Path: <linux-mips+bounces-13154-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFAaJ+ooi2n1QQAAu9opvQ
	(envelope-from <linux-mips+bounces-13154-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 13:47:38 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 120A611AFAA
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 13:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0172C303B4EE
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 12:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EEE30B529;
	Tue, 10 Feb 2026 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJ4NGsDs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4802248891
	for <linux-mips@vger.kernel.org>; Tue, 10 Feb 2026 12:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727654; cv=none; b=RXV0Ekg/SYydRwA4zGN74gT/Jqv696rYArl+nohhiNKAAYVHgpdjsOco/AOG3+FosCeupWOW/yK2BNXbTPyNW4bQkIsfBXSA0G1juPUhtbcR8Ga6Y5i9OFev9aBz8tD/mpujjaKlE0pAb2NuV7JxYe5arps56Cpo6vfA4ELNr/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727654; c=relaxed/simple;
	bh=3byUhG/m2c7E2GQCgSueOnUQ3LkrcuBr9TfT3+SL82U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCve6765anSJtEkz4zS81+oCcM3UeXKjL8fSsEhlUcXC5sAqM4Vyi6FgebCc9qKO2/JGDtAxkbwaPsiJ3Zt3A2ptrXpZ7J2ZSY/GhGFJrPyKxasC5Hf4w1Bh8+FL7r/XZ5LRbbePp1exyFdKw1dhd/lmKB8WrVSSnW0d3ZfdVto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJ4NGsDs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B51C4AF09
	for <linux-mips@vger.kernel.org>; Tue, 10 Feb 2026 12:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770727654;
	bh=3byUhG/m2c7E2GQCgSueOnUQ3LkrcuBr9TfT3+SL82U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kJ4NGsDs5qpD6oyGl1dylgz/c5K49OovvoIBkocz/k3lAMwC7YAQqcXMo11ZiyWJG
	 ovtVdTkELC2W7QJfkVsFpG727Z2pVAR5jLyeMx9Is/oqvPc+Ve7zUD4QNCnAj7dqVh
	 xakvhWAqM8inqXTbdlPysMFx7BEtFALNNBrc0MvBtVgxuIbQwZ/Dbx7jmLUE64NqDZ
	 I5vpKTsiKOmHR9KKi0F4jjc/5KoC30EQGHnj01FcJ/FDZqGEk5COG72dK7MXg3sW82
	 KzCBnX/xSSPZmSLNqoFInb4ZN+MYwEwZi7fbOsRzCrU0Md7iOmLekQdNIaatccxH3y
	 wiGsN6Cgc3pPQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-653780e9eb3so1049285a12.1
        for <linux-mips@vger.kernel.org>; Tue, 10 Feb 2026 04:47:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/Jcvs1X1nVM68Fyzn0IRXgWuW8MDgSO/mc98D88cRYk+sl9DQZY+GSAbhsYFB/ADxk5wx1pTvEEkg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn1Blaf/qrC0hh/lXtTB5aQRK3EBWx6GhfGIqoSNRk11A9qD0x
	6lFCVeFx6G07D1rFGuEQnY6R6XLSqzLLk5TDI4XuC8ots7aVugjX1/e88aoUD61BUY7vqhpLyAA
	HQoaOI+IeQwoSxmOaxteZu6w9SaJt07A=
X-Received: by 2002:a17:907:96a3:b0:b8e:d1f3:4744 with SMTP id
 a640c23a62f3a-b8edf4139c7mr865102066b.55.1770727653004; Tue, 10 Feb 2026
 04:47:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
 <20260131094547.455916-3-zhengxingda@iscas.ac.cn> <20260209234818.GA2119841-robh@kernel.org>
 <1f7b645328fb86d1097a80b224c39ca3ed07a4b2.camel@iscas.ac.cn>
In-Reply-To: <1f7b645328fb86d1097a80b224c39ca3ed07a4b2.camel@iscas.ac.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 10 Feb 2026 20:47:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5foQQFakDCYRDSM3vePZh-kECpTM+rwvs3jBvLgsjChQ@mail.gmail.com>
X-Gm-Features: AZwV_QjCQ0H5HZWn3pR4DLUJociZMJIWnpAT2Ryiz-3zKCNbW_uonG7cG-yu01Y
Message-ID: <CAAhV-H5foQQFakDCYRDSM3vePZh-kECpTM+rwvs3jBvLgsjChQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: interrupt-controller: add LS7A PCH LPC
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-13154-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,flygoat.com:email]
X-Rspamd-Queue-Id: 120A611AFAA
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 6:51=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> =E5=9C=A8 2026-02-09=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 17:48 -0600=EF=
=BC=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
> > On Sat, Jan 31, 2026 at 05:45:41PM +0800, Icenowy Zheng wrote:
> > > Loongson 7A series PCH contains an LPC controller with an interrupt
> > > controller.
> > >
> > > Add the device tree binding for the interrupt controller.
> > >
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > >  .../loongson,pch-lpc.yaml                     | 52
> > > +++++++++++++++++++
> > >  1 file changed, 52 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/interrupt-
> > > controller/loongson,pch-lpc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-
> > > controller/loongson,pch-lpc.yaml
> > > b/Documentation/devicetree/bindings/interrupt-
> > > controller/loongson,pch-lpc.yaml
> > > new file mode 100644
> > > index 0000000000000..c00fbf31f47f0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-
> > > controller/loongson,pch-lpc.yaml
> > > @@ -0,0 +1,52 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > > http://devicetree.org/schemas/interrupt-controller/loongson,pch-lpc.y=
aml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Loongson PCH LPC Controller
> > > +
> > > +maintainers:
> > > +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > +
> > > +description:
> > > +  This interrupt controller is found in the Loongson LS7A family
> > > of PCH for
> > > +  accepting interrupts sent by LPC-connected peripherals and
> > > signalling PIC
> > > +  via a single interrupt line when interrupts are available.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: loongson,pch-lpc-1.0
> >
> > Where does 1.0 come from? We don't do version numbers generally
> > unless
> > you define where the versions come from (e.g. Soft IP releases for
> > FPGAs). I would have expected "ls7a" in the compatible instead.
>
> I originally followed the behavior of PCH PIC; however after asking
> Jiaxun offlist, I was noticed about a register on the 7A1000 user
> manual in the PIC that identifies the PIC version number; such version
> number register does not exist for LPC part.
>
> I will switch to ls7a-lpc or ls7a1000-lpc. Newer compatible strings in
> the 2K series (LoongArch ones) come with the whole model number, I
> don't know whether this is needed for 7A1000 (although it looks like
> that 7A2000 has the same
Yes, they are the same, so I think ls7a-lpc is just OK.

Huacai

> >
> > Rob
> >
>

