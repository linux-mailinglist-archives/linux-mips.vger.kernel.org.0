Return-Path: <linux-mips+bounces-3086-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8150E8BC1B4
	for <lists+linux-mips@lfdr.de>; Sun,  5 May 2024 18:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A05428181F
	for <lists+linux-mips@lfdr.de>; Sun,  5 May 2024 16:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A527F374FE;
	Sun,  5 May 2024 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvF+81tI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A3629413;
	Sun,  5 May 2024 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714925112; cv=none; b=Gog30UAU5xL+NXzeRaT91k77ct+BIykgi0vs/wktCwzRR0bVd+1jz5FYw5eLAZPo7RDS6zq286L35oI2b8ZXH2+x5ZIEim1mxEfo15HIPhuz8QrvA+W3yYxthlyfqA0lhNP09jhd3h91WVNurcAgzPkCUjI8qItBcVRXgToAxcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714925112; c=relaxed/simple;
	bh=IjayBAJPbDerILH5aOgSqtqbYYyN4iTYWVaVyL0Teaw=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8yot2E9JIzoB1SlfsgA4M4rdFZ0Y65r7g8h4K53H+VQM6OS1nSwpl4u7bnJynBzqs3GUHaCY+Kp4F76AL2HDcatZqmQWfbFaaE+hjkm1qRCVT/JU0GUBOV/l3zQmpZyxW7SEfriEGZWLcQH7nfCGwdGebINmz4hEsQCNtIOctE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvF+81tI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41b79451145so8605875e9.3;
        Sun, 05 May 2024 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714925109; x=1715529909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EPKvOC0kv57T+hZCAMC/aTMq0cAEumBEh1pmaz4DRJc=;
        b=JvF+81tIGKkjp2KNPKPAqsgVdmaqtJ2wT9tPkwt/fnrrsaqBgULeJr4auoFb4p7b68
         racl4Jed25pu3MGj25CKauQ8X8muxAhXUva150P0300fm5gAhlsdugjqdk63+RUx+0Td
         +N63+EMn5mh6gwetWKYWKcQOQrBYvQXeC7uMWd3xgY6KB9qOJjsOe7Nsmb8R0709tFi9
         eRRy78VlL4qBLgm50D5hLqEuC5zzTyJIpViUnNo0vsdVJSg9Fw8EbitQkB+UiJx0FC0e
         MKPysz+3vuwAbeADBWqu0ASMWzotCArLVWUZqSptpD0oP5dwFPqyD2BKdThQMvNmLpTY
         bDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714925109; x=1715529909;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPKvOC0kv57T+hZCAMC/aTMq0cAEumBEh1pmaz4DRJc=;
        b=Jx6CW/20KuFWNM3i/Wl9s+IcL90pOEB7ge3aS4s38bzVlXpQJPiz0TCqNA3zENyRjD
         xfHq/wc5f7ScmhfJvGPoKOFOV/mjfftiAf2UDDBp2A8snSC1TZzldIdOGEhm+XPx1IRH
         vOjjGa2K3hy+ogwC5GMxcyJ/+zcaQTwVqo33+QWmPQP3pPw980/RBHnfpB3Oz5qaMwIS
         speK6syQxlss8QFPeQ/Qj1PM2OoB3hG+/vOZtoPnhHINJs0+/LGQy0qNXXZ1+EiJze0X
         6x+o8KgniZ8tpdB5PlQBapE1UxrvI0IsDln2s7dCxCR1BSB5S1QdScDqv4AE80hXpyuA
         VUzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcV+RPYG1bX/KzLgXBEM/hR0g8VVn0NL911QBeGkNkd/Y3Q7ClpRH+rJMV7V20/1GEWCreToRjNTvg/M8RZBL7xZgJMeLvibGAc2JtKKrTQ6jCblI8VDz18DQ59f8LaDXLKeMebMFrDgB2L8qKWLDKEiRVx2582zkaQep29K/+h6Ne5JE=
X-Gm-Message-State: AOJu0Yzc+SWWucvMUt4KnOM9VcTawbOqFYwEoDGTrFS6pgi+BvM40WqR
	WbV4BaClfThrFx3vjQTbZ4z8Nioks0kOecJk5x6MYhRZiF+COFQ6
X-Google-Smtp-Source: AGHT+IENo1CtEqRzVAmPZUVKx9nwiCJBYYww7/4t37T4vijPmdtR/tSw+WnXpMrEZtFD3qgB6YMD9Q==
X-Received: by 2002:a05:600c:4ece:b0:41a:5d49:6143 with SMTP id g14-20020a05600c4ece00b0041a5d496143mr5948246wmq.12.1714925108913;
        Sun, 05 May 2024 09:05:08 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b0041bb11ff5a7sm16728012wmq.8.2024.05.05.09.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 09:05:08 -0700 (PDT)
Message-ID: <6637ae34.050a0220.36c0b.6b25@mx.google.com>
X-Google-Original-Message-ID: <ZjeuMq-4JPxpoiJi@Ansuel-XPS.>
Date: Sun, 5 May 2024 18:05:06 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: mips: brcm: Document mips-cbr-reg
 property
References: <20240503135455.966-1-ansuelsmth@gmail.com>
 <20240503135455.966-4-ansuelsmth@gmail.com>
 <20240503-oncoming-taste-bab71375b67c@spud>
 <66353c11.5d0a0220.bb93c.fb57@mx.google.com>
 <20240503-dreamboat-satin-4e51e27643b1@spud>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503-dreamboat-satin-4e51e27643b1@spud>

On Fri, May 03, 2024 at 11:14:10PM +0100, Conor Dooley wrote:
> On Fri, May 03, 2024 at 09:33:35PM +0200, Christian Marangi wrote:
> > On Fri, May 03, 2024 at 05:21:41PM +0100, Conor Dooley wrote:
> > > On Fri, May 03, 2024 at 03:54:03PM +0200, Christian Marangi wrote:
> > > > Document mips-cbr-reg and mips-broken-cbr-reg property.
> > > > 
> > > > Some SoC suffer from a BUG where read_c0_brcm_cbr() might return 0
> > > > if called from TP1. The CBR address is always the same on the SoC
> > > > hence it can be provided in DT to handle broken case where bootloader
> > > > doesn't init it or SMP where read_c0_brcm_cbr() returns 0 from TP1.
> > > > 
> > > > Usage of this property is to give an address also in these broken
> > > > configuration/bootloader.
> > > > 
> > > > If the SoC/Bootloader ALWAYS provide a broken CBR address the property
> > > > "mips-broken-cbr-reg" can be used to ignore any value already set in the
> > > > registers for CBR address.
> > > > 
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > ---
> > > >  .../devicetree/bindings/mips/brcm/soc.yaml    | 32 +++++++++++++++++++
> > > >  1 file changed, 32 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> > > > index 975945ca2888..12d394b7e011 100644
> > > > --- a/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> > > > +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> > > > @@ -55,6 +55,21 @@ properties:
> > > >           under the "cpus" node.
> > > >          $ref: /schemas/types.yaml#/definitions/uint32
> > > >  
> > > > +      mips-broken-cbr-reg:
> > > > +        description: Declare that the Bootloader init a broken
> > > > +          CBR address in the registers and the one provided from
> > > > +          DT should always be used.
> > > 
> > > Why is this property even needed, is it not sufficient to just add the
> > > mips-cbr-reg property to the DT for SoCs that need it and use the
> > > property when present?
> > >
> > 
> > I described this in the cover letter.
> 
> It needs to be described in /this patch/. Cover letters usually don't
> end up in the commit history and I din't read them while looking for the
> justification for a change :)
> 
> > CBR might be set by the Bootloader
> > and might be not 0. In that case the value is ignored as an extra
> > precaution and the broken propetry is needed.
> 
> I dunno, if the bootloader is bad, you need to set a property anyway,
> so why not set mips-cbr-reg?
>

Florian any help here? Should I drop the additional property and set the
value directly?

One usecase we would use would be to set the CBR addr in the .dtsi and
maybe for the specific broken device use the additional property in the
.dts.

> > > > +        type: boolean
> > > > +
> > > > +      mips-cbr-reg:
> > > 
> > > Missing a vendor prefix.
> > > 
> > 
> > I will change this to bmips,cbr-reg hope it's O.K.
> > 
> > > > +        description: Reference address of the CBR.
> > > > +          Some SoC suffer from a BUG where read_c0_brcm_cbr() might
> > > > +          return 0 if called from TP1. The CBR address is always the
> > > > +          same on the SoC hence it can be provided in DT to handle
> > > > +          broken case where bootloader doesn't init it or SMP where
> > > 
> > > s/init/initialise/ please :)
> > > 
> > 
> > Sure!
> > 
> > > Thanks,
> > > Conor.
> > > 
> > > > +          read_c0_brcm_cbr() returns 0 from TP1.
> > > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > > +
> > > >      patternProperties:
> > > >        "^cpu@[0-9]$":
> > > >          type: object
> > > > @@ -64,6 +79,23 @@ properties:
> > > >      required:
> > > >        - mips-hpt-frequency
> > > >  
> > > > +dependencies:
> > > > +  mips-broken-cbr-reg: [ mips-cbr-reg ]
> > > > +
> > > > +if:
> > > > +  properties:
> > > > +    compatible:
> > > > +      contains:
> > > > +        anyOf:
> > > > +          - const: brcm,bcm6358
> > > > +          - const: brcm,bcm6368
> > > > +
> > > > +then:
> > > > +  properties:
> > > > +    cpus:
> > > > +      required:
> > > > +        - mips-cbr-reg
> > > > +
> > > >  additionalProperties: true
> > > >  
> > > >  examples:
> > > > -- 
> > > > 2.43.0
> > > > 
> > 
> > 
> > 
> > -- 
> > 	Ansuel



-- 
	Ansuel

