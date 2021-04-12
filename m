Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6728C35C7E9
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 15:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238881AbhDLNs2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 09:48:28 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44114 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237043AbhDLNs2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 09:48:28 -0400
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cx6cl7T3RgBzQHAA--.13657S3;
        Mon, 12 Apr 2021 21:47:39 +0800 (CST)
Subject: Re: [PATCH] MIPS: Fix strnlen_user access check
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <0a09783b-7522-5cf2-9014-39783aaacbdc@loongson.cn>
Date:   Mon, 12 Apr 2021 21:47:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Cx6cl7T3RgBzQHAA--.13657S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tw17XFWxCFWUAF4ktw1UKFg_yoW8GrykpF
        s5Aa1kGF4DKryfAasFyrWUXFy5Gws8Gr1F93y7Kr1kZF4qq3W3tr4Skr1qv3yxJFZaka4x
        uFyftrn5uw1jv3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26F4j6r4UJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE14v_Xr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y
        6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
        14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x07brUUbUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/11/2021 07:04 PM, Jinyang He wrote:
> Commit 04324f44cb69 ("MIPS: Remove get_fs/set_fs") brought a problem for
> strnlen_user(). Jump out when checking access_ok() with condition that
> (s + strlen(s)) < __UA_LIMIT <= (s + n). The old __strnlen_user_asm()
> just checked (ua_limit & s) without checking (ua_limit & (s + n)).
> Therefore, find strlen form s to __UA_LIMIT - 1 in that condition.
>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>   arch/mips/include/asm/uaccess.h | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> index 91bc7fb..85ba0c8 100644
> --- a/arch/mips/include/asm/uaccess.h
> +++ b/arch/mips/include/asm/uaccess.h
> @@ -630,8 +630,15 @@ static inline long strnlen_user(const char __user *s, long n)
>   {
>   	long res;
>   
> -	if (!access_ok(s, n))
> -		return -0;
> +	if (unlikely(n <= 0))
> +		return 0;
> +
> +	if (!access_ok(s, n)) {
> +		if (!access_ok(s, 0))
> +			return 0;
> +
> +		n = __UA_LIMIT - (unsigned long)s - 1;
Sorry for here and it should be ~__UA_LIMIT...
earlier discussed:
https://patchwork.kernel.org/project/linux-mips/patch/1618139092-4018-1-git-send-email-hejinyang@loongson.cn/#24107107

Hope other comment. :-)

Jinyang

> +	}
>   
>   	might_fault();
>   	__asm__ __volatile__(

