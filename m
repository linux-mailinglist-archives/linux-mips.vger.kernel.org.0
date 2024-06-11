Return-Path: <linux-mips+bounces-3564-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E27D90395E
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 12:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9924E2895C9
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 10:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877CF178385;
	Tue, 11 Jun 2024 10:55:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71AA54750;
	Tue, 11 Jun 2024 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718103346; cv=none; b=EElGbodMI4rWYrfUTaWC8s+KLs+qMM1S0G7VWjmtHzT3dArrvCzWN6KsLsAHVW6CeIAhUn3W1aqECzXXCh2Rv8tYLFl3JOk1AmAuK5/9GKqEWVP24absKEtNQ4lN9zrp6/xn9A7uM9PS/4XqnCgKnvOZiWjpSVrxzrtwNsDjvfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718103346; c=relaxed/simple;
	bh=7PiVZWBQ7T3V+IYy6XeibQQwd31KDTQIRC1F4q0R7QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPD/0B0iPZU6HtKzkGuVxNl6c/3mh6K+pqeeHpR0CXwLx+SwIiiKxz0LJpEpOVkcLAcM4mvQ1Lg4Ng7ClOBW1njtcF9Ob38W9vh4Dmc01qXoChI5V8Un7u351bfEizYP/sEaS67bbg7HJFPyI5IIERxk5CGeDgtblIev3KIoyAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sGzAC-0001OE-00; Tue, 11 Jun 2024 12:55:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9E694C0120; Tue, 11 Jun 2024 10:54:33 +0200 (CEST)
Date: Tue, 11 Jun 2024 10:54:33 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] MIPS: Alchemy: Switch to use kmemdup_array()
Message-ID: <ZmgQyXq83Pscu2Pv@alpha.franken.de>
References: <20240606165145.3032150-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606165145.3032150-1-andriy.shevchenko@linux.intel.com>

On Thu, Jun 06, 2024 at 07:51:45PM +0300, Andy Shevchenko wrote:
> Let the kememdup_array() take care about multiplication and possible
> overflows.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/mips/alchemy/common/platform.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

