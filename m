Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B06F325B2C
	for <lists+linux-mips@lfdr.de>; Fri, 26 Feb 2021 02:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhBZBMV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 25 Feb 2021 20:12:21 -0500
Received: from mail.loongson.cn ([114.242.206.163]:48768 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229537AbhBZBMV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Feb 2021 20:12:21 -0500
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv_G1Sjhggq8PAA--.3158S3;
        Fri, 26 Feb 2021 09:11:17 +0800 (CST)
Subject: Re: [PATCH v2 0/3] Add some perf support for mips
To:     Arnaldo Carvalho de Melo <acme@kernel.org>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
 <1d3c4abd-4b14-90e3-6528-457a8248cb52@loongson.cn>
 <YDZRxz1yRwgWc47F@kernel.org> <YDec9LIikZ9EVufH@kernel.org>
 <YDehtDi4q+lFO2l6@kernel.org> <YDeiR66J0ohidVSq@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <8894bb31-ec2b-7324-9c7f-6820d12d951e@loongson.cn>
Date:   Fri, 26 Feb 2021 09:11:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <YDeiR66J0ohidVSq@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
X-CM-TRANSID: AQAAf9Dxv_G1Sjhggq8PAA--.3158S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw4rKFy8WFy7uryxuFWfKrg_yoW7Wr4UpF
        1DCFsrtr4UXr95Aw4Dtw4vk3Wrtr98X3yIv390q393Aryqyr1Iv39a9w1jkFyqqa1jkF4j
        9rW7G345u3y5uaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_KwCF04k20xvY0x0EwI
        xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
        6cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1ItC7UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/25/2021 09:12 PM, Arnaldo Carvalho de Melo wrote:
> Em Thu, Feb 25, 2021 at 10:10:12AM -0300, Arnaldo Carvalho de Melo escreveu:
>> Em Thu, Feb 25, 2021 at 09:49:56AM -0300, Arnaldo Carvalho de Melo escreveu:
>>> Em Wed, Feb 24, 2021 at 10:16:55AM -0300, Arnaldo Carvalho de Melo escreveu:
>>>> Em Mon, Feb 22, 2021 at 02:43:39PM +0800, Tiezhu Yang escreveu:
>>>>> On 02/04/2021 11:35 AM, Tiezhu Yang wrote:
>>>>>> v2: add R26 and R27 to the enum perf_event_mips_regs in patch #1
>>>>>>
>>>>>> Tiezhu Yang (3):
>>>>>>     MIPS: kernel: Support extracting off-line stack traces from user-space
>>>>>>       with perf
>>>>>>     perf tools: Support mips unwinding and dwarf-regs
>>>>>>     perf tools: Generate mips syscalls_n64.c syscall table
>>>>> Hi Arnaldo,
>>>>>
>>>>> The kernel part patch #1 has been merged.
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ddc96bd42da
>>>>>
>>>>> Could the perf tool patches #2 and #3 have a chance to be merged before
>>>>> 5.12-rc1?
>>>>> If yes, we can use this feature in 5.12-rc1.
>>>> Thanks, applied, should make it into 5.12-rc1.
>>> First we'll have to fix this problem:
>>>
>>>    28    12.45 debian:experimental-x-mips64  : FAIL gcc version 10.2.1 20201224 (Debian 10.2.1-3)
>>>                       from builtin-diff.c:12:
>>>      /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory
>>>          7 | #include <asm/perf_regs.h>
>>>            |          ^~~~~~~~~~~~~~~~~
>>>      compilation terminated.
>>>      In file included from util/perf_regs.h:30,
>>>                       from util/event.h:15,
>>>                       from util/branch.h:15,
>>>                       from util/callchain.h:8,
>>>                       from builtin-record.c:16:
>>>      /git/linux/tools/perf/arch/mips/include/perf_regs.h:7:10: fatal error: asm/perf_regs.h: No such file or directory

Sorry for the late reply. I asked for a leave yesterday.

asm/perf_regs.h is a new added file in the patch #1,
the patch link is:
https://lore.kernel.org/patchwork/patch/1375477/
the commit is:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/mips/include/uapi/asm/perf_regs.h?id=1ddc96bd42da

So we should build patch #2 based on patch #1.

Thanks,
Tiezhu

>> I'm not finding it in the debian cross build packages:
>>
>> root@d77a78c0aa1c:/# apt-file find perf_regs.h | grep cross
>> linux-libc-dev-amd64-cross: /usr/x86_64-linux-gnu/include/asm/perf_regs.h
>> linux-libc-dev-arm64-cross: /usr/aarch64-linux-gnu/include/asm/perf_regs.h
>> linux-libc-dev-armel-cross: /usr/arm-linux-gnueabi/include/asm/perf_regs.h
>> linux-libc-dev-armhf-cross: /usr/arm-linux-gnueabihf/include/asm/perf_regs.h
>> linux-libc-dev-i386-cross: /usr/i686-linux-gnu/include/asm/perf_regs.h
>> linux-libc-dev-powerpc-cross: /usr/powerpc-linux-gnu/include/asm/perf_regs.h
>> linux-libc-dev-ppc64-cross: /usr/powerpc64-linux-gnu/include/asm/perf_regs.h
>> linux-libc-dev-ppc64el-cross: /usr/powerpc64le-linux-gnu/include/asm/perf_regs.h
>> linux-libc-dev-riscv64-cross: /usr/riscv64-linux-gnu/include/asm/perf_regs.h
>> linux-libc-dev-s390x-cross: /usr/s390x-linux-gnu/include/asm/perf_regs.h
>> linux-libc-dev-x32-cross: /usr/x86_64-linux-gnux32/include/asm/perf_regs.h
>> root@d77a78c0aa1c:/#
>>
>> Ideas?
> Trying with:
>
> [perfbuilder@five x-mips]$ db
> acmel/linux-perf-tools-build-ubuntu:19.10-x-mips
> STEP 1: FROM ubuntu:21.04
> STEP 2: MAINTAINER Arnaldo Carvalho de Melo <acme@kernel.org>
> STEP 3: ENV ARCH mips
> STEP 4: ENV TARGET mips-linux-gnu
> STEP 5: ENV CROSS_COMPILE=${TARGET}-
> STEP 6: RUN apt-get -y update &&     apt-get -y install make gcc-${TARGET} g++-${TARGET} flex bison git python3 &&     apt-get -y install curl wget bzip2 xz-utils file &&     export ELFUTILS_VER=0.173 &&     export ZLIB_VER=1.2.11 &&     export INSTALLDIR=/usr/${TARGET} &&     export PATH=$INSTALLDIR/bin:$PATH &&     export TARGETMACH=${TARGET} &&     export CROSS=${TARGET}- &&     export CC=${CROSS}gcc &&     export LD=${CROSS}ld &&     export AS=${CROSS}as &&     wget -q http://zlib.net/zlib-${ZLIB_VER}.tar.gz &&     wget -q https://fedorahosted.org/releases/e/l/elfutils/${ELFUTILS_VER}/elfutils-${ELFUTILS_VER}.tar.bz2 &&     tar xf zlib-${ZLIB_VER}.tar.gz &&     cd zlib-${ZLIB_VER} &&     ./configure --prefix=${INSTALLDIR} &&     make &&     make install &&     cd .. &&     rm -rf zlib-${ZLIB_VER} &&     rm -f zlib-${ZLIB_VER}.tar.gz &&     tar xf elfutils-${ELFUTILS_VER}.tar.bz2 &&     cd elfutils-${ELFUTILS_VER} &&     ./configure --host=${TARGET} --prefix=${INSTALLDIR} &&     make &&     make install &&     cd .. &&     rm -rf elfutils-${ELFUTILS_VER}* &&     git clone https://github.com/Linaro/OpenCSD.git &&     make -C OpenCSD/decoder/build/linux/ CROSS_COMPILE=${CROSS} install &&     rm -rf OpenCSD &&     apt-get -y remove wget bzip2 &&     apt-get -y clean &&     unset TARGET INSTALLDIR TARGETMACH CROSS CC LD AS &&     mkdir -m 777 -p /git /tmp/build/perf /tmp/build/objtool /tmp/build/linux &&     groupadd -r perfbuilder &&     useradd -m -r -g perfbuilder perfbuilder &&     chown -R perfbuilder.perfbuilder /tmp/build/ /git/

