Return-Path: <linux-mips+bounces-3822-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4669911E90
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 10:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E364B24F2A
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 08:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A8A16D334;
	Fri, 21 Jun 2024 08:22:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF5916D4F4;
	Fri, 21 Jun 2024 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718958143; cv=none; b=sUSi2zXhztXWYYsfEJhN3zIYa2LHTq0cM+tEsOLNrddRRtMsmhr28dwXSSgGGTa4OY+G1+Vd0sXPWsYjs89ZO1vNJvLLiNJ7LdSHC69scFGO3kZPk6q66aWa+2vkoUn6FsrJcFfYYgeDBI/UoWXcwVAoQ9ZgT3oxOpjDDMqOQIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718958143; c=relaxed/simple;
	bh=dgT8q2RUD4AsRrCrgspBvokTXMmqeYQLjIWJc/q4mjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFDfmdP5ufbVCFcTVwxhk7RyUp/qO+V/6PANDyvNmT7H2zftfGK79Sky5XAhHZ9tlrNgb39CZxqTQajvNUdSQX9UvY3IsMbdt6HfyPTx/R6DVA8QP1bY0hOolO7QcnE2EwNbMu8u1aKznHoHfgBgj4j7o/TSVaT3FTGgOeIKGEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sKZWX-0001Oj-00; Fri, 21 Jun 2024 10:21:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 88B31C0120; Fri, 21 Jun 2024 10:21:17 +0200 (CEST)
Date: Fri, 21 Jun 2024 10:21:17 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
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
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 00/14] MIPS: Support I6500 multi-cluster configuration
Message-ID: <ZnU3/c1T55k4WbYx@alpha.franken.de>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <ZnRtYFr5HFffyK7E@alpha.franken.de>
 <ff6fe06d-6209-4e34-9cc8-eb516fa4ffae@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff6fe06d-6209-4e34-9cc8-eb516fa4ffae@app.fastmail.com>

On Fri, Jun 21, 2024 at 12:05:32AM +0100, Jiaxun Yang wrote:
> 
> 
> 在2024年6月20日六月 下午6:56，Thomas Bogendoerfer写道：
> > On Sat, May 11, 2024 at 12:43:27PM +0200, Aleksandar Rikalo wrote:
> >> Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
> >> Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
> >> 1 cluster/4 VPU configurations.
> >
> > which existing CPUs can use this ?
> 
> Besides Boston are some multi cluster I6500 systems in wild, including Fungible F1,
> which comes with 52 cores in data panel.
> 
> Those vendors show no interest on mainline kernel support though.

ok, so looking at the series it touches areas with different maintainers,
I'm fine taking the MIPS parts, can I simply cherry-pick them out
of the series ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

