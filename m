Return-Path: <linux-mips+bounces-7612-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760DA1DC95
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 20:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D63433A413D
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 19:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4932518A6CE;
	Mon, 27 Jan 2025 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFxj5rfm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB217B50A;
	Mon, 27 Jan 2025 19:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005477; cv=none; b=QsuzMFLCBbriOkcW+QM708X5JsS0iXQhyxPaI5R2R+Uc5uzHRoyFVMyCYQ5ydqkEyvM6z+XwWki5hT20PBKdRXZm3QdcW7fLQRjdA6JzeHd/Oz7j4VGKUFrNtCCIMHpczmSuAUDjW/el6r4j83BxK+4iqVeH7evZyuabtsyq7F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005477; c=relaxed/simple;
	bh=r9YoCzMn+S7Rp21hkZ42NQlHWCOwaqNEe0i3f9P/rhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQ/YqLrq3YJSYtxcAvvi6u6igPxspWYxkfpSNO7ItpR+KnZ9jGNMg5JJgnqQJyl8hmaX0roLWXEZR1b4t4Ax8CS/Q78SkG67HqB+kS8yPYY+7AIcUmUH/2I5uCWQATSrB2HKYwCQLm4wLBBqPf5ArNBH1/vMycdo+NohLXPTUUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFxj5rfm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86628C4CED2;
	Mon, 27 Jan 2025 19:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738005476;
	bh=r9YoCzMn+S7Rp21hkZ42NQlHWCOwaqNEe0i3f9P/rhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFxj5rfm0IvZCUg/tO+0gBKuTznDKVK80+04mTG8YN1sFlvh2MJwAuIZMiTjG9A6i
	 Zj3XKiNoNTB3HjMLBZfUs/wmfkT0rscnJ518VQLQjH6La8oJDOjP0V+WgMTgys1SZR
	 jiPgowA8IKkJUH0X7Sqta7HcPXUC40RQmwa+6vHSadAxGbi7LpSQG0i83yFSsj6e09
	 vp+dwfJiiCBLQdkpMVTuZ3no03/rXMX42JsDnDG7o4aguNZutfDGGdO9mG9fvXoAIY
	 1/g3PpUQh2x1t2aEEYavbMnvun0Md/mwcEmOfVW860NZYefJiCQUke9jFTVpD/gtxU
	 JPFv+07PAiAtw==
Date: Mon, 27 Jan 2025 11:17:52 -0800
From: Kees Cook <kees@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] seccomp: kill the dead code in the
 !CONFIG_HAVE_ARCH_SECCOMP_FILTER version of __secure_computing()
Message-ID: <202501271117.E00B5250@keescook>
References: <20250120134409.GA21241@redhat.com>
 <20250120134452.GA21275@redhat.com>
 <202501201353.168E6AAC8@keescook>
 <20250121143038.GB3422@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121143038.GB3422@redhat.com>

On Tue, Jan 21, 2025 at 03:30:39PM +0100, Oleg Nesterov wrote:
> How about
> 
> 	__secure_computing()
> 	{
> 		return secure_computing_strict(syscall_get_nr(...));
> 	}
> 
> in the "#ifndef CONFIG_HAVE_ARCH_SECCOMP_FILTER" section near
> secure_computing_strict() in kernel/seccomp.c ?

Yeah, that should be good.

-- 
Kees Cook

