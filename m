Return-Path: <linux-mips+bounces-12901-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A44D1CA7A
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 07:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B940B3007F1C
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 06:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6736A36C599;
	Wed, 14 Jan 2026 06:19:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6025A3557E2;
	Wed, 14 Jan 2026 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768371556; cv=none; b=uIApsvKK7gETwGI6Rw0zY2EaTsYkG6LU5a3iacRKvbKRFG4tsGF8iygHHBp0VuzUQRIoYuji8EyvS5wRcBUHaIf4bZfvP9adFrapL61yHtSSoODcWZWhk5jF7Gax98gOiIVGPo8HAcNd6HdXlRFRMekjhMBIkXJh7aykmg/AA+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768371556; c=relaxed/simple;
	bh=GiT36aDrXhRnQSF0R052K+a8lgv9jLl4XPf3kpNrUh4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Uc0fn22pMOe1dE0TnT1ygGRMK+DvO1FzDFdkB0tvnp/htV6XDdQa45zTsymQOeOsu5n2RceYcCjCZoNUqSK40u67PukZA2N0kBnEImO64O5or97dMnjV8r19S8etwEh7TEETOKdmgsRUno01bunW3zoTcvVDb6+OmD3CGSx8DfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3824192009D; Wed, 14 Jan 2026 07:19:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 361CE92009C;
	Wed, 14 Jan 2026 06:19:02 +0000 (GMT)
Date: Wed, 14 Jan 2026 06:19:02 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Laight <david.laight.linux@gmail.com>
cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    Nicolas Pitre <npitre@baylibre.com>, linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: mips64-linux-ld: div64.c:undefined reference to `__multi3'
In-Reply-To: <20260113200455.3dffe121@pumpkin>
Message-ID: <alpine.DEB.2.21.2601140453090.6421@angie.orcam.me.uk>
References: <202601140146.hMLODc6v-lkp@intel.com> <20260113200455.3dffe121@pumpkin>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Jan 2026, David Laight wrote:

> > All errors (new ones prefixed by >>):
> > 
> >    mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
> >    div64.c:(.text+0x84): undefined reference to `__multi3'
> > >> mips64-linux-ld: div64.c:(.text+0x11c): undefined reference to `__multi3'  
> > 
> 
> This looks like a bug in the mips 'port'.
> arch/mips/lib/multi3.c has the comment:
> 
> /*
>  * GCC 7 & older can suboptimally generate __multi3 calls for mips64r6, so for
>  * that specific case only we implement that intrinsic here.
>  *
>  * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82981
>  */
> #if defined(CONFIG_64BIT) && defined(CONFIG_CPU_MIPSR6) && (__GNUC__ < 8)
> 
> So this code is excluded for gcc 8.5 but the compiler is generating the call.
> 
> Looking at the git log for that file there is a comment that includes:
> 	"we wouldn't expect any calls to __multi3 to be generated from
> 	 kernel code".
> Not true....
> Not sure why the link didn't fail before though, something subtle must
> have changed.
> 
> I think the fix is just to remove the gcc version check.

 Or rather fix the version check.  The GCC fix went in with GCC 10:

$ git log -1 --pretty=oneline 48b2123f6336
48b2123f6336ba6c06846d7c8b60bd14eaeae7ec re PR target/82981 (unnecessary __multi3 call for mips64r6 linux kernel)
$ git show 48b2123f6336:gcc/BASE-VER
10.0.0
$ 

I don't know why the PR got it all wrong; I've fixed it now.

  Maciej

