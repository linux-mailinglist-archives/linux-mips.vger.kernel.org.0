Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7147E32CB29
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 04:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbhCDDt0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 22:49:26 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47010 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232892AbhCDDs6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 22:48:58 -0500
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9d5WEBgaCQUAA--.8873S3;
        Thu, 04 Mar 2021 11:48:09 +0800 (CST)
Subject: Re: [PATCH] MIPS: Add comment about CONFIG_MIPS32_O32 in
 loongson3_defconfig when build with Clang
To:     Nathan Chancellor <nathan@kernel.org>
References: <1614820544-10686-1-git-send-email-yangtiezhu@loongson.cn>
 <20210304020244.pza6xd4ixziysrom@archlinux-ax161>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <958c5df5-76aa-9161-9519-07a03ee864a0@loongson.cn>
Date:   Thu, 4 Mar 2021 11:48:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210304020244.pza6xd4ixziysrom@archlinux-ax161>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxn9d5WEBgaCQUAA--.8873S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw18JrWUWr1kJF4UKr1UAwb_yoW8WFykp3
        95K3Wktr1DWF45GFWDArykWr9Yq3sxt3yqyasY93s0qFyDWFykWr9Ykwn3uryUArsFy34F
        gFZ3W34UJa1Iy3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjfUnQ6pDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/04/2021 10:02 AM, Nathan Chancellor wrote:
> On Thu, Mar 04, 2021 at 09:15:44AM +0800, Tiezhu Yang wrote:
>> When build kernel with Clang [1]:
>>
>> $ make CC=clang loongson3_defconfig
>> $ make CC=clang

[snip]

> I think this might be a better solution. I know that I personally never
> read defconfig files if a build fails.
>
> If CONFIG_MIPS32_O32 is broken with clang and the MIPS backend
> maintainer has said that it will not be supported due to lack of
> resources, then the config should not even be selectable in my opinion.
>
> Cheers,
> Nathan
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index d89efba3d8a4..ed35318a759d 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3315,6 +3315,8 @@ config SYSVIPC_COMPAT
>   config MIPS32_O32
>   	bool "Kernel support for o32 binaries"
>   	depends on 64BIT
> +	# https://bugs.llvm.org/show_bug.cgi?id=38063
> +	depends on $(success,$(CC) $(CLANG_FLAGS) -march=mips64 -o32 -c -x c /dev/null -o /dev/null)
>   	select ARCH_WANT_OLD_COMPAT_IPC
>   	select COMPAT
>   	select MIPS32_COMPAT

Hi Nathan,

Thank you very much for your reply and suggestion, maybe the following
change is simple, clear and better? If yes, I will send v2 later.

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3a38d27..f6ba59f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3318,6 +3318,8 @@ config SYSVIPC_COMPAT
  config MIPS32_O32
         bool "Kernel support for o32 binaries"
         depends on 64BIT
+       # https://bugs.llvm.org/show_bug.cgi?id=38063
+       depends on !CC_IS_CLANG
         select ARCH_WANT_OLD_COMPAT_IPC
         select COMPAT
         select MIPS32_COMPAT

Thanks,
Tiezhu

