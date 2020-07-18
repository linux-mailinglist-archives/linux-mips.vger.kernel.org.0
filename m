Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A87224750
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jul 2020 02:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgGRAFI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 20:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgGRAFI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jul 2020 20:05:08 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABE4C0619D2;
        Fri, 17 Jul 2020 17:05:07 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id u12so8940794qth.12;
        Fri, 17 Jul 2020 17:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m19mjNVg9Yx5LiqHjNrg1ffuzvD3ZOm9O2XkGj5bSOs=;
        b=VqScysbg9M/NbSpemXlxIgPmx1EIs50vcUg/xtRIr+5MkK/a48zx+eKxFNaL27K1st
         PPU7y3crCxIc/b9aGCsmQTzSMfvd3yWRNYnJrXdcrCu6pqsgv2s5fB3Mp1JK1JjvxHLI
         i/AsDWnuhm9hs4UttfX2+aGmYFgVcj7GLc4Y0KkFC5glchKwGvlVx3gzwsy6zj4KIbZI
         zltIsNisuic3lPRW/A7rY2at21PiUIuJaduHFrzAQl8rkYE6IMoO0Sz10BIDjda29m3h
         1YKa5qaiklw0Dki08JBRUaOz3vd8bQoRk905x2MmH4/dpf0OLs6jXbKe9JbHrj5f4t+H
         9tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m19mjNVg9Yx5LiqHjNrg1ffuzvD3ZOm9O2XkGj5bSOs=;
        b=NG5rMae6CippXqhDJ/111Lq3UUaLdiKqMcBGebG3qo7kTRhMLkcRHVznK2w4qRz2oX
         AA1WhfRik7dLz6WcOzulQHkpXpiBhtDQ5jaWBOKYQSXGTG0padJxEvnfbj9fe0vZ8QQb
         I1Cs6GSzAxnhhWmDpxxUMOEM2L64qc4F0KfODyMX1iJlFntNwiJEONPo7TaTZBrPsyUU
         pPycNJPllTD2Tzi4+CbBq31uy9bLMCDMsDlWJKlmWJIQbyaeElQIYnj222D8Kdlo6mU3
         vwWZEK2U7ecn+LHoeWVufeM8+dbtG3uKkQ6zxk2wtTYnLKjV+94ambHsnzAs3cCVkZvs
         Z2xg==
X-Gm-Message-State: AOAM533CAA/zX6zhWSt5SieR9JlcXt2AX4ygylIiMGPojzUZ8gU4TKMl
        ZDQ1E03mwnhiNurA08RG11ByaL1rnquH0VpIGX0=
X-Google-Smtp-Source: ABdhPJyFE6PJVO4nWUGfPDazWP393Pl2OWxj5b3M9aVKcbgwpVidiBe4D8NO4edItTdr4l/mRiirWoL/5e4G5iXNJZ4=
X-Received: by 2002:ac8:744a:: with SMTP id h10mr13573943qtr.241.1595030706825;
 Fri, 17 Jul 2020 17:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <1594114741-26852-1-git-send-email-yangtiezhu@loongson.cn>
 <alpine.LFD.2.21.2007072043250.31807@redsun52.ssa.fujisawa.hgst.com>
 <b62c76c5-3548-c3d5-ad3e-5664c463a52f@loongson.cn> <alpine.LFD.2.21.2007171044320.24175@redsun52.ssa.fujisawa.hgst.com>
In-Reply-To: <alpine.LFD.2.21.2007171044320.24175@redsun52.ssa.fujisawa.hgst.com>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Sat, 18 Jul 2020 08:04:55 +0800
Message-ID: <CAKcpw6XGhtifErTKyxCigyDGJBa01c7NALutJrdgyD_oX1u-LQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Prevent READ_IMPLIES_EXEC propagation
To:     "Maciej W. Rozycki" <macro@wdc.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Maciej W. Rozycki <macro@wdc.com> =E4=BA=8E2020=E5=B9=B47=E6=9C=8817=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 8 Jul 2020, Tiezhu Yang wrote:
>
> > >> In the MIPS architecture, we should clear the security-relevant
> > >> flag READ_IMPLIES_EXEC in the function SET_PERSONALITY2() of the
> > >> file arch/mips/include/asm/elf.h.
> > >>
> > >> Otherwise, with this flag set, PROT_READ implies PROT_EXEC for
> > >> mmap to make memory executable that is not safe, because this
> > >> condition allows an attacker to simply jump to and execute bytes
> > >> that are considered to be just data [1].
> > >   Why isn't the arrangement made with `mips_elf_read_implies_exec'
> > > sufficient?
> >
> > We inherit the READ_IMPLIES_EXEC personality flag across fork().
> > If we do not explicitly clear this flag in SET_PERSONALITY2(),
> > PROT_READ implies PROT_EXEC for mmap to make memory executable
> > even if used with the GCC option "-z noexecstack" when compile.

With next-20200717 with this patch on a Loongson 3A 4000 machine is
AMDGPU video card it get

[   25.019868] [drm] Fence fallback timer expired on ring comp_1.1.1
         Starting Network Manager Script Dispatcher Service...
[  OK  ] Started Network Manager Script Dispatcher Service.
[   25.551110] [drm] Fence fallback timer expired on ring comp_1.2.1
[   26.082351] [drm] Fence fallback timer expired on ring comp_1.3.1
[   26.613601] [drm] Fence fallback timer expired on ring sdma0
[   27.144859] [drm] Fence fallback timer expired on ring sdma1
[   27.707351] [drm] Fence fallback timer expired on ring uvd
[   28.238600] [drm] Fence fallback timer expired on ring uvd_enc0
[   28.769850] [drm] Fence fallback timer expired on ring uvd_enc1
[   29.051639] igb 0000:03:00.0 enp3s0: igb: enp3s0 NIC Link is Up
1000 Mbps Full Duplex, Flow Control: RX/TX
[   29.061605] IPv6: ADDRCONF(NETDEV_CHANGE): enp3s0: link becomes ready
[  OK  ] Finished Network Manager Wait Online.
[  OK  ] Reached target Network is Online.
         Mounting /home/syq/sbuild...
[   29.156613] Key type dns_resolver registered
[   29.167111] NFS: Registering the id_resolver key type
[   29.172173] Key type id_resolver registered
[   29.176337] Key type id_legacy registered
[   29.180686] NFS4: Couldn't follow remote path
[   29.185475] NFS4: Couldn't follow remote path
[   29.394860] [drm] Fence fallback timer expired on ring vce0
[   32.269979] NFS4: Couldn't follow remote path
[   35.363774] NFS4: Couldn't follow remote path
[   38.457413] NFS4: Couldn't follow remote path
[   39.051103] ------------[ cut here ]------------
[   39.055697] WARNING: CPU: 1 PID: 0 at net/sched/sch_generic.c:443
dev_watchdog+0x31c/0x328
[   39.063914] NETDEV WATCHDOG: enp3s0 (igb): transmit queue 0 timed out
[   39.070313] Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs
lockd grace rfkill snd_hda_codec_generic ledtrig_audio led_class
binfmt_misc vfat fat snd_hda_intel snd_intel_dspcfg snd_hda_codd
[   39.107286] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
5.8.0-rc5-next-20200717+ #66
[   39.114808] Hardware name: Lemote
LEMOTE-LS3A4000-7A1000-1w-V0.1-pc/LEMOTE-LS3A4000-7A1000-1w-V01-pc,
BIOS Kunlun-A1901-V4.1.0 03/06/2020
[   39.127082] Stack : 000003e000000400 35c940b50177d66d
0000000000000001 35c940b50177d66d
[   39.135043]         35c940b50177d66d 0000000000000000
980000027d067bd8 ffffffff80be28d0
[   39.143003]         980000027d067a60 0000000000000001
980000027d067aa8 0000000000000000
[   39.150962]         0000000000000000 c0000000ffffefff
0000000005f5e100 980000027d067a98
[   39.158922]         0000000000000001 ffffffff80c80000
0000000000000000 0000000000000000
[   39.166882]         ffffffff80be0000 ffffffff80bf3b48
0000000000200000 0000000000000000
[   39.174842]         9800000005fcc828 0000000000000000
ffffffff80657e78 0000000000000008
[   39.182802]         ffffffff80e60008 980000027d158000
980000027d067bd0 0000000000000122
[   39.190762]         ffffffff805a06fc 0000000000000000
0000000000000000 0000000000000000
[   39.198721]         0000000000000000 0000000000000000
ffffffff8020efe0 35c940b50177d66d
[   39.206681]         ...
[   39.209107] Call Trace:
[   39.211536] [<ffffffff8020efe0>] show_stack+0x40/0x128
[   39.216644] [<ffffffff805a06fc>] dump_stack+0xac/0xf0
[   39.221663] [<ffffffff80233330>] __warn+0xc0/0xe8
[   39.226335] [<ffffffff80233400>] warn_slowpath_fmt+0xa8/0xe8
[   39.231957] [<ffffffff8091d6d4>] dev_watchdog+0x31c/0x328
[   39.237323] [<ffffffff802ad744>] call_timer_fn.isra.30+0x24/0x98
[   39.243290] [<ffffffff802adea4>] run_timer_softirq+0x44c/0x470
[   39.249087] [<ffffffff80a46708>] __do_softirq+0x180/0x350
[   39.254451] [<ffffffff80239da4>] irq_exit+0xc4/0xf0
[   39.259297] [<ffffffff805bf124>] plat_irq_dispatch+0x64/0x100
[   39.265005] [<ffffffff80208e60>] handle_int+0x140/0x14c
[   39.270195] [<ffffffff80208ce0>] __r4k_wait+0x20/0x40
[   39.275214] ---[ end trace 084e32ee82ee2ecd ]---
[   39.279962] igb 0000:03:00.0 enp3s0: Reset adapter
[   44.051629] igb 0000:03:00.0 enp3s0: igb: enp3s0 NIC Link is Up
1000 Mbps Full Duplex, Flow Control: RX/TX
[   45.551211] NFS4: Couldn't follow remote path
[***   ] A start job is running for /home/syq/sbuild (32s / 1min 38s)
[   ***] A start job is running for /home/syq/sbuild (36s / 1min 38s)
[  *** ] A start job is running for /home/syq/sbuild (36s / 1min 38s)
[***   ] A start job is running for /home/syq/sbuild (46s / 1min 38s)
[ ***  ] A start job is running for /home/syq/sbuild (47s / 1min 38s)

Revert this patch can solve this problem.
I think that we need a wide test before have a so fundamental change.

>
>  It makes no sense to me to repeat this across all the architectures, and
> even less so to do it individually one by one as people rediscover this
> issue.
>
>  Why don't we maintain the flag globally in `fs/binfmt_elf.c' which is
> where we already set it?  E.g.:
>
>         SET_PERSONALITY2(*elf_ex, &arch_state);
>         if (elf_read_implies_exec(*elf_ex, executable_stack))
>                 current->personality |=3D READ_IMPLIES_EXEC;
>         else
>                 current->personality &=3D ~READ_IMPLIES_EXEC;
>
>   Maciej



--=20
YunQiang Su
