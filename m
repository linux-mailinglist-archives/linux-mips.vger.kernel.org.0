Return-Path: <linux-mips+bounces-3272-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4558C5E30
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2024 01:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC7EC1C20D33
	for <lists+linux-mips@lfdr.de>; Tue, 14 May 2024 23:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C7D182C9C;
	Tue, 14 May 2024 23:49:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612841E491;
	Tue, 14 May 2024 23:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715730576; cv=none; b=MnCEU1Eba+gFqvyRtGL3jQ6SpuT84qKHHXu2ZZXmFHMZGekgU6zGZgecZDa52ztjuuvHgpKfvc2JhwMqhS12zj9AciSqjaIQgQRyr9NJelERrNHXJn9jD0svrxQkzwI4ETjsn5Xaoqvz6QTQF9P7S53HgV1k6jE8eDL/fXHSBl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715730576; c=relaxed/simple;
	bh=qbv3bhwyolQ2fa4CHsQpjgG2qUfpyh+slSW4CMlvmwU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=u/mSud9hkSORck18V5YeF1I7NtHI8N8PXovP1MgWDoXuZ8JTgjpLrx22+CvKRhD8Ez3BKBZqzG5XOQgFvbsKYbfALuN5XNfHe8a17en6xHM9HbsGPyPwsL6PyZrb5V07Ow3mTMz/8MlOurTt6aFvaIWTFil9FqPZV89mL3eA5VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 84BC592009C; Wed, 15 May 2024 01:49:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7EB5A92009B;
	Wed, 15 May 2024 00:49:31 +0100 (BST)
Date: Wed, 15 May 2024 00:49:31 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Joe Perches <joe@perches.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: sibyte: pointless if tests
In-Reply-To: <2cf0b77f51b907969ae83993854773961b4e159c.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2405150010470.45291@angie.orcam.me.uk>
References: <2cf0b77f51b907969ae83993854773961b4e159c.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 24 Feb 2024, Joe Perches wrote:

> Here are a couple in sibyte:
> 
> Maybe this should be documented as:
> 
> 	"well, don't know what to do here"

 Of course just removing these useless conditionals isn't going to help 
here because if a console write does fail for some reason, then the index 
will move backwards regardless.  At least we now have some kind of a 
placeholder to bring someone's attention (such as yours).

> $ spatch --very-quiet -sp-file if_semi.cocci .
> diff -u -p ./arch/mips/sibyte/common/cfe_console.c /tmp/nothing/arch/mips/sibyte/common/cfe_console.c
> --- ./arch/mips/sibyte/common/cfe_console.c
> +++ /tmp/nothing/arch/mips/sibyte/common/cfe_console.c
> @@ -22,8 +22,6 @@ static void cfe_console_write(struct con
>  		if (str[i] == '\n') {
>  			do {
>  				written = cfe_write(cfe_cons_handle, &str[last], i-last);
> -				if (written < 0)
> -					;
>  				last += written;
>  			} while (last < i);
>  			while (cfe_write(cfe_cons_handle, "\r", 1) <= 0)

 The author indeed clearly was undecided as to what to do as the full last 
statement here is actually:

			while (cfe_write(cfe_cons_handle, "\r", 1) <= 0)
				;

potentially looping indefinitely.

 The CFE API clearly says:

Error codes:
      Code              Description
      CFE_ERR_INV_PARAM File handle is invalid
      others            Device may return device-specific error codes

and maybe CFE never actually fails for a console device write (I'd have to 
check the sources if there are any "others" for the console device and I'd 
assume the console file handle is always valid), but IMO the safe approach 
would be just to chicken out and silently return on a failure from any of 
these calls.  Also this code has been oddly written IMO and would benefit 
from some refactoring.  I'll see if I can queue a patch.

  Maciej

