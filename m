Return-Path: <linux-mips+bounces-8072-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B825A4BAFF
	for <lists+linux-mips@lfdr.de>; Mon,  3 Mar 2025 10:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60AA01891A56
	for <lists+linux-mips@lfdr.de>; Mon,  3 Mar 2025 09:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD2F1EBA1C;
	Mon,  3 Mar 2025 09:42:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5791CDFCA;
	Mon,  3 Mar 2025 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740994970; cv=none; b=aQ4rrmxe7OCQa6XX4JUPUdPi/nwDvWq2KQJj5zNsaxA1UYCefLooQ1Cnig5lI4naknpdHyps5aApZlNeJFfFRm3R1UKf/MamldhD9VgokRxEfCBzWeYzOV0Vy2loAZwYE3FxQeir1kMA0ivNOvVPvW9a0rxRKJHibtvpuzr0+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740994970; c=relaxed/simple;
	bh=8ubVrzYWizR6osHcNQDP+rw/4ntNCFl4JDZQ0PLFcrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svYUS8GDQokQMVgXY8h4aKgeUHuPW6V29dRP4R4xA8RLu+kVOt/gXuBdu6YvAvlgQP1j/HFHCu6QsxzqLkR4xH+i5Q6PFx0RsGwk6a1d1QTOiC4hgO9hjE+3MwHfXlz+0pan5uVx+JDVIOsAzR2/mSpxs3O0HogvfCg9yrpRE3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tp2Jo-000182-00; Mon, 03 Mar 2025 10:42:36 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A3488C0135; Mon,  3 Mar 2025 10:06:45 +0100 (CET)
Date: Mon, 3 Mar 2025 10:06:45 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: WangYuli <wangyuli@uniontech.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, chenlinxuan@uniontech.com,
	guanwentao@uniontech.com, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, niecheng1@uniontech.com,
	zhanjun@uniontech.com
Subject: Re: [PATCH 5/7] MIPS: dec: Remove dec_irq_dispatch()
Message-ID: <Z8VxJbTqHhIE-Q-w@alpha.franken.de>
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
 <222468E85948B141+20250218125842.667798-1-wangyuli@uniontech.com>
 <alpine.DEB.2.21.2502220019210.65342@angie.orcam.me.uk>
 <A1142BF8B63D5EC4+98768bf8-7bde-46ec-85fc-f077d67a1798@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A1142BF8B63D5EC4+98768bf8-7bde-46ec-85fc-f077d67a1798@uniontech.com>

On Mon, Mar 03, 2025 at 12:23:13PM +0800, WangYuli wrote:
> Hi Maciej,
> 
> On 2025/3/1 00:01, Maciej W. Rozycki wrote:
> >   Up to commit 8f99a16265353 ("MIPS: Tracing: Add IRQENTRY_EXIT section for
> > MIPS") `do_IRQ' used to be a macro, that's why.  At the time `do_IRQ' was
> > converted to a macro `dec_irq_dispatch' was created and previously this
> > place used to call `do_IRQ' too.
> > 
> >   It's always good finding out why things are as they are so as to make
> > sure you haven't been missing something.  This cleanup should have been
> > made along with commit 8f99a16265353, so it's pretty old a technical debt
> > being sorted here.
> > 
> >   Please add these findings to your commit description in v2.
> 
> Alright, thank you for the correction.
> 
> I do see that this commit has already been applied to mips-next.
> 
>  If it's alright with you and Thomas, I'm happy to send a patch v2 to
> include these details soon.

I'll drop the applied patch and take your v2.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

