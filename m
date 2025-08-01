Return-Path: <linux-mips+bounces-9966-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA77CB17DCC
	for <lists+linux-mips@lfdr.de>; Fri,  1 Aug 2025 09:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D106017C64C
	for <lists+linux-mips@lfdr.de>; Fri,  1 Aug 2025 07:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4981F4199;
	Fri,  1 Aug 2025 07:48:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFA72AE72;
	Fri,  1 Aug 2025 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754034502; cv=none; b=l3XBhgN3g7d5/Msa9doOAcWx/fQcIscUYRxfvMixQ6ECyO+3XFWDesPySMUXcbP+6bJWBPr7qgdiRzqrYcH7+yvsYVsCgwANUEWLv80UZU3eaUlGJyZ4EWwceMglxrFgs5mC2zydxyR5XuWSJT7UPoxeDJKJd9iQtSQi9Mqc33s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754034502; c=relaxed/simple;
	bh=eR+YJiypjKueL2sFiakEy9f2vYlFdaKQ5ytebsiXYg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mX6szH1fTJx8PKLB00IJIGxGuus4kj2DsW08UivZEQuKjOJzMQngDZyni+ELl7MjtO01DboR9Zd6D7xv6N3oYeGrPofjGX8R+Re1uNXOnWK7ERl72E6R+57/G1G9FBzS0f8S9iFCT5WMQwbTqXVVeljNMXv/hbvpv11LfiPjTps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uhkUr-0007Ki-00; Fri, 01 Aug 2025 09:48:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 774F5C04FD; Fri,  1 Aug 2025 09:40:41 +0200 (CEST)
Date: Fri, 1 Aug 2025 09:40:41 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] MIPS changes for v6.17
Message-ID: <aIxveYoD1HBMopoz@alpha.franken.de>
References: <aIomWdeNOQwaKPu1@alpha.franken.de>
 <CAHk-=wh+kN-LsKbi_ZA1_+LTA4ts=0C+5Xn5SrLBAoE_BKKy-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh+kN-LsKbi_ZA1_+LTA4ts=0C+5Xn5SrLBAoE_BKKy-w@mail.gmail.com>

On Thu, Jul 31, 2025 at 11:15:26AM -0700, Linus Torvalds wrote:
> On Wed, 30 Jul 2025 at 07:04, Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > DT updates for ralink, mobileye and ralink
> 
> Quoting Blazing Saddles:
>   "You said ralink twice"
>   "I like ralink"
> 
> But judging from the diffstat I suspect you meant qualcomm the second time.

I had the other vendor with r in mind... should have been realtek

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

