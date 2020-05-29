Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16FF1E7973
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 11:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgE2J3a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 05:29:30 -0400
Received: from mail-m975.mail.163.com ([123.126.97.5]:35666 "EHLO
        mail-m975.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgE2J33 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 05:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=+4EEy
        wAUFITYWURokQ5kreGf4kDxLIlPgQaIE9PyRbY=; b=pRuK9fJQq1z9deHbRSWok
        A+FwXAWRZBAtMFUiSdgU1qdI7iVoj76wdnVkxu3h8ZQpQi2UoUE08/2iAqdI9KUn
        0Xmv3Xu/psDgBJK8vHCQdVbKW9nd/3X/7APjFSdHy32RgNEIk2UaVzXJv3SiTWnM
        V1k2rzOaC130arGEbT4MFA=
Received: from [172.20.10.2] (unknown [124.64.18.22])
        by smtp5 (Coremail) with SMTP id HdxpCgCnUbXl1dBefUjPAA--.121S2;
        Fri, 29 May 2020 17:29:19 +0800 (CST)
Subject: Re: [PATCH] function:stacktrace/mips: Fix function:stacktrace for
 mips
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn
References: <20200528123640.4285-1-yuanjunqing66@163.com>
From:   yuanjunqing <yuanjunqing66@163.com>
Message-ID: <11c90f15-0a25-e628-c8db-53343c351085@163.com>
Date:   Fri, 29 May 2020 17:29:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200528123640.4285-1-yuanjunqing66@163.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: HdxpCgCnUbXl1dBefUjPAA--.121S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrW5GryDtFW8JF4fJFWUJwb_yoW8Xw4rp3
        4qyF9rGrWUXFs0k34fWF95ur1Yqr4kJ3y2vry7JrsIk3ZIgFs3AFn2k3Z0q3yq9ry8Ka4f
        ur1kuF45Cr4v9rDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jfyCJUUUUU=
X-Originating-IP: [124.64.18.22]
X-CM-SenderInfo: h1xd0ypxqtx0rjwwqiywtou0bp/xtbBUQ8zXFaD7RE31AAAs7
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

May I ask if you have received this email.

ÔÚ 2020/5/28 ÏÂÎç8:36, YuanJunQing Ð´µÀ:
> ftrace_call as global symbol in ftrace_caller(), this
> will cause function:stacktrace can not work well.
> i.e. echo do_IRQ:stacktrace > set_ftrace_filte
>
> Signed-off-by: YuanJunQing <yuanjunqing66@163.com>
> ---
>  arch/mips/kernel/mcount.S | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
> index cff52b283e03..cd5545764e5f 100644
> --- a/arch/mips/kernel/mcount.S
> +++ b/arch/mips/kernel/mcount.S
> @@ -87,8 +87,15 @@ EXPORT_SYMBOL(_mcount)
>  	PTR_LA   t1, _etext
>  	sltu     t3, t1, a0	/* t3 = (a0 > _etext) */
>  	or       t1, t2, t3
> +	PTR_LA	 t2, stlab-4 	/* t2: "function:stacktrace" return address */
> +	move	 a1, AT		/* arg2: parent's return address */
>  	beqz     t1, ftrace_call
> -	 nop
> +	 nop			/* "function:stacktrace" return address */
> +stlab:
> +	PTR_LA	t2, stlab-4
> +	/* ftrace_call_end: ftrace_call return address */
> +	beq	t2,ra, ftrace_call_end
> +	nop
>  #if defined(KBUILD_MCOUNT_RA_ADDRESS) && defined(CONFIG_32BIT)
>  	PTR_SUBU a0, a0, 16	/* arg1: adjust to module's recorded callsite */
>  #else
> @@ -98,7 +105,9 @@ EXPORT_SYMBOL(_mcount)
>  	.globl ftrace_call
>  ftrace_call:
>  	nop	/* a placeholder for the call to a real tracing function */
> -	 move	a1, AT		/* arg2: parent's return address */
> +	move	ra, t2		/* t2: "function:stacktrace" return address */
> +
> +ftrace_call_end:
>  
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>  	.globl ftrace_graph_call

