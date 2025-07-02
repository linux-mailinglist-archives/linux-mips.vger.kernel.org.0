Return-Path: <linux-mips+bounces-9603-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24286AF58F4
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 15:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC2157BB353
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 13:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA56275AFF;
	Wed,  2 Jul 2025 13:19:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A0227735;
	Wed,  2 Jul 2025 13:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462343; cv=none; b=fkHqb3EWEj47KOQzpsZAZzZOUrjxswyy5EmKCwtincB6YsxtW6q6nJLl92bm6gmW/nDdJ6UcZfgMPnmTMDAnfvg0NdsQVhMNhld8xsxNLA7f93gqZevhds0vLQbWCGfgZGeRknAyf6FDAEHb6ZzvdZYSGsBmgzkEPeafqQpI7UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462343; c=relaxed/simple;
	bh=QAwDg8AZhLOV8WryL5g2y7bANhcj6k8F/gQErZRvyrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVQEHykEB5c2Hw3qHSPsmuzBhvDMga8sYnLe3aTbz8gDiMt5zagYO4TnjAJP11xsDXPyz/Q6kpplhNAoNo3yJ0x4MeoT2pt4I9DbxOpmnSmdqf0Z/CwQzmibC6mqOzlechiCt2bpr6M8f+iLOvLgogPepLFRcFahSWYwcrsWUnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uWwab-00058Q-00; Wed, 02 Jul 2025 14:29:25 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 989A3C0C1C; Wed,  2 Jul 2025 14:14:47 +0200 (CEST)
Date: Wed, 2 Jul 2025 14:14:47 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: boot: use 'targets' instead of extra-y in Makefile
Message-ID: <aGUit7vdpeC1jVm8@alpha.franken.de>
References: <20250608015136.2960777-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608015136.2960777-1-masahiroy@kernel.org>

On Sun, Jun 08, 2025 at 10:51:34AM +0900, Masahiro Yamada wrote:
> vmlinux.bin.* files are built as prerequisites of other objects.
> There is no need to use extra-y, which is planned for deprecation.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/boot/Makefile | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/boot/Makefile b/arch/mips/boot/Makefile
> index 196c44fa72d9..8473c4671702 100644
> --- a/arch/mips/boot/Makefile
> +++ b/arch/mips/boot/Makefile
> @@ -54,10 +54,10 @@ UIMAGE_ENTRYADDR = $(VMLINUX_ENTRY_ADDRESS)
>  # Compressed vmlinux images
>  #
>  
> -extra-y += vmlinux.bin.bz2
> -extra-y += vmlinux.bin.gz
> -extra-y += vmlinux.bin.lzma
> -extra-y += vmlinux.bin.lzo
> +targets += vmlinux.bin.bz2
> +targets += vmlinux.bin.gz
> +targets += vmlinux.bin.lzma
> +targets += vmlinux.bin.lzo
>  
>  $(obj)/vmlinux.bin.bz2: $(obj)/vmlinux.bin FORCE
>  	$(call if_changed,bzip2)
> -- 
> 2.43.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

