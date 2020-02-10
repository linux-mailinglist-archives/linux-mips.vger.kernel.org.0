Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B52B158374
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2020 20:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgBJTVV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Feb 2020 14:21:21 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35073 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgBJTVV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Feb 2020 14:21:21 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so3216414plt.2
        for <linux-mips@vger.kernel.org>; Mon, 10 Feb 2020 11:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9iL+8UHtT7hqV0efHdmUG+2eYV+hnBNlj1jniBNOCRc=;
        b=GGJmrhl//tZ/6gWQyL1Wv+3FjFuvIibKiqoLNlPVFfJX+uhn/rfjQamlI0FkqYL3hp
         Q7+VL3cnkbyxPLk34ggO5U0OEhCOh6BY1IA9FsH6rv0LOiRES9VjBAU3moLtH+YldOAY
         X9M846nBxCf/03SbDHhqZCyx+LRoLU/4CyLosER6rm+pcN5nAGXt/i/keZA6ArUtOn1a
         d8E28N8bmW4vZizYQDvJgcLr7+RguQONzuUBFNWbQT67qapqZuPt5bWqUm5vWCxOZaDc
         q9FrSmWUppF9IXAMjevYjE+v6ulaRUZfIYVzY5LOXuhKj77XPLcMMlLeq+zHMZV9E0Oz
         19RQ==
X-Gm-Message-State: APjAAAWeYwvEhUgz0g3DQXgHAPui7sn8pT6ba3+hmibuWiXZ3V47oLaN
        HpIfPtNFy1hHG9202G58rCnZgBjs2VQ=
X-Google-Smtp-Source: APXvYqwjZMlNjVbczLAcZN8yGGybTr6MktTpKRSM/2WhGKNAIQDnQF2NCkzy5iJ3z0T6M8q/vpS8Mw==
X-Received: by 2002:a17:902:fe8b:: with SMTP id x11mr14626536plm.83.1581362480297;
        Mon, 10 Feb 2020 11:21:20 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id u126sm1147221pfu.182.2020.02.10.11.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 11:21:19 -0800 (PST)
Date:   Mon, 10 Feb 2020 11:24:50 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Wang Xuerui <git@xen0n.name>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH 1/2] MIPS: loongson3-llsc-check: Downgrade failures to
 notices
Message-ID: <20200210192450.oj5emuimburldawi@lantea.localdomain>
References: <20200202170052.14012-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200202170052.14012-1-git@xen0n.name>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Wang & Huacai,

On Mon, Feb 03, 2020 at 01:00:51AM +0800, Wang Xuerui wrote:
> From: Huacai Chen <chenhc@lemote.com>
> 
> Local ops (and other similar cases) don't need SYNCs before LL/SC
> because there is only one writer, so don't always fail on missing SYNCs.
> Print a notice instead.
> 
> [git@xen0n.name: Massaged commit message and symbol naming.]

I really dislike this patch; the whole point of the compile-time check
is to make problems fatal & easy to find. By turning them into mere
warnings you make it possible to ignore real problems, and by making
some of the warnings expected with patch 2 you make it much more likely
that real issues will be ignored.

I'd suggest that if you want to remove the SYNCs in asm/local.h then you
could come up with some way to annotate those places in a way that the
loongson3-llsc-check tool can detect & avoid erroring on. That way real
bugs will still be found, presuming the annotations are used correctly.
For example, you could come up with a macro to use instead of __SYNC()
that generates an ELF section listing the PC values of locations that
don't require the sync. The checker can take those into account, and we
can remove the section from the final VDSO image.

As it is, I'd much rather have asm/local.h incur the slight overhead
from extra sync instructions than make the checker useless.

Thanks,
    Paul

> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Wang Xuerui <git@xen0n.name>
> ---
>  arch/mips/tools/loongson3-llsc-check.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/tools/loongson3-llsc-check.c b/arch/mips/tools/loongson3-llsc-check.c
> index 0ebddd0ae46f..c485950b7a36 100644
> --- a/arch/mips/tools/loongson3-llsc-check.c
> +++ b/arch/mips/tools/loongson3-llsc-check.c
> @@ -138,6 +138,12 @@ static bool is_branch(uint32_t insn, int *off)
>  	}
>  }
>  
> +#define REPORT_OK		0x0
> +#define REPORT_LL		0x1
> +#define REPORT_BRANCH_TARGET	0x2
> +
> +static int err_report = REPORT_OK;
> +
>  static int check_ll(uint64_t pc, uint32_t *code, size_t sz)
>  {
>  	ssize_t i, max, sc_pos;
> @@ -149,8 +155,8 @@ static int check_ll(uint64_t pc, uint32_t *code, size_t sz)
>  	 * execute after the LL & cause erroneous results.
>  	 */
>  	if (!is_sync(le32toh(code[-1]))) {
> +		err_report |= REPORT_LL;
>  		fprintf(stderr, "%" PRIx64 ": LL not preceded by sync\n", pc);
> -		return -EINVAL;
>  	}
>  
>  	/* Find the matching SC instruction */
> @@ -185,9 +191,9 @@ static int check_ll(uint64_t pc, uint32_t *code, size_t sz)
>  			continue;
>  
>  		/* ...but if not, we have a problem */
> +		err_report |= REPORT_BRANCH_TARGET;
>  		fprintf(stderr, "%" PRIx64 ": Branch target not a sync\n",
>  			pc + (i * 4));
> -		return -EINVAL;
>  	}
>  
>  	return 0;
> @@ -297,6 +303,13 @@ int main(int argc, char *argv[])
>  			goto out_munmap;
>  	}
>  
> +	if (err_report & REPORT_LL)
> +		fprintf(stderr, "Notice: there are LLs not preceded by"
> +				" syncs, please confirm manually.\n");
> +	if (err_report & REPORT_BRANCH_TARGET)
> +		fprintf(stderr, "Notice: there are branches within LL/SC blocks"
> +				" not targeting syncs, please confirm manually.\n");
> +
>  	status = EXIT_SUCCESS;
>  out_munmap:
>  	munmap(vmlinux, st.st_size);
> -- 
> 2.21.0
> 
