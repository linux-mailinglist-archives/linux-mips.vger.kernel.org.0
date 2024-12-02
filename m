Return-Path: <linux-mips+bounces-6834-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A869E0219
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 13:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38016283476
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 12:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB391D86C4;
	Mon,  2 Dec 2024 12:25:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26B51FC7C5
	for <linux-mips@vger.kernel.org>; Mon,  2 Dec 2024 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733142345; cv=none; b=LajjL0bnv6NE88Z6pte9XynNNEQtg+5+40YHZ4oNNVJIXASHehhiO8C4s5qQdw/wADyYVe4IP5s17nNa7SXZU6D2YB8cKoaG20qlA89mvpCS5sKbDKI2PUiPW2rEFZ0+MfDOfRLV96Cip1Ft2lIXIWYgTMANH4/GupiWxDA3jlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733142345; c=relaxed/simple;
	bh=ty7RxvlH1pdSU5kT8tIYIm/StEHiY9jsB92suVzgJBE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VUI9c/aPEcZwrC2vBmj2ZDoCtrCqFH1nbSxL4eXv2R9eFa/nE8NY0qW1ASHcXERs9dUd30v7UTI8egD5deOosz9YFnL2UChkw64xPWnDisiCQt7g2v1xauvrVjcN/KtTz/g0HnmFL9nPbmkam74wBep4SCl2I2fCd23S9v4NVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id BFE8B92009C; Mon,  2 Dec 2024 13:25:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B8D8C92009B;
	Mon,  2 Dec 2024 12:25:34 +0000 (GMT)
Date: Mon, 2 Dec 2024 12:25:34 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
cc: linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>
Subject: Re: [now with correct Cc] [RFC] weirdness in "MIPS: ptrace: introduce
 NT_MIPS_MSA regset"
In-Reply-To: <20241124043651.GA250598@ZenIV>
Message-ID: <alpine.DEB.2.21.2412021219570.44939@angie.orcam.me.uk>
References: <20241124043651.GA250598@ZenIV>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 24 Nov 2024, Al Viro wrote:

> 	Both msa_get() and msa_set() have very odd logics:
> 
> 	} else if (sizeof(target->thread.fpu.fpr[0]) == regset->size) {
> 
> and
> 
> 	if (sizeof(target->thread.fpu.fpr[0]) == regset->size) {
> 
> resp.
[...]
> So it looks like both checks are constant true.  What am I missing here?

 FWIW ISTM these are leftovers from an earlier version or suchlike.  
FAOD I haven't had anything to do with this code so this is based solely 
on visual inspection.  Also no MSA hardware available here to verify 
anything (but QEMU might do).  HTH.

  Maciej

