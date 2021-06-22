Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EF03B103C
	for <lists+linux-mips@lfdr.de>; Wed, 23 Jun 2021 00:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhFVWzF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 18:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhFVWzE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 18:55:04 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC06BC061574
        for <linux-mips@vger.kernel.org>; Tue, 22 Jun 2021 15:52:47 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id g192so726996pfb.6
        for <linux-mips@vger.kernel.org>; Tue, 22 Jun 2021 15:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=yX7dbRRP6lhZb+ynk6L/KXEBeww/k9a2MTxoERVJ0g0=;
        b=EP6sFCDlmX5c9EmaUDq5io/k1tWfjS+C7MHJqiAPiPn8dvUZhhpcZVe7EsdDVKwQTc
         xacD6r/6z+qsP/Gg2RVbDLpJcNZcuo5+/U4on1gQoV+YUzcOSdb6adejj0kuKhFoNm7P
         I0bobKWSQHAq60fs393NugQUKWRp1DsNP0HqmwmWoUtE5eOBRyESnzqBSFTZl5ok0sAP
         PqCLnHiyFiywkFqKQWsr/hNGf6kjmbD8xgnEPDViJAjedhj5TDL+cUGcKx0srbMTMYt3
         eWEfo0diFMvTMSn8dyqW1tWifOMk/o5WqKJzNdaQe19MKNGWDbNVkpFbo4/rwEy46rvO
         GQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=yX7dbRRP6lhZb+ynk6L/KXEBeww/k9a2MTxoERVJ0g0=;
        b=THZ5QLhNr4fRBZXz3jMy2eoe7sKg/xLjiMnmrzwl8S2om+ovNA29MnjepWAd+dLcU5
         uQc3hwnxaBJaAFIDXzIn8BalQyjBuh7sW+dLWE+KdfdkWe/9fJfB8kdlBeLxg8Lol32v
         2tG/GzWRRu/1zfqqRmyydOeosuHnmoRQpMNqfdI6qSy/xjcIRFmHxsrt+ylOB+lXy7vM
         eYUOUN46nlUEMB9sqX9+eDFD8ZOafJ7XDkz/nEfpOpJ7M71YIRZ+oCh7nGDGd9+Aqesg
         x2pCrrmpv64YjoQC0W7iRjDL2n9SY9AzCKc6hrWHia8nM0W/+kLU63Zxk5vRitb2P2RL
         K/iw==
X-Gm-Message-State: AOAM532H2iqlT+KOOVyEnKjllHodym3D1HeLwwAWsO7FGG6YSWcAt5PW
        3qa+YOxAk3lBQm3/SPkUmmiHvboUGZEs9Q==
X-Google-Smtp-Source: ABdhPJzviQcmk7U0P87CqS0elaNWWH2zZwgNJ5s+zaJnJoQ0BWHxh9vk7VB0lq4YGy4yrAG97X0mmQ==
X-Received: by 2002:a05:6a00:1356:b029:301:a406:636d with SMTP id k22-20020a056a001356b0290301a406636dmr5746990pfu.39.1624402366871;
        Tue, 22 Jun 2021 15:52:46 -0700 (PDT)
Received: from [192.168.69.111] (mx-ll-171.6.245-6.dynamic.3bb.co.th. [171.6.245.6])
        by smtp.gmail.com with ESMTPSA id s63sm3327358pjj.35.2021.06.22.15.52.45
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 15:52:46 -0700 (PDT)
To:     linux-mips@vger.kernel.org
From:   Strontium <strntydog@gmail.com>
Subject: mips32r2 kexec load crashes kernel
Message-ID: <e9586add-ec79-bf0d-5d96-4ff33802c1ca@gmail.com>
Date:   Wed, 23 Jun 2021 05:52:44 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When i execute a kexec -l (load, not execute) on my MT7621 (mips32r2)
target running either the 5.4 or 5.10 kernel, i am getting a reported
kernel bug that causes the kernel to panic and reboot.  The error is the
same on either 5.4 or 5.10.  My target runs from flash, and the kernel .elf i
am trying to kexec is the exact same kernel booted from flash.

# kexec -l --append="console=ttyS0,115200 rootfstype=squashfs"
/tmp/vmlinux.elf
Modified cmdline:console=ttyS0,115200 rootfstype=squashfs
Unable to find /proc/device-tree/chosen/[linux,]stdout-path, printing
from purgatory is disabled
[  761.663355] kexec command line truncated to 256 bytes
[  761.668452] usercopy: Kernel memory overwrite attempt detected to
kernel text (offset 81844, size 256)!
[  761.677856] Kernel bug detected[#1]:
[  761.681423] CPU: 2 PID: 1755 Comm: kexec Not tainted 5.10.43 #0
[  761.687317] $ 0   : 00000000 00000001 0000005b 00988000
[  761.692545] $ 4   : 805e4408 8101e378 810238f8 822e1ca8
[  761.697770] $ 8   : 00000001 822e1cc0 00000000 000019c8
[  761.702991] $12   : 74206465 ffffff7f 00000001 656b206f
[  761.708214] $16   : 800153b4 00000100 00000000 800154b4
[  761.713435] $20   : 0041e02c 80010000 00000000 00000000
[  761.718656] $24   : 00000000 80314988                 
[  761.723877] $28   : 822e0000 822e1e50 80650000 801507e8
[  761.729100] Hi    : 00000125
[  761.731964] Lo    : 122f2000
[  761.734845] epc   : 801507e8 usercopy_abort+0x94/0x98
[  761.739886] ra    : 801507e8 usercopy_abort+0x94/0x98
[  761.744913] Status: 1100fc03 KERNEL EXL IE
[  761.749097] Cause : 50800024 (ExcCode 09)
[  761.753086] PrId  : 0001992f (MIPS 1004Kc)
[  761.757161] Modules linked in: mt7915e mt76 mac80211 cfg80211 hwmon
crc_ccitt compat sha256_generic libsha256 seqiv jitterentropy_rng drbg
hmac cmac leds_gpio gpio_button_hotplug zram zsmalloc
[  761.774316] Process kexec (pid: 1755, threadinfo=c9ceaefe,
task=a03f7798, tls=77ef2ec8)
[  761.782284] Stack : 00000100 80568ddc 805b702c 80568f04 8055f414
8055f414 8055f414 00013fb4
[  761.790642]         00000100 8237ce00 00000100 80150940 822e1eb4
80010000 0041e02c 80069818
[  761.798997]         00000100 8237ce00 38e38e39 00000100 80015388
8237ce00 80010000 80014cb8
[  761.807354]         822e1eb0 00000100 00000006 8054f4ba 8237ce00
00000000 807c8ee0 8237ce20
[  761.815709]         00000000 00000003 00000000 800a4498 00000000
8012a078 00000000 815ba758
[  761.824061]         ...
[  761.826505] Call Trace:
[  761.828944] [<801507e8>] usercopy_abort+0x94/0x98
[  761.833632] [<80150940>] __check_object_size+0x154/0x1c4
[  761.838945] [<80014cb8>] machine_kexec_prepare+0x124/0x2c4
[  761.844430] [<800a4498>] sys_kexec_load+0x258/0x388
[  761.849293] [<800135f8>] syscall_common+0x34/0x58
[  761.853980]
[  761.855461] Code: afa30010  0c01a5fe  24848e80 <000c000d> 3c02805d 
8c4293fc  1c40006c  00000000  27bdffd0
[  761.865209]
[  761.866973] ---[ end trace 8145ef41fc12390f ]---
[  761.871748] Kernel panic - not syncing: Fatal exception
[  761.876984] Rebooting in 3 seconds..

Is this a problem with the kexec utility from kexec-tools or is it a
kernel bug, as it appears to be?  Or have i done something wrong?

Steven

