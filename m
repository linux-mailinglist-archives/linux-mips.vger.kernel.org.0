Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E771E339D
	for <lists+linux-mips@lfdr.de>; Thu, 24 Oct 2019 15:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393497AbfJXNMz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Oct 2019 09:12:55 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40684 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390361AbfJXNMz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Oct 2019 09:12:55 -0400
Received: by mail-lj1-f193.google.com with SMTP id u22so6972128lji.7
        for <linux-mips@vger.kernel.org>; Thu, 24 Oct 2019 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=hrK+GXo5jPUW1NuanAWwbp3UQ7pRT6JtsxLHCNdvIIo=;
        b=EUWc5jqigygP9LKG4/M787yKUFrTUC1gWQM/+ly9VhHe+9BHV8iAXAgKkhqj/aqWFR
         TsK8BLq4yTbnnK6xnmxmQsBu7W9vrUmUTGpvieSwue7UKW79/pOZuP/LgIu2fVjuEKLc
         lbz40dnByh6Bt4QCq/Sw7Rwk/VVc7YTcwfpv0YBBWaiVFqG8JGhAVMZ/Urbsak1w7cxd
         5HZipw/B1owMG0KaQK3ePPpO5bCBxe1/ql4bhFUYQ9T3xPbU1E+qgf867HRrz5DKGsY+
         i1k/mATDbPAJhPlh1ZG493+kTnKCVLnSlK6t71AsNIP0HiEB1qDJPOWWrMviAetrr+K7
         1zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=hrK+GXo5jPUW1NuanAWwbp3UQ7pRT6JtsxLHCNdvIIo=;
        b=olvh/K6xr2agluGzjqAWWNX09vIcgQ91LGSOWH7yHVwthFbgtXxj5DAEg8L0+9c1hr
         MDOsEij0uiWYMYe7nzSBcpengRhZsmlhEfhe0mnkd9BC2EI9aIqXArjy/Z6r2CUFKQDf
         Rd9nq1ZNCTeJmhhdGIHPblV65IL4xAyhaQT2snLEK2LhDDHJ/vJJT5FbQDfuZ/+aQrDk
         TWcmlSwbTK1asF/ljrOBJoJ9DVa3usJTEbo0WN5mdT0c6meIeMTho114WNvfM0BXK9V1
         8IOvF/X3EJg5Sg9ZyC4lYAqjkgCeVpJCpqKqbXb/kw6xAAoX7B12G7HiOI2xOZUYq21P
         LQNg==
X-Gm-Message-State: APjAAAURmP9rqRJYh3TzSXHK6Ixxy6mnTa1MPYlmcGuyYN9SILvDJFm2
        DbqwOuibXi1Set6QTfLiZuuT2RCl4q6sWa5Fy7aq3SBxf4pS4A==
X-Google-Smtp-Source: APXvYqxeFTwWxVUwMWDVMZSGFinaSyLTnw6x7t+8UIzt07980dGsyVa3SxEciCwwdRR1UIE95hrRHsLmMON6k8hzL/o=
X-Received: by 2002:a2e:7312:: with SMTP id o18mr26320289ljc.32.1571922770619;
 Thu, 24 Oct 2019 06:12:50 -0700 (PDT)
MIME-Version: 1.0
From:   Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Thu, 24 Oct 2019 09:12:39 -0400
Message-ID: <CADkTA4NT5MBzErPT5S49aswxH4bUi2KKCWEWppPpFgJ-ru3L=g@mail.gmail.com>
Subject: v5.4-rcX: qemu-system-mips64 userspace segfault
To:     linux-mips@vger.kernel.org, vincenzo.frascino@arm.com,
        paul.burton@mips.com
Cc:     Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

I'm not sure if anyone else is running qemu-system-mips64 regularly,
but for the past 4 (or more) years, it has been the primary way that
we run QA on the mips64 Yocto Project reference kernel(s). I take care
of the kernel for the project, so I always have the fun of running
into issues first :D

That's enough preamble ...

I wanted to see if anyone recognized the issue that I'm seeing when I
bumped the linux-yocto dev kernel to the v5.4-rc series.

The one line summary is that I'm seeing a segfault as soon as  the
kernel hands off to userspace during boot. It doesn't matter if it is
systemd, sysvinit, or init=/bin/sh .. I always get a segfault.

Here's the snippet of the boot (it isn't informative, and doesn't
really tell us anything ..)

[   33.155335] md: Waiting for all devices to be available before autodetect
[   33.246899] md: If you don't use raid, use raid=noautodetect
[   33.352059] md: Autodetecting RAID arrays.
[   33.442893] md: autorun ...
[   33.536877] md: ... autorun DONE.
[   33.745949] EXT4-fs (vda): recovery complete
[   33.876766] EXT4-fs (vda): mounted filesystem with ordered data
mode. Opts: (null)
[   34.077905] VFS: Mounted root (ext4 filesystem) on device 253:0.
[   34.184518] devtmpfs: mounted
[   34.359569] Freeing unused kernel memory: 588K
[   34.476478] This architecture does not have kernel memory protection.
[   34.576358] Run /sbin/init as init process
[   35.011380] do_page_fault(): sending SIGSEGV to init for invalid
read access from 0000000000000360
[   35.253603] epc = 0000000000000360 in systemd[aaab121000+12d000]
[   35.368150] ra  = 000000fffdd0c5cc in
[   35.492165] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[   35.721361] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---

I was able to bisect the kernel and land on a commit that shows when
the problem first popped up:

> git bisect good
24640f233b466051ad3a5d2786d2951e43026c9d is the first bad commit
commit 24640f233b466051ad3a5d2786d2951e43026c9d
Author: Vincenzo Frascino <vincenzo.frascino@arm.com>
Date:   Fri Jun 21 10:52:46 2019 +0100

    mips: Add support for generic vDSO

    The mips vDSO library requires some adaptations to take advantage of the
    newly introduced generic vDSO library.

    Introduce the following changes:
     - Modification of vdso.c to be compliant with the common vdso datapage
     - Use of lib/vdso for gettimeofday

    Cc: Ralf Baechle <ralf@linux-mips.org>
    Cc: Paul Burton <paul.burton@mips.com>
    Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
    [paul.burton@mips.com: Prepend $(src) to config-n32-o32-env.c path.]
    Signed-off-by: Paul Burton <paul.burton@mips.com>

:040000 040000 2781bc95f79d835c754962eec097eaa149a6d29e
ad346bd742e3df90997075fbf1abeef586a02da3 M      arch

.. which passes the smell test for something that would be in the
right area for the type of segfault I'm seeing.

It of course wasn't trivial to revert, but with the following stack of
reverts, I'm able to build and boot again:

932bb934ed4d mips: compat: vdso: Use legacy syscalls as fallback
cdab7e2c73d5 mips: vdso: Fix flip/flop vdso building bug
b4c0f7fa5308 mips: vdso: Fix source path
1f66c45db330 mips: Add clock_gettime64 entry point
abed3d826f2f mips: Add clock_getres entry point
6393e6064486 mips: fix vdso32 build, again
24640f233b46 mips: Add support for generic vDSO
8919975b6171 MIPS: VDSO: Fix build for binutils < 2.25
90800281e761 MIPS: VDSO: Remove unused gettimeofday.c

I looked, and can't find any obvious way to fix the issue, or a new
config option that I should be tweaking .. or anything else, outside
of the local revert.

This email is already starting to get long, so I'll cut off the
information dump here. I can provide more details (.config, etc), or
whatever else folks might need to get some better idea.

FWIW: this is how we spawn qemu-system-mips64 for the boot test:

% qemu-system-mips64 -device
virtio-net-pci,netdev=net0,mac=52:54:00:12:35:02 -netdev
user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23,tftp=poky/build/tmp/deploy/images/qemumips64
-drive file=poky/build/tmp/deploy/images/qemumips64/core-image-minimal-qemumips64-20191017144136.rootfs.ext4,if=virtio,format=raw
-show-cursor -usb -device usb-tablet -object
rng-random,filename=/dev/urandom,id=rng0 -device
virtio-rng-pci,rng=rng0 -nographic -machine malta -cpu
MIPS64R2-generic -m 256 -serial mon:stdio -serial null -kernel
poky/build/tmp/deploy/images/qemumips64/vmlinux -append root=/dev/vda
rw highres=off  console=ttyS0 ip=dhcp console=ttyS0 console=tty

Cheers,

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
