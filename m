Return-Path: <linux-mips+bounces-5494-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB31973603
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 13:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D2E22830DA
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 11:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD62185B43;
	Tue, 10 Sep 2024 11:16:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13904188CB1;
	Tue, 10 Sep 2024 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725966970; cv=none; b=mq4hMe/dQXqP2tl01VZk9HcO2+WfrZKcSw1aAaPMz9r3pDq5BX6u9ecKMF64R+T8gu4D6dlbOu1oAsF88tYBwxQ//MrNTJBsf4w8dpPotPC/pjSUQunMolnMwKdKrXHBhuvEYiYAeR96gRXjvOQUOeYC7sfXaT/oeC7on60GONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725966970; c=relaxed/simple;
	bh=WwuWzlfalxUbA7n9dc2q0GE+bRK2RGMy6unlIrwup+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trJoqdhNHECjvw5mcQsywn4/3vXpRFbchXhFVwYfNb0/KwVDzWmd0aN6b8DySkx++Wolc89o+PHtRfP7RRLqBEktMCTR2YiQcf9ZhZIyOOQ1h2OV3PrDRbSTeAavbiElludO9WZdwpvAT2+Q4M5RGXYfgONzMO0uuIQTxmJe3yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1snyqf-0004WW-00; Tue, 10 Sep 2024 13:15:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3819BC014D; Tue, 10 Sep 2024 12:50:58 +0200 (CEST)
Date: Tue, 10 Sep 2024 12:50:58 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: kprobes: Massage previous delay slot detection
Message-ID: <ZuAkknRoKraAJkFC@alpha.franken.de>
References: <20240908-mips-chore-v1-0-9239c783f233@flygoat.com>
 <20240908-mips-chore-v1-2-9239c783f233@flygoat.com>
 <alpine.DEB.2.21.2409092259110.60835@angie.orcam.me.uk>
 <b4833f82-9e7e-4667-994b-c444ef935a9f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4833f82-9e7e-4667-994b-c444ef935a9f@app.fastmail.com>

On Tue, Sep 10, 2024 at 10:43:23AM +0100, Jiaxun Yang wrote:
> 
> 
> 在2024年9月9日九月 下午11:02，Maciej W. Rozycki写道：
> > On Sun, 8 Sep 2024, Jiaxun Yang wrote:
> >
> >> Expand the if condition into cascaded ifs to make code
> >> readable.
> >
> >  Apart from broken formatting what's making original code unreadable?
> 
> For me it's confusing because wired layout, cascaded ifs are clearly
> easier to format and has clear intention.

I prefer the original version, it's just to statements combined with &&,
which isn't scary at all.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

