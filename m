Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 824053A3EBA
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 11:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhFKJMQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Jun 2021 05:12:16 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:41867 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhFKJMN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Jun 2021 05:12:13 -0400
Received: by mail-wm1-f50.google.com with SMTP id y13-20020a1c4b0d0000b02901c20173e165so140534wma.0
        for <linux-mips@vger.kernel.org>; Fri, 11 Jun 2021 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Egx3T+r+MdqwKDRFu2oj7ToUZ/M+AjkRGEvdLGmyR0=;
        b=rZfaoDUnOmmtnXLuSumOibA5QNMCiMlQ80NgjHRY0Shk27yj3NfbvwJfg6HLwrNGsQ
         MZmn0iJ7rTMWg6Zrazz6eZVpBFfKISTNYlJzDhje0d9DxqZMuvip9tgAuSdRIX7TCij2
         5+NFIjRh/OASeCDEbuMnbPDQBVf+sQyGH8KFEjTdVnAEZjtt8l08imL6UU11G/iJECnY
         WPbH7Vk4DSMomRmti8r2X5RsYK/g6H9o7ZrWDkSh050129aUcCZ3LSQ63V2UbWWQ4upG
         Vkl5PcUwYvhDULREMhlevbgGM5pmAI0YHHXYaK6AENNYo7Un8Q99OH1B3q8sI0SVh4Tw
         +Wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Egx3T+r+MdqwKDRFu2oj7ToUZ/M+AjkRGEvdLGmyR0=;
        b=XNR9V99VDVDwEpMhUuMyiCIfEALbU/AXPvILY7vCdRAKwKKIJR8ygNdaLVLoLyxmXu
         IVM8P2xTILca9LGgr9vxRqU03sBvhlw9wfYI1nRZsYLEWPhgKM7y8JMorJQL7ipeF1qG
         jWdow5R8/n6pqQIWvQsmBd6dJjMBYMlTVLUYXt4L4JsJCpPFvFFP9AOGEUnqvlC8q4z+
         ZCBUQqyCXR31B221puNxtOkwhAWjf+5/adxXXT32zil8YYW6yJRTI3EsKoYsgwlHgizx
         XdvCvzadY8Xw6sdWJCVnzK0iuN7ofeHcA/nmQJ1tLUhx+gXFuQlrZOU7JwWpREQn9x6H
         I4/w==
X-Gm-Message-State: AOAM533RF/Qg66KiWHC4lTJAp61CMQNwwpOlvW6IcngLS88I9mrQyVFI
        p+cvjOh3QE47E9Dbjs0nnUiDRCG2g6ocZc/3RQ8yTQ==
X-Google-Smtp-Source: ABdhPJxm4IyPJvEMYQF+cuZdjXmewYzeznnDW42omLFdC7jhbt58zwV/AAUm8apWJ3kgHgKNnR7FZoCanj7gvHCZmnU=
X-Received: by 2002:a1c:41c5:: with SMTP id o188mr19063241wma.60.1623402539314;
 Fri, 11 Jun 2021 02:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210610210913.536081-1-tyhicks@linux.microsoft.com> <20210610210913.536081-3-tyhicks@linux.microsoft.com>
In-Reply-To: <20210610210913.536081-3-tyhicks@linux.microsoft.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Fri, 11 Jun 2021 11:08:48 +0200
Message-ID: <CAHUa44Hh2Q06zu0TwvCejcc_0cqXeTVNA8fyt=1VH9uT7++1vg@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] optee: Refuse to load the driver under the kdump kernel
To:     Tyler Hicks <tyhicks@linux.microsoft.com>
Cc:     Allen Pais <apais@linux.microsoft.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        Peter Huewe <peterhuewe@gmx.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Vikas Gupta <vikas.gupta@broadcom.com>,
        Thirupathaiah Annapureddy <thiruan@microsoft.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 10, 2021 at 11:09 PM Tyler Hicks
<tyhicks@linux.microsoft.com> wrote:
>
> Fix a hung task issue, seen when booting the kdump kernel, that is
> caused by all of the secure world threads being in a permanent suspended
> state:
>
>  INFO: task swapper/0:1 blocked for more than 120 seconds.
>        Not tainted 5.4.83 #1
>  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>  swapper/0       D    0     1      0 0x00000028
>  Call trace:
>   __switch_to+0xc8/0x118
>   __schedule+0x2e0/0x700
>   schedule+0x38/0xb8
>   schedule_timeout+0x258/0x388
>   wait_for_completion+0x16c/0x4b8
>   optee_cq_wait_for_completion+0x28/0xa8
>   optee_disable_shm_cache+0xb8/0xf8
>   optee_probe+0x560/0x61c
>   platform_drv_probe+0x58/0xa8
>   really_probe+0xe0/0x338
>   driver_probe_device+0x5c/0xf0
>   device_driver_attach+0x74/0x80
>   __driver_attach+0x64/0xe0
>   bus_for_each_dev+0x84/0xd8
>   driver_attach+0x30/0x40
>   bus_add_driver+0x188/0x1e8
>   driver_register+0x64/0x110
>   __platform_driver_register+0x54/0x60
>   optee_driver_init+0x20/0x28
>   do_one_initcall+0x54/0x24c
>   kernel_init_freeable+0x1e8/0x2c0
>   kernel_init+0x18/0x118
>   ret_from_fork+0x10/0x18
>
> The invoke_fn hook returned OPTEE_SMC_RETURN_ETHREAD_LIMIT, indicating
> that the secure world threads were all in a suspended state at the time
> of the kernel crash. This intermittently prevented the kdump kernel from
> booting, resulting in a failure to collect the kernel dump.
>
> Make kernel dump collection more reliable on systems utilizing OP-TEE by
> refusing to load the driver under the kdump kernel.
>
> Signed-off-by: Tyler Hicks <tyhicks@linux.microsoft.com>
> ---
>  drivers/tee/optee/core.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Looks good
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
