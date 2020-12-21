Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D112A2DF9CB
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 09:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgLUINk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Dec 2020 03:13:40 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44260 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726560AbgLUINj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Dec 2020 03:13:39 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx38v7WOBfpr8CAA--.7206S3;
        Mon, 21 Dec 2020 16:12:44 +0800 (CST)
Subject: Re: [QUESTION] support perf record --call-graph dwarf for mips
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Ralf Baechle <ralf@linux-mips.org>
References: <97fb66bf-51f8-a491-9eb4-10b2314cf82f@loongson.cn>
 <90c7db1a-8e1a-e253-79ca-f93dbac014c2@flygoat.com>
 <20201216143047.GC294100@kernel.org> <20201216151605.GA297512@kernel.org>
 <7ac47226-c09c-cc84-824b-11dd9a47bb56@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Archer Yan <ayan@wavecomp.com>,
        David Daney <david.daney@cavium.com>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <6e335538-d94b-34f4-cb83-6688101ce80d@loongson.cn>
Date:   Mon, 21 Dec 2020 16:12:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <7ac47226-c09c-cc84-824b-11dd9a47bb56@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx38v7WOBfpr8CAA--.7206S3
X-Coremail-Antispam: 1UD129KBjvJXoW3ArWDJrWkJrW8CF4xKFyDJrb_yoWxXrWUpr
        WUWF15Aa95JFyjyw1Ivwn09rW7Z345XayfAF1Fgr4ruwnxJF93KF1DJ348XFWj9F1UX3ZF
        qws0y34I9ryjy37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjfU0yxRDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/17/2020 08:48 PM, Tiezhu Yang wrote:
> On 12/16/2020 11:16 PM, Arnaldo Carvalho de Melo wrote:
>> Em Wed, Dec 16, 2020 at 11:30:47AM -0300, Arnaldo Carvalho de Melo 
>> escreveu:
>>> Em Wed, Dec 16, 2020 at 07:14:02PM +0800, Jiaxun Yang escreveu:
>>>>
>>>> 在 2020/12/16 下午6:05, Tiezhu Yang 写道:
>>>>> Hi,
>>>>>
>>>>> In the current upstream mainline kernel, perf record --call-graph 
>>>>> dwarf
>>>>> is not supported for architecture mips64. I find the following 
>>>>> related
>>>>> patches about this feature by David Daney <david.daney@cavium.com> 
>>>>> and
>>>>> Archer Yan <ayan@wavecomp.com> in Sep 2019.
>>>
...
> (3)[loongson@linux perf]$ ./perf record --call-graph dwarf cd
> Error:
> The sys_perf_event_open() syscall returned with 89 (Function not 
> implemented) for event (cycles:u).
> /bin/dmesg | grep -i perf may provide additional information.
>
> Call Trace:
> record__open
>   evsel__open()
>     evsel__open_cpu()
>       perf_event_open()
>   evsel__open_strerror
>
> Maybe we need tools/perf/arch/mips/entry/syscalls/syscall.tbl?

The code about mips kernel and perf tool are debugged successfully
on the Loongson 3A4000 CPU platform, we can see the following result,
I will make and submit some patches based on 5.11-rc1 in the next week.

[root@linux perf]# uname -r
5.10.0-rc7
[root@linux perf]# ./perf record --call-graph dwarf -F 1000 lscpu
Architecture:          mips64
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0-3
Thread(s) per core:    1
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
L1d cache:             64K
L1i cache:             64K
L2 cache:              2048K
NUMA node0 CPU(s):     0-3
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.078 MB perf.data (8 samples) ]
[root@linux perf]# ./perf report
# To display the perf.data header info, please use 
--header/--header-only options.
#
#
# Total Lost Samples: 0
#
# Samples: 8  of event 'cycles'
# Event count (approx.): 5682386
#
# Children      Self  Command  Shared Object Symbol
# ........  ........  .......  ................ ...........................
#
     94.86%    94.86%  lscpu    [kernel.vmlinux]  [k] get_page_from_freelist
             |
             ---__GI_access (inlined)
                syscall_common
                do_faccessat
                filename_lookup
                path_lookupat
                walk_component
                __lookup_slow
                d_alloc_parallel
                d_alloc
                __d_alloc
                kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    libc-2.20.so      [.] __GI_access (inlined)
             |
             ---__GI_access (inlined)
                syscall_common
                do_faccessat
                filename_lookup
                path_lookupat
                walk_component
                __lookup_slow
                d_alloc_parallel
                d_alloc
                __d_alloc
                kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] syscall_common
             |
             ---syscall_common
                do_faccessat
                filename_lookup
                path_lookupat
                walk_component
                __lookup_slow
                d_alloc_parallel
                d_alloc
                __d_alloc
                kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] do_faccessat
             |
             ---do_faccessat
                filename_lookup
                path_lookupat
                walk_component
                __lookup_slow
                d_alloc_parallel
                d_alloc
                __d_alloc
                kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] filename_lookup
             |
             ---filename_lookup
                path_lookupat
                walk_component
                __lookup_slow
                d_alloc_parallel
                d_alloc
                __d_alloc
                kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] path_lookupat
             |
             ---path_lookupat
                walk_component
                __lookup_slow
                d_alloc_parallel
                d_alloc
                __d_alloc
                kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] walk_component
             |
             ---walk_component
                __lookup_slow
                d_alloc_parallel
                d_alloc
                __d_alloc
                kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] __lookup_slow
             |
             ---__lookup_slow
                d_alloc_parallel
                d_alloc
                __d_alloc
                kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] d_alloc_parallel
             |
             ---d_alloc_parallel
                d_alloc
                __d_alloc
                kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] d_alloc
             |
             ---d_alloc
                __d_alloc
                kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] __d_alloc
             |
             ---__d_alloc
                kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] kmem_cache_alloc
             |
             ---kmem_cache_alloc
                __slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] __slab_alloc.isra.96
             |
             ---__slab_alloc.isra.96
                ___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] ___slab_alloc
             |
             ---___slab_alloc
                allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] allocate_slab
             |
             ---allocate_slab
                __alloc_pages_nodemask
                get_page_from_freelist

     94.86%     0.00%  lscpu    [kernel.vmlinux]  [k] __alloc_pages_nodemask
             |
             ---__alloc_pages_nodemask
                get_page_from_freelist

      5.00%     5.00%  lscpu    ld-2.20.so        [.] dl_main
             |
             ---dl_main

      0.13%     0.13%  lscpu    [kernel.vmlinux]  [k] perf_event_comm_output
      0.13%     0.00%  lscpu    [kernel.vmlinux]  [k] merge_sched_in
      0.13%     0.00%  lscpu    [kernel.vmlinux]  [k] 
event_sched_in.isra.132
      0.00%     0.00%  perf     [kernel.vmlinux]  [k] arch_local_irq_restore

#
# (Tip: List events using substring match: perf list <keyword>)
#

