Return-Path: <linux-mips+bounces-7558-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B86A1745A
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 22:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503C8188A98E
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 21:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A111EEA5F;
	Mon, 20 Jan 2025 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4lq3qPj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8781123A9;
	Mon, 20 Jan 2025 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737410078; cv=none; b=K5vlwo+eeTbp3ZL9FQzXOb9zWUKhr2qH7O/qNmPRJRoBChOU9qG3RrRHgz4zkM+/MnzeqsIvQLx36gWG6LP7dmJUdAgm6Zum3H/fLjRCrGMkbBU5c9v1KF6ENCiU5pGl6oNwYP2B9QS6j5v8O0BGDHLPNIgCxPr8JzuoZkE1cFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737410078; c=relaxed/simple;
	bh=FTNVSUbh2PWTc4zJ8DnJqkFLz/kXMkSs1jq7XJrn7yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cugbnSpVB9R43ninzgVukc3/p9sYQ/Nv3OKD8C+zsQl3+vLqN9JNgjo7bMiKOGX6HhNQ3fmeFOtKWR9h70j3aZ+ypUxIu2p0SAeLUMcjgzKzd+DMaauD2DOZ62yL72wS0zlPgc7humhVL0BmehW6vS68ByOMK9ZwjX1eKylQYMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4lq3qPj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F4BC4CEE1;
	Mon, 20 Jan 2025 21:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737410078;
	bh=FTNVSUbh2PWTc4zJ8DnJqkFLz/kXMkSs1jq7XJrn7yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R4lq3qPjkaty+B9MZVUJMBEtN18EE/1NYlWpZrSPIOVz9PwI+vmjdGMRFscMEjKtk
	 eoGuNLy988ukdqRItKpN1JIBfjgxAhW5YrVwHZ17ajr7c2PIOTXTlShTJjvLl8Uwbq
	 OWQgorVgP+nXecpsnVtYxlUiYl3uinWxLqn1tgeiPV3HTlutvrcetE3VAGK8Kvzlsp
	 pV+G4TaI9gnJwHBUx6l/wPoqyUSpn/62NGn1sl+1AJ83TpFurVnWW2oXm0nhg3x2fE
	 opqAwfhGizhqXtJzUcD7cHOIQrHT+pAXZ0OzcLipktjANtAq9aywGBuq4XJ3HK+y/R
	 UMa67C8A7+vYA==
Date: Mon, 20 Jan 2025 13:54:35 -0800
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
Message-ID: <202501201353.168E6AAC8@keescook>
References: <20250120134409.GA21241@redhat.com>
 <20250120134452.GA21275@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120134452.GA21275@redhat.com>

On Mon, Jan 20, 2025 at 02:44:52PM +0100, Oleg Nesterov wrote:
> Depending on CONFIG_HAVE_ARCH_SECCOMP_FILTER, __secure_computing(NULL)
> will crash or not, this is not consistent/safe.

Right now this never happens because there are no callers.

> Fortunately, if CONFIG_HAVE_ARCH_SECCOMP_FILTER=n, __secure_computing()
> has no callers, these architectures use secure_computing_strict().

As you say here.

> Also, after the previous change __secure_computing(sd) is always called
> with sd == NULL, so it is clear that we can remove the code which makes
> no sense.

However, after this change, if someone were to *add* a caller, it would
bypass strict mode. Instead of "return 0", it seems like it'd be better
to remove the function entirely (and maybe add a comment about calling
secure_computing_strict() directly)?

> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  include/linux/seccomp.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
> index e45531455d3b..e01dfe57a884 100644
> --- a/include/linux/seccomp.h
> +++ b/include/linux/seccomp.h
> @@ -32,11 +32,7 @@ static inline int secure_computing(void)
>  }
>  #else
>  extern void secure_computing_strict(int this_syscall);
> -static inline int __secure_computing(const struct seccomp_data *sd)
> -{
> -	secure_computing_strict(sd->nr);
> -	return 0;
> -}
> +static inline int __secure_computing(const struct seccomp_data *sd) { return 0; }
>  #endif
>  
>  extern long prctl_get_seccomp(void);
> -- 
> 2.25.1.362.g51ebf55
> 

-- 
Kees Cook

