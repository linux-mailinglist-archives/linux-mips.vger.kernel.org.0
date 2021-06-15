Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51773A77B1
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 09:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbhFOHMZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Jun 2021 03:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhFOHMZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Jun 2021 03:12:25 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372D7C0613A3
        for <linux-mips@vger.kernel.org>; Tue, 15 Jun 2021 00:10:20 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so1326947wmq.5
        for <linux-mips@vger.kernel.org>; Tue, 15 Jun 2021 00:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CW960DyAkJbZgIulFh2SqKgZviNtgHFFzWUHYQAciss=;
        b=TvW1XGLl5bBBwb99rHkJePUTzdbV7rSN6B1VDY8W31TGCATQ9bjidrAgwKLLgINUpJ
         loo3c2/atVGTWFw8KUjTKnil0+62LwQOiRx6GX12Yoe6CAqxLoXUwrXpDJr3nZD+plII
         u7K5aZ/PQ40WDn/FfOp9vGBBK+ZuH9MKuYxRZ1xNucIjJ7Nmjw43CUUjOpDfDMTc12WI
         guwyZuKeVyMkjQkJ3Zhukwo9m7vrlX33KxpGaXfcO0OsxliXAgybh6SObPkqvMYpYe53
         JgNBEMhsvli7NMaP0biXVAW4sXELZJGPOPrEst/+b/M/mP4YI+0bMGKWzX1loxr4OcYK
         5n2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CW960DyAkJbZgIulFh2SqKgZviNtgHFFzWUHYQAciss=;
        b=ife63n+0NDhY1DWwdqTZWqKqKWZJ8ocJgTBZEK9TwqfXSJQdg4Uwf9ZnfTB6iEJ1ku
         ZC/k4L1fU+qAAHrEh8sj0WWrTp0KOpHM/+mRlvUA89HiEet4PfANqhmLDENNxsceJufN
         CQolvhF9wFKxKUDqQVMsU1SfQiXT2VcF9lwjkPn6wtSIKvAT7OzdGSPUzUBh2K3y7rLB
         djn4ndkRElWCghgu6t/+qvO9QeYqgI/qzIQDIHEmNxVrnQ7lWo9tWcNSqUUuT6p6ns1r
         N6VZ1v5QBRp/0cz/7+FPhssnejU//4ZEC6GOesXWrk1PnAP6TCyWNzmV0CCMmKyRzABS
         nwLA==
X-Gm-Message-State: AOAM530P/bbzICWnLN0lWeajvJk9kJ2TpqVittsEwXNp5J7LQjzZHFob
        joiYbGUbOgKTFyRrmVGqGGVJMuvvu9N0roUd8ASjXA==
X-Google-Smtp-Source: ABdhPJz5rVd5W8B/FQIKX6pBxgS6Znp7UnQMQ1wxjlQWONGkOGM546PORvSVmNM/dDoLfR/RfkdyuHbrNfd4+ZipfrM=
X-Received: by 2002:a7b:c853:: with SMTP id c19mr3573406wml.30.1623741018772;
 Tue, 15 Jun 2021 00:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210614223317.999867-1-tyhicks@linux.microsoft.com> <20210614223317.999867-7-tyhicks@linux.microsoft.com>
In-Reply-To: <20210614223317.999867-7-tyhicks@linux.microsoft.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Tue, 15 Jun 2021 09:10:08 +0200
Message-ID: <CAHUa44G+hxjckap1e1qZXTf6vQqQYNMw=ofzdFCP1OgCXQsF5Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] tee: Correct inappropriate usage of
 TEE_SHM_DMA_BUF flag
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

On Tue, Jun 15, 2021 at 12:33 AM Tyler Hicks
<tyhicks@linux.microsoft.com> wrote:
>
> From: Sumit Garg <sumit.garg@linaro.org>
>
> Currently TEE_SHM_DMA_BUF flag has been inappropriately used to not
> register shared memory allocated for private usage by underlying TEE
> driver: OP-TEE in this case. So rather add a new flag as TEE_SHM_PRIV
> that can be utilized by underlying TEE drivers for private allocation
> and usage of shared memory.
>
> With this corrected, allow tee_shm_alloc_kernel_buf() to allocate a
> shared memory region without the backing of dma-buf.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Co-developed-by: Tyler Hicks <tyhicks@linux.microsoft.com>
> Signed-off-by: Tyler Hicks <tyhicks@linux.microsoft.com>
> ---
>  drivers/tee/optee/call.c     | 2 +-
>  drivers/tee/optee/core.c     | 3 ++-
>  drivers/tee/optee/rpc.c      | 5 +++--
>  drivers/tee/optee/shm_pool.c | 8 ++++++--
>  drivers/tee/tee_shm.c        | 4 ++--
>  include/linux/tee_drv.h      | 1 +
>  6 files changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
