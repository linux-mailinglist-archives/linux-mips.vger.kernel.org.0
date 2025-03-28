Return-Path: <linux-mips+bounces-8397-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2EBA75112
	for <lists+linux-mips@lfdr.de>; Fri, 28 Mar 2025 20:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1BC3174DE6
	for <lists+linux-mips@lfdr.de>; Fri, 28 Mar 2025 19:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BB21E5202;
	Fri, 28 Mar 2025 19:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="Mq5LDGpc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02391322B;
	Fri, 28 Mar 2025 19:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743191844; cv=none; b=DnlumpIwHz1PSGWXTmvvf4qvUX8tgqtCOr6RKud3hfDpj6gbYiD46p2XjBThOX2D88b1v/ft9nB9YbSWfF1xxXCvfqfxSxX2Aj1W/cSAVEHB88HaCjrVQf8ocTd5CsYp9hiJ7DU6yBW20HRR6c9omqS7j6xqh7hQo1jw7LS5Q8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743191844; c=relaxed/simple;
	bh=jK5o0+UAvCpgd+K8DPN/etuOyl5N+4vZ7kVjYbr6hKw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=u0uqhQ/PjpkIEAZwRN6pZUn0rKs3GQOjrQ5bzCnmEna2nYKboq/Zsy8nKyvskStlNbY3Jzq6LAH0zHcF4566MLXKCGUCf5iqRqqRPDadflceWOuVdzgs/zYOj+nrPsyv0aIFaQMyXvY5Ow7J3sxsmOwr8zBTHCB1tYO/N8bmgA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=Mq5LDGpc; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:From:Sender:Reply-To:
	Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=V3YydQPYPrtlLxnVNKUtllEv3FC7Dhodkj47vEwhPQk=; b=M
	q5LDGpctSytdWp9XF910Bj0AVkwqIpkNuooJBEgxrFuErMj4+e43x8a64AXCH/YTlxoCTNW7r6G7J
	a5rGUofqlkSOqiu5X33ItHaQRn7LNrALY8YvuGosERyNo1TUubIiA6rmweEbead3AGxoTwlj5LRkt
	xz5VBLSyHCJ1Hgem7igyx8R2KD7DswWr8VASTR22kH41JbRQQS3RaRLEiaodTdIQV8f/7fnpMrX+b
	11IyZVvejwgjhKGXKrlmZPNLiwUrY2JoRnGLCx+ud5lRr+SEu8vTfdzJZvmMrjDYw6BvtyBL2XK4q
	0sr4yFEzZdJveLlP6Uj4p4N+tMtm/wP+Q==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tyFpB-0024un-HS;
	Fri, 28 Mar 2025 20:57:05 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2025 20:57:01 +0100
Message-Id: <D8S5XFO82X83.356EJDDZP8RZX@fjasle.eu>
Cc: <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mips: Add '-std=gnu11' to vdso CFLAGS
From: "Nicolas Schier" <nicolas@fjasle.eu>
To: "Khem Raj" <raj.khem@gmail.com>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Masahiro Yamada" <masahiroy@kernel.org>,
 "Kees Cook" <kees@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250327032436.3600578-1-raj.khem@gmail.com>
In-Reply-To: <20250327032436.3600578-1-raj.khem@gmail.com>

On Thu Mar 27, 2025 at 04:24 CET, Khem Raj wrote:
> GCC 15 changed the default C standard dialect from gnu17 to gnu23,
> which should not have impacted the kernel because it explicitly requests
> the gnu11 standard in the main Makefile. However, mips/vdso code uses
> its own CFLAGS without a '-std=3D' value, which break with this dialect
> change because of the kernel's own definitions of bool, false, and true
> conflicting with the C23 reserved keywords.
>
>   include/linux/stddef.h:11:9: error: cannot use keyword 'false' as enume=
ration constant
>      11 |         false   =3D 0,
>         |         ^~~~~
>   include/linux/stddef.h:11:9: note: 'false' is a keyword with '-std=3Dc2=
3' onwards
>   include/linux/types.h:35:33: error: 'bool' cannot be defined via 'typed=
ef'
>      35 | typedef _Bool                   bool;
>         |                                 ^~~~
>   include/linux/types.h:35:33: note: 'bool' is a keyword with '-std=3Dc23=
' onwards
>
> Add '-std=3Dgnu11' to the decompressor and purgatory CFLAGS to eliminate
> these errors and make the C standard version of these areas match the
> rest of the kernel.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: stable@vger.kernel.org
> ---
> v2: Filter the -std flag from KBUILD_CFLAGS instead of hardcoding
>
>  arch/mips/vdso/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> index fb4c493aaffa..69d4593f64fe 100644
> --- a/arch/mips/vdso/Makefile
> +++ b/arch/mips/vdso/Makefile
> @@ -27,6 +27,7 @@ endif
>  # offsets.
>  cflags-vdso :=3D $(ccflags-vdso) \
>  	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
> +	$(filter -std=3D%,$(KBUILD_CFLAGS)) \
>  	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
>  	-mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
>  	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \

Thanks.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>


