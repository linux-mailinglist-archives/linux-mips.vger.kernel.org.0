Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BA5224861
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jul 2020 05:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgGRD7U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 23:59:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42344 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727032AbgGRD7U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Jul 2020 23:59:20 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX2aKcxJfZ6kAAA--.771S3;
        Sat, 18 Jul 2020 11:59:08 +0800 (CST)
Subject: Re: [PATCH] MIPS: Prevent READ_IMPLIES_EXEC propagation
To:     YunQiang Su <wzssyqa@gmail.com>,
        "Maciej W. Rozycki" <macro@wdc.com>
References: <1594114741-26852-1-git-send-email-yangtiezhu@loongson.cn>
 <alpine.LFD.2.21.2007072043250.31807@redsun52.ssa.fujisawa.hgst.com>
 <b62c76c5-3548-c3d5-ad3e-5664c463a52f@loongson.cn>
 <alpine.LFD.2.21.2007171044320.24175@redsun52.ssa.fujisawa.hgst.com>
 <CAKcpw6XGhtifErTKyxCigyDGJBa01c7NALutJrdgyD_oX1u-LQ@mail.gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Yi Li <liyi@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1f085043-00a8-65c8-174e-2b215f6dd2aa@loongson.cn>
Date:   Sat, 18 Jul 2020 11:59:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAKcpw6XGhtifErTKyxCigyDGJBa01c7NALutJrdgyD_oX1u-LQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxX2aKcxJfZ6kAAA--.771S3
X-Coremail-Antispam: 1UD129KBjvJXoW3uF4DGw1DGr13Gr1fWw17Wrg_yoWkGr47pF
        1UGr13K3y8Ar1ktw17Jr15WF4aqrW0yay7Ar4rCw1xCF15Cr18Grn7KrW7GrZrAr1UAF12
        yw1DJw4Fg34Uuw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
        n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
        0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
        zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
        4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
        6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
        BIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/18/2020 08:04 AM, YunQiang Su wrote:
> Maciej W. Rozycki <macro@wdc.com> 于2020年7月17日周五 下午6:00写道：
>> On Wed, 8 Jul 2020, Tiezhu Yang wrote:
>>
>>>>> In the MIPS architecture, we should clear the security-relevant
>>>>> flag READ_IMPLIES_EXEC in the function SET_PERSONALITY2() of the
>>>>> file arch/mips/include/asm/elf.h.
>>>>>
>>>>> Otherwise, with this flag set, PROT_READ implies PROT_EXEC for
>>>>> mmap to make memory executable that is not safe, because this
>>>>> condition allows an attacker to simply jump to and execute bytes
>>>>> that are considered to be just data [1].
>>>>    Why isn't the arrangement made with `mips_elf_read_implies_exec'
>>>> sufficient?
>>> We inherit the READ_IMPLIES_EXEC personality flag across fork().
>>> If we do not explicitly clear this flag in SET_PERSONALITY2(),
>>> PROT_READ implies PROT_EXEC for mmap to make memory executable
>>> even if used with the GCC option "-z noexecstack" when compile.
> With next-20200717 with this patch on a Loongson 3A 4000 machine is
> AMDGPU video card it get

Hi Yunqiang,

Thanks for your test and report.

I test this patch used with Radeon and there is no this problem,
here is log:

[    3.554403] radeon 0000:03:00.0: VRAM: 2048M 0x0000000000000000 - 0x000000007FFFFFFF (2048M used)
[    3.554410] radeon 0000:03:00.0: GTT: 2048M 0x0000000080000000 - 0x00000000FFFFFFFF
[    3.554414] [drm] Detected VRAM RAM=2048M, BAR=256M
[    3.554418] [drm] RAM width 64bits DDR
[    3.554611] snd_hda_intel 0000:03:00.1: Force to snoop mode by module option
[    3.555277] [TTM] Zone  kernel: Available graphics memory: 3852912 KiB
[    3.555281] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    3.555284] [TTM] Initializing pool allocator
[    3.555298] [TTM] Initializing DMA pool allocator
[    3.555365] [drm] radeon: 2048M of VRAM memory ready
[    3.555369] [drm] radeon: 2048M of GTT memory ready.
[    3.555375] [drm] Loading oland Microcode
[    3.564885] [drm] Internal thermal controller with fan control
[    3.577104] snd_hda_codec_generic hdaudioC0D0: autoconfig for Generic: line_outs=0 (0x0/0x0/0x0/0x0/0x0) type:line
[    3.577112] snd_hda_codec_generic hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    3.577121] snd_hda_codec_generic hdaudioC0D0:    hp_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    3.577126] snd_hda_codec_generic hdaudioC0D0:    mono: mono_out=0x0
[    3.577131] snd_hda_codec_generic hdaudioC0D0:    dig-out=0x3/0x0
[    3.577135] snd_hda_codec_generic hdaudioC0D0:    inputs:
[    3.579113] input: HDA ATI HDMI HDMI as /devices/platform/bus@10000000/1a000000.pci/pci0000:00/0000:00:0f.0/0000:03:00.1/sound/card0/input6
[    3.584927] [drm] radeon: dpm initialized
[    3.590769] [drm] Found VCE firmware/feedback version 50.0.1 / 17!
[    3.590797] [drm] GART: num cpu pages 131072, num gpu pages 524288
[    3.592380] [drm] PCIE gen 2 link speeds already enabled
[    3.729862] [drm] PCIE GART of 2048M enabled (table at 0x00000000001DC000).
[    3.730241] radeon 0000:03:00.0: WB enabled
[    3.730252] radeon 0000:03:00.0: fence driver on ring 0 use gpu addr 0x0000000080000c00 and cpu addr 0x000000006703df0a
[    3.730258] radeon 0000:03:00.0: fence driver on ring 1 use gpu addr 0x0000000080000c04 and cpu addr 0x00000000d769f606
[    3.730263] radeon 0000:03:00.0: fence driver on ring 2 use gpu addr 0x0000000080000c08 and cpu addr 0x00000000f843f9c0
[    3.730269] radeon 0000:03:00.0: fence driver on ring 3 use gpu addr 0x0000000080000c0c and cpu addr 0x000000008a749926
[    3.730275] radeon 0000:03:00.0: fence driver on ring 4 use gpu addr 0x0000000080000c10 and cpu addr 0x0000000063a5bdd6
[    3.761115] radeon 0000:03:00.0: fence driver on ring 5 use gpu addr 0x0000000000075a18 and cpu addr 0x0000000030827134
[    3.875028] radeon 0000:03:00.0: failed VCE resume (-145).
[    3.875037] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.875042] radeon 0000:03:00.0: radeon: MSI limited to 32-bit
[    3.875117] radeon 0000:03:00.0: radeon: using MSI.
[    3.875171] [drm] radeon: irq initialized.
[    4.072354] [drm] ring test on 0 succeeded in 1 usecs
[    4.072363] [drm] ring test on 1 succeeded in 1 usecs
[    4.072372] [drm] ring test on 2 succeeded in 1 usecs
[    4.072388] [drm] ring test on 3 succeeded in 4 usecs
[    4.072401] [drm] ring test on 4 succeeded in 4 usecs
[    4.249024] [drm] ring test on 5 succeeded in 1 usecs
[    4.249034] [drm] UVD initialized successfully.
[    4.249384] [drm] ib test on ring 0 succeeded in 0 usecs
[    4.249445] [drm] ib test on ring 1 succeeded in 0 usecs
[    4.249501] [drm] ib test on ring 2 succeeded in 0 usecs
[    4.249547] [drm] ib test on ring 3 succeeded in 0 usecs
[    4.249587] [drm] ib test on ring 4 succeeded in 0 usecs
[    4.400723] [drm] ib test on ring 5 succeeded
[    4.401930] [drm] Radeon Display Connectors
[    4.401934] [drm] Connector 0:
[    4.401937] [drm]   HDMI-A-1
[    4.401940] [drm]   HPD2
[    4.401945] [drm]   DDC: 0x6530 0x6530 0x6534 0x6534 0x6538 0x6538 0x653c 0x653c
[    4.401947] [drm]   Encoders:
[    4.401951] [drm]     DFP1: INTERNAL_UNIPHY
[    4.401954] [drm] Connector 1:
[    4.401957] [drm]   VGA-1
[    4.401961] [drm]   DDC: 0x65c0 0x65c0 0x65c4 0x65c4 0x65c8 0x65c8 0x65cc 0x65cc
[    4.401964] [drm]   Encoders:
[    4.401967] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[    4.693982] [drm] fb mappable at 0x405F4000
[    4.693986] [drm] vram apper at 0x40000000
[    4.693989] [drm] size 8306688
[    4.693992] [drm] fb depth is 24
[    4.693994] [drm]    pitch is 7680
[    4.839216] Console: switching to colour frame buffer device 240x67
[    4.935491] atkbd serio2: keyboard reset failed on isa0060/serio2
[    5.260310] radeon 0000:03:00.0: fb0: radeondrmfb frame buffer device
[    5.279275] [drm] Initialized radeon 2.50.0 20080528 for 0000:03:00.0 on minor 0


Let us analysis to find the root cause.

Thanks,
Tiezhu

>
> [   25.019868] [drm] Fence fallback timer expired on ring comp_1.1.1
>           Starting Network Manager Script Dispatcher Service...
> [  OK  ] Started Network Manager Script Dispatcher Service.
> [   25.551110] [drm] Fence fallback timer expired on ring comp_1.2.1
> [   26.082351] [drm] Fence fallback timer expired on ring comp_1.3.1
> [   26.613601] [drm] Fence fallback timer expired on ring sdma0
> [   27.144859] [drm] Fence fallback timer expired on ring sdma1
> [   27.707351] [drm] Fence fallback timer expired on ring uvd
> [   28.238600] [drm] Fence fallback timer expired on ring uvd_enc0
> [   28.769850] [drm] Fence fallback timer expired on ring uvd_enc1
> [   29.051639] igb 0000:03:00.0 enp3s0: igb: enp3s0 NIC Link is Up
> 1000 Mbps Full Duplex, Flow Control: RX/TX
> [   29.061605] IPv6: ADDRCONF(NETDEV_CHANGE): enp3s0: link becomes ready
> [  OK  ] Finished Network Manager Wait Online.
> [  OK  ] Reached target Network is Online.
>           Mounting /home/syq/sbuild...
> [   29.156613] Key type dns_resolver registered
> [   29.167111] NFS: Registering the id_resolver key type
> [   29.172173] Key type id_resolver registered
> [   29.176337] Key type id_legacy registered
> [   29.180686] NFS4: Couldn't follow remote path
> [   29.185475] NFS4: Couldn't follow remote path
> [   29.394860] [drm] Fence fallback timer expired on ring vce0
> [   32.269979] NFS4: Couldn't follow remote path
> [   35.363774] NFS4: Couldn't follow remote path
> [   38.457413] NFS4: Couldn't follow remote path
> [   39.051103] ------------[ cut here ]------------
> [   39.055697] WARNING: CPU: 1 PID: 0 at net/sched/sch_generic.c:443
> dev_watchdog+0x31c/0x328
> [   39.063914] NETDEV WATCHDOG: enp3s0 (igb): transmit queue 0 timed out
> [   39.070313] Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs
> lockd grace rfkill snd_hda_codec_generic ledtrig_audio led_class
> binfmt_misc vfat fat snd_hda_intel snd_intel_dspcfg snd_hda_codd
> [   39.107286] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
> 5.8.0-rc5-next-20200717+ #66
> [   39.114808] Hardware name: Lemote
> LEMOTE-LS3A4000-7A1000-1w-V0.1-pc/LEMOTE-LS3A4000-7A1000-1w-V01-pc,
> BIOS Kunlun-A1901-V4.1.0 03/06/2020
> [   39.127082] Stack : 000003e000000400 35c940b50177d66d
> 0000000000000001 35c940b50177d66d
> [   39.135043]         35c940b50177d66d 0000000000000000
> 980000027d067bd8 ffffffff80be28d0
> [   39.143003]         980000027d067a60 0000000000000001
> 980000027d067aa8 0000000000000000
> [   39.150962]         0000000000000000 c0000000ffffefff
> 0000000005f5e100 980000027d067a98
> [   39.158922]         0000000000000001 ffffffff80c80000
> 0000000000000000 0000000000000000
> [   39.166882]         ffffffff80be0000 ffffffff80bf3b48
> 0000000000200000 0000000000000000
> [   39.174842]         9800000005fcc828 0000000000000000
> ffffffff80657e78 0000000000000008
> [   39.182802]         ffffffff80e60008 980000027d158000
> 980000027d067bd0 0000000000000122
> [   39.190762]         ffffffff805a06fc 0000000000000000
> 0000000000000000 0000000000000000
> [   39.198721]         0000000000000000 0000000000000000
> ffffffff8020efe0 35c940b50177d66d
> [   39.206681]         ...
> [   39.209107] Call Trace:
> [   39.211536] [<ffffffff8020efe0>] show_stack+0x40/0x128
> [   39.216644] [<ffffffff805a06fc>] dump_stack+0xac/0xf0
> [   39.221663] [<ffffffff80233330>] __warn+0xc0/0xe8
> [   39.226335] [<ffffffff80233400>] warn_slowpath_fmt+0xa8/0xe8
> [   39.231957] [<ffffffff8091d6d4>] dev_watchdog+0x31c/0x328
> [   39.237323] [<ffffffff802ad744>] call_timer_fn.isra.30+0x24/0x98
> [   39.243290] [<ffffffff802adea4>] run_timer_softirq+0x44c/0x470
> [   39.249087] [<ffffffff80a46708>] __do_softirq+0x180/0x350
> [   39.254451] [<ffffffff80239da4>] irq_exit+0xc4/0xf0
> [   39.259297] [<ffffffff805bf124>] plat_irq_dispatch+0x64/0x100
> [   39.265005] [<ffffffff80208e60>] handle_int+0x140/0x14c
> [   39.270195] [<ffffffff80208ce0>] __r4k_wait+0x20/0x40
> [   39.275214] ---[ end trace 084e32ee82ee2ecd ]---
> [   39.279962] igb 0000:03:00.0 enp3s0: Reset adapter
> [   44.051629] igb 0000:03:00.0 enp3s0: igb: enp3s0 NIC Link is Up
> 1000 Mbps Full Duplex, Flow Control: RX/TX
> [   45.551211] NFS4: Couldn't follow remote path
> [***   ] A start job is running for /home/syq/sbuild (32s / 1min 38s)
> [   ***] A start job is running for /home/syq/sbuild (36s / 1min 38s)
> [  *** ] A start job is running for /home/syq/sbuild (36s / 1min 38s)
> [***   ] A start job is running for /home/syq/sbuild (46s / 1min 38s)
> [ ***  ] A start job is running for /home/syq/sbuild (47s / 1min 38s)
>
> Revert this patch can solve this problem.
> I think that we need a wide test before have a so fundamental change.
>
>>   It makes no sense to me to repeat this across all the architectures, and
>> even less so to do it individually one by one as people rediscover this
>> issue.
>>
>>   Why don't we maintain the flag globally in `fs/binfmt_elf.c' which is
>> where we already set it?  E.g.:
>>
>>          SET_PERSONALITY2(*elf_ex, &arch_state);
>>          if (elf_read_implies_exec(*elf_ex, executable_stack))
>>                  current->personality |= READ_IMPLIES_EXEC;
>>          else
>>                  current->personality &= ~READ_IMPLIES_EXEC;
>>
>>    Maciej
>
>

