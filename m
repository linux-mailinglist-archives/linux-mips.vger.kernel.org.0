Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A577EA28E8
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2019 23:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbfH2V0j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Aug 2019 17:26:39 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44172 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726894AbfH2V0j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Aug 2019 17:26:39 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so2259147pgl.11
        for <linux-mips@vger.kernel.org>; Thu, 29 Aug 2019 14:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=GWW8DLxytIiCzhfA2BJxy+/D87jQXnHMbpMx/kGEXeU=;
        b=SZGvIs6E9TskHAVTLovdtnJ3wivDhHJPTxAcX2m2/O1Wt5ZB7JkMLW3C/v0a5DlJxr
         kjzCc0WgKXUVgNOgxXOQ7+n9XK0EqyIfi5o5jL95OK457mBy/xfRT7k+/qgv7XA0NeDb
         y7kSQTHOux1UP/gcY1ok2//XPPs84aEiEh1sH34eRHiUcUxmdrxWoX9OlPh6xLAqUJ8+
         9EengEykizGIUvi9nrVmOWE0jEoiC7Hb5vnkHtIX4Tc989bmaW53jkxPE7c7C5hSquY/
         8uz2XnV9v7Rv7MZg+uWTtl6GYByJIbw4MFDqFTYOEJK5is/VxOuY3EEc38vbskFjl2I2
         PDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GWW8DLxytIiCzhfA2BJxy+/D87jQXnHMbpMx/kGEXeU=;
        b=hnsmRb0AEbB30YDbhDB+1Xu9dIAaTLtzpYjW1Amz8jPkcb9WLWCH3/5V6ptupiDlx3
         KLEBBcp+3eemY79kwJ3XkNJtq+h6gGXwaoMKnxnjRKXBoU3ynKbn8AioYuEd4h5N5XMW
         +YVSactTOWdKJF6ziM4Mjceln7ooFvWFenGh9UQNuzuA+EUweCfsayg3RNFlrJcUakik
         uTaKdCsHUemDaPHfxXcMgom52YG2BNbxx8syxxRPkJdiidcgMcnDJ4YcUnN2Dnxft2e/
         vD0xGH2uJvqCTURi9pyFjWG7K7OyrxAG+DwNt3TYV+xGqQtK61bzwk309XhZtCQfBDmy
         ey5g==
X-Gm-Message-State: APjAAAXTcsyIBAX3O18FlR6a9J9ubbdxCIv9y8V4fKzOUqUdMFmsBbr1
        z9CAl5+jbE+BecbvBGedl+8dew==
X-Google-Smtp-Source: APXvYqzgsuapLgy6KYdw7jRoVvKrtPqUVQIKBUbs4nUAFFRMYUPAiPFENsbmkHB/pRiOPNxRcrVZ9Q==
X-Received: by 2002:a63:4a51:: with SMTP id j17mr10144639pgl.284.1567113998895;
        Thu, 29 Aug 2019 14:26:38 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local ([12.1.37.26])
        by smtp.gmail.com with ESMTPSA id v67sm6499918pfb.45.2019.08.29.14.26.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 14:26:38 -0700 (PDT)
Subject: Re: [PATCH v2 net-next 02/15] MIPS: SGI-IP27: restructure ioc3
 register access
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20190829155014.9229-1-tbogendoerfer@suse.de>
 <20190829155014.9229-3-tbogendoerfer@suse.de>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <d9192f8c-a8a6-86aa-62eb-91826163bb43@pensando.io>
Date:   Thu, 29 Aug 2019 14:26:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829155014.9229-3-tbogendoerfer@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/29/19 8:50 AM, Thomas Bogendoerfer wrote:
> Break up the big ioc3 register struct into functional pieces to
> make use in sub-function drivers more straightforward. And while
> doing that get rid of all volatile access by using readX/writeX.
>
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---

> diff --git a/arch/mips/sgi-ip27/ip27-console.c b/arch/mips/sgi-ip27/ip27-console.c
> index 6bdb48d41276..5886bee89d06 100644
> --- a/arch/mips/sgi-ip27/ip27-console.c
> +++ b/arch/mips/sgi-ip27/ip27-console.c
> @@ -35,6 +35,7 @@ void prom_putchar(char c)
>   {
>   	struct ioc3_uartregs *uart = console_uart();
>   
> -	while ((uart->iu_lsr & 0x20) == 0);
> -	uart->iu_thr = c;
> +	while ((readb(&uart->iu_lsr) & 0x20) == 0)
> +		;
> +	writeb(c, &uart->iu_thr);
>   }

Is it ever possible to never see your bit get set?
Instead of a tight forever spin, you might add a short delay and a retry 
limit.

I see this in several other times in the following code as well.  It 
might be interesting to see how many times through and perhaps how many 
usecs are normally spent in these loops.

Not a binding request, just a thought...

sln


