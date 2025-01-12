Return-Path: <linux-mips+bounces-7405-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0BA0AA27
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2025 15:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9152D1886AAA
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2025 14:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BAC1B87D1;
	Sun, 12 Jan 2025 14:40:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0C91B87D0;
	Sun, 12 Jan 2025 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736692850; cv=none; b=Ko6zJ4DkP8TTv99hN/ywWZb9Sm3n6cNECRT3RCcSqOIlwYiCZIMbtqa9zUdWN7ppNIMWW3rbx2mpNJsfCgSZUTDv9czGBwIi+lMKiCIfW5QjIJS1xuvvvY9pCYCO8vuou+/kAaF+WhZyO1iI4TU6nkJp1AiD3az3jwDZvbzOQRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736692850; c=relaxed/simple;
	bh=9C9h0VvJA6e7oXetjCEhkUvi0pepYoj5uE9TkxBxFzI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qLFUU7C0UANbZ2uLXd2LfRGM2V74MldtjhAmmle//ZOOGgbGgY42OvWk+FYE2g+HzB3pST22wrZYjNUdg09mEeTkxCq/hd8Z4ccAigxk8QMyjGNKrPLnIDkObil6a6l5SbElx3fAbxNp+kHJMK2EFWmsGYey260J8cjepgoKVm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1062B92009C; Sun, 12 Jan 2025 15:40:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0ABA392009B;
	Sun, 12 Jan 2025 14:40:48 +0000 (GMT)
Date: Sun, 12 Jan 2025 14:40:47 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: "Eric W. Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, Kees Cook <kees@kernel.org>, 
    "Paul E. McKenney" <paulmck@kernel.org>, linux-alpha@vger.kernel.org, 
    linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
    Michael Cree <mcree@orcon.net.nz>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, 
    Chris Hofstaedtler <zeha@debian.org>, util-linux@vger.kernel.org, 
    linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH] alpha/elf: Fix misc/setarch test of util-linux by removing
 32bit support
In-Reply-To: <2758fa70d237ff972b0c8d7114777dc4a20c8f3b.camel@physik.fu-berlin.de>
Message-ID: <alpine.DEB.2.21.2501120146480.18889@angie.orcam.me.uk>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>  <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>  <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>  <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de> 
 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>  <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>  <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org> <2758fa70d237ff972b0c8d7114777dc4a20c8f3b.camel@physik.fu-berlin.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 11 Jan 2025, John Paul Adrian Glaubitz wrote:

> > the EF_ALPHA_32BIT flag set.  Just to fail explicitly in case someone
> > somewhere has binaries that trying to use alpha's 32bit pointer
>                             ^^^ are

 If nitpicking, I'd say just "try".

  Maciej

