Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC19C130DC4
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jan 2020 08:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgAFHFN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Jan 2020 02:05:13 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33986 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgAFHFN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Jan 2020 02:05:13 -0500
Received: by mail-lj1-f193.google.com with SMTP id z22so45065858ljg.1
        for <linux-mips@vger.kernel.org>; Sun, 05 Jan 2020 23:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t5yk19yvKtDVRKf82rfjHqiC02zuVOaJ9JjJu9aCc7w=;
        b=YzxSMW/yslL+DsacaMKeKgkaOXrZijHQ6IskmC3pW3RrM0UHz2H1Y6+OiuD/yqK8Ub
         JWx/Z8+HXjPMHvgZFyJGegm4K1gF4kKDW/H7hHlh+Tnd4/giINsN9TQ2MWbo3lGuvrrK
         +cwgSWhuTxfg2o9gd33vV0U6O46O5Xe0Z9CVjk1OBXSaab7imcv9Gvi+GQzGdBOTwZk9
         lBt4EOoOZiIFAdIvD/zNOHoAmU49pcr++OOZUjSfKVxnFtY1CjQQwkFlDzgQWwhk4Ibd
         N+YvEyS3Dl4OxVOYtpvMcSZ5SRtkDWPS4MN8493ORiB3cNBz/QfwraGlpC6mkjeGeuXn
         kxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t5yk19yvKtDVRKf82rfjHqiC02zuVOaJ9JjJu9aCc7w=;
        b=kxalP1CYWfnJFm5JZXcjZC8pFiKwWsB68wWqxyXZ55zgGB4TCF7MMNb6mXD1io8bFe
         Whm/x8XvFOMr7W4XUdfZ8d1XtJufpUrO+4X1p9lz7rtvOaxIz5TfRMUW0/8zOpj8pqCn
         zetKflca+HlbFiKW2Dm0VCgurxdlIpjxx4BF0ROE+jBQFDgGzPSIVUYxOhIo01DCOMpd
         sJocqK2/X4gmCql3BBY3WvrRbO8mwDGsVaYiZPsORYZLhM7y7GNSbD39cNdk/CAM9OZc
         sNHFcyzxlu8lHpftGRnkBjM2gvU+bFaUq1YSW7i4hEvmTcy4QSMOxIasDPv5B8RbLVYV
         QASg==
X-Gm-Message-State: APjAAAVsoCFwnVPT2YO5ub0duih5CH1T5+aV3bGLh7dhy15HVI8akePJ
        tInddJzyO60PBb17+uw9ywIIUThGA/DcGU1fhln+cw==
X-Google-Smtp-Source: APXvYqxHu/fTNapq5CnQkXWLWyHBsBS/+4g11L9WZQFQhkz8bg/NqbygIktGRp/mwi+IcUx9wRO96LXf7uWFjHmVQY0=
X-Received: by 2002:a2e:8316:: with SMTP id a22mr8525403ljh.141.1578294310955;
 Sun, 05 Jan 2020 23:05:10 -0800 (PST)
MIME-Version: 1.0
References: <1578291843-27613-1-git-send-email-vikas.gupta@broadcom.com> <1578291843-27613-2-git-send-email-vikas.gupta@broadcom.com>
In-Reply-To: <1578291843-27613-2-git-send-email-vikas.gupta@broadcom.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Mon, 6 Jan 2020 12:34:59 +0530
Message-ID: <CAFA6WYPMz=48rfH84aS9eGOQ7OejnLhAZSsZTFR2LXbfvjiCtg@mail.gmail.com>
Subject: Re: [PATCH v1] firmware: tee_bnxt: Reduce shm mem size to 4K
To:     Vikas Gupta <vikas.gupta@broadcom.com>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Sheetal Tigadoli <sheetal.tigadoli@broadcom.com>,
        netdev@vger.kernel.org, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vikram Prakash <vikram.prakash@broadcom.com>,
        Vasundhara Volam <vasundhara-v.volam@broadcom.com>,
        Jens Wiklander <jens.wiklander@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+ Jens

Hi Vikas,

On Mon, 6 Jan 2020 at 11:56, Vikas Gupta <vikas.gupta@broadcom.com> wrote:
>
> Reduce shm memory size as maximum size supported by optee_shm_register
> API is 4K.
>

There isn't any 4K size limitation with optee_shm_register() but
rather its an issue in upstream that is fixed via this patch [1]. Give
it a try and let me know if it works for you.

[1] https://lkml.org/lkml/2019/12/30/189

-Sumit

> Fixes: 246880958ac9 (=E2=80=9Cfirmware: broadcom: add OP-TEE based BNXT f=
/w manager=E2=80=9D)
> Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
> ---
>  drivers/firmware/broadcom/tee_bnxt_fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/b=
roadcom/tee_bnxt_fw.c
> index 5b7ef89..8f0c61c6 100644
> --- a/drivers/firmware/broadcom/tee_bnxt_fw.c
> +++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
> @@ -12,7 +12,7 @@
>
>  #include <linux/firmware/broadcom/tee_bnxt_fw.h>
>
> -#define MAX_SHM_MEM_SZ SZ_4M
> +#define MAX_SHM_MEM_SZ SZ_4K
>
>  #define MAX_TEE_PARAM_ARRY_MEMB                4
>
> --
> 2.7.4
>
