Return-Path: <linux-mips+bounces-5495-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E770797370A
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 14:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A481C287F15
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 12:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F361B18C34D;
	Tue, 10 Sep 2024 12:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/nJLTmd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC85184535;
	Tue, 10 Sep 2024 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725970817; cv=none; b=IhatMXT5U6SV3+OMoj1VDxRGuiV12EPKWqFaPy53+Thef81IGbEmHigH2x8mNnxqih1jdjJIUtJDA4LBmSjN2gWxy1xTLieWFS0Ldk+Rxcz0/astbk9C4ijNfiw/Ukp1FVeeYiQwra6uJ26Cm+Qzu1mmMr/MqcPsK34hHRpRPms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725970817; c=relaxed/simple;
	bh=d3MXfy+BOQM4BCa9TNpqSL2C0Be4VpIVPtQN0jtPsrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXaT6/sd6oV4ntEn15e0kgGgd0pvt3VPNCZmt6zVuuSMXqdk8GQ0XdKcN8TX6dZPDsQ5WtKZZxEkfBE9R/cJGqjO5CHSerY8ipXHXJDb5FP8/+9h3nK5cGpwmjxEZJtaPTNqAaj1vgk1QmmIHEAm3NjzP6PJOy0IsgMkdD7OJ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/nJLTmd; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f75c0b78fbso7322221fa.1;
        Tue, 10 Sep 2024 05:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725970814; x=1726575614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fI6hy/4mGAcVa6DnoUMOTFVkwV/NISt2fFlodh6pZ+M=;
        b=b/nJLTmdQPmO1geRlCsUBv+WNg9Y3GYQbo1izpZa+Massrtb0cPF6iTKNz7bHjOMun
         9bNMgYYjzcxl0NPFa/wrWy1zag141aSuXkO/jqIjTUWe1WGm+DF2fZoZeCEYwZ41YRX9
         p90shNCYMGIQRSjftbetO2YPrDjH/mB3krC8T80ggSFRB9GQc1auaVPF856GPzENc18g
         w/zpBZ47vArrXj3FwNtH4yAPdyGBMW6nkyr8TjwrJCGhTs28Naiw2r9oGVLq2gsH/cdd
         rEXp7kZ9Jvsfa05PpCWK/kIL5cQWinOCA06tXZDqOyBd9p2tTdkZsnYh0Mfc24JbxFHc
         2J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725970814; x=1726575614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fI6hy/4mGAcVa6DnoUMOTFVkwV/NISt2fFlodh6pZ+M=;
        b=fo/lS2rBbmiiSqbMr5Bn3UR2v1sjJkDq5ympBnnIno5qFc6LU0iHa/xLbEWdKLEF/B
         nQ7nhdAouc+di/HYI63nGgKkmwFDo0rMxa6gQy3ugRQILimxEouIl/QiBmtLTkQijflj
         LEq9PKnEuzPtxvmeYWvGzavN6e5PHlG9u0Yko6wy7o/ftwZ9PW0RIkOr6iaOVsK3mTxI
         /KsO5I3LzIL7WpUPNdrCaYVS06mcPBRMzovP8H99TDysDkLM5C9myPSbKGH/e75hIwG8
         fIYqTxZvblsoajPi6/vcnbzJ//08MNP3wHrFR9o6MCFU1ym0IwXnDk7/TXZ0smqt12zf
         n+rw==
X-Forwarded-Encrypted: i=1; AJvYcCUiQYWV2SsL88mGQ8Kd1gWCMuWhoJ7kRZFtmPdrbhWFIJW0kmAZyP7VMvLSpksDhg4+ThxjDFtox/TAVw==@vger.kernel.org, AJvYcCVHVaCn9/gZ5ErdqP8QMW8YbFBXhs2WQK9fFGI8E6id7Zj1ejz2JpXaG2kX4QheKvBRV/61CdSnkATR@vger.kernel.org, AJvYcCWvsgD1CRN4fnDcXVGxpjebzQNyydjzqs+Ox5lCxNrEDRjdGNzcLAtfvMBDtdxuEM4ZMca+sOP+8neTGMhw@vger.kernel.org
X-Gm-Message-State: AOJu0YxUujhiayxuT7DWUoOh+4PGdzK6ge4F82jd4ckClSZnshjpnsmx
	BNFL7ixDlr+BNRSH/LK7yxqB87n4WWA5uUm+Qwlzel9TqMznXWPy
X-Google-Smtp-Source: AGHT+IE2puuqpTB2oD3dUeKerqjHKH4/QqUP+8pRASUn6j+PQbjYfsyW971oT9pLqAnjQf+VZLF+RA==
X-Received: by 2002:a05:6512:3d07:b0:536:553f:3ef9 with SMTP id 2adb3069b0e04-536587b3364mr9403116e87.27.1725970813905;
        Tue, 10 Sep 2024 05:20:13 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f90d4desm1141570e87.269.2024.09.10.05.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:20:13 -0700 (PDT)
Date: Tue, 10 Sep 2024 15:20:10 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Paul Burton <paulburton@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/6] MIPS: cm: Probe GCR address from devicetree
Message-ID: <2xkut5pyzk4b4ugl4ku72y4rfqrfsoxj4aww2jwlgkc3lmd464@zwf773fr7fpq>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
 <3wemwdkev7pafyfu3yxhpvvpqaplhlejbzxtmahcarrnoeelzr@747sgyl63kwj>
 <Zt745ZtuZmVH61uA@alpha.franken.de>
 <tyjojeubipma56cnldy3yabbiakca7bnt4efei7i4r5xme7gpq@ecz5rqwwyg5n>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tyjojeubipma56cnldy3yabbiakca7bnt4efei7i4r5xme7gpq@ecz5rqwwyg5n>

On Tue, Sep 10, 2024 at 11:06:56AM +0300, Serge Semin wrote:
> Hi Thomas
> 
> On Mon, Sep 09, 2024 at 03:32:21PM +0200, Thomas Bogendoerfer wrote:
> > On Tue, Aug 06, 2024 at 10:49:52PM +0300, Serge Semin wrote:
> > > Hi Jiaxun
> > > 
> > > On Wed, Jun 12, 2024 at 11:08:52AM +0100, Jiaxun Yang wrote:
> > > > Hi all,
> > > > 
> > > > This series enabled mips-cm code to probe GCR address from devicetree.
> > > > 
> > > > This feature has been implemented in MIPS's out-of-tree kernel for
> > > > a while, and MIPS's u-boot fork on boston will generate required
> > > > "mti,mips-cm" node as well.
> > > > 
> > > > Please review.
> > > > Thanks
> > > 
> > > Got this tested on my P5600-based SoC implemented as non-generic
> > > platform. Alas the system hangs up on the early boot-up stage with no
> > > even a single char printed to the console. I'll be able to get back to
> > > the problem debugging on the next week.
> > 
> > any news about that ?
> 
> Oops. This patch set has absolutely slipped out of my mind. I am
> getting back to it immediately and will submit the debug status
> shortly after I dig out the reason of the hanging up. Sorry for the
> inconvenience.

Found the reason of the problem on my platform. It was due to the too
early change_gcs_control() invocation. Since mips_cm_probe() is now
called after the prom_init() method the later function can't access
any CM-register. So for the system to boot up I had to move the GCR
controler register update to the plat_mem_setup() method in my
platform code. After that the system booted up successfully. Double
checked the rest of the platforms in the vanilla kernel repo for having
the similar issue. It seems to me there is no platform left in the
kernel with such potential problem presented.

But then I decided to test out the actual GCR-base address setup
procedure implemented in this patch set, and found another problem
unrelated to my platform. I'll submit the problem summary in reply to
the respective patch in this series.

-Serge(y)

> 
> -Serge(y)
> 
> > 
> > Thomas.
> > 
> > -- 
> > Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> > good idea.                                                [ RFC1925, 2.3 ]

