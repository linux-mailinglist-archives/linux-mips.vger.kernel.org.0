Return-Path: <linux-mips+bounces-6607-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FB29B88D8
	for <lists+linux-mips@lfdr.de>; Fri,  1 Nov 2024 02:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E2A31F21051
	for <lists+linux-mips@lfdr.de>; Fri,  1 Nov 2024 01:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5AB1C6B4;
	Fri,  1 Nov 2024 01:47:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9122ADDAD;
	Fri,  1 Nov 2024 01:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730425646; cv=none; b=CU7iWAqIoU+fxG042asSXo9ckXvLHyUUwjvojD1WXTkfg6RbRmecZpsSLltIsJUJb42jzei3t5oM1nT5kUSHtqS9MM3satILlgC5+LDUVk+Uo8vePzlkgKRd6fuJv+b2sIjihz8lT7+OEX4MzDMncou1QIc2zHdsaeJXb+etyW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730425646; c=relaxed/simple;
	bh=sXZCbRbeFr64bWTbo4bDXx21yjrRFDO5DVEu8ooKcUI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aHu54tKVXbsyiZm+ix4gCNWyk5gmMHlzdK645uTmSmbaVztHiTHz4VohjH3pnDXOm0FwW6eF1vt/DSk3ZH7dMIFC1o8br9zNi8uy3VlDTGPcbfNkldG/VFlIco6xl8FMrzp63p8b8NEx1WO5AA0MPfb+4xlvZj57EPD8dCJqqI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CF8C992009C; Fri,  1 Nov 2024 02:47:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C827A92009B;
	Fri,  1 Nov 2024 01:47:17 +0000 (GMT)
Date: Fri, 1 Nov 2024 01:47:17 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Aleksandar Rikalo <arikalo@gmail.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Theo Lebrun <theo.lebrun@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
    devicetree@vger.kernel.org, 
    Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
    Chao-ying Fu <cfu@wavecomp.com>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, 
    Hauke Mehrtens <hauke@hauke-m.de>, 
    Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, linux-kernel@vger.kernel.org, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    Marc Zyngier <maz@kernel.org>, 
    "paulburton@kernel.org" <paulburton@kernel.org>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Serge Semin <fancer.lancer@gmail.com>, 
    Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v8 00/13] MIPS: Support I6500 multi-cluster
 configuration
In-Reply-To: <c7d5a4e9-f080-46dd-9b96-07eb08d361f4@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2411010146340.40463@angie.orcam.me.uk>
References: <20241028175935.51250-1-arikalo@gmail.com> <c7d5a4e9-f080-46dd-9b96-07eb08d361f4@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Oct 2024, Jiaxun Yang wrote:

> Reviewd-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

 Typo here.

  Maciej

