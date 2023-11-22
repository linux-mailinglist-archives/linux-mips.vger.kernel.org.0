Return-Path: <linux-mips+bounces-185-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C8B7F4F88
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 19:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F9A11C209DE
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 18:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28DC4F5E9;
	Wed, 22 Nov 2023 18:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CVd7/2dy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67EA4F5E1
	for <linux-mips@vger.kernel.org>; Wed, 22 Nov 2023 18:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1DAC433C8;
	Wed, 22 Nov 2023 18:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1700677742;
	bh=qsGh4PHkc0mg1b/d1tYd78id5VXrFh16WcGzldQw1Yo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CVd7/2dyvM4ZZaZhMypGSXAXmchB52w3uxIDBo/44hGyQ8Im+Ody44375XiPRro2r
	 J0LMiq/WzPnBqBM+9D4McwJyaxL9AILUjVvlrvd3Su9GSFarF38MmnhI84MwZDHc1v
	 2oV5dSPY8+X5KKODaMS6k8iqVAJLMdOL5OgXEAOI=
Date: Wed, 22 Nov 2023 10:29:00 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Mike Rapoport
 <rppt@kernel.org>, Matthew Wilcox <willy@infradead.org>, Alexey Malahov
 <Alexey.Malahov@baikalelectronics.ru>, Arnd Bergmann <arnd@arndb.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 Chao-ying Fu <cfu@wavecomp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yinglu Yang <yangyinglu@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] MIPS: mm: Fix some memory-related issues
Message-Id: <20231122102900.68216218f77b61e342f37627@linux-foundation.org>
In-Reply-To: <20231122182419.30633-1-fancer.lancer@gmail.com>
References: <20231122182419.30633-1-fancer.lancer@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Nov 2023 21:23:58 +0300 Serge Semin <fancer.lancer@gmail.com> wrote:

> Just recently I've rebased my MIPS32-related work from kernel 6.5-rc4 onto
> the latest kernel 6.7-rc1 and immediately got into a bootup-time
> mm-related bug (see patches 3-5 in this series). After fixing it I decided
> it was time to submit for review the generic MIPS code fixes which I have
> been collecting in my local repo for the last year. I was going to submit
> them a bit later after I finished working on a patchset with my SoC
> arch-specific changes, but since it was getting bigger and bigger, it
> turned to be reasonable to spill out the generic part of series right away
> especially seeing it might get to be useful in the most recent kernel.

It would have been better to separate out the two tiny unrelated MM
patches from this series.  I'll steal them - if they later turn up via
the MIPS tree then that's OK.

