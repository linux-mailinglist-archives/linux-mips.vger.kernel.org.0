Return-Path: <linux-mips+bounces-13151-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGUNM6cNi2l/PQAAu9opvQ
	(envelope-from <linux-mips+bounces-13151-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 11:51:19 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB4119D4A
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 11:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B84B03030D0D
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 10:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AFA360728;
	Tue, 10 Feb 2026 10:51:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06B5342C80;
	Tue, 10 Feb 2026 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770720673; cv=none; b=fHU9JHV1dcMPDEcBZ/2daVsZFp0qNh/4zwsT3k0QtWY+6ZFtwLRC93TEuSzSNxmblVz8lGKbkIaAx6tXANS4upkU6PJFyqz+oF/z7CridJijWE+cI3HIjlG1LPjsBjCzrQGWVcc1dYnQqKHW+tmpOP7T/YdPd5RRocs8f+zIJqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770720673; c=relaxed/simple;
	bh=mhdYid8XmFcIj9wWiW7/K/jA197wwkjAf5+5sx75Ca4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JokSeQHoVCKjIH6wd77Y0MacliuMp463Dl4rqejqOx87pdQzDSzi8+7Q+KB4QuWog6SWKcTLL33r3WoiE7d3p+uwkZ45vJLEL1nh0yH1DW6vOJxdxMuE4FynSjq2xq+md1wsDOy2zKqhFMtNxRCatC/SW7H+k/p+Om1TUV4gmR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.253])
	by APP-01 (Coremail) with SMTP id qwCowABH7mmWDYtphfqdBw--.30927S2;
	Tue, 10 Feb 2026 18:51:02 +0800 (CST)
Message-ID: <1f7b645328fb86d1097a80b224c39ca3ed07a4b2.camel@iscas.ac.cn>
Subject: Re: [PATCH 2/8] dt-bindings: interrupt-controller: add LS7A PCH LPC
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen
 <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mips@vger.kernel.org
Date: Tue, 10 Feb 2026 18:51:02 +0800
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
X-CM-TRANSID:qwCowABH7mmWDYtphfqdBw--.30927S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr17ArWDJF48JryxCr1ftFb_yoW5Jry3pF
	WrC3ZxKFW8tr1xCw4Sq3WUGrW5Ar4fAw1DGFsIqw1UCr9xWFy2qrWavr9Yga45Zr4xXFWj
	vry09a1UuF45JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07betCcUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,flygoat.com:email];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	DMARC_NA(0.00)[iscas.ac.cn];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-13151-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: B2BB4119D4A
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

I originally followed the behavior of PCH PIC; however after asking
Jiaxun offlist, I was noticed about a register on the 7A1000 user
manual in the PIC that identifies the PIC version number; such version
number register does not exist for LPC part.

I will switch to ls7a-lpc or ls7a1000-lpc. Newer compatible strings in
the 2K series (LoongArch ones) come with the whole model number, I
don't know whether this is needed for 7A1000 (although it looks like
that 7A2000 has the same=20
>=20
> Rob
>=20


