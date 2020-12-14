Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49052D97D0
	for <lists+linux-mips@lfdr.de>; Mon, 14 Dec 2020 13:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438344AbgLNMCY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Dec 2020 07:02:24 -0500
Received: from mout.gmx.net ([212.227.17.22]:46915 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437740AbgLNMCY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Dec 2020 07:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1607947211;
        bh=vFZUH/A+dSelnEOTvUqfH9AhcXXAFjJO23KGSKyMe0Q=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=YiDa7wFRF63KKOsCZwZiKyBJTRtc3llrtwurcc+0BoyoCDG2BilH/Xm3ZpRu0gptZ
         ntqXelvMXjGFFcePa5pzSWfgn5oWoQy1YO4iIEkHVip933J5LZN8kAvnvab84kIfMy
         WCgSgdJzdApjdmC4l2QG5wMTGzFtdCARto74nXHA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([62.143.246.89]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPokN-1kRrvE1Yv5-00MrnI; Mon, 14
 Dec 2020 13:00:11 +0100
Subject: Re: [PATCH v5] cacheflush.2: Document __builtin___clear_cache() as a
 more portable alternative
To:     Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>, linux-man@vger.kernel.org
Cc:     Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, gcc-patches@gcc.gnu.org,
        cfe-users@lists.llvm.org, cfe-dev@lists.llvm.org
References: <e2424619-2a5a-a44a-2dc0-a16310725250@gmail.com>
 <20201214114306.10784-1-alx.manpages@gmail.com>
From:   Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <00c985bb-e363-76ab-3ae8-40f4dfc07d88@gmx.de>
Date:   Mon, 14 Dec 2020 13:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214114306.10784-1-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Capo1mKwHx7ISVqgaMVd34VhbCirWAIluLaE2hsUSG/6+gFqGMa
 jDxrchLCTKNXHQYuf7j6HDTCQK/4oUBsJmafO7nRVKpNInYBmzoV1GQISskMWWZNQepT/mb
 pMRma9uLp/K6c2nGYrGjJd3NRtExPQ2xQ7fVT9HKoek6Jf690rQMNKq5CXZbH1aGc+f8THU
 Dok3+PDHXhzOd3qBj6hng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UehdsZnDCLM=:mw2JRYwiXvWEiZr1qkwNun
 a/FXaSwscuUM2Qd+ZSd0U00ioCXtmBUZZhQSL2cMOtYSb6IdfJkx/ouBwCFsf/p/9gpiNdpZ1
 hemLTb4M4QzZl6/Fo5RQcWNNfvrtIYnXdMeYhdsgBcl6J6HQBTMlsUWWIeNEtNK4eN7vicPt2
 p9D73hT+Ijc6FrohOM6yv0aJjr138xVHx6MfROW3xS74p68denQ+L67BDrO0tunv2u0yOpnZF
 jP1P+ix987G/WdqKWw9V4HKFszpy03iluizH+ApGGwBV9BNCVTD0zlYvjb8MIDQXef5V+bxAF
 y6hRkOFREK4gx6zpdGXN5jP5LuEXLJ2ZkkUtPvLV+IQLlOIuRBd1A7EDJghEU36I63eaPfIjA
 oap9q+vJDYGamg6NPlWBigNqaWWQlSH90zo7PzU1LEPUWxTv/J/ULV2t+OREZt3LX+pXChFCw
 W6CDWotqn8NAjJ/14nNAIuff7tlwGlRLJZpj4Kz6/UZ6sE2BjAKCF5nELeELb1EZZaQNU29yu
 PKZlo5Gz1xiL0tkrhYgnXgc5Opx7yZg8Zqgh0WFQuZRT7nsC97IGQhTC/pW+SheDQrFkhUMx1
 1XqfeZrpzyW1SW59lqW6d9PpFHacFCUIGSI9cv9jjCfBGvsWfVOukA3CoDlbsYworbhrSG0lC
 3a+upN04dn8A1kBImhfgeDj23r5KpGBjL9AhyvfUX100eXz7Zh7AGM9UWYiwNDXjaRUD4XKmJ
 OiH7+MRNSmtYnSOaSlIcILI4FzUMDxO28rWe675Mm6c+06LuMrsIqPOJv9LZaiLtd7VBicJkm
 70D3GHApaxccIBvofRkzN8q3/cCWq3VH/BLcXBwE3UvWFVByTMvkLeFhGyrR+LiuRlR3hgOKQ
 DR7cBQIHqsNmBkFt+/xw==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/14/20 12:43 PM, Alejandro Colomar wrote:
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

> ---
>   man2/cacheflush.2 | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
> index aba625721..7a2eed506 100644
> --- a/man2/cacheflush.2
> +++ b/man2/cacheflush.2
> @@ -86,6 +86,30 @@ On Linux, this call first appeared on the MIPS archit=
ecture,
>   but nowadays, Linux provides a
>   .BR cacheflush ()
>   system call on some other architectures, but with different arguments.
> +.SH NOTES
> +Unless you need the finer grained control that this system call provide=
s,
> +you probably want to use the GCC built-in function
> +.BR __builtin___clear_cache (),
> +which provides a portable interface
> +across platforms supported by GCC and compatible compilers:
> +.PP
> +.in +4n
> +.EX
> +.BI "void __builtin___clear_cache(void *" begin ", void *" end );
> +.EE
> +.in
> +.PP
> +On platforms that don't require instruction cache flushes,
> +.BR __builtin___clear_cache ()
> +has no effect.
> +.PP
> +.IR Note :
> +Until GCC 9.1.0,
> +the prototype for this built-in function used
> +.I char *
> +instead of
> +.I void *
> +for the parameters.
>   .SH BUGS
>   Linux kernels older than version 2.6.11 ignore the
>   .I addr
>

