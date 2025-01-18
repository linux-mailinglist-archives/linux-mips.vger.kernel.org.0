Return-Path: <linux-mips+bounces-7503-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C3DA15C60
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 11:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03CA03A7EFE
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 10:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DA818859A;
	Sat, 18 Jan 2025 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b="yX0E5LlK"
X-Original-To: linux-mips@vger.kernel.org
Received: from minute.unseen.parts (minute.unseen.parts [139.162.151.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE06618755C;
	Sat, 18 Jan 2025 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.151.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737196611; cv=none; b=CUnD8iau942JYTVi4doAcGHKT1u73y3riuj4K0MNp7u+ng24aRnQRHlpzdDFfYP7Lgki1GCQoW9idB9jdYl8R4B5Bd9jKSL5gQyZ5+XVaOrjsGZI6OqGhbfhet80DQBsAsqPMK2XxV6robhUUSyzrRGgNuU8jrneADVH9quXFm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737196611; c=relaxed/simple;
	bh=/WL9Al1gHJtt5RyHtH8e1SSbM0KijPA5LnNJsgpki20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmNCJZs3S9GfPNwwl1W0meo2K8kate7iGI1P6P1ObW66p6xhPO2qS1pLKSRqIPDcxw2jqq1XIL0QP9ryRBMgzIiHbWIM3eivw36pwrrShp+VygAVu2eTxxgzEtsEdFoDfmTINE2AY5UbSroy1o36SeKm0kYtKEv+6IGTjuezowo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts; spf=pass smtp.mailfrom=unseen.parts; dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b=yX0E5LlK; arc=none smtp.client-ip=139.162.151.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unseen.parts
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unseen.parts; s=sig; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c9nSAqqWxyLaQqHtxXscYRgnpeMDtXLRxxYGRZPtQRA=; b=yX0E5LlK9F2HN4W1Zv9JcuRMTX
	qqomh8v1zoxquNIyyvGByazKGWw7JHdNxdbnv2e8QxK2R1DvLGhgucUJfYOi66IEreurkcfZR81KR
	5k7qoIGAVBT4Cs1Ptu6FuEiNXRo/VUlP4fwsCouDBR+JKfWepdPIx9hiIL12wyeo8ly32hQKvqAmg
	pATkNY4JwZVfVWSdLDXoKe+pN8Fg6sj/CTjoRk+I6X9F2WrmjkGQ2onLIz1DsLeIWNnGOw4jTMapW
	N6DJNCaaDE6clMZV1JZtc7Bhb/wjgbmByiIlVMBDph8awc6rE9tZG8+/bQ7i6Nq1PzpmWkNQ8DrxB
	WpxzQz8w==;
Received: from minute.unseen.parts ([139.162.151.61]:46722 helo=minute)
	by minute.unseen.parts with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <ink@unseen.parts>)
	id 1tZ6BI-0006Jw-1V;
	Sat, 18 Jan 2025 11:35:56 +0100
Date: Sat, 18 Jan 2025 11:35:54 +0100
From: Ivan Kokshaysky <ink@unseen.parts>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Kees Cook <kees@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-alpha@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>,
	Sam James <sam@gentoo.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
	Chris Hofstaedtler <zeha@debian.org>, util-linux@vger.kernel.org,
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v2] alpha/elf: Fix misc/setarch test of util-linux by
 removing 32bit support
Message-ID: <Z4uECl9wQ2sqdKym@minute>
References: <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
 <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
 <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
 <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
 <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
 <2758fa70d237ff972b0c8d7114777dc4a20c8f3b.camel@physik.fu-berlin.de>
 <alpine.DEB.2.21.2501120146480.18889@angie.orcam.me.uk>
 <78f3ae1f68842a9d1af62caaac3929834ce6ecfa.camel@physik.fu-berlin.de>
 <87y0zfs26i.fsf_-_@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0zfs26i.fsf_-_@email.froward.int.ebiederm.org>

On Sun, Jan 12, 2025 at 11:39:01PM -0600, Eric W. Biederman wrote:
...
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -360,7 +360,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  
>  extern void paging_init(void);
>  
> -/* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
> +/* We have our own get_unmapped_area */
>  #define HAVE_ARCH_UNMAPPED_AREA

Just remove the definition. As the comment suggests, the only reason
it exists is ADDR_LIMIT_32BIT, which is gone.

> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -1210,8 +1210,7 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __user *, txc_p)
>  	return ret;
>  }
>  
> -/* Get an address range which is currently unmapped.  Similar to the
> -   generic version except that we know how to honor ADDR_LIMIT_32BIT.  */
> +/* Get an address range which is currently unmapped. */
>  
>  static unsigned long
>  arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
> @@ -1230,13 +1229,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  		       unsigned long len, unsigned long pgoff,
>  		       unsigned long flags, vm_flags_t vm_flags)
>  {
> -	unsigned long limit;
> -
> -	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
> -	if (current->personality & ADDR_LIMIT_32BIT)
> -		limit = 0x80000000;
> -	else
> -		limit = TASK_SIZE;
> +	unsigned long limit = TASK_SIZE;
>  
>  	if (len > limit)
>  		return -ENOMEM;

Likewise, just remove these functions. The generic_get_unmapped_area()
works fine, tested on up1500.

Ivan.

