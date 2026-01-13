Return-Path: <linux-mips+bounces-12893-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E84D18828
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 12:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5580D3008155
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 11:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A10122A4FC;
	Tue, 13 Jan 2026 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="empt09En";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BirJaMY5"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7B2346ADB
	for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304153; cv=none; b=dlS/YDhQ3BYCnti3de8iV1kSwZpIXF2Eb2YKpDZZi4jy3HhLYZEJ15b52LucCJ8hWCj6LCNVrj0CsGa9C0wFL9Av6WKfbqn2+OOZ4rWyrBhWz5vrXEA2kHBN4P4zxjQNvfl/9UmY3okt1G2FXAuZTvWIpyNdjSUFv8YycFIx9XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304153; c=relaxed/simple;
	bh=GhniXQQx5pz3sodmRh6+sRp7+YRRsdoq4CZz9gmkCwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGJnEY7ls/PQOGLS2OVHJWgL9y0vhPqo8rhkFobSdfds+cxX2/pllQ5oVIr8w1JMTHTql0JEntVsYuy+H3FxdLh8lcKEvz80r2dvyjrQB9fdZpI+StMEcTRNNHpCUXYyrDga5NJ5qFVRGGqzSQ4F+xEmAwLB725dLcsktA52VdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=empt09En; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BirJaMY5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768304148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=juIsOkxFx+cUSDS0VP6Yi0iHExwrV6WSs6Rqrp0hnaQ=;
	b=empt09EnjDzchTVg4716YqUdzrFhiV+4JzooPFcjEoYWNHcdltXxAFUJh8t2qKm2+ioZoZ
	05fmrTxjWVeCmbK2KVgesvdFLMjUCw1v8seTSgixgVk+5Vc3dE+6CWf+ATO7tx65SgQzAv
	NvUAt3EMGzbuUHZwuuzN7kPeG+SrCeA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-Z8WgruXBOkKojRDyW3540w-1; Tue, 13 Jan 2026 06:35:47 -0500
X-MC-Unique: Z8WgruXBOkKojRDyW3540w-1
X-Mimecast-MFC-AGG-ID: Z8WgruXBOkKojRDyW3540w_1768304146
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804b991976so193883866d6.2
        for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 03:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768304146; x=1768908946; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juIsOkxFx+cUSDS0VP6Yi0iHExwrV6WSs6Rqrp0hnaQ=;
        b=BirJaMY5ov7zyLiIBWC0YbVy+ZcEGQDAMvV49OggzMuu+615z/nfkk6W44c1uN7MWn
         kBI45cFneoNTq5iEVizik3poC9BvCDKMFjKp6bYwMTdrcJXj8u+EeNGoiBUeUNsIFYYC
         IZEskGlruMO2gI1D0vCcAHO07AxDHqsLK1O+l0z6uiYBPkCuVtsIhn47nE6VrV0WNy5S
         1czwpvovQbX6nxtIst2xRHZboTne4R2NNojTeCxZEjYPHciq4QG0BV/dCirrh1oFviYe
         UpL034xtYCoEDsoGndG4p6C7UnnUf1PWDj4NbZNMIPXe0uzdq3HGKVlsLCjL2svSYP6O
         Oz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768304146; x=1768908946;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=juIsOkxFx+cUSDS0VP6Yi0iHExwrV6WSs6Rqrp0hnaQ=;
        b=D8W61cmCF6Dg4wvPd0I1ALMe0z9341465w418k0dU4WW/eUqRyuQSnbLHAC/AOvdXD
         VntzxjfkCQg9WmhixfpUII0RrTGj3lAHGUZL0n08oW4gkeO7hcpsAixjabcZuDWBYBpc
         1ArpSfTn4uiUuOKwheyJh3LuV26myldL60Ti1kdBLqe02p58OfjfYJqHfzxsmqCzBfCM
         GQi+E8leGzCcKq/GMSuXUIAN2cTENamVZ7T051HaReCA/CQjewZCkttgbFOzHKU3VMGw
         8ktzckDKx7R76ujax23BqC4GCp5HaKKP95XKR49rbBSE0FqZv9UYzI4/r27f3mvr1rFe
         P0Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUl16+H6niCBlRxe5s4yAoYC3hP0pMV8l7u6M24ReV2rq5GBDdI7AAaIWmu80Rd6Cx4d0f0NHJCuIv2@vger.kernel.org
X-Gm-Message-State: AOJu0YyvAiiCWQ5gladAwtgg+57c8wW1rme+R1awIN17iXMYzvOC3Ux7
	bk8dU31psW/mt7JFTFzFXJXyq64bRMkpmi2oiI5lcDqoGxYvop/8MJdBctZWN34COag7IZ3EhHm
	q1hI+VGJfMnetvlh00jnTZ874qlWrHNlZoZt4lVoMwvEakZbepFoqey4NMBTrxDM=
X-Gm-Gg: AY/fxX5dMhjOHxhOXSUQ2SqxtXfu9bl+l/yF1AHGUhfc5FqGKGemYTe3uvcuXP3BKHB
	nEDQCLsjHY6tNVbggPjrIzEg1+9qyhI0MrkouiR3ARkM3R+/05E9HfjFMrMMI39enO5RYoaTrP7
	2SMZ7dnGl9nZ7Mg3+W7nd+v7c+dLHzaDP1lV3H6sL1RiPs5zYyXOUTHUngxD9Ugigw57lU+uhUh
	Np46zVEhyYXFs0fP6JnXorfgUkgoOtmCj7MD2iJ6HpIO5t85KCahVU6Dt5834GYQQ/7X6ngimC2
	vG3SJ3+YebcXGMeum1pG2qb2JiGLCx6YhwkXyr1Fafpum/784N3R/HkzNFfnvQ9OUAEaBY5ev2K
	eltsVRFJwpzdvYLESllP4WV+EMOI6zulJijowhKCXZ6Xn
X-Received: by 2002:a05:6214:d0f:b0:88a:2f7f:e936 with SMTP id 6a1803df08f44-89084185816mr347411206d6.2.1768304146021;
        Tue, 13 Jan 2026 03:35:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzo0uppLbk/PCtIlWD/jdmbPhxx6qOCx3tl4mcCeMJFRw6/FZUdNL++K5+FCupwRFrHnhjTA==
X-Received: by 2002:a05:6214:d0f:b0:88a:2f7f:e936 with SMTP id 6a1803df08f44-89084185816mr347410866d6.2.1768304145542;
        Tue, 13 Jan 2026 03:35:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e2833sm149831326d6.18.2026.01.13.03.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:35:45 -0800 (PST)
Date: Tue, 13 Jan 2026 06:35:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 16/16] clk: microchip: core: allow driver to be
 compiled with COMPILE_TEST
Message-ID: <aWYuD6koAp_rDJ29@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
 <20260112-mips-pic32-header-move-v2-16-927d516b1ff9@redhat.com>
 <176828328795.4027.16644210192638742005@lazor>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176828328795.4027.16644210192638742005@lazor>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Jan 12, 2026 at 10:48:07PM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2026-01-12 15:48:10)
> > diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> > index 1b9e43eb54976b219a0277cc971f353fd6af226a..1e56a057319d97e20440fe4e107d26fa85c95ab1 100644
> > --- a/drivers/clk/microchip/Kconfig
> > +++ b/drivers/clk/microchip/Kconfig
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> >  config COMMON_CLK_PIC32
> > -       def_bool COMMON_CLK && MACH_PIC32
> > +       def_bool (COMMON_CLK && MACH_PIC32) || COMPILE_TEST
> >  
> >  config MCHP_CLK_MPFS
> >         bool "Clk driver for PolarFire SoC"
> > diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
> > index 891bec5fe1bedea826ff9c3bd4099c90e2528ff9..ce3a24e061d145934c84843008efadc3b0e2cffa 100644
> > --- a/drivers/clk/microchip/clk-core.c
> > +++ b/drivers/clk/microchip/clk-core.c
> > @@ -75,6 +75,7 @@
> >  /* SoC specific clock needed during SPLL clock rate switch */
> >  static struct clk_hw *pic32_sclk_hw;
> >  
> > +#ifdef CONFIG_MATCH_PIC32
> 
> CONFIG_MACH_PIC32?

Ugh... :/ This compiles on arm64 since nop is a valid assembly
instruction.

I'm going to hold off on posting a v3 for now unless there's an issue
with one of the earlier patches. This patch can't go in until all of
the other patches in this series land in Linus's tree.

Brian


