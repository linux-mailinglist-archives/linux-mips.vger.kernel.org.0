Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D618A4AF6
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 19:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729116AbfIARog (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 13:44:36 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39438 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbfIARog (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 13:44:36 -0400
Received: by mail-lf1-f65.google.com with SMTP id l11so8806035lfk.6
        for <linux-mips@vger.kernel.org>; Sun, 01 Sep 2019 10:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=I5Fclft5uHGcVrLx1b7YXlBUJ2dYic0DZm5TnU19y10=;
        b=DvPgcVq2wKGSzxksEGnNQmgHnbLqUiQX81rGRBHfcw6kmFXYQmjxKJWqgudpWTxj8O
         QFymTPzWw0CXlQqnIkYujk8udZv6LWfS5BDxKvrui6+Bmk3TBcMani6Y2QK1IpNwR+Oc
         ToCg8eKEQx2AsBSs0DPJRvJl4zs7isJaLOOyRV/tZnfoobyGEyIPH2Bvon1nx7mIrGRW
         OiWRk5iptW8jsrtO2e9cvNUOWr2kaGxtXQHgmSuO0Pf0czwnxPTLmjqTzISrB1aEFUFx
         FQxSwEIkluMXTvyg8KIyoShB9E986GyTlDUdOG/aPLn7Il5cAziAl9VmJ90kcZRTi4Q+
         cnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I5Fclft5uHGcVrLx1b7YXlBUJ2dYic0DZm5TnU19y10=;
        b=REVrIH8o6NKyz1xfPqvVDz84wzwNfvJw/mOqlNGuU4Ww2IeZciN5U9BDmDIdSlZjQL
         Q2fO0Our6cwBuyX1TfjpZF9KHYjxfcLNRJ9z/klmqGww17AxtbAo5zqjfgoHgR7WLNOO
         1v2IxHeMD5EKNQmSk4mnwd16ieuB69kh5NeslQhGJ1F4vf5gT2odx80atmGf15lwsas9
         F+ppWPy5CqpKwE6cV1+6c2W0MPzG+tOXoI0xMJS+gwNw2aeY05j7cdQYROVS9MkTTCVK
         7e4tqG4+QxC2DOxmf36DlMhSTqpFYLIB2gZUCjj5OdbXnFwUsQi6oWIhlKwhmpBedHGu
         71ag==
X-Gm-Message-State: APjAAAXLkZZAScN+K4954kYfutua6jKKYv7XwDbYlfh/lCqnTYgRFSMo
        TVCs4g5u9dslZM6CMmQ7BDXvYdrMch4=
X-Google-Smtp-Source: APXvYqxWXEHAwxVafSlydZnQtRCCLkW4X39a2seUaSr0laVnaXh22wAivw/lfZLDxhZXSOixIAHxZA==
X-Received: by 2002:a19:beca:: with SMTP id o193mr15296962lff.137.1567359873731;
        Sun, 01 Sep 2019 10:44:33 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:456:3a8b:7887:7591:d38e:68e7? ([2a00:1fa0:456:3a8b:7887:7591:d38e:68e7])
        by smtp.gmail.com with ESMTPSA id a20sm2095062lff.78.2019.09.01.10.44.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Sep 2019 10:44:33 -0700 (PDT)
Subject: Re: [PATCH 072/120] MIPS: PS2: IOP: SIF printk command support
To:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <53102a0102944d3c118f5cfc8cda3210284f59d6.1567326213.git.noring@nocrew.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <97cdc04c-39b7-6d60-4e2e-2cd303fe9650@cogentembedded.com>
Date:   Sun, 1 Sep 2019 20:44:31 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <53102a0102944d3c118f5cfc8cda3210284f59d6.1567326213.git.noring@nocrew.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 01.09.2019 19:12, Fredrik Noring wrote:

> Allow IOP modules to print kernel messages, with kernel log levels. This
> greatly simplifies debugging of subsequent IOP modules.
> 
> IOP messages are prefixed with "iop: " in the kernel log.
> 
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> ---
>   drivers/ps2/iop-module.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/ps2/iop-module.c b/drivers/ps2/iop-module.c
> index bb4814b5d3c4..18020b3673d3 100644
> --- a/drivers/ps2/iop-module.c
> +++ b/drivers/ps2/iop-module.c
> @@ -892,6 +892,30 @@ int iop_module_request(const char *name, int version, const char *arg)
>   }
>   EXPORT_SYMBOL_GPL(iop_module_request);
>   
> +/**
> + * cmd_printk - IOP module kernel log printk command
> + * @header: SIF command header
> + * @void: message to print

    @data, maybe?

> + * @arg: optional argument to sif_request_cmd, set to %NULL
> + *
> + * The command allows IOP modules to print kernel messages, with kernel log
> + * levels. This greatly simplifies debugging of subsequent IOP modules. IOP
> + * messages are prefixed with "iop: " in the kernel log.
> + */
> +static void cmd_printk(const struct sif_cmd_header *header,
> +	const void *data, void *arg)
> +{
> +	const char *msg = data;
> +
> +	if (msg[0] == KERN_SOH[0]) {
> +		const char fmt[] = { msg[0], msg[1],
> +			'i', 'o', 'p', ':', ' ', '%', 's', '\0' };
> +
> +		printk(fmt, &msg[2]);
> +	} else
> +		printk("iop: %s", msg);
> +}
> +
>   static int __init iop_module_init(void)
>   {
>   	int err;
[...]

MBR, Sergei
