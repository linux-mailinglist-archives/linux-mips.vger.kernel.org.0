Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993EB352E74
	for <lists+linux-mips@lfdr.de>; Fri,  2 Apr 2021 19:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbhDBRcr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Apr 2021 13:32:47 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:45965 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236284AbhDBRcl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Apr 2021 13:32:41 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4FBnF106C9z9v3qR;
        Fri,  2 Apr 2021 19:32:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id lodEmtGE1XZv; Fri,  2 Apr 2021 19:32:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4FBnF04lhLz9v3qQ;
        Fri,  2 Apr 2021 19:32:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id C362C8BB77;
        Fri,  2 Apr 2021 19:32:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id Ig-4h8da1m4r; Fri,  2 Apr 2021 19:32:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id B96388BB6F;
        Fri,  2 Apr 2021 19:32:37 +0200 (CEST)
Subject: Re: [PATCH 3/8] powerpc: convert strcpy to strlcpy in prom_init
To:     Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
        ob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     xe-linux-external@cisco.com, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <0c80a08ad4cf788c75043c1615c05bad893f4fde.1617126961.git.danielwa@cisco.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d7b0b382-056f-d800-d96a-adc0338378a2@csgroup.eu>
Date:   Fri, 2 Apr 2021 19:32:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <0c80a08ad4cf788c75043c1615c05bad893f4fde.1617126961.git.danielwa@cisco.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 30/03/2021 à 19:56, Daniel Walker a écrit :
> There's only two users of strcpy and one is the command
> line handling. The generic command line handling uses strlcpy
> and it makes sense to convert this one other user to strlcpy to
> keep prom_init size consistent.
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Daniel Walker <danielwa@cisco.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/kernel/prom_init.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index ccf77b985c8f..2c2f33155317 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -242,15 +242,6 @@ static int __init prom_strcmp(const char *cs, const char *ct)
>   	return 0;
>   }
>   
> -static char __init *prom_strcpy(char *dest, const char *src)
> -{
> -	char *tmp = dest;
> -
> -	while ((*dest++ = *src++) != '\0')
> -		/* nothing */;
> -	return tmp;
> -}
> -
>   static int __init prom_strncmp(const char *cs, const char *ct, size_t count)
>   {
>   	unsigned char c1, c2;
> @@ -276,6 +267,20 @@ static size_t __init prom_strlen(const char *s)
>   	return sc - s;
>   }
>   
> +static size_t __init prom_strlcpy(char *dest, const char *src, size_t size)
> +{
> +	size_t ret = prom_strlen(src);
> +
> +	if (size) {
> +		size_t len = (ret >= size) ? size - 1 : ret;
> +
> +		memcpy(dest, src, len);
> +		dest[len] = '\0';
> +	}
> +	return ret;
> +}
> +
> +
>   static int __init prom_memcmp(const void *cs, const void *ct, size_t count)
>   {
>   	const unsigned char *su1, *su2;
> @@ -2702,7 +2707,7 @@ static void __init flatten_device_tree(void)
>   
>   	/* Add "phandle" in there, we'll need it */
>   	namep = make_room(&mem_start, &mem_end, 16, 1);
> -	prom_strcpy(namep, "phandle");
> +	prom_strlcpy(namep, "phandle", 8);
>   	mem_start = (unsigned long)namep + prom_strlen(namep) + 1;
>   
>   	/* Build string array */
> 
