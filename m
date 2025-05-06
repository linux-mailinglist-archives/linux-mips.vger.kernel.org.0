Return-Path: <linux-mips+bounces-8945-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C92BAAC569
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 15:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C0D8524871
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 13:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FED828001C;
	Tue,  6 May 2025 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IR10GhDy"
X-Original-To: linux-mips@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0C921773D;
	Tue,  6 May 2025 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537164; cv=none; b=jBlrA5fvgPQ1++N8WnHMTij9Cdn6zaCauuErx8UA6f1M6dUf9+ffNqoikzpddTNOsbAial9Rafea4c7RCFTHNg4S1NUTk9/sqWrIW5idOKC1zBvCNsggFPc8NYkhq/W/+cTV3zK8tlXLVhkPPO4fD1VGUQxrd4+hWmHar796//M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537164; c=relaxed/simple;
	bh=WLluURKbm4eGnI6fPXUW+jlJLn5vL0ww++Ei8KhjTqI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M90hVr5kjGJGU+94kgTWjpjvc+SmEMG4G4jyLB5yf0+E80QIN8BI358R5Eolndaj2HRlRjm1CQav+l5QwRyfBM/9sNA9mGoqVERyJ8hOVzX/HMdD4pjuzXjQS5HsZbs91u8PuB9XiZNDdCFjkC5FkWoHypXDV6uN4wOczBfm6rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IR10GhDy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 026A2403A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746537161; bh=m8AIbhmxSPITdk7Wy5PZ0OjI7Z8rf39QNecnep+a59k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IR10GhDySlD3IFtodkh3Iiciiwj5Q6TYxO3X293u114YIfE2BHgi+c+h2PzLTuzyn
	 jy/A5sZ7XiVneRvAJxHHzFDKuQcHzrbnZUs8C8fUcerorgP7IdbJ8G8LeleT5D54kU
	 +yc0s54sVFG+l0bEcdOWuM1QkqYG9Ctw14RRChqP8sSen23qAN0OEAnqXSFwXgwRKB
	 H53Rb/VuCXdQ8yoGFChoknszcKW6S44N1YPagqZe2Cctv6X+AgOjXVPsj+A7ydmr3C
	 x45eO054b/PWztWYBPbT7VOmuYxcIbu4+azb+Hhp9AMh2SAQukX6tEDwG16fWcLV98
	 0qyzSvfJc03cQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 026A2403A7;
	Tue,  6 May 2025 13:12:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: WangYuli <wangyuli@uniontech.com>, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, bp@alien8.de,
 ardb@kernel.org, gregkh@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, WangYuli <wangyuli@uniontech.com>
Subject: Re: [PATCH] Documentation/kernel-parameters: Update memtest parameter
In-Reply-To: <0FC3D21CA22E8251+20250428034746.21216-1-wangyuli@uniontech.com>
References: <0FC3D21CA22E8251+20250428034746.21216-1-wangyuli@uniontech.com>
Date: Tue, 06 May 2025 07:12:37 -0600
Message-ID: <87a57px4qi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

WangYuli <wangyuli@uniontech.com> writes:

> LoongArch, MIPS and XTENSA has supported memtest now.
> Update documentation for them.
>
> Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dce44566192ec0b38597fdfd435013c2d54653ff
> Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fb8e9f59d6f292c3d9fea6c155c22ea5fc3053ab
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index d9fd26b95b34..eeba55deb38d 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3620,7 +3620,7 @@
>  			Note that even when enabled, there are a few cases where
>  			the feature is not effective.
>  
> -	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV,EARLY] Enable memtest
> +	memtest=	[KNL,X86,ARM,LOONGARCH,MIPS,M68K,PPC,RISCV,XTENSA,EARLY] Enable memtest

Applied, thanks.

jon

