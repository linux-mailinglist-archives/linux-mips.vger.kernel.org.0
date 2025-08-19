Return-Path: <linux-mips+bounces-10374-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A8B2BCF6
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 11:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 688621895FFF
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 09:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5850731A060;
	Tue, 19 Aug 2025 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRaRBTnt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F5C31A05D;
	Tue, 19 Aug 2025 09:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594941; cv=none; b=e+Bq/Z8wqId6PoI9pxia0MxpwIMnmF79dVxIL2GHEKSKNznKezjGC1Jr7QVwCpKNJA8NN++8ioNbNIe4+Jv1JJS4u1KjRHmYNh/rP72GDF6vQkR5DF05vq1cIIb+IjgEAO4TnL+qb3mAA19kV334Fn6L38hg/qPhnsstA02S1/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594941; c=relaxed/simple;
	bh=TwoXi/9qfmrjexDxSolTWGtf8iw2WG+oeRmRoe1Ff60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8/w6EmzBmOTqVyoO695jtqGJIuLMEeNQi5jwH1yal3yVGILPvefg1wTSkj50yyxTb35myyReJhObgpeVFBhWZ1Q96h/zzHGorO4omRP8fYkxLo7yJ761DNa4A4T0iMdik8MkKQiM7geiBSWgJT2kPWyzjSX0M8wolFtQ3C94xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRaRBTnt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5EEC4CEF1;
	Tue, 19 Aug 2025 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755594940;
	bh=TwoXi/9qfmrjexDxSolTWGtf8iw2WG+oeRmRoe1Ff60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRaRBTntEGOj7TgTYiQfZGZ1z6h5Ra2kbklmNhS9RcuQ+oN82aPnw9E0KvVdaPTEE
	 g3xzUqcI1+Uz9DZr5X1Tk59QLCwmDXOJ2IdEbk0IRkkW9LiHIEUkln8Zy76Afwd2k8
	 7PbSvqXPAUIN2MfPGvcrpVgitv7pDGfzscLlbX/RTtrQCKatkXriOod5Jb63PE9If7
	 MtgXsZZvCNAS1xeYvQh26yr5PIru5ZQo0CG3dX8NOVS+lfFCy+menQ+47994BS7wFj
	 d2gIqJytRUXkZQVbEC24+olsg8y5JYiaViOMnsYytdsGKvcNctEiKokTMONhQCuJTE
	 OY+gqLw/aB15g==
Date: Tue, 19 Aug 2025 11:15:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de, john@phrozen.org, 
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mips: lantiq: Document Lantiq Xway
 GPTU
Message-ID: <20250819-imported-tested-wren-cbcaff@kuoka>
References: <20250816132002.3632343-1-olek2@wp.pl>
 <20250816132002.3632343-2-olek2@wp.pl>
 <20250818-departure-gloss-b99cacb9401e@spud>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250818-departure-gloss-b99cacb9401e@spud>

On Mon, Aug 18, 2025 at 06:38:24PM +0100, Conor Dooley wrote:
> On Sat, Aug 16, 2025 at 03:16:22PM +0200, Aleksander Jan Bajkowski wrote:
> > The Lantiq SoC has six built-in 16-bit general purpose timers (GPTU).
> > 
> > Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> > ---
> >  .../mips/lantiq/lantiq,gptu-xway.yaml         | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
> > new file mode 100644
> > index 000000000000..fcbcd98def46
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,gptu-xway.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lantiq Xway SoC series General Purpose Timer Unit (GPTU)
> > +
> > +maintainers:
> > +  - Aleksander Jan Bajkowski <olek2@wp.pl>
> > +
> > +description:
> > +  The Lantiq SoC has six built-in 16-bit general purpose timers. The voice
> > +  firmware needs these timers as a reference.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^gptu@[0-9a-f]+$"
> 
> This is a timer, why are you not using "timer" as the prefix?
> Otherwise, this looks okay to me other than...
> 
> > +
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - lantiq,ase-gptu
> > +          - lantiq,danube-gptu
> > +          - lantiq,xrx100-gptu
> > +          - lantiq,xrx200-gptu
> > +      - const: lantiq,gptu-xway
> 
> ..the fact that my OCD hates how the fallback inverts the position of
> gptu in the compatible!

Recommended naming is soc-subblock, so xway-gptu, but even more
recommended (and documented...) is to use only soc compatibles.

If xway is the soc, where is separate entry for that (maybe missing in
email context?).

Best regards,
Krzysztof


