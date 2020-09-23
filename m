Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20589275874
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 15:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgIWNNY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 09:13:24 -0400
Received: from relay2.mymailcheap.com ([217.182.66.162]:57660 "EHLO
        relay2.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgIWNNV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Sep 2020 09:13:21 -0400
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 1BAEC3ECD9;
        Wed, 23 Sep 2020 15:13:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id EBD922A510;
        Wed, 23 Sep 2020 15:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1600866798;
        bh=ARx23wj2vqf+60Qb4aU9aeJMsazyIuMC8wBBqRBo8CE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=0BUcpMEeVjvgEllRg+g5xyMYVbAR7iR7TN3J4v82/C12PHECVyEa4H0fn3jCaP7WC
         8NuQg+jZ916YekQxgJxwSwAw+bm84HwUiH2/L+SfIBAP3J5LeUyftr3GcFnPbukArn
         PbFGiyWLsIgCGFCLsmTotgn8TBYu38CzjDV2hCO8=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TyE-jPGoeJ5q; Wed, 23 Sep 2020 15:13:15 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 23 Sep 2020 15:13:15 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 74DDF40FE5;
        Wed, 23 Sep 2020 13:13:14 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="f4QackNg";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 65E6D40FE5;
        Wed, 23 Sep 2020 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1600866672;
        bh=ARx23wj2vqf+60Qb4aU9aeJMsazyIuMC8wBBqRBo8CE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=f4QackNgGsWdGq0Ko5Lm39l7gu9dFiIVrKJmXHrYZGn5R/rnJY/NhHHrKkeolJ4rN
         wJ+WHgWhQ4oI2UmiNYKe6XVIsl5QyaPa7JooggrSpuG2y/wwA0oWl4hiIbFjwmvWlM
         hpZoueOpmNuSgm+fv0Y9Pua2QSEwAdwpfFCh62cg=
Subject: Re: [PATCH] perf annotate mips: Add perf arch instructions annotate
 handlers
To:     Peng Fan <fanpeng@loongson.cn>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Dengcheng Zhu <dzhu@wavecomp.com>,
        Paul Burton <paulburton@kernel.org>,
        Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
        Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <1600858584-6161-1-git-send-email-fanpeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <0753902c-07c9-4390-7ffe-ff02cd1c87e1@flygoat.com>
Date:   Wed, 23 Sep 2020 21:11:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <1600858584-6161-1-git-send-email-fanpeng@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 74DDF40FE5
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_TWELVE(0.00)[14];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/9/23 18:56, Peng Fan Ð´µÀ:
> From: Dengcheng Zhu <dzhu@wavecomp.com>
>
> Support the MIPS architecture using the ins_ops association
> method. With this patch, perf-annotate can work well on MIPS.
>
> Testing it with a perf.data file collected on a mips machine:
> $./perf annotate -i perf.data
>
>           :           Disassembly of section .text:
>           :
>           :           00000000000be6a0 <get_next_seq>:
>           :           get_next_seq():
>      0.00 :   be6a0:       lw      v0,0(a0)
>      0.00 :   be6a4:       daddiu  sp,sp,-128
>      0.00 :   be6a8:       ld      a7,72(a0)
>      0.00 :   be6ac:       gssq    s5,s4,80(sp)
>      0.00 :   be6b0:       gssq    s1,s0,48(sp)
>      0.00 :   be6b4:       gssq    s8,gp,112(sp)
>      0.00 :   be6b8:       gssq    s7,s6,96(sp)
>      0.00 :   be6bc:       gssq    s3,s2,64(sp)
>      0.00 :   be6c0:       sd      a3,0(sp)
>      0.00 :   be6c4:       move    s0,a0
>      0.00 :   be6c8:       sd      v0,32(sp)
>      0.00 :   be6cc:       sd      a5,8(sp)
>      0.00 :   be6d0:       sd      zero,8(a0)
>      0.00 :   be6d4:       sd      a6,16(sp)
>      0.00 :   be6d8:       ld      s2,48(a0)
>      8.53 :   be6dc:       ld      s1,40(a0)
>      9.42 :   be6e0:       ld      v1,32(a0)
>      0.00 :   be6e4:       nop
>      0.00 :   be6e8:       ld      s4,24(a0)
>      0.00 :   be6ec:       ld      s5,16(a0)
>      0.00 :   be6f0:       sd      a7,40(sp)
>     10.11 :   be6f4:       ld      s6,64(a0)
> ...
>
> The original patch link is:
> https://lore.kernel.org/patchwork/patch/1180480/
>
> Signed-off-by: Dengcheng Zhu <dzhu@wavecomp.com>
> Signed-off-by: Peng Fan <fanpeng@loongson.cn>
> ---
>
> Add "bgtzl", "bltzl", "bgezl", "blezl", "beql"
> and "bnel", remove "bgtzal", "blezal", "beqzal",
> "bnezal" and "jialc". Because these five can not
> be found in the instruction manual.

Hi Peng Fan,

These instructions do exist in MIPS Release 6.
Please see MD00086-2B-MIPS32BIS-AFP-6.06[1].

Also I'd sugguest you to note your changes in commit
message instead of comments, Like:

```
Signed-off-by: Dengcheng Zhu <dzhu@wavecomp.com>
Signed-off-by: Peng Fan <fanpeng@loongson.cn>
[fanpeng@loongson.cn: Add missing "bgtzl", "bltzl",
"bgezl", "blezl", "beql" and "bnel" for pre-R6 processors]
```

Thanks.

[1]: 
https://s3-eu-west-1.amazonaws.com/downloads-mips/documents/MD00086-2B-MIPS32BIS-AFP-6.06.pdf

- Jiaxun
>
>   tools/perf/arch/mips/Build                   |  2 +-
>   tools/perf/arch/mips/annotate/instructions.c | 41 ++++++++++++++++++++++++++++
>   tools/perf/util/annotate.c                   |  8 ++++++
>   3 files changed, 50 insertions(+), 1 deletion(-)
>   create mode 100644 tools/perf/arch/mips/annotate/instructions.c
>
> diff --git a/tools/perf/arch/mips/Build b/tools/perf/arch/mips/Build
> index 1bb8bf6..e4e5f33 100644
> --- a/tools/perf/arch/mips/Build
> +++ b/tools/perf/arch/mips/Build
> @@ -1 +1 @@
> -# empty
> +perf-y += util/
> diff --git a/tools/perf/arch/mips/annotate/instructions.c b/tools/perf/arch/mips/annotate/instructions.c
> new file mode 100644
> index 0000000..8fae8a1
> --- /dev/null
> +++ b/tools/perf/arch/mips/annotate/instructions.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +static
> +struct ins_ops *mips__associate_ins_ops(struct arch *arch, const char *name)
> +{
> +	struct ins_ops *ops = NULL;
> +
> +	if (!strncmp(name, "bal", 3) ||
> +	    !strncmp(name, "bgezal", 6) ||
> +	    !strncmp(name, "bltzal", 6) ||
> +	    !strncmp(name, "bgtzl", 5) ||
> +	    !strncmp(name, "bltzl", 5) ||
> +	    !strncmp(name, "bgezl", 5) ||
> +	    !strncmp(name, "blezl", 5) ||
> +	    !strncmp(name, "beql", 4) ||
> +	    !strncmp(name, "bnel", 4) ||
> +	    !strncmp(name, "jal", 3))
> +		ops = &call_ops;
> +	else if (!strncmp(name, "jr", 2))
> +		ops = &ret_ops;
> +	else if (name[0] == 'j' || name[0] == 'b')
> +		ops = &jump_ops;
> +	else
> +		return NULL;
> +
> +	arch__associate_ins_ops(arch, name, ops);
> +
> +	return ops;
> +}
> +
> +static
> +int mips__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
> +{
> +	if (!arch->initialized) {
> +		arch->associate_instruction_ops = mips__associate_ins_ops;
> +		arch->initialized = true;
> +		arch->objdump.comment_char = '#';
> +	}
> +
> +	return 0;
> +}
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index 0a1fcf7..80a4a3d 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -152,6 +152,7 @@ static int arch__associate_ins_ops(struct arch* arch, const char *name, struct i
>   #include "arch/arm/annotate/instructions.c"
>   #include "arch/arm64/annotate/instructions.c"
>   #include "arch/csky/annotate/instructions.c"
> +#include "arch/mips/annotate/instructions.c"
>   #include "arch/x86/annotate/instructions.c"
>   #include "arch/powerpc/annotate/instructions.c"
>   #include "arch/s390/annotate/instructions.c"
> @@ -175,6 +176,13 @@ static struct arch architectures[] = {
>   		.init = csky__annotate_init,
>   	},
>   	{
> +		.name = "mips",
> +		.init = mips__annotate_init,
> +		.objdump = {
> +			.comment_char = '#',
> +		},
> +	},
> +	{
>   		.name = "x86",
>   		.init = x86__annotate_init,
>   		.instructions = x86__instructions,
