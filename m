Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7C081305B5
	for <lists+linux-mips@lfdr.de>; Sun,  5 Jan 2020 05:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgAEEqd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Jan 2020 23:46:33 -0500
Received: from mail-il1-f175.google.com ([209.85.166.175]:44627 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgAEEqc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Jan 2020 23:46:32 -0500
Received: by mail-il1-f175.google.com with SMTP id z12so3446922iln.11
        for <linux-mips@vger.kernel.org>; Sat, 04 Jan 2020 20:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=junsun-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=lvlyKeFx2zuonqFHMW5XoD2J5gNU86sxAlvX6sB5ZAY=;
        b=E1OYEjhkfOvp7i0O2EfBTvYc2g8xnF+lemegZqoLsoJO3akmuLEcpx8WIb3jVf4mUb
         IdngOULGPWEUbZjLn11X3neZjeHW3yVMnQGRGbrpoDTxuyxJTxNgP74watkW+SqKkCyr
         tP6GtS1tPGM5Z+dRDnEQAayOUzZkd9NECYL0bnqxGyVmDvaDoCNZ2Ph2w37jQxOFWIeD
         B6WLAucIswffXSoCduKjAbSdsPrzQKpwogkqTSA3rRPSfvWlJ+bkL1k1zanRwq/BRRQ2
         9/6MmI+yikaPyd1SfXN+CLelsbjokTZe8ez0Rj+SciGL0zJglSWtZfQiuHe/Z08Z+Z4B
         ks4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=lvlyKeFx2zuonqFHMW5XoD2J5gNU86sxAlvX6sB5ZAY=;
        b=qdUo4xepZs/Z56Cbk4hzgnlx/yJETJGyQS8eQTFnfY9iiqIBtYZXvjC2VWUvCNpfoT
         2X+K5o3rTTqVVptN2Emeu2ivei1oB6rRlCOWc1Z5UkCUC1FSoBfUom5G6xvgnANaOM4V
         eeKWrX79x640x6tFV78Ab7f1DtH+sTeTO2nBytlsulcqDyKVoC3hZYbEISG3zhUXqhWa
         lM1F5uF5YChi13u8M0A69E/EEie9YxWRurqflAg+Gc7/5TkXC5aHkMIk4fZC/6OF3g+9
         7DMsjAgLoNkwHyKuPj3ZXo8zgox0xPudaPoBjmvOczCr8jEbF3LuF140wV0YISBb2463
         DqjQ==
X-Gm-Message-State: APjAAAXtI8C3/Otv9uZUbD8ihwWKAIrzelePj4icM+UKym4GGHOt/1np
        GGyzwH2uYILDfEiotjDBifpCmrHyDKc54RTevOTv0Q==
X-Google-Smtp-Source: APXvYqwl3n1whesY5bXM26yrOpjAVZousFe7XhEnEpnl3owC8Fw4mXumKdTxDVz+b3D4kfUoiy0zPO3ynDGi0HazdvQ=
X-Received: by 2002:a92:8991:: with SMTP id w17mr74227708ilk.12.1578199592076;
 Sat, 04 Jan 2020 20:46:32 -0800 (PST)
MIME-Version: 1.0
References: <CAP5Nno5CPjV2mcf2ny8AtcC2ziqDkv6Kc7f4hCq1TF4DvKvJkw@mail.gmail.com>
In-Reply-To: <CAP5Nno5CPjV2mcf2ny8AtcC2ziqDkv6Kc7f4hCq1TF4DvKvJkw@mail.gmail.com>
From:   Jun Sun <jsun@junsun.net>
Date:   Sat, 4 Jan 2020 20:46:21 -0800
Message-ID: <CAP5Nno466s9M_7E0keMP3s=rDuZ48hrAb9-xAv52SsADr910XA@mail.gmail.com>
Subject: Re: debian bootup hangs on qemu-system-mips64el
To:     qemu-discuss@nongnu.org, debian-mips@lists.debian.org,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Cross-post to the *right* linux-mips list with the *right*
"plain/text" format (sigh)... and hopefully we can have more expert
eyes looking at this ...

(Really sorry to qemu-discuss and debian-mips list ...)

Thanks.

Jun


On Wed, Jan 1, 2020 at 6:50 PM Jun Sun <jsun@junsun.net> wrote:
>
> Hi, all,
>
> Debian/mips64el runs well on qemu-system-mips64el until I turned on smp o=
ption with a number of 2 or higher.  See the error message below.  It usual=
ly hangs pretty early on.
>
> I have experimented with different CPU types (e.g., 5KEc) and different m=
emory amont with no avail. Does anybody have an idea?
>
> I attached the kernel config for reference.  It appears SMP kernel config=
s are enabled properly.
>
> Thanks a lot!
>
> Jun
>
> qemu-system-mips64el -M malta -smp 2 -cpu MIPS64R2-generic -m 1314 -hda h=
da.qcow2 -kernel vmlinux -initrd initrd.img -append 'root=3D/dev/sda1 conso=
le=3DttyS0 nokaslr' -nographic -net user,hostfwd=3Dtcp::2222-:22,hostfwd=3D=
tcp::8080-:80,hostfwd=3Dtcp::8443-:443 -net nic -serial mon:stdio
> qemu-system-mips64el: warning: SPD cannot represent final 2MB of SDRAM
> [    0.000000] Linux version 4.19.0-6-5kc-malta (debian-kernel@lists.debi=
an.org) (gcc version 8.3.0 (Debian 8.3.0-6)) #1 SMP Debian 4.19.67-2+deb10u=
1 (2019-09-20)
> [    0.000000] earlycon: uart8250 at I/O port 0x3f8 (options '38400n8')
> [    0.000000] bootconsole [uart8250] enabled
> [    0.000000] CPU0 revision is: 00010000 (MIPS GENERIC QEMU)
> [    0.000000] FPU revision is: 007f0000
> [    0.000000] Checking for the multiply/shift bug... no.
> [    0.000000] Checking for the daddiu bug... no.
> [    0.000000] MIPS: machine is mti,malta
> [    0.000000] Software DMA cache coherency enabled
> [    0.000000] Determined physical RAM map:
> [    0.000000]  memory: 0000000010000000 @ 0000000000000000 (usable)
> [    0.000000]  memory: 0000000042200000 @ 0000000090000000 (usable)
>
> [HANG FOREVER AT HERE ...]
>
