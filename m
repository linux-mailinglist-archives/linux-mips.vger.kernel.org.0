Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928DBA4CAB
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 01:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbfIAXPw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 19:15:52 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39028 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729037AbfIAXPw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 19:15:52 -0400
Received: by mail-wm1-f66.google.com with SMTP id n2so11322528wmk.4
        for <linux-mips@vger.kernel.org>; Sun, 01 Sep 2019 16:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CC6cxdG7hW0v5xnOHMhM+4sW92IMkEHNgId9du41JpA=;
        b=c9fawoRCx94D1ZfkXCvZbvGoS5K0kNwPNB5iefhhJ6B26x/oOoZUjHG/y4YZSQ0O0e
         YKPlSQ8IYdKOkdPTR9TRydCJJnTP00pXNFgTNcie4YVlGL3KFxQx1rYcSeU+xSaFZJN+
         HZzeOnQYm/SVngAWJLwOGSjZEtsA9TiqVY7PCo3PpIW6jnmc2sPTQ2KnN6lGGOHsrhE/
         kFUkaHjLWmb7CogvpIr9ZKf4bFJQl6WLj1fu2clcZd6lKv0NpLIRmF76CzMB/sbgadUU
         PzFQ5mISuUVX5rXON1Vwsb16OHikaibBRKOLs6w6x+qNdek4gdwHk9pW2PF6qUZ7Fsww
         mwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CC6cxdG7hW0v5xnOHMhM+4sW92IMkEHNgId9du41JpA=;
        b=Fsv30k/c9TO1Br6WrC7EsPtMVe94VlIHbjKW088Ojt40KHuc3mT32XkL3ZjSoCGnzN
         O2uBc7X5Ckec1rQt11t+zHFsrlEwaaVUJiy9le1vh0XYirFFoCF8yZKNT7ruGvkF1v6Y
         8FtDoT2VuUnHcHyrH1oCNuuGGUAUMP0RC/Vdcg0YuasRCHnahhM3GoyeBDg0LR0xCHzw
         vRMmaV/zUyOL8pcRpkVY1rtOK9sT5tBwKbL4V2QLqLSmTR6Yvl1Xh2lRLRXGQwzq65Wd
         PR7cIskg1hVmdZoXrMDvSg7QFlEQsSEgJqZQ0bTSCl55awWE1GlY+bydQX1fxjqNJHMP
         j0lQ==
X-Gm-Message-State: APjAAAVbBsDKGS7JCl83ylvfepJ9pNupLXHnt3EGuTVH3rlchqpjt/13
        wKoVtr29FrBreO3qe1dldUBb1MAZ
X-Google-Smtp-Source: APXvYqyyLdaYocyaRXdwnbhFmGkHxXUq1ignDHViT9OFG8a+wiDAawIBaX1/nqVQL1FS77j0Y9140A==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr33174286wmi.50.1567379750174;
        Sun, 01 Sep 2019 16:15:50 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net. [88.10.102.251])
        by smtp.gmail.com with ESMTPSA id d5sm8116492wrh.46.2019.09.01.16.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2019 16:15:49 -0700 (PDT)
Subject: Re: [PATCH 120/120] MIPS: Fix name of BOOT_MEM_ROM_DATA
To:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <54a08fcb41b12e715529148a6bc11bcb3e2adb4d.1567326213.git.noring@nocrew.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5e5a2f02-ca92-360f-9d8c-acc8063e9777@amsat.org>
Date:   Mon, 2 Sep 2019 01:15:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <54a08fcb41b12e715529148a6bc11bcb3e2adb4d.1567326213.git.noring@nocrew.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/1/19 6:37 PM, Fredrik Noring wrote:
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> ---
>  arch/mips/kernel/setup.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index ab349d2381c3..7d5bf8cb513b 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -870,14 +870,16 @@ static void __init resource_init(void)
>  		switch (boot_mem_map.map[i].type) {
>  		case BOOT_MEM_RAM:
>  		case BOOT_MEM_INIT_RAM:
> -		case BOOT_MEM_ROM_DATA:
>  			res->name = "System RAM";
>  			res->flags |= IORESOURCE_SYSRAM;
>  			break;
> +		case BOOT_MEM_ROM_DATA:
> +			res->name = "System ROM";
> +			break;
>  		case BOOT_MEM_RESERVED:
>  		case BOOT_MEM_NOMAP:
>  		default:
> -			res->name = "reserved";
> +			res->name = "Reserved";

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  		}
>  
>  		request_resource(&iomem_resource, res);
> 
