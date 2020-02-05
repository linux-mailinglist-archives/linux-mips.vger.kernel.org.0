Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F55153761
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 19:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgBESSh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Feb 2020 13:18:37 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38001 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbgBESSh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Feb 2020 13:18:37 -0500
Received: by mail-wm1-f67.google.com with SMTP id a9so3999020wmj.3;
        Wed, 05 Feb 2020 10:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zRat+qyp62rqX1dHNawmHI+S4EdW2pDZ71ZlraaGzu0=;
        b=qDDqSn8MWh5m4Np0dBmzzoPFq80KhGa3PRBOXGqZVj7fWi9JdP+qij1Z6++zNJCsby
         jA0+K8Nyifu1+08e3FQ0gubyfpFZYFHuwR04HH0A7b4zbZALs8bEKmdXLdHbYsYJsW/z
         WjAVDkjh40+W0oJ0W/KxxgeVSO7tz9qFbdqmTNT2gvzvSZ+Yu9vmpRGbHjDP/hpyu13H
         aXnhrLMxsJmjb9p8fnkPM3E19ExxDzI67iIUvGhzVd5K+URPMJVlUVG0p+M5Ke/y7CR3
         EAsqYLYs/qIPOy61un5hhB9rKivckquzfvT4vmUNYEG6yyRV8k336FdFQFK2KEy7V1X7
         V5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zRat+qyp62rqX1dHNawmHI+S4EdW2pDZ71ZlraaGzu0=;
        b=F29yptFVsF1niK2Pux+G4C9tWG2jpTZX0JduxbjbTWMGODXv/m8IWPFlnFeeyWgXht
         jnpBlkdU7g1mUpfhmxqRk8ZpER8nEQIRVEo/T66GilbUpixVhkQrEf4HVFUrOQR1Uzxd
         ngpLDX3A1ZYezNwTb3AX2WCg+llv1F+Y4swFHgmtrJvf+PD/Avag09Zhpks++uhBmAVN
         f2SpEV3CwOyon4oDoZHWzLxkUqIKvQRgXVxYphYOWMQZ2nZXOYxhy+GG6t4zwvaeNZlL
         SLpzcAlQNHyH6HLAnUo64RXiFs5YcJ9wByDo0hET9OFTFb/sQnWmmz4+8TWzaXVgGWr+
         FpZA==
X-Gm-Message-State: APjAAAVa+0oLyZ419XbsHn5FXNf7VlrwppwN2MGtUbpgNX2jbcRNWTfr
        bgJ8muvmEVIsx4Ww7zTVmBnQezTv
X-Google-Smtp-Source: APXvYqz/5U1k9xjfA2F5TDgY7XJ5iP452t6q0eV71bxaJU8eFcVWgNBCYD4jQ2o1m75F1BQ7bQR96Q==
X-Received: by 2002:a7b:cf35:: with SMTP id m21mr7447047wmg.144.1580926713883;
        Wed, 05 Feb 2020 10:18:33 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.162])
        by smtp.gmail.com with ESMTPSA id m3sm742548wrs.53.2020.02.05.10.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 10:18:33 -0800 (PST)
Subject: Re: [PATCH 3/3] mips/jazz: Update jazz_defconfig for MIPS Magnum
To:     Finn Thain <fthain@telegraphics.com.au>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1580610812.git.fthain@telegraphics.com.au>
 <a39b20bfa8ee493a9fd26a5f7a8ce0bf3aa20ed7.1580610812.git.fthain@telegraphics.com.au>
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
Message-ID: <bc985d31-f325-637e-562b-741fc5895f8d@amsat.org>
Date:   Wed, 5 Feb 2020 19:18:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a39b20bfa8ee493a9fd26a5f7a8ce0bf3aa20ed7.1580610812.git.fthain@telegraphics.com.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/2/20 3:33 AM, Finn Thain wrote:
> Enable some options for machine type, framebuffer, serial controller and
> ATA interfaces.
> 
> This allows a jazz_defconfig build to work on the emulated MIPS Magnum
> machine provided by qemu-system-mips64el.
> 
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> ---
> This patch enables CONFIG_FB_G364. This depends upon the build fix at
> the beginning of this patch series.
> ---
>  arch/mips/configs/jazz_defconfig | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/configs/jazz_defconfig b/arch/mips/configs/jazz_defconfig
> index b13b2396a8a9..92085df3e367 100644
> --- a/arch/mips/configs/jazz_defconfig
> +++ b/arch/mips/configs/jazz_defconfig
> @@ -1,5 +1,7 @@
>  CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
> +CONFIG_NO_HZ=y
> +CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_PREEMPT_VOLUNTARY=y
>  CONFIG_BSD_PROCESS_ACCT=y
>  CONFIG_LOG_BUF_SHIFT=14
> @@ -8,6 +10,8 @@ CONFIG_EXPERT=y
>  CONFIG_SLAB=y
>  CONFIG_MACH_JAZZ=y
>  CONFIG_OLIVETTI_M700=y
> +CONFIG_MIPS_MAGNUM_4000=y
> +CONFIG_CPU_LITTLE_ENDIAN=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  CONFIG_MODVERSIONS=y
> @@ -25,6 +29,7 @@ CONFIG_INET6_IPCOMP=m
>  CONFIG_PARPORT=m
>  CONFIG_PARPORT_PC=m
>  CONFIG_PARPORT_1284=y
> +CONFIG_DEVTMPFS=y
>  CONFIG_BLK_DEV_FD=m
>  CONFIG_BLK_DEV_LOOP=m
>  CONFIG_BLK_DEV_CRYPTOLOOP=m
> @@ -44,6 +49,8 @@ CONFIG_ISCSI_TCP=m
>  CONFIG_SCSI_PPA=m
>  CONFIG_SCSI_IMM=m
>  CONFIG_JAZZ_ESP=y
> +CONFIG_ATA=y
> +CONFIG_PATA_LEGACY=y
>  CONFIG_NETDEVICES=y
>  CONFIG_BONDING=m
>  CONFIG_DUMMY=m
> @@ -54,11 +61,15 @@ CONFIG_NE2000=m
>  CONFIG_SERIO_PARKBD=m
>  CONFIG_SERIO_RAW=m
>  CONFIG_VT_HW_CONSOLE_BINDING=y
> -CONFIG_SERIAL_8250=m
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_8250_EXTENDED=y
>  CONFIG_SERIAL_8250_SHARE_IRQ=y
>  CONFIG_SERIAL_8250_DETECT_IRQ=y
>  CONFIG_SERIAL_8250_RSA=y
> +CONFIG_FB=y
> +CONFIG_FB_G364=y
> +CONFIG_FRAMEBUFFER_CONSOLE=y
>  # CONFIG_HWMON is not set
>  CONFIG_EXT2_FS=m
>  CONFIG_EXT3_FS=y
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
