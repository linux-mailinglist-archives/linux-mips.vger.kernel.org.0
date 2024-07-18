Return-Path: <linux-mips+bounces-4373-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EC935140
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jul 2024 19:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC4551C20D7D
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jul 2024 17:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24DF14534A;
	Thu, 18 Jul 2024 17:29:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21424143892;
	Thu, 18 Jul 2024 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721323749; cv=none; b=d+aOluT3VUBC338L1HuEZ71TP1sH/qsNYaZ1YyJTSmLT9e2e3f1wFe56eXU70Z4hnwKyMegjRr8P/5LaqP/xsqUy2HajP6J6IoLgyB5XppNAgLRwl+JyHAoh7l4c3xwKA6znU4bdcs+UfjvSPtG3PRiGd2CUmIkmr8ileQQxzeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721323749; c=relaxed/simple;
	bh=oB0oDoQHMm/TA7ycU7tDmprI6NQJrAYoQxiym6/rdSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9Xjeiz7rASO6SzRWX+G3Y7TZzn667qTCzDlxZPbMaANvBMlZp8wCbuOKod7Hw3amUoZ57cB3S2IdwbzxbdZRRsCvIIYlilqTIhiqyDoK+hYxbdg1M80DCPGKGP/UeIoJCIZEa+ea3jzzuwbKrSBwblFcoWrxerPLhIh5B5Qw4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sUUvy-0006QO-00; Thu, 18 Jul 2024 19:28:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id ABB43C014D; Thu, 18 Jul 2024 19:28:38 +0200 (CEST)
Date: Thu, 18 Jul 2024 19:28:38 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Switch to SYNC_R4K
Message-ID: <ZplQxmWwujQkBU5w@alpha.franken.de>
References: <20240714-loongson64-cevt-r4k-v1-1-98afed7260aa@flygoat.com>
 <e68b7f44-8a3c-4963-8d95-be8747bf9a61@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e68b7f44-8a3c-4963-8d95-be8747bf9a61@app.fastmail.com>

On Thu, Jul 18, 2024 at 03:34:30PM +0800, Jiaxun Yang wrote:
> 
> 
> 在2024年7月14日七月 上午10:41，Jiaxun Yang写道：
> > Nowadays SYNC_R4K is performing better than Loongson64's
> > custom sync mechanism.
> >
> > Switch to SYNC_R4K to improve performance and reduce code
> > duplication.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> > Last minute for 6.11 :-)
> 
> Hi Thomas,
> 
> Could you please apply this to 6.11 PR, or 6.11 fixes?
> 
> This is technically a left over of previous clock source series, and it does help
> on preventing random RCU stall for multi-node Loongson-3 systems.

if Huacai is ok with it, I'll add it to a second PR for 6.11.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

