Return-Path: <linux-mips+bounces-4153-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 164ED9283D0
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 10:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD40228935D
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 08:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F8A142E83;
	Fri,  5 Jul 2024 08:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIBpxhWh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFEC14533A;
	Fri,  5 Jul 2024 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720168820; cv=none; b=liCsse/CEJ+wPfTB9tMXgZkAUPgmUlCBzMasa6qvbyS2SMVwBlbGNn3s9QMYKzdLjY4qx/YRr2HOroQZf87K2rHgY0678KS3aB/kUU8qGxX32RLZD+DGSmoxyr/RPsAw7U4A1FvlNifl2COSqvaMtluWkos0+l34I9KPmQu7iQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720168820; c=relaxed/simple;
	bh=eMsEYj6fFpHAbyqjKGlZWXoWK4QVHj2b/OtoKnzWlyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjarvYLU5pAwKFfE9ho9OqUNff2i/8gKgJzM5lqb2pMoa33qM+CJHAqjJnXNm2g1tbzCN+sbpCR3J7M2bHGBF3EIfbg7S8miueKvK5aKb/spNS7M6g6ouyfGUMNN0elKLq/S4kRpAvOJMuJdcvz3XP/oEFxp571pJ3VulkSdgQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIBpxhWh; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so16975881fa.0;
        Fri, 05 Jul 2024 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720168816; x=1720773616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Yr9I47olGFZZxZqW9dMF0gF4wA5rppH8tFBbgiG4jU=;
        b=FIBpxhWh59h5zliwZSyOSpprZcA43x0+w394aRd6TB3MsEfVXzSrkhRGM+MslEyPkR
         JJAIS6dLgaZiBmitPhKgqaludMZl45/yZ8LhRXXLRsfpPJ3EuK7Shol4xnIDmYCAWIPt
         nTIKsMcqpBAaO57UqCwSAnI0aUwFpYyo4J02pijolzpt66P8gIkDgDq0vT96dSAcFNR3
         LnYVBJHrokxA1UC05vlOdkvJU36L/VaLvLb/WB/yMUZs5dtjraVaql3rLGNtFT1FqImk
         fuLFQu9jEzqP1GrEpUeFm/W34qZM7fNmfEfmwFh2XN7XL7iA21oswValnzXPkRGPTsIb
         HIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720168816; x=1720773616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Yr9I47olGFZZxZqW9dMF0gF4wA5rppH8tFBbgiG4jU=;
        b=TWVcGEhm27fAzzddc+KpRCvOXwsLy2dWBn723GfrHk9JUqhjdt9A9Wu+29LIjlLdmJ
         oueoOXmIeuH03MLGX56JxLOfBWxT8Z03iUQkwRYVLHxgRnMNegvd/E0V/Cj1i4wewJbj
         1OUNZHvFoe/oNX5jOQKyCopi8uBhjfmyW68LEFos5JEW30FWbi2drDZ+QDXpag4dQLFm
         VnxWhl+Xni7yfPbfwrgNXs8IslHmMRRRma1UdD32NDq/yBleOGpcruSr38kTdYLrFiXj
         eum8D7B4toZOgqss7joZwflZ1/W735oySFLtFI3vX+pfEglkHP15FVXTcTDL8bHCr5Cr
         4TIg==
X-Forwarded-Encrypted: i=1; AJvYcCWmphSA6VJeBvrWzCKE68vc/w3GrX1HcMnd5B4eL6YdnrsfE2vIqgKjM+ScOLuFvCs4mfDdbw6RlFag2lkVFBSejq2/yLBSmUYNfPk7bKla8FNXEtY6VwhmfAVh3GHaPaMiq3tLsvrsAA==
X-Gm-Message-State: AOJu0YzLwy3J4s5uBUPr/drPb6nvp94aR2iCRREhZMX4a/yrgcAij9KV
	i1bjJz5Vj1L8gzSflngmvFY7B5jDMV0lxzjMwQIHqhXBUJ9/D65K
X-Google-Smtp-Source: AGHT+IG2Z7eYtEBqjsbBDQ4g/IcwNOhL7Kn/UN9vwVIed9SEKjumd7abyxzzz+2+iE74xH0+cNDkvA==
X-Received: by 2002:ac2:4c0d:0:b0:52e:9cc7:4461 with SMTP id 2adb3069b0e04-52ea061af1amr2368977e87.5.1720168816279;
        Fri, 05 Jul 2024 01:40:16 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0bddcsm2721023e87.52.2024.07.05.01.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:40:15 -0700 (PDT)
Date: Fri, 5 Jul 2024 11:40:13 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] MIPS: smp: Make IPI interrupts scalable
Message-ID: <kzcncrqchl42itomsncvgjem6iddwhslw3djcgkyzxl6xtfi76@wsuswv3vty2x>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-1-e332687f1692@flygoat.com>
 <ZoVokcDYqZnuqd2X@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoVokcDYqZnuqd2X@alpha.franken.de>

Hi folks,

On Wed, Jul 03, 2024 at 05:04:49PM +0200, Thomas Bogendoerfer wrote:
> On Sun, Jun 16, 2024 at 10:03:05PM +0100, Jiaxun Yang wrote:
> > Define enum ipi_message_type as other architectures did to
> > allow easy extension to number of IPI interrupts, fiddle
> > around platform IPI code to adopt to the new infra, add
> > extensive BUILD_BUG_ON on IPI numbers to ensure future
> > extensions won't break existing platforms.
> > 
> > IPI related stuff are pulled to asm/ipi.h to avoid include
> > linux/interrupt.h in asm/smp.h.
> > 
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  arch/mips/cavium-octeon/smp.c   | 109 ++++++++++++-----------------------
> >  arch/mips/include/asm/ipi.h     |  34 +++++++++++
> >  arch/mips/include/asm/smp-ops.h |   8 +--
> >  arch/mips/include/asm/smp.h     |  42 ++++++--------
> >  arch/mips/kernel/smp-bmips.c    |  43 +++++++-------
> >  arch/mips/kernel/smp-cps.c      |   1 +
> >  arch/mips/kernel/smp.c          | 124 ++++++++++++++++++++--------------------
> >  arch/mips/loongson64/smp.c      |  51 +++++++++--------
> >  arch/mips/mm/c-octeon.c         |   2 +-
> >  arch/mips/sgi-ip27/ip27-smp.c   |  15 +++--
> >  arch/mips/sgi-ip30/ip30-smp.c   |  15 +++--
> >  arch/mips/sibyte/bcm1480/smp.c  |  19 +++---
> >  arch/mips/sibyte/sb1250/smp.c   |  13 +++--
> >  13 files changed, 236 insertions(+), 240 deletions(-)
> 
> you are touching a lot of platforms, how many did you test ?

In a one or two days I'll be able to test the series on the SoC with
2x MIPS P5600 Warrior.

-Serge(y)

> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

