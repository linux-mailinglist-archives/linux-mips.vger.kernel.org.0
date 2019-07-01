Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E685C230
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2019 19:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbfGARnk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jul 2019 13:43:40 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44887 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbfGARnk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jul 2019 13:43:40 -0400
Received: by mail-pf1-f196.google.com with SMTP id t16so6906580pfe.11;
        Mon, 01 Jul 2019 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HhNv+wbN0VpJBBUB5um1iIUQWl9GFxBZ8169m9nMh1Q=;
        b=QnUrJklGkONB4oUCSDM4a5/B9AjR3Ueaf5s+tdYxalrXDIZ0GhwPNWh42efZy+I5Xn
         92xwnF53ODnXP+9sgmpHBhOOjpqV26b7+42ZRPRk6xmPRdVvaelDyd3gdjMqsdRq/vVa
         8YXYcTOWru/z0aXw/rgdkrtxHNhCM+U+r4yigeD0tzmNZQ3ULfNBd8aAMi0i3695b5nT
         F1HwO7xsHq4XhurMKHyvX1NEG99wq6nwqu60ustJ17VW/xG90UOMVfp7Ho4LClGJSQ0Z
         QXENjnc9l7y8HixsJptV+PVZ60bswk6qfv+VYe/owAsnVnEH+PPu3khpsm9JBrEGafVn
         zoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=HhNv+wbN0VpJBBUB5um1iIUQWl9GFxBZ8169m9nMh1Q=;
        b=Pdwqst5IZUyB/qj30WXsKnaUB/5QzOyk8QJHuNpdKn4YQ8UpDpNnNvLC8zHV7tGqOY
         M1HDgbxTyHMYbyNyqCIHSyawl0DAKcxgX2EjCqe6/2g4VMrTTZT4ZN2CH6cWXvv6P91/
         sybdsdIgFvHfrsLN01iyq5Jl5O2hSIz2eW6pgKlmfzkeuqXgx+jYlpuOMR15TaxiowFQ
         SrT/KA0UvRTjH+iTlVb8wAiVrIgsUsFfUnOKwvRLG3Vso6xH03bc4EXbzej3AoK7895r
         jPOcdEU8TUaTb82xKtFF430re9gUbFAKQ9AAw9sbya3fv/5kvPw9NaBBNoDM9zVAD4db
         g2gQ==
X-Gm-Message-State: APjAAAX3a5DjOCuZtpe2B3dUpnfS0c0ZXmAA362UQs/J19OYJ3ryxCx2
        AMfl+N1YGdP9ma/sspyni6Y=
X-Google-Smtp-Source: APXvYqyplVhpDW5rDBLRdETRKZqEF+2npSCxstRykGDoDFKPjD1Lu6ZctfD97RsU9C2mhJ/QiLiPig==
X-Received: by 2002:a17:90a:2008:: with SMTP id n8mr536465pjc.4.1562003019392;
        Mon, 01 Jul 2019 10:43:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x1sm182418pjo.4.2019.07.01.10.43.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 10:43:38 -0700 (PDT)
Date:   Mon, 1 Jul 2019 10:43:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sh: stub out pud_page
Message-ID: <20190701174336.GA24848@roeck-us.net>
References: <20190701151818.32227-1-hch@lst.de>
 <20190701151818.32227-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701151818.32227-2-hch@lst.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 01, 2019 at 05:18:17PM +0200, Christoph Hellwig wrote:
> There wasn't any actual need to add a real pud_page, as pud_huge
> always returns false on sh.  Just stub it out to fix the sh3
> compile failure.
> 
> Fixes: 937b4e1d6471 ("sh: add the missing pud_page definition")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/sh/include/asm/pgtable-3level.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/sh/include/asm/pgtable-3level.h b/arch/sh/include/asm/pgtable-3level.h
> index 3c7ff20f3f94..779260b721ca 100644
> --- a/arch/sh/include/asm/pgtable-3level.h
> +++ b/arch/sh/include/asm/pgtable-3level.h
> @@ -37,7 +37,9 @@ static inline unsigned long pud_page_vaddr(pud_t pud)
>  {
>  	return pud_val(pud);
>  }
> -#define pud_page(pud)		pfn_to_page(pud_pfn(pud))
> +
> +/* only used by the stubbed out hugetlb gup code, should never be called */
> +#define pud_page(pud)		NULL
>  
>  #define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
>  static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
> -- 
> 2.20.1
> 
