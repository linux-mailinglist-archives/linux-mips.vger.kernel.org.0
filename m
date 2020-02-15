Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 520151600E9
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2020 23:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgBOWMp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Feb 2020 17:12:45 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35217 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgBOWMp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Feb 2020 17:12:45 -0500
Received: by mail-wr1-f65.google.com with SMTP id w12so15183948wrt.2;
        Sat, 15 Feb 2020 14:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jsC0gm1MrUFPLxkGggWB2x4nz39/Gtx7ObXiq8PjvPQ=;
        b=DvCGI3TRvR+8GKlr6+o+6hsUJlXBMbvXV1/Gh16SDpMw/lpY9ebTuGIjrGMzAxHsKO
         aVZKxZRTiriJWpKpw25Y2UFEFM/JAXX96PuSIFqPPt1EzAq42D3ygu28CnDuzjwY23rZ
         k5j0KOCY/G2VDVzjPorE/3JjqbHLmIUCOL2rqBzIe70A9d6S7Hc+PDKyAQ9BnmmACXoD
         XNydKzx1brv07p9HL0emznfBpCdrXY4Y4RgMW9i8enPjj1MHUOoh8coCjAONt86sDGFE
         NzSEojbMmMm7rGEHkdfubnDOAMD8LZOecOhHzDVnhJXHLQfDcCJN+hi/f4DBqINCH38P
         /lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jsC0gm1MrUFPLxkGggWB2x4nz39/Gtx7ObXiq8PjvPQ=;
        b=SItYrHjxzysIgtEiRjD0rA/O2OVP4i/0sijqQnmJB/Om8VqxB/4czmvAmuLS7AeCfk
         YvoFYRsgMrMsIYR4kGGGl91jrV0xqwoMw9sQw6wlVZu3slxVnqAmHSLes145M2jCnSlm
         8Z3i4MTWRGSow1r1tuC8ZL6mNbx3wbALLmqydiS6eYnyneH5bE6uol5Av0XqpIqnhscI
         lRu+eilVeqG6mNcJ0FirxKNuEY5hSqXYTuCZ8+/UK9rFVifyB/0TTyemapvspIuk6Vvl
         jkofon+qMmkVDDsPOjBab4yZ8KXqZKGLi2XI2w8wYJxgY46kIuaVwHao0+CtZD8A7iAi
         RtQw==
X-Gm-Message-State: APjAAAU2nsrshIL9UP2BFc2sqsXNqr2WIN1rq8RjFHvWUve+m1eWXn9q
        tttiverej8Km1VYUyADQh+xTOdz+ubI=
X-Google-Smtp-Source: APXvYqzLra39kj8Y8cnO1XeZdzNgccAYiyWRTQavK7rjCcKZJkbHKuoEpjSnhq480pJxPYdTGjQ8lg==
X-Received: by 2002:a5d:5007:: with SMTP id e7mr11865988wrt.228.1581804762727;
        Sat, 15 Feb 2020 14:12:42 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net. [88.21.202.78])
        by smtp.gmail.com with ESMTPSA id w22sm12999727wmk.34.2020.02.15.14.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2020 14:12:41 -0800 (PST)
Subject: Re: [PATCH] arch/mips: change duplicated word in NUMA help text
To:     Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
References: <8e127f9a-6c73-e0f5-4fb5-f3ab3656221f@infradead.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <00af0774-931f-9d60-4cfa-fa3d398ee921@amsat.org>
Date:   Sat, 15 Feb 2020 23:12:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8e127f9a-6c73-e0f5-4fb5-f3ab3656221f@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/1/20 2:55 AM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix wording in NUMA help text.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200131.orig/arch/mips/Kconfig
> +++ linux-next-20200131/arch/mips/Kconfig
> @@ -2676,7 +2676,7 @@ config NUMA
>  	  Say Y to compile the kernel to support NUMA (Non-Uniform Memory
>  	  Access).  This option improves performance on systems with more
>  	  than two nodes; on two node systems it is generally better to
> -	  leave it disabled; on single node systems disable this option
> +	  leave it disabled; on single node systems leave this option
>  	  disabled.
>  
>  config SYS_SUPPORTS_NUMA
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
