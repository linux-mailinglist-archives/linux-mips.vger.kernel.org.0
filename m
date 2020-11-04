Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E172A5E20
	for <lists+linux-mips@lfdr.de>; Wed,  4 Nov 2020 07:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgKDGb5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Nov 2020 01:31:57 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40048 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727323AbgKDGb5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Nov 2020 01:31:57 -0500
Received: from [10.130.0.60] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD9PVSqJfPnkFAA--.14168S3;
        Wed, 04 Nov 2020 14:31:52 +0800 (CST)
Subject: Re: [PATCH v3 5/6] MIPS: Loongson64: SMP: Fix up play_dead jump
 indicator
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
 <1604387525-23400-6-git-send-email-yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>, Jun Yi <yijun@loongson.cn>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <e534bc91-a946-fde7-a411-bf200abbe6a5@loongson.cn>
Date:   Wed, 4 Nov 2020 14:31:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1604387525-23400-6-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxD9PVSqJfPnkFAA--.14168S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1UJw15KFWrGFykCFW8tFb_yoW8Zr1Dp3
        9rAw17KFs8uF4UZFn5Jw1UJFWUJa9YqasxJFZFqr15Z3s0gw1Y9FySkr1rXa4xWF1vka40
        qFyDurykCay7ArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUaoGdUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, all,

On 11/03/2020 03:12 PM, Tiezhu Yang wrote:
> In play_dead function, the whole 64-bit PC mailbox was used as a indicator
> to determine if the master core had written boot jump information.
>
> However, after we introduced CSR mailsend, the hardware will not guarante
> an atomic write for the 64-bit PC mailbox. Thus we have to use the lower
> 32-bit which is written at the last as the jump indicator instead.
>
> Signed-off-by: Lu Zeng <zenglu@loongson.cn>
> Signed-off-by: Jun Yi <yijun@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>
> v2: No changes
> v3: Update the commit message and comment
>
>   arch/mips/loongson64/smp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index 736e98d..aa0cd72 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -764,9 +764,10 @@ static void loongson3_type3_play_dead(int *state_addr)
>   		"1: li    %[count], 0x100             \n" /* wait for init loop */
>   		"2: bnez  %[count], 2b                \n" /* limit mailbox access */
>   		"   addiu %[count], -1                \n"
> -		"   ld    %[initfunc], 0x20(%[base])  \n" /* get PC via mailbox */
I have some confusion here. Play_dead CPUs is always brought up by cpu_up().
On Loongson64, it calls loongson3_boot_secondary(). The value of 
startargs[0]
is the address of smp_bootstrap() which is in CKSEG0 and a constant 
after the
kernel is compiled. That means its value likes 0xffffffff8... and only 
the low
32bit is useful. As "lw" is sign-extended, could we replace "ld" with 
"lw" simply?

Thanks,
Jinyang
> +		"   lw    %[initfunc], 0x20(%[base])  \n" /* check lower 32-bit as jump indicator */
>   		"   beqz  %[initfunc], 1b             \n"
>   		"   nop                               \n"
> +		"   ld    %[initfunc], 0x20(%[base])  \n" /* get PC (whole 64-bit) via mailbox */
>   		"   ld    $sp, 0x28(%[base])          \n" /* get SP via mailbox */
>   		"   ld    $gp, 0x30(%[base])          \n" /* get GP via mailbox */
>   		"   ld    $a1, 0x38(%[base])          \n"

