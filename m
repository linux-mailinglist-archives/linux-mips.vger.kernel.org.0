Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 606ABB0325
	for <lists+linux-mips@lfdr.de>; Wed, 11 Sep 2019 19:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729720AbfIKRwS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Sep 2019 13:52:18 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46492 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729622AbfIKRwS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Sep 2019 13:52:18 -0400
Received: by mail-io1-f67.google.com with SMTP id d17so25952822ios.13
        for <linux-mips@vger.kernel.org>; Wed, 11 Sep 2019 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HbS/KQiPS6GYQq/A01AcuHnYtxU/1GCYRocYDq2JA1s=;
        b=b+x7KfThP8mwzHSS0fnuf6kgIsBKNRIeXFwrR5UJKYaFo2gS/TjEBsV8MM43IgiQQD
         6q9s+Oh2B2Yelu98Zl0ap07eXNLx4FwX8UjhX6XNSJZ5B4v6t8khZgYHh+Qe9roM/6Jm
         1hHjsa+3JqdhaeJ2L68tfTM42KeicxNHolDFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HbS/KQiPS6GYQq/A01AcuHnYtxU/1GCYRocYDq2JA1s=;
        b=FQZF3P9M1y4s1Ej8NOeKW7edK+qA0bSWumbIuXoixQfH/d/qlxvsDLDWne1UbKZ4Cb
         Psa3T+PellODtTtZfiqSz1Z40Aj2rmBNEfLIjudjDxPnDXjXQSFG6DNkhxNbrB4MV3wi
         W9w20gfcNWOPwnzmi/KYKgIgbt64vM4kK6+madQVZLONPjfG5KMz/v7dOnjs9VvueigM
         BxtZoBeIrx8k2k586SKPWGWYCfFpKOucb9tcGO5v7MXEKhuPdnuk24xGSJ7Huua+PgDy
         DAwoDCP0rqV9+Mcm+BD6yw4SPulB+FihWn8HgkpuG9e/rcRmte46qS04ewFwL/L/qDuF
         a49w==
X-Gm-Message-State: APjAAAWeiopgsYp1lnOiCOku/nOp9WPBrbOYv4umxiD+9L5qck5bwNJR
        U8Gt+zY45LxD1lNran6PGyED2lUSay+5WD5qqDEuaw==
X-Google-Smtp-Source: APXvYqxkQY2aPHHvJGRvqt+Dwv2PsDnBNCwxYJo7++vNEUAeJk43TQhCoq5hPcsrnVqk5SBNnMHxXYJP2PK6HU0/dfY=
X-Received: by 2002:a6b:b487:: with SMTP id d129mr84591iof.223.1568224337302;
 Wed, 11 Sep 2019 10:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <1568128624-2902-1-git-send-email-sheetal.tigadoli@broadcom.com> <20190910171601.GA12665@kroah.com>
In-Reply-To: <20190910171601.GA12665@kroah.com>
From:   Sheetal Tigadoli <sheetal.tigadoli@broadcom.com>
Date:   Wed, 11 Sep 2019 23:23:56 +0530
Message-ID: <CAFD6DHjOV9ChRXsuoanXh0JN6DW-AUxTFdcu8PKTwGa5wW7e8A@mail.gmail.com>
Subject: Re: [PATCH] firmware: broadcom: add OP-TEE based BNXT f/w manager
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Scott Branden <scott.branden@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Vikram Prakash <vikram.prakash@broadcom.com>,
        tee-dev@lists.linaro.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Vikas Gupta <vikas.gupta@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thanks for the review and  comments.

On Tue, Sep 10, 2019 at 10:46 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Sep 10, 2019 at 08:47:04PM +0530, Sheetal Tigadoli wrote:
> > From: Vikas Gupta <vikas.gupta@broadcom.com>
> >
> > This driver registers on TEE bus to interact with OP-TEE based
> > BNXT firmware management modules
> >
> > Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
> > Signed-off-by: Sheetal Tigadoli <sheetal.tigadoli@broadcom.com>
> > ---
> >  drivers/firmware/broadcom/Kconfig             |   8 +
> >  drivers/firmware/broadcom/Makefile            |   1 +
> >  drivers/firmware/broadcom/tee_bnxt_fw.c       | 447 ++++++++++++++++++++++++++
> >  include/linux/firmware/broadcom/tee_bnxt_fw.h |  17 +
> >  4 files changed, 473 insertions(+)
> >  create mode 100644 drivers/firmware/broadcom/tee_bnxt_fw.c
> >  create mode 100644 include/linux/firmware/broadcom/tee_bnxt_fw.h
> >
> > diff --git a/drivers/firmware/broadcom/Kconfig b/drivers/firmware/broadcom/Kconfig
> > index 6468082..a846a21 100644
> > --- a/drivers/firmware/broadcom/Kconfig
> > +++ b/drivers/firmware/broadcom/Kconfig
> > @@ -22,3 +22,11 @@ config BCM47XX_SPROM
> >         In case of SoC devices SPROM content is stored on a flash used by
> >         bootloader firmware CFE. This driver provides method to ssb and bcma
> >         drivers to read SPROM on SoC.
> > +
> > +config TEE_BNXT_FW
> > +     bool "Broadcom BNXT firmware manager"
> > +     depends on ARCH_BCM_IPROC && OPTEE
>
> No ability to build with compile testing?
Will add "|| COMPILE_TEST"
>
> > +     default ARCH_BCM_IPROC
> > +     help
> > +       This module help to manage firmware on Broadcom BNXT device. The module
> > +       registers on tee bus and invoke calls to manage firmware on BNXT device.
> > diff --git a/drivers/firmware/broadcom/Makefile b/drivers/firmware/broadcom/Makefile
> > index 72c7fdc..17c5061 100644
> > --- a/drivers/firmware/broadcom/Makefile
> > +++ b/drivers/firmware/broadcom/Makefile
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-$(CONFIG_BCM47XX_NVRAM)          += bcm47xx_nvram.o
> >  obj-$(CONFIG_BCM47XX_SPROM)          += bcm47xx_sprom.o
> > +obj-$(CONFIG_TEE_BNXT_FW)            += tee_bnxt_fw.o
> > diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
> > new file mode 100644
> > index 00000000..89a48fd
> > --- /dev/null
> > +++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
> > @@ -0,0 +1,447 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2019 Broadcom.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/tee_drv.h>
> > +#include <linux/uuid.h>
> > +
> > +#include <linux/firmware/broadcom/tee_bnxt_fw.h>
> > +
> > +#define DRIVER_NAME  "tee-bnxt-fw"
>
> KBUILD_MODNAME?
Will remove DRIVER_NAME macro and use KBUILD_MODNAME instead.
>
> > +#define MAX_SHM_MEM_SZ       SZ_4M
>
> Why?
Limiting max data buffer size per request to optee to 4MB.
>
> > +
> > +#define MAX_TEE_PARAM_ARRY_MEMB              4
> > +
> > +enum ta_cmd {
> > +/*
> > + * TA_CMD_BNXT_FASTBOOT - boot bnxt device by copying f/w into sram
> > + *
> > + * param[0] unused
> > + * param[1] unused
> > + * param[2] unused
> > + * param[3] unused
> > + *
> > + * Result:
> > + * TEE_SUCCESS - Invoke command success
> > + * TEE_ERROR_ITEM_NOT_FOUND - Corrupt f/w image found on memory
> > + */
> > +     TA_CMD_BNXT_FASTBOOT = 0,
> > +
>
> Please indent the comments too.  As-is this is hard to read.
Will do
>
>
> > +/*
> > + * TA_CMD_BNXT_HEALTH_STATUS - to check health of bnxt device
> > + *
> > + * param[0] (out value) - value.a: health status
> > + * param[1] unused
> > + * param[2] unused
> > + * param[3] unused
> > + *
> > + * Result:
> > + * TEE_SUCCESS - Invoke command success
> > + * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
> > + */
> > +     TA_CMD_BNXT_HEALTH_STATUS,
>
> Should all of these have explicit values?
Will initialize each cmd (TA_CMD_BNXT_*) explicitly
>
> > +
> > +/*
> > + * TA_CMD_BNXT_HANDSHAKE - to check bnxt device is booted
> > + *
> > + * param[0] (in value)  - value.a: max timeout value
> > + * param[0] (out value) - value.a: boot status
> > + * param[1] unused
> > + * param[2] unused
> > + * param[3] unused
> > + *
> > + * Result:
> > + * TEE_SUCCESS - Invoke command success
> > + * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
> > + */
> > +     TA_CMD_BNXT_HANDSHAKE,
> > +
> > +/*
> > + * TA_CMD_BNXT_COPY_COREDUMP - copy the core dump into shm
> > + *
> > + * param[0] (in value) - value.a: offset at which data to be copied from
> > + *                    value.b: size of the data
> > + * param[1] unused
> > + * param[2] unused
> > + * param[3] unused
> > + *
> > + * Result:
> > + * TEE_SUCCESS - Invoke command success
> > + * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
> > + * TEE_ERROR_ITEM_NOT_FOUND - Corrupt core dump
> > + */
> > +     TA_CMD_BNXT_COPY_COREDUMP,
> > +
> > +/*
> > + * TA_CMD_BNXT_FW_UPGRADE - upgrade the bnxt firmware
> > + *
> > + * param[0] (in value) - value.a: size of the f/w image
> > + * param[1] unused
> > + * param[2] unused
> > + * param[3] unused
> > + *
> > + * Result:
> > + * TEE_SUCCESS - Invoke command success
> > + * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
> > + */
> > +     TA_CMD_BNXT_FW_UPGRADE,
> > +};
> > +
> > +/**
> > + * struct tee_bnxt_fw_private - OP-TEE bnxt private data
> > + * @dev:             OP-TEE based bnxt device.
> > + * @ctx:             OP-TEE context handler.
> > + * @session_id:              TA session identifier.
> > + */
> > +struct tee_bnxt_fw_private {
> > +     struct device *dev;
>
> Why is the pointer back needed?
the dev pointer is used in "dev_err()"
>
> > +     struct tee_context *ctx;
> > +     u32 session_id;
> > +     struct tee_shm *fw_shm_pool;
> > +};
> > +
> > +static struct tee_bnxt_fw_private pvt_data;
> > +
> > +static inline void prepare_args(int cmd,
> > +                             struct tee_ioctl_invoke_arg *inv_arg,
> > +                             struct tee_param *param)
> > +{
> > +     memset(inv_arg, 0, sizeof(*inv_arg));
> > +     memset(param, 0, (MAX_TEE_PARAM_ARRY_MEMB * sizeof(*param)));
> > +
> > +     inv_arg->func = cmd;
> > +     inv_arg->session = pvt_data.session_id;
> > +     inv_arg->num_params = MAX_TEE_PARAM_ARRY_MEMB;
> > +
> > +     /* Fill invoke cmd params */
> > +     switch (cmd) {
> > +     case TA_CMD_BNXT_HEALTH_STATUS:
> > +             param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
> > +             break;
> > +     case TA_CMD_BNXT_HANDSHAKE:
> > +             param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
> > +             break;
> > +     case TA_CMD_BNXT_COPY_COREDUMP:
> > +     case TA_CMD_BNXT_FW_UPGRADE:
> > +             param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
> > +             param[0].u.memref.shm = pvt_data.fw_shm_pool;
> > +             param[0].u.memref.size = MAX_SHM_MEM_SZ;
> > +             param[0].u.memref.shm_offs = 0;
> > +             param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> > +             break;
> > +     case TA_CMD_BNXT_FASTBOOT:
> > +     default:
> > +             /* Nothing to do */
> > +             break;
> > +     }
> > +}
> > +
> > +/**
> > + * tee_bnxt_fw_load() - Load the bnxt firmware
> > + *               Uses an OP-TEE call to start a secure
> > + *               boot process.
> > + * Returns 0 on success, negative errno otherwise.
> > + */
> > +int tee_bnxt_fw_load(void)
> > +{
> > +     int ret = 0;
> > +     struct tee_ioctl_invoke_arg inv_arg;
> > +     struct tee_param param[MAX_TEE_PARAM_ARRY_MEMB];
> > +
> > +     if (!pvt_data.ctx)
> > +             return -ENODEV;
> > +
> > +     prepare_args(TA_CMD_BNXT_FASTBOOT, &inv_arg, param);
> > +
> > +     ret = tee_client_invoke_func(pvt_data.ctx, &inv_arg, param);
> > +     if ((ret < 0) || (inv_arg.ret != 0)) {
> > +             dev_err(pvt_data.dev, "TA_CMD_BNXT_LOAD invoke err: %x\n",
> > +                     (ret < 0) ? ret : inv_arg.ret);
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(tee_bnxt_fw_load);
>
> Why are you exporting symbols for a single file?  What uses these?
These apis will be used by bnxt driver, still working on open sourcing changes

> This feels really wrong, are you sure this all is correct?
>
> I stopped reading here :)
>
> thanks,
>
> greg k-h
