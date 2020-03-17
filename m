Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1647187BBC
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2020 10:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgCQJJl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Mar 2020 05:09:41 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40616 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgCQJJl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Mar 2020 05:09:41 -0400
Received: by mail-lj1-f193.google.com with SMTP id 19so21842301ljj.7
        for <linux-mips@vger.kernel.org>; Tue, 17 Mar 2020 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=To90Aks1QffLWwmCVhWp92G2t7kKA7+CEhKhINvOIzQ=;
        b=OrfhVnn77/q/QbU3GLdBl8/vFd/OmkvQ5h26M/H7pVe9WwMGkLALnwxMK+CxEwCjhY
         XvcpVnYykjrO730oo7sXyrArDMF3y+Eu3kh7YqHNnLktiOBMsJchzTWmn5VR4K/NbnTB
         wt6ZYuCPlzONROFDGLLwv1AEBR6DtGCb2XCWmCtEhh2ad1JrDf9F+sowm4cuRAmt244I
         5Ldoz6Rafdb3cBN80a5HuE8qpA12fNf8Wvsst4xo+qS+ABvksoCfy+2VIks8mEG9gc+D
         elBddi3V4K3YBnTGQaQi33Un+enw3KKaqpLrb6zGGu2aqGeKI9qLaUkMxjkEq3x35Nuw
         BuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=To90Aks1QffLWwmCVhWp92G2t7kKA7+CEhKhINvOIzQ=;
        b=aeh5S/VsgDyLN+l9ZeV86V5K+JkBIKiLarnI4CVD5jfsEspzKJsihtH/rY7HLYdoyM
         b63hYYSCdJHyNlpFkPtPq4QY4t1Yjx30wsTEYHAfQztyXWvgdFX7kDosTQzIHUuFgtC0
         1z/PPhfxEZIFmx+PBIUAc3LNQuPn25dgStTWmTb3mqmA5Wq+oGhDsYE2Yr0oiRnlp33a
         vpiixaleCCgKC7mwcAgo9wk+wc+jst1HBZBDERQmH4hrdFieoJFvhcNP/M7Bw/8oOTEd
         TtZNrQJ1QYb6AIq+svE1XmekCZ9WSq0/3DZQFjS2N8u+4DwToTZtAMU6yAJOECEeQVFo
         H9iQ==
X-Gm-Message-State: ANhLgQ2traw6VQ6YAPtc4Iu1IeX9G/QUiK5JesGk5jc71e14obVU72Cr
        k91AOvj+1kTt/0RDNWtFVqr4Lw==
X-Google-Smtp-Source: ADFU+vsTOYO0auHM8js2HOb5sViti64Bjr9l2wyOuM9fFyeZM4T9/eByqc5cktvLY+az7E8U+3Gqqg==
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr2148589ljp.116.1584436178731;
        Tue, 17 Mar 2020 02:09:38 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:48ef:94a3:a481:5e62:4324:124b? ([2a00:1fa0:48ef:94a3:a481:5e62:4324:124b])
        by smtp.gmail.com with ESMTPSA id k2sm2202120lfo.36.2020.03.17.02.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 02:09:38 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] firmware: tee_bnxt: remove unused variable init
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
References: <20200317040742.12143-1-rayagonda.kokatanur@broadcom.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e94bbb2c-6f36-61bb-d26a-2ce3e1a139e0@cogentembedded.com>
Date:   Tue, 17 Mar 2020 12:09:32 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200317040742.12143-1-rayagonda.kokatanur@broadcom.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 17.03.2020 7:07, Rayagonda Kokatanur wrote:

> Remove unused variable initialization.

    I think it's not an initialization, it's an assignment. :-)

> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> ---
>   drivers/firmware/broadcom/tee_bnxt_fw.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
> index ed10da5313e8..6fd62657e35f 100644
> --- a/drivers/firmware/broadcom/tee_bnxt_fw.c
> +++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
> @@ -143,8 +143,6 @@ int tee_bnxt_copy_coredump(void *buf, u32 offset, u32 size)
>   	prepare_args(TA_CMD_BNXT_COPY_COREDUMP, &arg, param);
>   
>   	while (rbytes)  {
> -		nbytes = rbytes;
> -
>   		nbytes = min_t(u32, rbytes, param[0].u.memref.size);
>   
>   		/* Fill additional invoke cmd params */

MBR, Sergei
