Return-Path: <linux-mips+bounces-9925-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92733B13168
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jul 2025 21:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 469C83ACDB5
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jul 2025 19:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC131C5D72;
	Sun, 27 Jul 2025 19:01:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72214213E6A;
	Sun, 27 Jul 2025 19:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753642919; cv=none; b=p/x000UgSR2qntVaM+ZMGIcrA44J4R5/Se3oplvtRi++NMzWxoF77IbrBAP+eNH3+hiwcIEe/0/azPuond3gOi1lyr+Ctyf1DSZti/tMlw1zs9rRU8+OGaRR5WOw4ODi/NyYs7Sc89/m9WQSC1lHDyKZqXFKTH3yAhziSEZ8eXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753642919; c=relaxed/simple;
	bh=C72CnXlCjAGJWRRe8EzOtYYuUq0AFT09OXChtU+PxaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDfpZ2JtV89jBp5vq25WKw7flZvpmwPBCWJFd3JjFCpJ29EAwgDb5ISgWMEoYgVOxQbWzRbCIlVioKJ7Orf0ZdUd7Hjew9cMsYd2klUDKAwpdi6ISNmWTNGupdntzwEhRb7RSGdGNULZS0o54iT8Sv/GVdm3sBYkJjkp/zJNDEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1ug6d0-0007HT-00; Sun, 27 Jul 2025 21:01:46 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 59DF6C035D; Sun, 27 Jul 2025 21:01:35 +0200 (CEST)
Date: Sun, 27 Jul 2025 21:01:35 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] MIPS: alchemy: gpio: use new GPIO line value setter
 callbacks for the remaining chips
Message-ID: <aIZ3j3EjjGu5a-w2@alpha.franken.de>
References: <20250727082442.13182-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727082442.13182-1-brgl@bgdev.pl>

On Sun, Jul 27, 2025 at 10:24:42AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Previous commit missed two other places that need converting, it only
> came out in tests on autobuilders now. Convert the rest of the driver.
> 
> Fixes: 68bdc4dc1130 ("MIPS: alchemy: gpio: use new line value setter callbacks")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Thomas: this flew under my radar until it came out in autobuilder tests
> now. Thomas: if it's too late for you to take it through the MIPS tree
> for v6.17, can you Ack it and let me take it directly through the GPIO
> tree? This change is needed for us to complete the rework of GPIO
> callbacks during the next cycle.
> 
>  arch/mips/alchemy/common/gpiolib.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

