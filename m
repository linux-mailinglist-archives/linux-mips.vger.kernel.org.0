Return-Path: <linux-mips+bounces-13148-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LtfFzjRimluOAAAu9opvQ
	(envelope-from <linux-mips+bounces-13148-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 07:33:28 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C26117623
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 07:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC1C0300A31F
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 06:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11C13126C1;
	Tue, 10 Feb 2026 06:33:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C218F24E4C4;
	Tue, 10 Feb 2026 06:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770705205; cv=none; b=ODWd9AEq3PrUlcBwCS9TrtWnOoCVTu7Y0S6O6kzeDhLYZGZ4weIt95M7Puy5TVW4gQ2Lnp5asSka/El9s7ttineoIItFJEBQHfmYlvIIhwwVe0eISgxFx7L7LDV+jTmods2uhK1xP+n/0qd+PZI3KbEYW5AeHqi20eRXsj2JreE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770705205; c=relaxed/simple;
	bh=ELNGn58lprTOE6DdQhIub5y+dHpwa3+JrVnKzyMSDjw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aEkXHbQ0p2TS7vJlCtR1UxFv+Bi9q2T/NVkKo2DBC4aOWLrtW0MvLmDjFUgpPGEN5SVXbdgiXwmht08eJdpfhaTnG/ZZYd+L0pR2N88mV6ahxaeZjevwmeSb42wZKiMAj5dOjM/AknvecuOWsR6xlBR5eNWZsuKfJYqDSL9Jhng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.253])
	by APP-01 (Coremail) with SMTP id qwCowABX_Gcg0Ypp6UCaBw--.59656S2;
	Tue, 10 Feb 2026 14:33:06 +0800 (CST)
Message-ID: <89d49eada6411c99fdf3ca389b1ff01c2694f954.camel@iscas.ac.cn>
Subject: Re: [PATCH 2/8] dt-bindings: interrupt-controller: add LS7A PCH LPC
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen
 <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mips@vger.kernel.org
Date: Tue, 10 Feb 2026 14:33:04 +0800
In-Reply-To: <20260209234818.GA2119841-robh@kernel.org>
References: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
	 <20260131094547.455916-3-zhengxingda@iscas.ac.cn>
	 <20260209234818.GA2119841-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowABX_Gcg0Ypp6UCaBw--.59656S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr17ArWDJF48JryxCr1ftFb_yoW8uryUpF
	4rC3ZxGFW8tr4fC3yIqa4UCF43ZrZ3JwnxGFsIqw1UCr9xWF92qrWa9r95Wa15ZrWxXFWU
	ZFy09a18ur1DJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x07betCcUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,iscas.ac.cn:mid,iscas.ac.cn:email];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	DMARC_NA(0.00)[iscas.ac.cn];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-13148-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 95C26117623
X-Rspamd-Action: no action

=E5=9C=A8 2026-02-09=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 17:48 -0600=EF=BC=
=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
> On Sat, Jan 31, 2026 at 05:45:41PM +0800, Icenowy Zheng wrote:
> > Loongson 7A series PCH contains an LPC controller with an interrupt
> > controller.
> >=20
> > Add the device tree binding for the interrupt controller.
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > =C2=A0.../loongson,pch-lpc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 52
> > +++++++++++++++++++
> > =C2=A01 file changed, 52 insertions(+)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/interrupt-
> > controller/loongson,pch-lpc.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/interrupt-
> > controller/loongson,pch-lpc.yaml
> > b/Documentation/devicetree/bindings/interrupt-
> > controller/loongson,pch-lpc.yaml
> > new file mode 100644
> > index 0000000000000..c00fbf31f47f0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-
> > controller/loongson,pch-lpc.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
> > http://devicetree.org/schemas/interrupt-controller/loongson,pch-lpc.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Loongson PCH LPC Controller
> > +
> > +maintainers:
> > +=C2=A0 - Jiaxun Yang <jiaxun.yang@flygoat.com>
> > +
> > +description:
> > +=C2=A0 This interrupt controller is found in the Loongson LS7A family
> > of PCH for
> > +=C2=A0 accepting interrupts sent by LPC-connected peripherals and
> > signalling PIC
> > +=C2=A0 via a single interrupt line when interrupts are available.
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: loongson,pch-lpc-1.0
>=20
> Where does 1.0 come from? We don't do version numbers generally
> unless=20
> you define where the versions come from (e.g. Soft IP releases for=20
> FPGAs). I would have expected "ls7a" in the compatible instead.

Well this replicates what's set on PCH PIC, although I am okay to
change it to `7a1000-pch-lpc` .
Thanks
Icenowy

>=20
> Rob
>=20


