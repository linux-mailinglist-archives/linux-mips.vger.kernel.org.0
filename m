Return-Path: <linux-mips+bounces-3577-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C5903A88
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4AEF1C21DC0
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B44717C7AA;
	Tue, 11 Jun 2024 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBuiQGnO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0017B4F1;
	Tue, 11 Jun 2024 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105836; cv=none; b=pg351mDv+tFRgxMrAo9qRP25Lws2FxmP9ze8W+Ymx3i7T2bdEUmDmBM53VLcIkbvSBbcwhMor8TEzR3sF6vqS7yw8F+6vvvqFXyMrkAqV1hv4ZgA+oGIZY2qkMj0S4HyW1avsrj48E30wGgK6daownQcvofS9ZSFcS4efe7fBak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105836; c=relaxed/simple;
	bh=FepTHKh4sGeAm/GXcpX4c1WyjmPJrBoituMivVedRxU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REfCjHfHwlMWYG1K0OYOgLykYd78j3qvLExYu2pE3TMD5bgU4KSVFkr6OWc5oWrNkhtWQM2bGzFQsf1PiGjtAIm+ICNZMlNts46CoI/Piwcy/2EFeeaT/UrnwDCwZQCkL93yyqbcQ5FoU6skzGZI6I/EInp8dFMgia8jQeOzrBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBuiQGnO; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so9052891fa.2;
        Tue, 11 Jun 2024 04:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105833; x=1718710633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lyMlg+Sg02crgNZFrVTdDwmie6O/X88kwR2hhITnEkk=;
        b=lBuiQGnODUaDNe44H0l+vnTeGkU/NxZRbuBsQNtG1SItl5OYKnJTPNQYbQeNTobl6Q
         kRcR4/mDseZFMZoAW4DvjVjicaevVyTbE7PSRZB19VXKPpkMe2Ng0LnSVqgCudvQzw2p
         6yyEqXC5n5iVe67vHJIbmMrKA433Dir5TIUvIkfFSw608b5iEXb31081kmIPH+oFz+61
         Yhnf6X3tLbcmTibWEnBDTRbwOaWGNeJvwAbx0sD8WiLseXw+VOhvoIfrX+ZNf99kcl/M
         PFEEEE6a9jUHoBkNS/Ojbxhwh3Njr39ZQtPNrX/D2W6Wrl5ERMbUhnn5E420B1R7NI81
         iOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105833; x=1718710633;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyMlg+Sg02crgNZFrVTdDwmie6O/X88kwR2hhITnEkk=;
        b=DdlPzif1Y2EjFj+y8rwPM3t2nE6Ma2nAN6/QNsP9LMJ8c49GoS/kwNlsPmR0puFxsu
         2ooWMQnGl1LTUHuMtb+l/DSABqiaGbbrTuidjqlCjXQhD1FLRYI3GJUd+Q+Z5JGui9wj
         yNCQpIAEDZz/hinBX6CmmZ0jwOPi8ioUO1up1hbaY0h8pTEM3h9PeoMuEW3U+UuV1gNA
         s+aWzeOh8fH49uyzEGdzTUPlivKphfbljHp2ueJ8ltfBHZP88K4ELQioDpyn21ocAbSS
         pz5S2gLXeZgw4hOH7Zyx6nD19UUNavPbeyxJoRHvGylljL1v/lBYoPGkjZGbBD3QTrmw
         aD2w==
X-Forwarded-Encrypted: i=1; AJvYcCXn3bxd/MUR/04ZC2nIqC1aUjiwQX8F5FVsAZ5lkiKuuv5VeB1bZ0ZQ6YHUaIYR+GEvw5VByZ83QVXMTvC6sZWKXGTTmXh32NdAe9iUh9udTuE/TZdaMbv02SPIHvA0pg15QJtn5cQTZppiCQQnsNAS2NKivwB0TKXvRJmduCZnhBcz1Ds=
X-Gm-Message-State: AOJu0YyUs+M9aso12zBF53j87RGvsfQcqZcyZmWW+DpEhdl3EMEMylr8
	v8SXGkQmwwT1aCZDBK5KIGDoztk3KfdhBXyB64SCv6FPD/EtLEvf
X-Google-Smtp-Source: AGHT+IEAE5u/p4dZpDmKbSme6maU/X4vXb80n7i3PLymk8XQ84h6eACZWmKrNzkWjluS/14n/KfuJQ==
X-Received: by 2002:a2e:97cd:0:b0:2eb:e6ff:7ddf with SMTP id 38308e7fff4ca-2ebe6fff32bmr34010971fa.25.1718105832575;
        Tue, 11 Jun 2024 04:37:12 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421aace8288sm74410295e9.47.2024.06.11.04.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:37:11 -0700 (PDT)
Message-ID: <666836e7.050a0220.16ed5.dd36@mx.google.com>
X-Google-Original-Message-ID: <Zmg25smfthmZhBAl@Ansuel-XPS.>
Date: Tue, 11 Jun 2024 13:37:10 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] mips: bmips: rework and cache CBR addr handling
References: <20240511130349.23409-1-ansuelsmth@gmail.com>
 <20240511130349.23409-2-ansuelsmth@gmail.com>
 <ZmgOYI8Mj86PIart@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmgOYI8Mj86PIart@alpha.franken.de>

On Tue, Jun 11, 2024 at 10:44:16AM +0200, Thomas Bogendoerfer wrote:
> On Sat, May 11, 2024 at 03:03:45PM +0200, Christian Marangi wrote:
> > diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> > index 66a8ba19c287..dba789ec75b3 100644
> > --- a/arch/mips/bmips/setup.c
> > +++ b/arch/mips/bmips/setup.c
> > @@ -111,7 +111,7 @@ static void bcm6358_quirks(void)
> >  	 * because the bootloader is not initializing it properly.
> >  	 */
> >  	bmips_rac_flush_disable = !!(read_c0_brcm_cmt_local() & (1 << 31)) ||
> > -				  !!BMIPS_GET_CBR();
> > +				  !!bmips_cbr_addr;
> 
> this hunk doesn't apply to mips-next, please respin.
>

Thanks for pointing this out. Indded a patch was missing and got lost in
sending last revision. I just pushed v6 (and then right after v7 as I
was missing some tag for the DT patch that I forgot to add) that should
add the already reviwed patch.

-- 
	Ansuel

