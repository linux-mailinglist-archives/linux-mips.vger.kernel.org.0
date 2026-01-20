Return-Path: <linux-mips+bounces-12973-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F630D3C0F3
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jan 2026 08:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BD3E2428267
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jan 2026 07:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A25838BF67;
	Tue, 20 Jan 2026 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Tciaar/5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45D7328B69;
	Tue, 20 Jan 2026 07:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768895460; cv=none; b=KX72g/arpohCWh40+v1Dop7LPKe02KI3/B4zeBLoGLH4E/j19ME4fwoKLqQea6f5vfzuHC/1TYH8HDzHI1Lv1Fgqho/j9taW1O4yUsza5lRy4e0NnMr61Ndxz1AIiEtVXh3NpJnZmIRXYN8zG7XVUIbXlyjl/BEdPTFu3stkiVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768895460; c=relaxed/simple;
	bh=M1oDIo7kMH+o2Bqa9bB6To5fUKBi9MLVBJ4XO90c+kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gv5sYjYnHPig/EKvTrQX+s4nSs1fu2guGttlbPkF4qqNqHuTqIicX6+adEP34a2yG4+hUk3bbk2YBsegY7Na31MeW8AY5fNJHnwhdL5qZX8/6r37WSvw/JvTohT0affvzOMuX3mF/KLnM+ZZWq5DpBX+oEFm7RZj1pK+DRbTCXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Tciaar/5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6021E1A2950;
	Tue, 20 Jan 2026 07:50:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 336F7606AB;
	Tue, 20 Jan 2026 07:50:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86DD110B6B17A;
	Tue, 20 Jan 2026 08:50:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768895453; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=OHovWdP9MJB1pmMzSrhYB5kXWJ2e1UMYi67ZL2LH0f8=;
	b=Tciaar/5gnRd+t4yAPib0BmQ5S2MX6p/FQAwuIfRfOK3f2yY9gZSgOEoIQz1DcFik9EADG
	lJvHfNSfknjGj/AKViafPG3BlMNQ3HaSOoSjJ1vJIWkC6WbxREQPfakZ86Wo5FR20TVPF2
	gFynBtidjQqvMUoD+YMF7/EHZEmnq6b2pWzWRNVdj04K/FIXPc1KfgxVDU1Vw+TeFBnlCs
	RlnT4F27PWcuvsyWO6KdNmoSaIYoTESKkZbrnrhbkEKlDxCTkYaL4Z8xoaCxDuGbREPBhm
	fP14sCTDUNxml/aVVGDj8ULEH7n/nKnKpvaQiee7fIEhKlUq5dR9wgljvLGFVQ==
Date: Tue, 20 Jan 2026 08:50:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: loongson: Correct Loongson-1C
 interrupts property
Message-ID: <20260120075045e7e864ba@mail.local>
References: <cover.1768616276.git.zhoubinbin@loongson.cn>
 <b6295c907410f6708115cba4df0959ee6629f8a5.1768616276.git.zhoubinbin@loongson.cn>
 <20260119-tricking-premiere-ada70700f804@spud>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-tricking-premiere-ada70700f804@spud>
X-Last-TLS-Session-Version: TLSv1.3

On 19/01/2026 18:24:36+0000, Conor Dooley wrote:
> On Sat, Jan 17, 2026 at 10:26:48AM +0800, Binbin Zhou wrote:
> > The `interrupts` property indicates an RTC alarm interrupt, which is
> > required for RTCs that support the alarm feature, which is not supported
> > by the Loongson-1C RTC. We exclude it for a more accurate description.
> > 
> > Changing the `allowed` property is ABI-breaking behavior, but
> > throughout the existing Loongson DTS{i}, the description of the RTC
> > nodes conforms to the modified bingding rules.
> 
> Right, changing properties is an ABI break, but when following the ABI
> would've produced something non-functional, breaking it is not really
> relevant.


But the HW has the interrupt, the fact that is not functional doesn't
mean it isn't there. I thought we should describe the hardware?

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
> 
> > 
> > Thus, the existing Loongson DTS{i} will not be affected.
> > 
> > Fixes: 487ef32caebe ("dt-bindings: rtc: Split loongson,ls2x-rtc into SoC-based compatibles")
> > Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../devicetree/bindings/rtc/loongson,rtc.yaml         | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > index f89c1f660aee..fac90a18153e 100644
> > --- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > @@ -42,6 +42,17 @@ required:
> >  
> >  unevaluatedProperties: false
> >  
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - loongson,ls1c-rtc
> > +
> > +then:
> > +  properties:
> > +    interrupts: false
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/interrupt-controller/irq.h>
> > -- 
> > 2.47.3
> > 



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

