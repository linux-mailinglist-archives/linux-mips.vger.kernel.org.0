Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B6C239D03
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 01:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgHBX75 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Aug 2020 19:59:57 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:37192 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgHBX75 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Aug 2020 19:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1596412797; x=1627948797;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ur8Ff/9vPrbxyZspjOu+aYVmKVsvs/qexsjUIe2px8o=;
  b=GQ84xw5NDJRmmHsjEhcunzgBS8RyMEHFrgCKv87FrqaLbnDfxB4Nre3q
   XFmiObDlX+Zz1CnB8DPCxhq47i8mDJocdlyUYGsB0nG8IrV4NZI1Qy6cp
   uUQpYtrs3gGG8D1eXlE8/wz14oxo3jx0hgftZEcLpMKo1Lsml9vbeSto0
   bh9gtvJ+DcPcpb0gwFAW/4vN6RNkCl1pBl3nkaAmuT5LiVa7hhUjHm1dM
   GX7YZscx6h/dBhkwheXnu+oGfoTEm6CWGmmEXV5FvfXu7cz4PvTb2MYDZ
   bBXJz93IM9B6RkGcfba7LhgtzfFk4Q/9JwhIaQnhEzDqA3AlCRLYbVwTi
   g==;
IronPort-SDR: N8yS1RhQXe0KxYnipsY+1G3rQKcoxkeRj+gYOAtCmQkUyVkdKkx1g1OEfy+AX+TcNSRNCcQZyh
 EPml9Oi1bX+xsJ97j+e1yvU9bUwNE9fvgezUBxR+5XzA1Mjux5ZdZjTzQRY94Aj6u9DEKJBKw2
 XrHt9uBbfqW/rCBMGYNossIu0G5UQYx/cJDUp7jfIwkTVRlg5EwZAaPoocmy/DAMC81SpcCJnb
 EPguu0xTsF8v/0qvBl+9+tWnz4cgQbehgimOfqNw8QxDZU1hYw8J4mt2QFEcr1il8E4S7Q9l9F
 ccE=
X-IronPort-AV: E=Sophos;i="5.75,428,1589212800"; 
   d="scan'208";a="145210150"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 03 Aug 2020 07:59:57 +0800
IronPort-SDR: 0y0HofJs6ztnGBIs0YfoM0zh8RxhqrGdxfLyWG5Bl44M9aeWcblAH63qVuBtKOw69/hnob7VjV
 wBO+avnH9VCA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2020 16:47:19 -0700
IronPort-SDR: FDWYD31ChbhmzNfP97EtrNNqqD76JVHE8hK144xUJYCGaXIzs8YpvUQttjHcy1wmP/2G783v1Y
 irAy8jQ2UDgQ==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2020 16:59:56 -0700
Date:   Mon, 3 Aug 2020 00:59:51 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Romain Naour <romain.naour@gmail.com>
cc:     linux-mips@vger.kernel.org,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCHv3] mips: Do not include hi and lo in clobber list for
 R6
In-Reply-To: <20200801154401.4177009-1-romain.naour@gmail.com>
Message-ID: <alpine.LFD.2.21.2008030044230.24175@redsun52.ssa.fujisawa.hgst.com>
References: <20200801154401.4177009-1-romain.naour@gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 1 Aug 2020, Romain Naour wrote:

> v3 Avoid duplicate code (Maciej W. Rozycki)
> v2 use MIPS_ISA_REV instead of __mips_isa_rev (Alexander Lobakin)
> ---
>  arch/mips/include/asm/vdso/gettimeofday.h | 30 +++++++++++++++++++----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
> index c63ddcaea54c..93008551282e 100644
> --- a/arch/mips/include/asm/vdso/gettimeofday.h
> +++ b/arch/mips/include/asm/vdso/gettimeofday.h
> @@ -35,7 +35,11 @@ static __always_inline long gettimeofday_fallback(
>  	: "=r" (ret), "=r" (error)
>  	: "r" (tv), "r" (tz), "r" (nr)
>  	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
> -	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
> +	  "$14", "$15", "$24", "$25",
> +#if MIPS_ISA_REV < 6
> +	  "hi", "lo",
> +#endif
> +          "memory");

 Can you please use a helper macro, say GCC_REGS_HI_LO, moving the details 
into a separate header, just as I suggested with examples given?  My very 
point was to avoid `#if MIPS_ISA_REV < 6' sprinkled throughout code.

 Also I note all the clobbers are the same across all the syscalls used 
here, so another possibility is to have a macro like VDSO_SYSCALL_CLOBBERS 
defined in a single place according to the architecture level, and then 
just use it throughout avoiding code duplication.

  Maciej
