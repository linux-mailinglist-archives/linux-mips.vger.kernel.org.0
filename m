Return-Path: <linux-mips+bounces-3578-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DF5903A8B
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98AC5B23A13
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01C317B4E2;
	Tue, 11 Jun 2024 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5PaQpDy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315CC176FB7;
	Tue, 11 Jun 2024 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105870; cv=none; b=kEEofetWhQZAx2cqDrdzx4r7bLhYk0RmVtdND2SEhtCRdSDROJBhcxW+6waB78GQ/vaQllIKuvOIuto+TNKNJWp6qkChFpBnC3iXeCkSil0z+n1d6aYmwHma7ELp4d9GjRFr2Gh3r72n3lo1K/w7MfqnKJOIUmYpuoG3ejVoc+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105870; c=relaxed/simple;
	bh=LRqiJygFXwFdgnMHnMYbPnGJMx7dxKY7Rq9+IwL5GQ8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4vBHPXrV5GvW7Yb+pxjEARTYYkilk/z6XNjeitWXroWjwTVrg4nwtVm6xddruTabrifm77oosRjtRUvHuIneAQGcXINBUDhH6lYHfhnlpbI2c1qfCZfYmzrT8XUkQ+Ug6F4b4HHGm1d81ajIMZDOhJaDYBgH2mbBDmoCZQM0+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5PaQpDy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4217990f8baso29045065e9.2;
        Tue, 11 Jun 2024 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105868; x=1718710668; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HaD75ZmmaDNSb2smaeP0NbZYw8FhKXtqbvgVsLndZ8Y=;
        b=a5PaQpDya7nnPMe2pKLfNjA78mqq9xX/WfDlhTJb4dwcQJzX5ToG2ntk28ra9w36eH
         bFepgocPUGFGKT5G13oz0XPTftGgfh/bRWMQnFKyE9h5V+xhRODKP840AiT/jxuLGmHB
         YNpAjarbNFVvXylU5hytB3jLtKDWdqoFH8Bzj++KsKmJ8F09a6yGDq/ZgDI0a8dq86g0
         RDGeeoM9q9a2TUypPDufRlTR1xsA7ns0PBfWQbp9ba7NlqIE1Q9oBwJ84oJNNYhPwmKS
         JTaMzvtOhiTD5JK88j9iZUYyki5KO5fZbaLPqP9W9v0K1JSGGcaxVNSNq75WFWkQLJnF
         el8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105868; x=1718710668;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaD75ZmmaDNSb2smaeP0NbZYw8FhKXtqbvgVsLndZ8Y=;
        b=v8BlfRnNxOLKQIsWJR99mly1w3kASMh+Ca3+G34P0s0YS1D6LdPLt4ekKsF4zNq8Ht
         tiWJ23b4tTUG4wdN8rhZ6bASDY3YVenOrBQFbJMSZva1Ox9XN0y+vPixJjRy/wcI4a9o
         eNSqGCHp3Lmy9BbBJztJfz1Lf9cEEBbQkRwGipvDxw7Xw3bBGHM2osYbuVSuvNkFwVOa
         Qnn57RuysIVb0hdcknCtOytKOeahpWFpUqJpow3XucHYsx3qMJK0ciTYPnFHHzGW4gET
         hooMcLbPDJmsAAE6Z6o1hsc0jf3JKU66aPdf9PQwQc6+K+R19QEbMg1KJMGp30TxT6A5
         jrIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3vFETiH6lVN0XPpks940nxvQa/zbKtgf+UqKZUzv0bHI0hQLs+43qn738YaIbol+n3rN5IpUNiTSh0xv9xRi8jSWQPUMCui07DZHIbp4i9c3/L5zJ+PjqOLRfkfN5Bq70sFcHLW9PmSA4WM5VOCFrqXW8d6h3It59ApySze9MX3SHl9o=
X-Gm-Message-State: AOJu0YyjbSs/CEgiKfqfVqF3lwFziA6fjvRk3FEWZC8xQU20/mCLvvSj
	RI1KRjMawxc1DuMumnjvMciK0xOYEleIJjBRVBN0buu/2zEEbTqo
X-Google-Smtp-Source: AGHT+IFM0gLT73nfugxN7tYKb2QdTeAdpM+o5hUErNm4nhVqnARtaaA5aL1O2PLZRNCPWk4R3Nsvhg==
X-Received: by 2002:a5d:59a5:0:b0:35f:2947:e30a with SMTP id ffacd0b85a97d-35f2947e34bmr3464511f8f.46.1718105867497;
        Tue, 11 Jun 2024 04:37:47 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f22607f38sm5977210f8f.13.2024.06.11.04.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:37:47 -0700 (PDT)
Message-ID: <6668370b.df0a0220.d88a7.7744@mx.google.com>
X-Google-Original-Message-ID: <Zmg3Crz7o-dR533T@Ansuel-XPS.>
Date: Tue, 11 Jun 2024 13:37:46 +0200
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
	linux-kernel@vger.kernel.org,
	Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v5 4/4] mips: bmips: enable RAC on BMIPS4350
References: <20240511130349.23409-1-ansuelsmth@gmail.com>
 <20240511130349.23409-5-ansuelsmth@gmail.com>
 <ZmgPFLSCxjed2EGZ@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmgPFLSCxjed2EGZ@alpha.franken.de>

On Tue, Jun 11, 2024 at 10:47:16AM +0200, Thomas Bogendoerfer wrote:
> On Sat, May 11, 2024 at 03:03:48PM +0200, Christian Marangi wrote:
> > From: Daniel González Cabanelas <dgcbueu@gmail.com>
> > 
> > The data RAC is left disabled by the bootloader in some SoCs, at least in
> > the core it boots from.
> > Enabling this feature increases the performance up to +30% depending on the
> > task.
> > 
> > Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>
> > Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> > [ rework code and reduce code duplication ]
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > ---
> >  arch/mips/kernel/smp-bmips.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
> > index 20e2fb10022d..52324738cbb3 100644
> > --- a/arch/mips/kernel/smp-bmips.c
> > +++ b/arch/mips/kernel/smp-bmips.c
> > @@ -626,6 +626,23 @@ void bmips_cpu_setup(void)
> >  		__raw_readl(cbr + BMIPS_RAC_ADDRESS_RANGE);
> >  		break;
> >  
> > +	case CPU_BMIPS4350:
> > +		u32 rac_addr = BMIPS_RAC_CONFIG_1;
> 
> my gcc 10.2.1 doesn't like the declaration here:
> 
> /local/tbogendoerfer/korg/linux/arch/mips/kernel/smp-bmips.c:630:3: error: a label can only be part of a statement and a declaration is not a statement
>   630 |   u32 rac_addr = BMIPS_RAC_CONFIG_1;
>

Thanks I moved the declaration up before the switch.

-- 
	Ansuel

