Return-Path: <linux-mips+bounces-3184-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E7C8C02EB
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 19:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 448311C21350
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 17:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DF12E3E8;
	Wed,  8 May 2024 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFyt6pt5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8A1481C7;
	Wed,  8 May 2024 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188676; cv=none; b=XQvHJ5TWrRmTkyfWHsxxm7yf6/xHbw5VHUDSCCeHmZuLc7Vt6wdO4zM4dlMMdnbZOGYGmEmpjAwmffPV7RjkFSVcA7rG4p2XUlitDRsrpFyd9renzjns0otBekB2y/Wvtcmt3CUdsj04rlhXMb9LRXNyCGziJ8KQ0A9JbW2VXzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188676; c=relaxed/simple;
	bh=dQ1PujkEMVyDR+EYy/vGg4r/EPmkcT2tXaQHweR28kQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnXmZsJz71i6GJcdzoZtc2JWunGKUfQQ30iWH1lYRQI+IUH3KLi/XaSCcmCWFZFTUGyjZWhXRXtU6sFzeq8w3rQrYgRJ4YnJLY5VFJzvJBsSY6IRqbJLjf/RSUSn00QQBhrUkyX37FeadmlZQHH/1DRBl9X27pqOD2U2UxtVfRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFyt6pt5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41ba1ba55ebso33412675e9.1;
        Wed, 08 May 2024 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715188673; x=1715793473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i51eNBLEnKmpTBUq1c2fUkBOT8KxBV14AE2eIYTyHdI=;
        b=RFyt6pt5T0AG3BCKg/OrkbgXsdYWQRPXA2Gzi6/hDYLXIn7sCAxiITnhgptyaD/Dun
         bLns8aU4VUF9M9xTm74Nn9w1ateIXSYkegxO5KubDSdujAE4NUXYDmQiF2vZ3LYM7q8Q
         u1M416sXrDgWjR1GjWnB3FIdLM8tI4AQ0mPagCZIwnZzuXaUAuJFIa5EkyWO5LNF2eou
         I7tOXJnP3mFLe1Neq0s+Ftwu1/kz0y84GkTPWv+B2XE8iPAbOyCOyzFM32OZC8Lsd1K4
         VausQgYJe4l80w3iskwUZFO1H1JUmO3hAPf3TWbB23wynG6CB8f0ZD9dzXeCF1CwQy2u
         vxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715188673; x=1715793473;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i51eNBLEnKmpTBUq1c2fUkBOT8KxBV14AE2eIYTyHdI=;
        b=fOkdwuYfQqyAV7caE0h2TdbbIwNOD1mhBmppxLMV+sEIib5i/xDpt3Afg/oK/ho7GN
         82rNG63kk9ri/od2q3HIA/DAV0AA4ng714YaRHwaOEkNe7ogHUmpml0tf7eZAd7+qhub
         +c2XK69ICtq/ooBL1OitRXSBmS9UPtKBotXiF81f5sun2vB6og0nTmbZJwZAvlwh4Kku
         oCyLLyRytqDfozERPRtUxqxMSDn9wR4NieIWSiyQkA2EAZ0Fd2FV6bO1yefaZMe+q7aT
         ibtQtu4Al1dVCrsBqxAQZC5A/dwnJNUGeCk20zJW+RXV524gIturJEYQUHybTIDGOki/
         BtrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY202wa3gFLLpBOfExS8J7rx8I6te7imJAPO5zeb/Q4ORsXAzljOz0lcpMtDiE9qmSf1gI/gRfDtC74N1eG6BBXiN299vxk/+7nuQJhz9alVA6j/OwZ5jDywqBzrHPRJZX4nstJxok49jAauyuIzjLl9MC4uBXorpOoSE4zzoE3yKwD00=
X-Gm-Message-State: AOJu0YyYmIvdToVOY885v1zc3+GGbxPwL8dF3B2gBhLJUchxlfSCSplA
	ftTj5+BCm0UQs6G8kDiULF+jG4ubF7rIdRgTxguCQ2V8sQd1P0Hf
X-Google-Smtp-Source: AGHT+IEe8dNMvP50T4YHLKplQEXCwHlmUs+OHuBCNAb6L+D8L9+dbcPqOujgIL8oXEafwQcIWEuGVw==
X-Received: by 2002:a05:600c:46cb:b0:41b:9828:f4c2 with SMTP id 5b1f17b1804b1-41f71cc25b5mr28271025e9.3.1715188672447;
        Wed, 08 May 2024 10:17:52 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id je1-20020a05600c1f8100b00418a9961c47sm2946660wmb.47.2024.05.08.10.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:17:51 -0700 (PDT)
Message-ID: <663bb3bf.050a0220.38dcc.9b82@mx.google.com>
X-Google-Original-Message-ID: <Zjuzvc8d2AfMOdF2@Ansuel-XPS.>
Date: Wed, 8 May 2024 19:17:49 +0200
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
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: mips: brcm: Document
 brcm,bmips-cbr-reg property
References: <20240508170721.3023-1-ansuelsmth@gmail.com>
 <20240508170721.3023-3-ansuelsmth@gmail.com>
 <20240508-prong-serving-660e6046621d@spud>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508-prong-serving-660e6046621d@spud>

On Wed, May 08, 2024 at 06:14:34PM +0100, Conor Dooley wrote:
> On Wed, May 08, 2024 at 07:07:18PM +0200, Christian Marangi wrote:
> > Document brcm,bmips-cbr-reg property.
> > 
> > Some SoC suffer from a BUG where read_c0_brcm_cbr() might return 0
> > if called from TP1. The CBR address is always the same on the SoC
> > hence it can be provided in DT to handle broken case where bootloader
> > doesn't init it or SMP where read_c0_brcm_cbr() returns 0 from TP1.
> > 
> > Usage of this property is to give an address also in these broken
> > configuration/bootloader.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../devicetree/bindings/mips/brcm/soc.yaml    | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> > index 975945ca2888..77f73ab48c11 100644
> > --- a/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> > +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> > @@ -55,6 +55,15 @@ properties:
> >           under the "cpus" node.
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >  
> > +      brcm,bmips-cbr-reg:
> > +        description: Reference address of the CBR.
> 
> Pretty sure that Rob commented last time that there's no definition
> anywhere here of CBR, but I don't see either a response to him or an
> explanation in v3 as to what CBR means.
>

Sorry I missed it.

> > +          Some SoC suffer from a BUG where read_c0_brcm_cbr() might
> > +          return 0 if called from TP1. The CBR address is always the
> > +          same on the SoC hence it can be provided in DT to handle
> > +          broken case where bootloader doesn't initialise it or SMP
> > +          where read_c0_brcm_cbr() returns 0 from TP1.
> 
> Why is a ?linux? function name in the binding? Surely this is just
> "or in SMP systems where reading CBR returns 0 from...", no? Ditto
> above.
>

It's really just a reference to reading c0 register at an offset, that
is why I was so specific. Ok I will be more verbose.

> 
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> >      patternProperties:
> >        "^cpu@[0-9]$":
> >          type: object
> > @@ -64,6 +73,20 @@ properties:
> >      required:
> >        - mips-hpt-frequency
> >  
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - brcm,bcm6358
> > +          - brcm,bcm6368
> > +
> > +then:
> > +  properties:
> > +    cpus:
> > +      required:
> > +        - brcm,bmips-cbr-reg
> > +
> >  additionalProperties: true
> >  
> >  examples:
> > -- 
> > 2.43.0
> > 



-- 
	Ansuel

