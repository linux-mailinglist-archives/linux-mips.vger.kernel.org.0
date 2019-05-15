Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABEB1E7D8
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2019 07:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbfEOFRI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 May 2019 01:17:08 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33988 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbfEOFRI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 May 2019 01:17:08 -0400
Received: by mail-wm1-f66.google.com with SMTP id j187so3783688wma.1;
        Tue, 14 May 2019 22:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tQy8LqZeiCTFZqYP9rZB9L8U43PniXX44buCC9T7XRQ=;
        b=cXxy7EHD0VHyl+J6XVpGG3PC96z0a+gTj5JU481JIMYS+1Nb8ClavRkvrwWnHat3W0
         YyyRtrlVLn9+XiwN4nNeKJCqU0+CgiMYuoLKSJh7vaOsrPRR8aanxkLcSrnpcS2Tv8TB
         bvQZ3ABDnRzaHLlxQ8im5RprDZcP80YX4UQQCRGb/1YMCojzgJFW+4adDYabm6x8Fu/h
         0ouFAQhTH+ZaGJqZiqgnhZNE7tWMKPgMiJ7JSBMnhmi7vdBIRklljdiXm+uCy6U59fhS
         OSEjYlKiXMomHr+hefaYRUN97fmQc2kwD4lXxytC8hzeD81aiIc1HXfVge4bg40/NU1Z
         tAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tQy8LqZeiCTFZqYP9rZB9L8U43PniXX44buCC9T7XRQ=;
        b=BvmW5kJcnrI7urirYh9KjpCMT+/1zNPPgTu9O/ymGOe/vRX8cz+kPFdQMm/QtRqNwo
         Ic++GliKvYvIowSCcd8ibNwa0ix7T1NgDviRksJOzsjU415f4D/5/bdy16ihgb75CSMC
         sQoo3bToq+z13QFxaK/dFmaxc9bv87oop9sPYVObJ7uDNNZjYEkUmBq5q7ZVqhHeLX5l
         k1eMqbZHzvfXFwEid08rXlDKc/AVDgWFpjHBwBBdxFB8h3ObGF0Lre6N5Y/gxRqhwM5C
         mArnHryom2ovL88ffuec2sKmgfgkHUUo8Kcupy+YkuosGsXe7YDhjVRUeTM0KezlS6K3
         dpkA==
X-Gm-Message-State: APjAAAXE7W0ant4sFTa84ECl3DI/bdnANCjOgjdZTkugYwAFwVYhmCiL
        hIVJtLHULW8LltNecmdHtogW4xryAc4=
X-Google-Smtp-Source: APXvYqy8EvVaju/xMm4Jje13j0EJOW0Q7G26RrYHu0wQEjHS2QudeQ+a4MJSnsZdrWYfC2r1m1O1FQ==
X-Received: by 2002:a1c:2104:: with SMTP id h4mr21410644wmh.146.1557897425573;
        Tue, 14 May 2019 22:17:05 -0700 (PDT)
Received: from [192.168.1.43] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id k67sm1078521wmb.34.2019.05.14.22.17.04
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 22:17:04 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] firmware: bcm47xx_nvram: Correct size_t printf
 format
To:     Florian Fainelli <f.fainelli@gmail.com>, linux-mips@linux-mips.org
Cc:     joe@perches.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190514173816.17030-1-f.fainelli@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <2269a105-5338-14cf-025f-5764cedcd9b8@amsat.org>
Date:   Wed, 15 May 2019 07:17:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514173816.17030-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Florian,

On 5/14/19 7:38 PM, Florian Fainelli wrote:
> When building on a 64-bit host, we will get warnings like those:
> 
> drivers/firmware/broadcom/bcm47xx_nvram.c:103:3: note: in expansion of macro 'pr_err'
>    pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
>    ^~~~~~
> drivers/firmware/broadcom/bcm47xx_nvram.c:103:28: note: format string is defined here
>    pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
>                            ~^
>                            %li
> 
> Use %zu instead for that purpose.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Changes in v2:
> - Use %zu instead of %zi (Joe Perches)
> 
>  drivers/firmware/broadcom/bcm47xx_nvram.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
> index d25f080fcb0d..8698c5dd29d9 100644
> --- a/drivers/firmware/broadcom/bcm47xx_nvram.c
> +++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
> @@ -100,7 +100,7 @@ static int nvram_find_and_copy(void __iomem *iobase, u32 lim)
>  		nvram_len = size;
>  	}
>  	if (nvram_len >= NVRAM_SPACE) {
> -		pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
> +		pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
>  		       nvram_len, NVRAM_SPACE - 1);

Why not change the other format too, to stay consistent?

>  		nvram_len = NVRAM_SPACE - 1;
>  	}
> @@ -152,7 +152,7 @@ static int nvram_init(void)
>  	    header.len > sizeof(header)) {
>  		nvram_len = header.len;
>  		if (nvram_len >= NVRAM_SPACE) {
> -			pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
> +			pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
>  				header.len, NVRAM_SPACE);

Ditto.

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  			nvram_len = NVRAM_SPACE - 1;
>  		}
> 
