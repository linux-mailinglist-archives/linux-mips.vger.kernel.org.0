Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84BFA2EC604
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jan 2021 23:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbhAFWHu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jan 2021 17:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbhAFWHu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jan 2021 17:07:50 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED561C061575
        for <linux-mips@vger.kernel.org>; Wed,  6 Jan 2021 14:07:09 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id v1so185462pjr.2
        for <linux-mips@vger.kernel.org>; Wed, 06 Jan 2021 14:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=97bTCu9/bzmLzrhctga1J2iFmuyfoogQ7hmoxWlzhpk=;
        b=MHvyLbjHzGYY/d2eSM18499bLDNbuoRUCVJKrih26oS3pMLrwHUwEX0vtpb7g+pbVB
         zxVYPJi9a/XBs5bgqwr3lP2REnJrpTgQHhRWa6vs8S2i61bGw2bEdgjTJoujUMNT99YQ
         8KFORDJPn2cFDq9ijNxgxYiL7hwg6YgjTmkLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=97bTCu9/bzmLzrhctga1J2iFmuyfoogQ7hmoxWlzhpk=;
        b=gy4Ojo25irQahdqUQdcidv/p2zP8+nUuQkAtr0C/LvpvWyScJgEMP4YBB7/t7Zf+bv
         q+QP/SSGpA96nWOHKvXhpxpQ8NAmh6sXVhBPoWusM145+//qWWQe0k433zluBe0Ao6nR
         VghLD5LhFbaWr0iweLqSFbL9+mjvtX+rsJBuhDxCG/cDVNJgaHakbtObOT3vSBHZliaw
         u8C4g3AAL+He67e/BLtJDB+s85lcKaRFHPflY3S+CLzDeFKZdMzbBTvvYQUwpwkFSfrJ
         wBrVdL65tYYHHeW8aP7iGeiOPMxYRs2pYMIKQlxLvFikdCbhxzrZ3uCmQQGt+UbD5Z2e
         +n0Q==
X-Gm-Message-State: AOAM5312JyMOlDnbTg9nZb1G3WJTzmAtq4czwpuT5eWWUfCC61IqkcMm
        JlgvcQBQR/rE0EDoS4ABmZFfrw==
X-Google-Smtp-Source: ABdhPJxKM0L8EziSFUGgh8qzAMXGV2beB7hn7pXRl3sdjvtm+H0Mr16vdfmpvdb+5BX3AFsp79wzdg==
X-Received: by 2002:a17:90a:6fc7:: with SMTP id e65mr6190115pjk.116.1609970829428;
        Wed, 06 Jan 2021 14:07:09 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o32sm3821053pgm.10.2021.01.06.14.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 14:07:08 -0800 (PST)
Date:   Wed, 6 Jan 2021 14:07:07 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alex Smith <alex.smith@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Markos Chandras <markos.chandras@imgtec.com>,
        linux-mips@vger.kernel.org, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 mips-next 2/4] MIPS: vmlinux.lds.S: add
 ".gnu.attributes" to DISCARDS
Message-ID: <202101061400.8F83981AE@keescook>
References: <20210106200713.31840-1-alobakin@pm.me>
 <20210106200801.31993-1-alobakin@pm.me>
 <20210106200801.31993-2-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106200801.31993-2-alobakin@pm.me>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 06, 2021 at 08:08:19PM +0000, Alexander Lobakin wrote:
> Discard GNU attributes at link time as kernel doesn't use it at all.
> Solves a dozen of the following ld warnings (one per every file):
> 
> mips-alpine-linux-musl-ld: warning: orphan section `.gnu.attributes'
> from `arch/mips/kernel/head.o' being placed in section
> `.gnu.attributes'
> mips-alpine-linux-musl-ld: warning: orphan section `.gnu.attributes'
> from `init/main.o' being placed in section `.gnu.attributes'
> 
> Misc: sort DISCARDS section entries alphabetically.

Hmm, I wonder what is causing the appearance of .eh_frame? With help I
tracked down all the causes of this on x86, arm, and arm64, so that's
why it's not in the asm-generic DISCARDS section. I suspect this could
be cleaned up for mips too?

Similarly for .gnu.attributes. What is generating that? (Or, more
specifically, why is it both being generated AND discarded?)

-Kees

> 
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> ---
>  arch/mips/kernel/vmlinux.lds.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index 83e27a181206..5d6563970ab2 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -221,9 +221,10 @@ SECTIONS
>  		/* ABI crap starts here */
>  		*(.MIPS.abiflags)
>  		*(.MIPS.options)
> +		*(.eh_frame)
> +		*(.gnu.attributes)
>  		*(.options)
>  		*(.pdr)
>  		*(.reginfo)
> -		*(.eh_frame)
>  	}
>  }
> -- 
> 2.30.0
> 
> 

-- 
Kees Cook
