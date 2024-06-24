Return-Path: <linux-mips+bounces-3879-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E296F913FFA
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 03:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 835791F22EF3
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 01:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09572114;
	Mon, 24 Jun 2024 01:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AE2CtpNj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB0E1396;
	Mon, 24 Jun 2024 01:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192542; cv=none; b=l55OXuHOas81Qj1CcKR9s8uAGjW5uInmYfEq/PbgZM5CHwP+XQ86PnRlJ8mDD2+eVqijtOVBEKHOGh5XbwiTzWZoWzB59IqIyOeIyCj77vnGmshgZEl9FUUobn1qemLakLg0z4H5U4IGGcdyvcMMhZWOkhAiuAi6F61UU7EDYZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192542; c=relaxed/simple;
	bh=MeR5ieAFVKxrRwPp8lkmwEaRTOroYoOPGXfnmDLDTBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhEKkb4vuGde8yN0kA0oxTwPVGhYO+YbOWhfkdnCE0rsaXljHfFq/YOfFBUxNHX7HDTXT/qFZb0+HmITXQcLXOwpCn21UMNoauZ6iFRNfTgVzi2uMFJEvokVUjKcaIQ5uiZGBK0nMwO1JPVqGXlRby1eo5T71O93uEHDi6mJuwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AE2CtpNj; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebe785b234so40508761fa.1;
        Sun, 23 Jun 2024 18:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719192539; x=1719797339; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/C9zZIr+pSADQAmoaBnfCtm3dpiOP5Z/aJ4VXnI2zrY=;
        b=AE2CtpNjEUnn2DVo2J4dpRj9zLkozAf7KgUfrX4BlW3wcHvkcyMxqhEtjX+P/UPluy
         88+jsWaoI3/5FRcaC0jarsF5JrRc7SZ++7v1yNeC/JYupwF4kK9AS5BEM/NEnBgqAzOQ
         cvIAASmThymHET2JYxFro8UoDuS4ffcA0m/exgFV8mvO1BeHZJLdoCGP+r3bmJxHPmpr
         L9irLWhwF/9qR7vxef/NeyVnltl4w+hL6hir1dJ/eyS4f5XRa2PGi4HFuDyuBYL42Im9
         w9SZwod3v6j40GhMgTYTvrq03rBOclQzdkH0xJ9NdAyKwb+azNXZCr+itp7BQJ3p0SK9
         3sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719192539; x=1719797339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/C9zZIr+pSADQAmoaBnfCtm3dpiOP5Z/aJ4VXnI2zrY=;
        b=U3EBh4ByZ8uEc6q5SNGFRG6Tg8ikQ4kmE1RNPBpIZdmzWSutW3JSgihD2Rj0MHcC88
         tpbmRVHpQaNGXIji2iiWV8PbjqNxocMZ0CFOaln9/8WQJU4GJwudmn32P8X2+xQSwXVC
         9ZKww299gXd/32DIvnLLr0CMM3hQJ5Si3RYLWjZkhWeFQF7wzrV09dF4D3k7VPi61LUD
         1cUBKTPni1YbY4qwqUcy2iA2pO7V0yGrWd2Pu5/w3Mp6zk0PWOUYRnYAJnSMbb1Vjj9Y
         bPDbhFQGVDUYQfzugrJjc5R3DjdAlj0aCznl4AOdHjRnQcQFBj2dxVeYV9FtMzUH6SFv
         lKHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDWIPv9rgtpBydbyw1kEs5n3lnaH0sQhb93iZdFWENp0oqnlbhW3ghKuyNzR4YWRSdxs7OKgW0/8eFZW1/SMTR08rzHT6aBlz9/fajamFYave6bEz869Gpybd1U3eBMJxe5uWAK6OAKw==
X-Gm-Message-State: AOJu0YwhM0Fic61ZzX76Yb/TojDj/q+sR2qYF5fXYpcOFEQhWsOuJuVM
	wPj3FJ9/5exljk1531/418AaLYsx3BIu+Pxnk6IWHDIikmYLGJsK
X-Google-Smtp-Source: AGHT+IGRO+Gn5KjeWlG85mP17u3v0wzITMKCEHEIVW9LPVKFnoKD9IJih67Jl77qhrcOGTlFJElJvg==
X-Received: by 2002:a2e:96c4:0:b0:2ec:1f9f:a876 with SMTP id 38308e7fff4ca-2ec593101ebmr24938831fa.6.1719192539056;
        Sun, 23 Jun 2024 18:28:59 -0700 (PDT)
Received: from mobilestation ([89.113.147.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d71430fsm8022881fa.60.2024.06.23.18.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 18:28:58 -0700 (PDT)
Date: Mon, 24 Jun 2024 04:28:54 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Chao-ying Fu <cfu@wavecomp.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, linux-kernel@vger.kernel.org, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"paulburton@kernel.org" <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 00/14] MIPS: Support I6500 multi-cluster configuration
Message-ID: <dc73hv3pb3cjtrfnqi46ukverkv4ewfvrqlom6jjbweskcwwia@lgknnonm4mo5>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <ZnRtYFr5HFffyK7E@alpha.franken.de>
 <ff6fe06d-6209-4e34-9cc8-eb516fa4ffae@app.fastmail.com>
 <ZnU3/c1T55k4WbYx@alpha.franken.de>
 <4xsbpttlr5tetkuiipsieimrbq2syera74tkuy2ikxiskx5jpd@y24epvmvg7gr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4xsbpttlr5tetkuiipsieimrbq2syera74tkuy2ikxiskx5jpd@y24epvmvg7gr>

Hi folks,

On Fri, Jun 21, 2024 at 12:13:29PM +0300, Serge Semin wrote:
> Hi Thomas, Jiaxun
> 
> On Fri, Jun 21, 2024 at 10:21:17AM +0200, Thomas Bogendoerfer wrote:
> > On Fri, Jun 21, 2024 at 12:05:32AM +0100, Jiaxun Yang wrote:
> > > 
> > > 
> > > 在2024年6月20日六月 下午6:56，Thomas Bogendoerfer写道：
> > > > On Sat, May 11, 2024 at 12:43:27PM +0200, Aleksandar Rikalo wrote:
> > > >> Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
> > > >> Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
> > > >> 1 cluster/4 VPU configurations.
> > > >
> > > > which existing CPUs can use this ?
> > > 
> > > Besides Boston are some multi cluster I6500 systems in wild, including Fungible F1,
> > > which comes with 52 cores in data panel.
> > > 
> > > Those vendors show no interest on mainline kernel support though.
> > 
> 
> > ok, so looking at the series it touches areas with different maintainers,
> > I'm fine taking the MIPS parts, can I simply cherry-pick them out
> > of the series ?
> 
> Please hold on with merging it in for a bit. I'll give the series a
> try on my MIPS P5600-based SoC later, on this weekends.

I haven't been able to reach my HW treasury on this weekend. But today
(on Monday) I'll definitely do that and test out the series. Sorry for
the delay.

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

