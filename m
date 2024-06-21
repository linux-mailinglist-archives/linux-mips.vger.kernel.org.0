Return-Path: <linux-mips+bounces-3831-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D850C91203C
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 11:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 147DB1C21CDB
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 09:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E4816D9DD;
	Fri, 21 Jun 2024 09:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8Rp3pDH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF3116D9B1;
	Fri, 21 Jun 2024 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718961212; cv=none; b=amjYLG97c/dOj38d2wsiaOiMAdU4RTi7157vmpapLcZv7gM6M6V7jHX06ThxechHnMqOJp8y5MEEtmgSctBuHsTfmqpUBT2FeKg4xTHn6oAbyP2Gn/JwHZpfguvh46uXPOkgdPy06Y1MfO9ZLER3DKBHAbE50kmoizMXqaPpd74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718961212; c=relaxed/simple;
	bh=fv/S5/9ybJPJUxF48OIewvL3HfLZ+JrH7Cn0THjtD/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2L70L8//eWnETxwsRGXnmmj/h1e7srKTGgHdpubWJa/D7O+bUOCAXhJqNlNrmzK7sFusqjUvMFIREBNs0Nv3p+Z4WTt4OWI/sPWy9oZRsawJ3JE44eLWdFWU8GdWoXgMtpUGPeh4UTYOxAnLe90g+iLuLzsBc3vQ67Xyf4cXgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8Rp3pDH; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so22642421fa.1;
        Fri, 21 Jun 2024 02:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718961209; x=1719566009; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ON+cg4TNotxKMww6ho7vuLBsVf7edBNVPSZgwt8adtg=;
        b=l8Rp3pDHCRm1LyWwsq043jYyGTxulWwuFdkMioZ34tklaOo0fpeB8EFI4y0fHuQC/a
         L3+rQiXAb/TuCFLQdYYJP120XPE7ZDouM4LcRvVsx9boB2VI9aSrJnYC5evARzVKUfWH
         I2AIDZjXz0d93bsyF94ZbvubQ/tw+oPiikzSe3766agZKrXYLPt30/+BWdoh9fpSxlN9
         0Nx77bLWQdCBhUj+Q1ItRo1gVkx+0ZysiBuC81nJqZWA6QrM/kY+lP4/BzJ2rkJcxKwu
         1GgA/ypYiaI9o519JGfv1WP6sRC4VX+XQFnpI3K9zRICN7XTXm5K84fY0RkW2tZcOmHb
         W8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718961209; x=1719566009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ON+cg4TNotxKMww6ho7vuLBsVf7edBNVPSZgwt8adtg=;
        b=fwb3mWs1+/OSU3C07mCI+rd/+sd4nWGGwTVJ9lX8COd4TQBy6payEOfQz+XUZ3Vum+
         t6gjk1nz8Hqxa+5Dl/bWfPIyE85VK91qeCLYJrVk3IuxBjrTisTDOPxigFEgmAUek/W/
         +K0JOM/pr6dAJjmpgXTF+egU9ONt6W+bToholM3Qdmmefi4/yfJ3XPdSfcJXFdlH5Hnt
         I3GbFg7Hsxun9BchSsc/4KNopb/DZlr80DOrPZ5koTA3odOOmALvvYw/uQWy/Br25mt+
         Q5ZBGk84jwDYdWou5JEIQx7KsWQOriavmT6vehGULUcVYQdOqmZxDzVs7EYZNnwRWmId
         noMg==
X-Forwarded-Encrypted: i=1; AJvYcCV4d5ry5/XgER54imF25df6R7g677TasqqunNyJrBOi+ztmrBdI1p4sPOEStPfMboedD0HBMXYUxLzxwZV0gDdMFd5Qwy/VhODWakBJ1HdAA/s+muP0BFXYVlWlgl75W3gfdxa4pdCPUA==
X-Gm-Message-State: AOJu0YzRK1NcP209z7t9Kwf5VfUOFR0RnzdYfWEnUXLqlKUWFI/gFHO4
	wZTzRfaoJ4jMZlVwKiQmg03nDHHXxskCq1xhtv1wbD/iAHH+aWcQYJqc0Q==
X-Google-Smtp-Source: AGHT+IFGfYBJTSuwKjWDOTsWo8Gf3r828qh8/V9VCSnLJn3X01qHalRZ0j488/n0+5sOMfKWUz977w==
X-Received: by 2002:a05:6512:688:b0:52c:1c56:a230 with SMTP id 2adb3069b0e04-52ccaa2d625mr4987238e87.5.1718961208958;
        Fri, 21 Jun 2024 02:13:28 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b4bfdsm142418e87.11.2024.06.21.02.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:13:28 -0700 (PDT)
Date: Fri, 21 Jun 2024 12:13:25 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
	Chao-ying Fu <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, 
	linux-kernel@vger.kernel.org, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	Marc Zyngier <maz@kernel.org>, "paulburton@kernel.org" <paulburton@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 00/14] MIPS: Support I6500 multi-cluster configuration
Message-ID: <4xsbpttlr5tetkuiipsieimrbq2syera74tkuy2ikxiskx5jpd@y24epvmvg7gr>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <ZnRtYFr5HFffyK7E@alpha.franken.de>
 <ff6fe06d-6209-4e34-9cc8-eb516fa4ffae@app.fastmail.com>
 <ZnU3/c1T55k4WbYx@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnU3/c1T55k4WbYx@alpha.franken.de>

Hi Thomas, Jiaxun

On Fri, Jun 21, 2024 at 10:21:17AM +0200, Thomas Bogendoerfer wrote:
> On Fri, Jun 21, 2024 at 12:05:32AM +0100, Jiaxun Yang wrote:
> > 
> > 
> > 在2024年6月20日六月 下午6:56，Thomas Bogendoerfer写道：
> > > On Sat, May 11, 2024 at 12:43:27PM +0200, Aleksandar Rikalo wrote:
> > >> Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
> > >> Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
> > >> 1 cluster/4 VPU configurations.
> > >
> > > which existing CPUs can use this ?
> > 
> > Besides Boston are some multi cluster I6500 systems in wild, including Fungible F1,
> > which comes with 52 cores in data panel.
> > 
> > Those vendors show no interest on mainline kernel support though.
> 

> ok, so looking at the series it touches areas with different maintainers,
> I'm fine taking the MIPS parts, can I simply cherry-pick them out
> of the series ?

Please hold on with merging it in for a bit. I'll give the series a
try on my MIPS P5600-based SoC later, on this weekends.

-Serge(y)

> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

