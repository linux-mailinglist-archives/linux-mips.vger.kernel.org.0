Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB37561E4
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2019 07:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbfFZFuM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Jun 2019 01:50:12 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:47072 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfFZFuM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Jun 2019 01:50:12 -0400
Received: by mail-yw1-f67.google.com with SMTP id z197so543728ywd.13
        for <linux-mips@vger.kernel.org>; Tue, 25 Jun 2019 22:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q7NSeFVRY9PowvxOHelyVcPJET+B1e24XnHJuQNq6bg=;
        b=VBn58feyu95JdPeeNYG39WoU4Y402pdhXDgQK3jhj+FzBN04PHNqHbXsKLwQzm1g7j
         GBE1Fz6N9a+xmFaIrv8UUXe0QdQc7WLGLhpqfwKd5GYxjyG41RBBFJtJIruY79e3MvkN
         MbV8TkyzblzsJPsJOzToEmcPlRo+muHrkRdpyUQltinoYRn9c14vF5/lpEtGwcrjjiIm
         sSVsDDBqwtckZcX0soHriSrxF4hjjiyIpg7tHQ4VqNvvee7lYwal2U3wHDXOiqZhULfJ
         p6HMAJmDFivGobqFiBy5O8wq1y4B9XK/3rTYPlJ88ibWdJrtx/8w5/5Nyz5b6HONjJKM
         k8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q7NSeFVRY9PowvxOHelyVcPJET+B1e24XnHJuQNq6bg=;
        b=bBoKw8KQSsIWl6e0T4mTTpUxquzSWZIsYEEC+jFmFWKDMpdLmQ4wApPLFS7vJpLxab
         e7as5GJKaaSXjQqNijRdsKkVdSKy8enbWoj35nWpHOA6PAGvLfQNoCmjuCHGFl3pXA74
         jhG2u7t+RPXDj44uZNgdVMmJ7bM5VrdWhjl6YAqBBJJIgkB+JQEZ3alSWH2OKrVMCK2d
         uPiFpTj6VXVst/dNH42WvAOGGRHXVR2zvzrgORM0PKs4YVm5flvTFXtDr7QwlPE6obra
         gyzHna0mKLW+mgtNR3aiasI/l+uB9ZCd7yyV19L/Gcy5LQJMbf/yZU1sALh+5Jc/B4FT
         kNdA==
X-Gm-Message-State: APjAAAV8MloUyl74ER6uuSkFXKc8CDmUdG0AMM+WJQO8lk4cESbxa2dg
        chnfai3lcvX8DdA7sTJ4I2d256AIW7JfXEOTGl4HPg7E
X-Google-Smtp-Source: APXvYqyPWd9tkF8GkbhGk8Bw+/WQBkLF/pBLWGeafBn5q5e5RGMdwJGKA5D9+Mq6wOhmq7XajJIXfjBz4YtUCYBHWzU=
X-Received: by 2002:a81:2793:: with SMTP id n141mr1589469ywn.256.1561528211236;
 Tue, 25 Jun 2019 22:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
 <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
 <20190624175553.2tpepq5zsamovrra@pburton-laptop> <060345a6-bef2-ec17-e264-eccda29f5c8b@gentoo.org>
In-Reply-To: <060345a6-bef2-ec17-e264-eccda29f5c8b@gentoo.org>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Wed, 26 Jun 2019 07:49:56 +0200
Message-ID: <CA+QBN9CtbYmTnUNyvohifcHQ03+kURZBPJ=CQRrCw0euDe-u9A@mail.gmail.com>
Subject: Re: SGI-IP30
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> SMP works fine, on my machine at least.  I got it working back in 4.4 a few
> years ago, and it's largely just worked fine since then on the one machine I
> have.

here I am with
- kernel v4.18.20 + Gentoo patches
- mips64-unknown-linux-gnu {binutils v2.29.1, gcc-v7.4.0) emerged by
Gentoo crossdev

crossdev --b 2.30-2 --g 8.2.0  --l 2.22-r1 --k 4.3 -s2 -A n32 -t
mips64-unknown-linux-gnu --without-headers -v

my Octane is
>> hinv
                   System: IP30
                Processor: 600 Mhz R14000, 2M secondary cache
                Processor: 600 Mhz R14000, 2M secondary cache, (cpu 1)
              Memory size: 1536 Mbytes
                  Network: ef0 ethernet (100/10 base-T)
                SCSI Disk: scsi(0)disk(1)
                SCSI Disk: scsi(0)disk(2)
                SCSI Disk: scsi(0)disk(3)
                    Audio: RAD Audio Processor

(yes, there is no GFX, it's a headless configuration)

my test reports:

kernel type
- No Forced Preemption: stable
- Voluntary Kernel Preemption: it works, but it has some issues with
smp_stop() and panic()
- Preemptible Kernel: completely unstable, the kernel panics in 20 seconds

I have a ram-rootfs, based on uclibc/mips3-be. It's attached to the
kernel, so "bash" is the first process.

CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE="../rootfs/mips3be-uclibc-2008"
CONFIG_INITRAMFS_ROOT_UID=0
CONFIG_INITRAMFS_ROOT_GID=0
CONFIG_RD_GZIP=y

I have three SCSI hard drives, and they do work, but I prefer net-booing

Once booted, it works properly. The 20-hours burning-in test is passed!
(two gcc sessions + nbench in a while(1) { do(); } loop )

When I exit from "bash", the kernel correctly calls the panic()
function, which calls ip30_machine_restart()
(arch/mips/sgi-ip30/ip30-power.c) but this function is not able to
restart the Octane, so it simply hangs and I have to manually force a
hardware reset. Sometimes the machine seems gone insane, and I have to
press the "reset" button several times before I can see the red light.

the solution is adding "isolcpus=1" to command line. This way the
kernel does reboot/restart correctly.

CONFIG_CMDLINE_BOOL=y
CONFIG_CMDLINE="ip=off isolcpus=1 console=ttyS0,9600 rdinit=/sbin/bash
init=/bin/bash"
CONFIG_CMDLINE_OVERRIDE=y

I have also fixed the power-down function (ds1685_rtc_poweroff_ip30,
drivers/rtc/rtc-ds1685.c) since the kernel does not power down, it
simply hangs forever.

/*
 * sgi-ip30
 * ========
 *
 * ds1685_rtc_poweroff_ip30 - uses the RTC chip to power the system off.
 * @pdev: pointer to platform_device structure.
 */
void __noreturn
ds1685_rtc_poweroff_ip30(struct platform_device *pdev)
{
        u8 val;
        struct ds1685_priv *rtc;

        printk("ip30: ds1685_rtc_poweroff\n");

        /* Check for valid RTC data, else, spin forever. */
        if (unlikely(!pdev))
        {
                pr_emerg("ds1685_rtc_poweroff_ip30, platform device
data not available, spinning forever ...\n");
                while(1);
                unreachable();
        }
        else
        {
                /* Get the rtc data. */
                rtc = platform_get_drvdata(pdev);

                if (!rtc->no_irq)
                {
                        disable_irq_nosync(rtc->irq_num);
                }

                /* prepare the RTC for waking us up so we don't wind up dead */
                val = rtc->read(rtc, 0x4b);
                val &= 0x2a;
                val |= 0x81;
                rtc->write(rtc, 0x4b, val);

                while(1)
                {
                         rtc->write(rtc, 0x4a, 0x08);
                         dev_warn(&pdev->dev, "Powerdown.\n");
                         msleep(100);
                }
                unreachable();
                /* there is no way out */
        }
}
EXPORT_SYMBOL(ds1685_rtc_poweroff_ip30);

This source comes from kernel 2.6.17, and it works properly. Instead
of patching the existing ds1685_rtc_poweroff(), I have just created a
dedicated function ds1685_rtc_poweroff_ip30() ...


-

Everything I have tried with the PCI ... doesn't work. The ShoeHorn
panics the kernel, the ShoeBox seems to have quirks
