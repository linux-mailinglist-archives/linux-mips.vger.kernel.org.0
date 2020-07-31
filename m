Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D66234B67
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 21:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgGaTCi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 15:02:38 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:54217 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgGaTCi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jul 2020 15:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1596222157; x=1627758157;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eCZgR4XdKcfX+5k/GjZQaH/px9IXWVojiGq5ykOz24I=;
  b=QVgH0etsPB+rkOW10JLfGOvDVvNGPTCLjtJi6eJx5x3tvHZOwhnY4TQO
   Tgnb5HA+L5S7QYw0uUVbGD/G25GZbhCumHLxqRp6eM98NPjzOKzgeK6zW
   83KFzXBfDTlmo4FN5gCbrLjHc+cZ6saC1lBfuxWXPANf1fezir8h6kcSn
   PpQHH7bc4baJhLct1i8cpCXMHk8gAd9tziMAz/e/B1F6BRKUSRn2lcCtk
   hbQXrM4GLg+DViceMNFDiXXCsotnZsFk82U4zRwaUqnuuP/TeUqZI/FfM
   nByl/N1huETMsTNtqAOiVFgDNi0t8eiPW8t4h4jU51jVZO22gC6WyiRDF
   A==;
IronPort-SDR: Bbdk7WyzRPReMJCtg2fvs03ZXO9neaFfhTZG98P0h998haFiVI8rFJTu5vpyYuc+aCeV+fm+44
 iO8WcqOnt9Wpo2q5HhEQaciTqkUncb240O6yPxN/UZlWNy3hca24AxNlK9UoPDD8qe2n0O2+jz
 YtIxeIEqlJ0TNpG+CgSe4s4+pXkbyRUg36czylnTW+asNCWm/v26jlfLfNg/zSw/ghvoUBWuB8
 JyVFQfh9rzjWaKkZw19Q+OtmE3hUitofa6ovkyvVqLTgunvTAtRJcqs/ZybP0wvpbJPIhlIsys
 zuQ=
X-IronPort-AV: E=Sophos;i="5.75,419,1589212800"; 
   d="scan'208";a="253211143"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Aug 2020 03:02:37 +0800
IronPort-SDR: 4uq+dJ9Fokn1viKPaOE3B/ekWBDXHDTXwZOdODqTpvDumWA/c493mumWIONU3MnSBaTHlEdC3o
 8ci/JlDPaCYUKWHbkG9XLwq9R/aYYtv6E=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 11:50:04 -0700
IronPort-SDR: XsETKoElqKlNWh/Ic9CV4Wrlhp1hYVDXTrdLs2ObX46VCbnrRU17aO7j3grlrGHvmcSogezpxQ
 TWZguTusk6wA==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 12:02:37 -0700
Date:   Fri, 31 Jul 2020 20:02:31 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Romain Naour <romain.naour@gmail.com>
cc:     linux-mips@vger.kernel.org,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCHv2] mips: Do not include hi and lo in clobber list for
 R6
In-Reply-To: <20200725145401.1357002-1-romain.naour@gmail.com>
Message-ID: <alpine.LFD.2.21.2007311948430.24175@redsun52.ssa.fujisawa.hgst.com>
References: <20200725145401.1357002-1-romain.naour@gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 25 Jul 2020, Romain Naour wrote:

> diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
> index c63ddcaea54c..e377a7201a33 100644
> --- a/arch/mips/include/asm/vdso/gettimeofday.h
> +++ b/arch/mips/include/asm/vdso/gettimeofday.h
> @@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
>  	register long nr asm("v0") = __NR_gettimeofday;
>  	register long error asm("a3");
>  
> +#if MIPS_ISA_REV >= 6
> +	asm volatile(
> +	"       syscall\n"
> +	: "=r" (ret), "=r" (error)
> +	: "r" (tv), "r" (tz), "r" (nr)
> +	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
> +	  "$14", "$15", "$24", "$25", "memory");
> +#else
>  	asm volatile(
>  	"       syscall\n"
>  	: "=r" (ret), "=r" (error)
>  	: "r" (tv), "r" (tz), "r" (nr)
>  	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>  	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
> +#endif

 Argh, please avoid a flood of inline #ifdef's across code; let alone 
repeating identical parts in both legs of the conditional.

 We've been through this before, cf. commit b0984c43702f ("MIPS: Fix 
microMIPS LL/SC immediate offsets"), or commit 09abbcffb3ee ("[MIPS] 
cpu-bugs64.c: GCC 3.3 constraint workaround"), or the GCC_REG_ACCUM macro 
visible in the latter commit (originally added with historical commit 
f4232a2ce8f9 reachable at <git://git.linux-mips.org/pub/scm/ralf/linux> if 
you can have a look there).

  Maciej
