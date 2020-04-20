Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28001B12E8
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 19:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgDTRZo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 13:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726833AbgDTRZn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 13:25:43 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B4CC061A0F
        for <linux-mips@vger.kernel.org>; Mon, 20 Apr 2020 10:25:43 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k18so4193191pll.6
        for <linux-mips@vger.kernel.org>; Mon, 20 Apr 2020 10:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WuvYwXlE5Hkt+ipHk4SgCiMdDOtGLT9536mgI23hPzc=;
        b=nT5PkhLJDgs4ZshcX0RBOau7mCFQINthAo95r+0yKvntm76Iq2QN/eA+8RlrAlPCzo
         Nzv+q2x76nv0PlboZbBkvPYcK0h1499XovNnguvRWNdhBgWKy+Cpihz7Jwh+DS5f9rLv
         LAdt8NCB3ip6deeyBvdiE3TaoGK0kIUDoUEGgeFBq/FAjXTKPB+AuHxa+0NVwZLsGbd0
         pRzPp56olekaFGsGyTZqQZZnPiuWTZpj/ooBk0u51Ne4dC4CBiEq3aQCQtOZSXYSWy9P
         kgnQm6eQ8JFg8f98apCUW7P8tMj/UldqTHkLlpVsgRw0f0lHvbHkH49OFyrN/m++DtLx
         kklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WuvYwXlE5Hkt+ipHk4SgCiMdDOtGLT9536mgI23hPzc=;
        b=Qqsq9jweb3+XjPrJF66qJQdfR7thuMw2wGyyoUonGNVjgmpxplY16/rD53SfaAZD5V
         Cimp9XL50Rd1E5rcVEZxHHs450JyTDh2D61nezohye/mCRqR2byHtvcF0Ds/2cQhpYXn
         +cs0nPVl+L8+Yd3Cb9XIWhAm3xXnSmZ0GXKhzTN94YmGqaVenkygYXC/ULaXbSQKEc3o
         N1oKPPq7FolkdJvD8Hh6fKi7kgdmbmPxP5HlSU2zJq7uDKUgN8IiQmC+XcIeYxQ6asLO
         Jef3uRPkuMnP8ui98R/btbtFwsvPASOZg1mkUS1es9Ot+ABoO83Tx++LsmFcxrmq3VDg
         oM5g==
X-Gm-Message-State: AGi0PuYO8Qw58KcKuycLlWVpCbDI12pah2pyBTl0pp4dN7RbHWKgkOvt
        53tHVqeLV4YkyI9mugGMJ4g20Q==
X-Google-Smtp-Source: APiQypJQ+TxM84Dn0UOUTX5+M6t/2KmdqsL6wy9XgCzEzL/hbZm74owRVPj2e/ZPzqDIAPXdp7avlg==
X-Received: by 2002:a17:90a:3ea7:: with SMTP id k36mr488720pjc.125.1587403543005;
        Mon, 20 Apr 2020 10:25:43 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8? ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id p65sm1658019pgp.51.2020.04.20.10.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 10:25:42 -0700 (PDT)
Subject: Re: [PATCHv3 01/50] kallsyms/printk: Add loglvl to print_ip_sym()
To:     Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Greentime Hu <green.hu@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        James Hogan <jhogan@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>, Michal Simek <monstr@monstr.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Burton <paulburton@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Chen <deanbo422@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Will Deacon <will@kernel.org>, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20200418201944.482088-1-dima@arista.com>
 <20200418201944.482088-2-dima@arista.com>
 <24a1f021e52ccabfd53baa22b93947ef10e6bf3b.camel@perches.com>
From:   Dmitry Safonov <dima@arista.com>
Message-ID: <7616c5f4-def1-7362-ceef-db76107b9c2b@arista.com>
Date:   Mon, 20 Apr 2020 18:25:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <24a1f021e52ccabfd53baa22b93947ef10e6bf3b.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Joe,

On 4/18/20 9:40 PM, Joe Perches wrote:
> On Sat, 2020-04-18 at 21:18 +0100, Dmitry Safonov wrote:
>> print_ip_sym() needs to have a log level parameter to comply with other
>> parts being printed. Otherwise, half of the expected backtrace would be
>> printed and other may be missing with some logging level.
> 
> I'd rather create another extension to %ps that also emits
> the [<address>] along with the symbol lookup and retire
> print_ip_sym altogether.

Makes sense.
Would you mind if I'll do it on the top of these patches?
[not to mix new printk-format with patches those add loglvl parameter]

> 
> Something like:
> ---
>  lib/vsprintf.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 7c488a..8fce8f 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -2072,6 +2072,8 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
>   * - 'S' For symbolic direct pointers (or function descriptors) with offset
>   * - 's' For symbolic direct pointers (or function descriptors) without offset
>   * - '[Ss]R' as above with __builtin_extract_return_addr() translation
> + * - '[Ss]B' [<address>] and symbolic direct pointers as above
> + *	     (was used previously used as print_ip_sym)
>   * - '[Ff]' %pf and %pF were obsoleted and later removed in favor of
>   *	    %ps and %pS. Be careful when re-using these specifiers.
>   * - 'B' For backtraced symbolic direct pointers with offset
> @@ -2183,6 +2185,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>  	case 'S':
>  	case 's':
>  		ptr = dereference_symbol_descriptor(ptr);
> +		if (fmt[1] == 'B')
> +			buf += vsprintf(buf, end, "[<%px>] ", ptr);
>  		/* Fallthrough */
>  	case 'B':
>  		return symbol_string(buf, end, ptr, spec, fmt);
> 
> 

Thanks,
          Dmitry
