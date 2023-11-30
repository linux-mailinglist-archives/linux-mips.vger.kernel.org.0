Return-Path: <linux-mips+bounces-414-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0097FF4A4
	for <lists+linux-mips@lfdr.de>; Thu, 30 Nov 2023 17:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 277BF1C20CDA
	for <lists+linux-mips@lfdr.de>; Thu, 30 Nov 2023 16:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F6854BF8;
	Thu, 30 Nov 2023 16:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lbLLL9vY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D8F5467D;
	Thu, 30 Nov 2023 16:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC8CC433C9;
	Thu, 30 Nov 2023 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701361170;
	bh=mDtzF7NAf/4/gCyKEm5oMxB9JWjUMGxC0nVhCgSfJiI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lbLLL9vY1iZm73oW0pLb5e2DTUMZwAVzUyefidj4FWo5C5BEKe0QdpDdbG48LcpVR
	 RGVEOqcSIEiYSLWUJi7eFZbo6zoyYvnMhIuFWrq6+IMh/0b03TTVWdV3YsMdEFRc2Q
	 BJBvgqW0vCh7Bamjd5FtC0tZZY4LTFNienKCGV/8=
Date: Thu, 30 Nov 2023 08:19:29 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Stephen Rothwell" <sfr@rothwell.id.au>, linux-next
 <linux-next@vger.kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "David S . Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: linux-next: lots of errors/warnings from the
 -Werror=missing-prototypes addition
Message-Id: <20231130081929.46a79c33edee8651c63112dc@linux-foundation.org>
In-Reply-To: <4be73872-c1f5-4c31-8201-712c19290a22@app.fastmail.com>
References: <20231130075838.05e5bc9b@oak>
	<20231129131003.d2c1078847c3865c1ac2dfd5@linux-foundation.org>
	<ebb5b1a2-ed27-4a77-b62b-1d3f19bddd85@app.fastmail.com>
	<20231129151030.24b807f1d2b43be301a533b7@linux-foundation.org>
	<4be73872-c1f5-4c31-8201-712c19290a22@app.fastmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Nov 2023 09:07:38 +0100 "Arnd Bergmann" <arnd@arndb.de> wrote:

> > I guess it should precede "Makefile.extrawarn: turn on
> > missing-prototypes globally".
> 
> I already have a collection of patches to fix up known
> -Wmissing-prototype warnings across architectures in the
> asm-generic tree, so I'll add this patch there:
> 
> commit bdef96eb0b89dfa80992312a8e3b2613bf178ae5
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Thu Nov 30 00:07:07 2023 +0100
> 
>     arch: turn off -Werror for architectures with known warnings

I think this would be better in the mm-nonmm tree, alongside
"Makefile.extrawarn: turn on missing-prototypes globally".  Can I steal it?

