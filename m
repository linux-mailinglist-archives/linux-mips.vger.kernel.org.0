Return-Path: <linux-mips+bounces-8825-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6B6A9E74A
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 07:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D841D7A3402
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 05:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B998199920;
	Mon, 28 Apr 2025 05:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NlcDN3JQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC47A94A;
	Mon, 28 Apr 2025 05:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745816726; cv=none; b=tfko7aRaVxIn+mlcDOFQ5uRA/lgoSZbusRxz8MkJHyXEznLozC3RpjLpxC6kv7QovqlgWZD1yWnNl6SEBY0OP1elhMkJCcDEfhVxn3/Vh5BPdvOsUe0C+an3DvJy9iA/LNeihgJ0seXcWKDnWyqFV6aFVtg8Gopv4hwRZH3FsCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745816726; c=relaxed/simple;
	bh=9tFC3sP9nYVvzIHKboLuqpY2G6/FGtMIMbRHY4joA+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bb+FoF8sl870Z02xrrJIJLt1/K3RbNydlaVrO0k15NSED3EsfknsoBPL6Z3wnfvTYYL2EDhNZNsR7/p1R50svALCTu3d0hyY3siU+e+7SL4W70opIsYFtVCv6AaOtjhajuDXf2bJNuoxDsr5A6m9/p6MSpn14lBjO4zGx96/m3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NlcDN3JQ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IfLKbDkV4fPPgTS+DMHTqBfYjg9NHL/fFPBrZojxEhc=; b=NlcDN3JQO7+DOfYbSrtU6MqRzZ
	0/7ur+y7APRmZaZcnW4c1zo3MIms1ojY0EzVINTVthariWuYPtmeJ9kh2eqyJMlaPulKI3E2aVF8V
	c7Jo8Mg4Z6/Pw6hl8nUv1n+eqqEmGPM9Q3R0PTsWndPa8Wb7H+ab+avtJM+Loq/57vt7Xm2lZpwI9
	snOc2vbGu7cGNZ6KJ9sysYbqvdw6nrp3SrEcUH7BDmirU1sVA7yVz5Z0i+MOLGm+yEaTD6M1hUKSH
	w3/1QzVyO6IOcystr7C6e08dqCPYZbuCz2W6b6KG4R2GUQqN/E5VrxyYRKjOJbvsT3UfNmFPBJrF1
	IfbYpNRQ==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Gfz-0000000CY27-3ztO;
	Mon, 28 Apr 2025 05:05:08 +0000
Message-ID: <b8ffdc7e-1b5b-41df-835e-c11a200d7dec@infradead.org>
Date: Sun, 27 Apr 2025 22:05:01 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/kernel-parameters: Update memtest parameter
To: WangYuli <wangyuli@uniontech.com>, corbet@lwn.net,
 akpm@linux-foundation.org, rostedt@goodmis.org, paulmck@kernel.org,
 thuth@redhat.com, bp@alien8.de, ardb@kernel.org, gregkh@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com
References: <0FC3D21CA22E8251+20250428034746.21216-1-wangyuli@uniontech.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <0FC3D21CA22E8251+20250428034746.21216-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/27/25 8:47 PM, WangYuli wrote:
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

It looks to me like ARM64 needs its own entry above.

>  			Format: <integer>
>  			default : 0 <disable>
>  			Specifies the number of memtest passes to be

-- 
~Randy


