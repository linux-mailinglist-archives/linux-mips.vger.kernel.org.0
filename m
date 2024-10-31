Return-Path: <linux-mips+bounces-6581-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F29B7D2F
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 095311C20810
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 14:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CBF1A0BDC;
	Thu, 31 Oct 2024 14:44:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E9A1A08CC;
	Thu, 31 Oct 2024 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385852; cv=none; b=fcMAHSdI269RI4CSkDFpyssWowIFDZ2wfQDENVjDa5ZS4CgLIhUs5+0a0jGWKLDl6mO+oK1q9SSibGJCZdPmR6XshsBBc8oi8Dhn2ktyDvWZH9wJHlOJFtYjkXUPndPZ3JXLra0Hbqz92QvuusLraLcbOJJK5gxGhWAWBFRRuVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385852; c=relaxed/simple;
	bh=gpARlhMd+jMUQZ0z3fOHRWkGCLUpFJQ59B5vavO6d/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CP1yW+21yelO3jihsWLWEVyo6GqXOrt9+Cn9Mp3k1zPa98cl6mKgscavrO+fD/xIfeIkKewahlme+DoQHhs8zJ33UBVQkWTF5zn43aN6ivqHQkLWqy/JGSybsF5MJEny7pv+qNb5/xG42q5YfpBb+QX85fTFZmRyoA84MPe1+FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1t6WOD-0000MK-00; Thu, 31 Oct 2024 15:43:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 08969C0161; Thu, 31 Oct 2024 15:42:58 +0100 (CET)
Date: Thu, 31 Oct 2024 15:42:58 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Theo Lebrun <theo.lebrun@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	linux-kernel@vger.kernel.org,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"paulburton@kernel.org" <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v8 10/13] dt-bindings: mips: cpu: Add property for broken
 HCI information
Message-ID: <ZyOXcrS/7txCQU3B@alpha.franken.de>
References: <20241028175935.51250-1-arikalo@gmail.com>
 <20241028175935.51250-11-arikalo@gmail.com>
 <avz4crm2yrk3fg7r4qxkgkt3ka5hmk54v2wtcms453tsnewu5w@jzjxmyd4b7yg>
 <CAGQJe6p6QgSQKByVQ8G+HpWbdEHnfNb8vRureOrS2VZa6Lk74A@mail.gmail.com>
 <29d7688e-5fac-4821-8764-bdc760112370@app.fastmail.com>
 <378f8b70-12d9-4ec3-a1e5-35bd992bfc90@app.fastmail.com>
 <87jzdoadve.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzdoadve.fsf@BLaptop.bootlin.com>

On Thu, Oct 31, 2024 at 09:13:57AM +0100, Gregory CLEMENT wrote:
> Hi Jiaxun,
> 
> > 在2024年10月29日十月 下午4:11，Jiaxun Yang写道：
> >> 在2024年10月29日十月 下午12:21，Aleksandar Rikalo写道：
> >> [...]
> >>>
> >>>> Is this property applicable for all MIPS vendors? There is no vendor
> >>>> prefix here, so this is generic for this architecture, right?
> >>
> >> I'd say the best vendor prefix is mti in this case.
> >>
> >> CM3 IP block is supplied by MIPS Technology, it is not a part of MIPS
> >> architecture spec.
> >
> > I just tried to revise this problem and I think a better approach would
> > be picking my CM binding [1] patch and add this as a property to CM binding.
> >
> > You don't need to pick rest of that series, this binding alone is sufficient,
> > and it's already being reviewed.
> >
> > Thanks
> > [1]:
> > https://lore.kernel.org/all/20240612-cm_probe-v2-5-a5b55440563c@flygoat.com/
> 
> I had a look at your series and it seems that all the issues raised were
> solved, so why wasn't it merged?

https://lore.kernel.org/all/2xkut5pyzk4b4ugl4ku72y4rfqrfsoxj4aww2jwlgkc3lmd464@zwf773fr7fpq/

so it's still unclear to me, whether there is something to fix or not.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

