Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F5F3651CC
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 07:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhDTFXy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Apr 2021 01:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbhDTFXy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Apr 2021 01:23:54 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F8AC06174A;
        Mon, 19 Apr 2021 22:23:22 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id u16so20523062oiu.7;
        Mon, 19 Apr 2021 22:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SrMiG9tkfnIwZi2qx3u5+XtSbmv2aCutrNCW7yEp9U4=;
        b=h6zEMfXzSV3iet6RXOlKqyubE7kXrZlcfYbWChBKf7CYocvDpRlAdgA0oieA1o3BAR
         27UCTg3MfjtCnxQ4NUbcTIl6LgSP39RwzkmwxFI1rEYcvqiJ8uLRveGEMYjPguIiroT+
         z1581YSQLMyMFrUkT5093PIlIibFwRyMUwMCq+5Inc+ro7itwgVF9zwgMOh25YPbDcif
         +4bYEgWSVoM8djCPKl/Ui/rxGgk18cjKdAUjo8abxLW2SegMiQzZ8x95Tymt9Blx85TJ
         kF5YuUlHIW5IOtIHambku3KNdYhDMR2S5/6tmUb9hKtU0mOHd7m2vruujBr/S4aJlaaa
         Er1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=SrMiG9tkfnIwZi2qx3u5+XtSbmv2aCutrNCW7yEp9U4=;
        b=f+LahaMQ0MVMR9/E0DIZ94z6OoMHFKCupCShlvTb/kucuLjbdO+ENyoUkry67Hnkxb
         kePTH0E9H4Em53KVIlheT07L0MKCMwJuF/g6hGiJxc8op11SWfdJdfMUnlqJ28hG5MGE
         WHhorj4rXXnfSI2N8qA0v2zYlqD4K+Pz3dXMXEcHRfkaaxaxqU1yt8q19BqWfLyXqM2v
         jOEcwmTC8TWoOcHLe0mE/bgoc2PYt3QPkvOxI1qYBtLgeyBn0YanC2i5gmhfdt/lTZB/
         Cv+egpBqwxDVLUdNSr+cbu3ALdAR2GKghrncyD6zz6MpYeQZgKUWLemhhNvF5fGs1dSm
         iHcw==
X-Gm-Message-State: AOAM531ReqOm4prV/IKl/0iDIsqn9fn8HZL4Q56iW2GPJHHLu/zN6I46
        Mupd42V+buBfFmX7kDPldkY=
X-Google-Smtp-Source: ABdhPJxrjIuo3xv00gz/Ej97Xw+UIa2Ipy5cQsWiz82zl0k4XUOPg4kUKFnsuMTuJHTm5RQTDonP0A==
X-Received: by 2002:a05:6808:13c6:: with SMTP id d6mr1843424oiw.155.1618896201956;
        Mon, 19 Apr 2021 22:23:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o186sm2113264ooa.35.2021.04.19.22.23.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 22:23:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 19 Apr 2021 22:23:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 8/8] MIPS: pci-legacy: use generic pci_enable_resources
Message-ID: <20210420052319.GA162457@roeck-us.net>
References: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
 <20210414031240.313852-9-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414031240.313852-9-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 13, 2021 at 08:12:40PM -0700, Ilya Lipnitskiy wrote:
> Follow the reasoning from commit 842de40d93e0 ("PCI: add generic
> pci_enable_resources()"):
> 
>   The only functional difference from the MIPS version is that the
>   generic one uses "!r->parent" to check for resource collisions
>   instead of "!r->start && r->end".
> 
> That should have no effect on any pci-legacy driver.
> 

Unfortunately it does. With this patch in place, all my mips qemu emulations
fail to boot from ide/ata drive; the driver is not instantiated. The error
message is:

ata_piix 0000:00:0a.1: can't enable device: BAR 0 [io  0x01f0-0x01f7] not claimed
ata_piix: probe of 0000:00:0a.1 failed with error -22

Reverting this patch fixes the problem, and the message displayed by the driver
is:

ata_piix 0000:00:0a.1: enabling device (0000 -> 0001)

Bisect log is attached.

Guenter

---
# bad: [50b8b1d699ac313c0a07a3c185ffb23aecab8abb] Add linux-next specific files for 20210419
# good: [bf05bf16c76bb44ab5156223e1e58e26dfe30a88] Linux 5.12-rc8
git bisect start 'HEAD' 'v5.12-rc8'
# bad: [c4bb91fc07e59241cde97f913d7a2fbedc248f0d] Merge remote-tracking branch 'crypto/master'
git bisect bad c4bb91fc07e59241cde97f913d7a2fbedc248f0d
# bad: [499f739ad70f2a58aac985dceb25ca7666da88be] Merge remote-tracking branch 'jc_docs/docs-next'
git bisect bad 499f739ad70f2a58aac985dceb25ca7666da88be
# bad: [11b56408a328d1c5c4dfa7667c5dc46956b64aec] Merge remote-tracking branch 'parisc-hd/for-next'
git bisect bad 11b56408a328d1c5c4dfa7667c5dc46956b64aec
# good: [09ccc0ee1227f2cfe50d8dbbe241d115d9b3885f] Merge branch 'arm/defconfig' into for-next
git bisect good 09ccc0ee1227f2cfe50d8dbbe241d115d9b3885f
# good: [a5b76c2f17330e266a5c56dde21430e27b0d0dbb] Merge remote-tracking branch 'arm-soc/for-next'
git bisect good a5b76c2f17330e266a5c56dde21430e27b0d0dbb
# good: [1e4241f6813f1c1a0027d96df075ffd01808b3cf] Merge remote-tracking branch 'ti-k3/ti-k3-next'
git bisect good 1e4241f6813f1c1a0027d96df075ffd01808b3cf
# good: [7496a43be7a362391607d78e49a3f28de80029ce] Merge remote-tracking branch 'h8300/h8300-next'
git bisect good 7496a43be7a362391607d78e49a3f28de80029ce
# good: [66633abd0642f1e89d26e15f36fb13d3a1c535ff] MIPS/bpf: Enable bpf_probe_read{, str}() on MIPS again
git bisect good 66633abd0642f1e89d26e15f36fb13d3a1c535ff
# good: [2c92ef8ff8d327797c1920ae7f938bcc6f3f7421] MIPS: Fix strnlen_user access check
git bisect good 2c92ef8ff8d327797c1920ae7f938bcc6f3f7421
# good: [3a070801c61f4e3987d59b1068368ba71d727208] Merge remote-tracking branch 'microblaze/next'
git bisect good 3a070801c61f4e3987d59b1068368ba71d727208
# good: [317f553bb677e324c9c865ff7f14597bc5ceeb9c] MIPS: pci-legacy: remove redundant info messages
git bisect good 317f553bb677e324c9c865ff7f14597bc5ceeb9c
# bad: [6ce48897ce476bed86fde28752c27596e8753277] MIPS: Loongson64: Add kexec/kdump support
git bisect bad 6ce48897ce476bed86fde28752c27596e8753277
# bad: [99bca615d89510917864fac6b26fd343eff2aba2] MIPS: pci-legacy: use generic pci_enable_resources
git bisect bad 99bca615d89510917864fac6b26fd343eff2aba2
# good: [0af83d2e447af3e5098583cb6320bb1b1fb0976b] MIPS: pci-legacy: remove busn_resource field
git bisect good 0af83d2e447af3e5098583cb6320bb1b1fb0976b
# first bad commit: [99bca615d89510917864fac6b26fd343eff2aba2] MIPS: pci-legacy: use generic pci_enable_resources
