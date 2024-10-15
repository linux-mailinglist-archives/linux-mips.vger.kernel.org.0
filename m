Return-Path: <linux-mips+bounces-6049-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE6E99DC00
	for <lists+linux-mips@lfdr.de>; Tue, 15 Oct 2024 04:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0067B2834AB
	for <lists+linux-mips@lfdr.de>; Tue, 15 Oct 2024 02:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2D014F9FF;
	Tue, 15 Oct 2024 02:01:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DAC41C63;
	Tue, 15 Oct 2024 02:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728957685; cv=none; b=gdTU5p/RarBeZ7mLWoFascg4no7BhM+3KAO2wSpOIotAKvRSwpBazs+URY/MdPxGYLlvuG6Qtc/yT7F2gUAmZTa1s9pHTad3Tcb1p0Id8oJVfnlRTUj/iTo/fzilrtep5egQjpuObV8fA4W7w1GSr8uhUh/h1CqYUNxu9mUFdkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728957685; c=relaxed/simple;
	bh=DTyI8SRxp7jPsONaFnChyUkuV4JPvnXIdwINlLHvqOQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MX8viaAz6xy9CLUeX3CtV4s2ii9Aeecs0zSrpxomvKsWlOflZOF1kmX82nkscnmjyN08RSq+FYZLCz2lnG6lbnimKKAXhfjZAKPmo/MkqposE97khrlG6+R4CiSKl20PJU98bt7d60F/CeamV+VIPVF8e88SGqtCjj/Rj+6DtkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E6EE492009C; Tue, 15 Oct 2024 04:01:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E00EB92009B;
	Tue, 15 Oct 2024 03:01:13 +0100 (BST)
Date: Tue, 15 Oct 2024 03:01:13 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, zhanggenjian@kylinos.cn, 
    ricardo@marliere.net, bvanassche@acm.org, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] mips: sgi-ip22: Replace "s[n]?printf" with sysfs_emit
 in sysfs callbacks
In-Reply-To: <Zw2GRQkbx8Z8DlcS@mail.google.com>
Message-ID: <alpine.DEB.2.21.2410150220160.40463@angie.orcam.me.uk>
References: <Zw2GRQkbx8Z8DlcS@mail.google.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Oct 2024, Paulo Miguel Almeida wrote:

> snprintf() has the documented, but still rather strange trait of
> returning the length of the data that *would have been* written to the
> array if space were available, rather than the arguably more useful
> length of data *actually* written, [...]

 Why do you think that just returning `n - 1' in the case of a length 
overflow would be more useful than returning the unmet buffer length 
requirement?  I think the opposite is the case: the value returned lets 
you reallocate the buffer for more space and retry, and there's no other 
way to figure out how much this would be.  And if you need to know how 
many characters were actually written, then `min(n - 1, snprintf(...))' 
will do (and code you propose to replace does exactly that, open-coded).

 The change itself makes sense to me, but not your proposed description 
I'm afraid.  Just replacing open-coded pieces with calls to `sysfs_emit' 
is enough justification.

  Maciej

