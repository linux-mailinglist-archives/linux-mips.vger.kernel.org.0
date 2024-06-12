Return-Path: <linux-mips+bounces-3625-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EBB905723
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 17:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 250042830D9
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 15:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60B91802DA;
	Wed, 12 Jun 2024 15:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+tOc/Sg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8ED1DDEB;
	Wed, 12 Jun 2024 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718206718; cv=none; b=LJj2XU+jDQHxghXlWpPBNKLMb3PylUIiampY1bm0IBI9U7+04DcystZ7FWYLZ4tpu2AqAlBKaq+bKs6BBG0caRqm8tUv9hbxyQsVODNBiTHJA0a8OadoiQp5ngqufwmIM2ttnV8c1JfIgXCNj/U+VohvN4G6uf98Fjpeji1sG5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718206718; c=relaxed/simple;
	bh=UVEtssoDSiF7CYe1BuJDK3tIUGU/VpwtuyxzewETC+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozBJXucnchC12wDkiEWsRoTbeLDEAz8BajGLhSEPTUAbJ553h5EHA29FLF4XdXF2w2JtbHSR+BrwbeV+2Lm2hvJUcgEvOTpB75NwzrF/T0x6w/YqAQcIz6FovjKhwYYfhEk+72iZ4l3bBnMasdX8OLjwM0u1+TrOp0fleuryllw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+tOc/Sg; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7041053c0fdso3997232b3a.3;
        Wed, 12 Jun 2024 08:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718206716; x=1718811516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+OiUYHJjgr74ugaJv//KCphSRFmbhG58JfdaCA2l9I=;
        b=j+tOc/SgNBXjOr/mAGJKsSYIK7YcEhnoYb7NaNVXyx6TBhMOI3ETtdG93nfhELmqDk
         hbb+7DvPKBTb6bUW4yF9OsikjptfghztBC7RK5CgTQUmErRBclvArbzK4q3sftV7AaO1
         3Gv6HEfBb8f3c5b0imRqfXrMCTH07rTMdGT3DLMbOyEv3pTCdXzbY5UJqpFGctKelj/6
         4Szb3e8RS/07g2+sh4NaOL3YBmxnGoqb2blxqqr4wv8VZ6iq09daprfbAa9HAWrPKkGM
         mDXmHCpUvJQP3htrUYkJxyH2+vv1fpBeXr//pZPNpxEyDfcD8RduHED/6TH3RRqFUCy7
         Cxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718206716; x=1718811516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+OiUYHJjgr74ugaJv//KCphSRFmbhG58JfdaCA2l9I=;
        b=iI4zbHsvmXmtOz2CZgSwOfxcWwEYJibNlruSJ+Ii9cVVFdRbcn6WmgGUu3JBLcikfj
         JmlwPC1P2K2ONSk5DxJoaN34tYf4I5880nEJndFCJ2CGLh3JdEZpkGgH9EyIqu/gJEHW
         QymsRX5rguJAYWi0yy1Nj1+6ZZGSLWmpzmhzZpPvah/kGdFCTmTtYdg5Bn5hNPHPzBuG
         2fvNjAGd0WjOC8/LNE3kj540n/FAN6+Km9C14IEia8kf2MLqi4EUdyx8Lc+/NXweMvFK
         gDzg7NpLMQoIK0k5bSA/1hpgJGvBdX3g2dI2LeOrGbbnVFYxQ7LVXBFDoWz/io3sFjwz
         pJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUysZ1B93QBoms5aL3O00wMXUfftxv4aiJ0+lTGkByYUkk8/6H4cmK9GxkHcI9ODn9bt44boHnd7kQPWYUEjW2GGiOVqSGntBcZ7ul/0YWbXhRCZdTvLWkK1fNdtikuGFCnJcTrozRpGmE+0IIORS3rbm7b0dboAirj1saek73xAA==
X-Gm-Message-State: AOJu0YwplFTVD9mnGl9fmA4osreJyCO8/sFs8DOTT2zuTswO5Y57FsY8
	Was/s7Gczwo+fJnW8vkZiUST3smhQTx7hH27pdhlsIVp4MVSNHzh
X-Google-Smtp-Source: AGHT+IGGLwgxSXoWDvCvGIc3N+l9N/n5l4Zca0dJDsuNpFwB50SuY2whOS+6ceWf3F+yYlR6r9lkCA==
X-Received: by 2002:a05:6a21:32a8:b0:1b3:8232:2079 with SMTP id adf61e73a8af0-1b8a9c8e246mr2522599637.52.1718206716460;
        Wed, 12 Jun 2024 08:38:36 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3077:52c7:3e56:8d61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de27605dcasm9367495a12.79.2024.06.12.08.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:38:36 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:38:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Martin Schiller <ms@dev.tdt.de>, hauke@hauke-m.de,
	rdunlap@infradead.org, robh@kernel.org, bhelgaas@google.com,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Message-ID: <ZmnA-fifJkEBt0lH@google.com>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
 <ZmhbQgXxyhZ7shBh@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmhbQgXxyhZ7shBh@alpha.franken.de>

Hi Thomas, Martin,

On Tue, Jun 11, 2024 at 04:12:18PM +0200, Thomas Bogendoerfer wrote:
> On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
> > Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API") not
> > only switched to the gpiod API, but also inverted / changed the polarity
> > of the GPIO.
> > 
> > According to the PCI specification, the RST# pin is an active-low
> > signal. However, most of the device trees that have been widely used for
> > a long time (mainly in the openWrt project) define this GPIO as
> > active-high and the old driver code inverted the signal internally.
> > 
> > Apparently there are actually boards where the reset gpio must be
> > operated inverted. For this reason, we cannot use the GPIOD_OUT_LOW/HIGH
> > flag for initialization. Instead, we must explicitly set the gpio to
> > value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag that
> > may have been set.
> > 
> > In order to remain compatible with all these existing device trees, we
> > should therefore keep the logic as it was before the commit.
> > 
> > Fixes: 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Martin Schiller <ms@dev.tdt.de>
> > ---
> >  arch/mips/pci/pci-lantiq.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> applied to mips-fixes

The patch is unfortunately also wrong as it will break any board that
actually has correct polarity annotation.

I will prepare a quirk for drivers/gpio/gpiolib-of.c to force the
polarity to low for this GPIO.

Thanks.

-- 
Dmitry

