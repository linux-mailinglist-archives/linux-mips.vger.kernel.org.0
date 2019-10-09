Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5E32D0F06
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 14:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729575AbfJIMnj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 08:43:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42247 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbfJIMnj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Oct 2019 08:43:39 -0400
Received: by mail-wr1-f68.google.com with SMTP id n14so2774636wrw.9;
        Wed, 09 Oct 2019 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2aP3QyiaeBnkG3DxeeYQ4nlgffh90nk86KCIg/jKuaU=;
        b=cBeTh2vWr29qPnCY2i41SlQjI/XBacikQbSAfARZjWlXqMa4R0bf+DQEUlB2oKlYps
         iealIxs9gvtcIqskd11+6UvPOgcd7wcX/O8YrOP2zvjXiDZEUW7iJYWr1r5nbVm91mD3
         L4qXbiun3ZpgtKy4Rvj04jASWWV/3tLGIVq8VMhxXpNxzRq4kSl/ISHRiN0fSARF5MaX
         nfy6dbj5T3cBpUQ3Zepj9sLhfGQ5bUpW8AC6DEWv9SsdmCx380Z+m2MNgLCbfX8bx2n/
         8gzyan4ExcLnYW4P/ZJgrrwm0ZhkIZKS64TUjuIJRtONtN+gXnZReW0m6JFJ19hvnd+W
         yY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2aP3QyiaeBnkG3DxeeYQ4nlgffh90nk86KCIg/jKuaU=;
        b=M4pf+Y+oz2TTQTcpBITMG1xUbyhIiwSP/QZMDVJ9DEsSnoLWlNgGcHOOBhNyJx4XMW
         Q0BMst/m6iy1imE+x9vgdW0M3jISswbgxF+zvTVjI7pS8Nvoentu3CvUyQCwptAZMfDj
         DTcviFWh77W9mCTDIg0522OkukcFEHNOdYQHcR6WRHyJ9sV1y4S/HJyMkjG6iFMVlyDp
         r/ZDXJlwqNv6nDLLm4UgRNv7eyRUO7ilceQ2W1c8Wf9Wqu4Dld1Tw8SmgIec1N4mrsgF
         appS6VF8U+lVuOHrwt8xBtrtqVm0oEmMFP5aRVlWnXQ1OyhS0KPrZCXNIRz+ohhQ1Gn8
         JAuw==
X-Gm-Message-State: APjAAAXvFqIrOKhGTuHC3T/s3kCsStN0u5PxTUq/bGEtZqewZ1kELC/Z
        7jKCm5dO11Vn06Ca9eOsKL4=
X-Google-Smtp-Source: APXvYqyg+4+QGfZoqRK4FuRALg+eUJqhWP99UpdMPJ7+2+soui8JmB5yzjg3klnpqUwKUnTcJwVpCw==
X-Received: by 2002:a5d:654a:: with SMTP id z10mr2727157wrv.159.1570625017013;
        Wed, 09 Oct 2019 05:43:37 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.46])
        by smtp.gmail.com with ESMTPSA id g4sm2599857wrw.9.2019.10.09.05.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 05:43:36 -0700 (PDT)
Subject: Re: [PATCH] MIPS: include: Mark __xchg as __always_inline
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20191009100600.10572-1-tbogendoerfer@suse.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a685a8fe-7cd9-7d94-54c8-3b6e133cfd74@amsat.org>
Date:   Wed, 9 Oct 2019 14:43:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191009100600.10572-1-tbogendoerfer@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/9/19 12:06 PM, Thomas Bogendoerfer wrote:
> Commit ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING
> forcibly") allows compiler to uninline functions marked as 'inline'.
> In cace of __xchg this would cause to reference function

Typo: "in case of"

> __xchg_called_with_bad_pointer, which is an error case
> for catching bugs and will not happen for correct code, if
> __xchg is inlined.
> 

Ah, this is the equivalent of ARM commit 920fdab7b3c.

Maybe add:

Fixes: ac7c3e4ff401

> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
>   arch/mips/include/asm/cmpxchg.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
> index 012dcf7046ad..f6136871561d 100644
> --- a/arch/mips/include/asm/cmpxchg.h
> +++ b/arch/mips/include/asm/cmpxchg.h
> @@ -77,8 +77,8 @@ extern unsigned long __xchg_called_with_bad_pointer(void)
>   extern unsigned long __xchg_small(volatile void *ptr, unsigned long val,
>   				  unsigned int size);
>   
> -static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
> -				   int size)
> +static __always_inline
> +unsigned long __xchg(volatile void *ptr, unsigned long x, int size)
>   {
>   	switch (size) {
>   	case 1:
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
