Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D42B71595CF
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2020 18:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgBKRBS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Feb 2020 12:01:18 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35202 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728353AbgBKRBR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Feb 2020 12:01:17 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so6032696pgk.2
        for <linux-mips@vger.kernel.org>; Tue, 11 Feb 2020 09:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H7iuRM8yHTFvyxReMmW4tCVEvKQHXWOuGOxHsaAC9vo=;
        b=EykSddE1jrYUv0gaLie7j8H7kqxw6qUbl8wUy+xUxbMggxW8oLjbARlv/WbNxTIw8i
         ZS+TWOF16qaCkXYKterCGUEMSlcnOyQYzlzQuKF7INqJkfYVb3v/Njq/65wKRixjkdx3
         okUyhNYjhhQ7IW2rivxkBYlRfGUklOmLEFTX+VHzT2UYtAXXyQ0BxNcay6YSkjqQ9kyW
         DAlSv3vls/7S9TtHnRIhK8tt2aGb86W7vyxcTe33t1yz/idA4iQWDEGJ4EQi5FVTNabQ
         e42jYzBYBNsSVmX7hXFUN1Zrk/MoMLzVraOAfVlNbAozezA7OLKy6XHguZs6iPghseOv
         IYNA==
X-Gm-Message-State: APjAAAWPxdLBCtbV2Q8soS3oz2Jx4ccXYtwzvGYevqryHVAqlY9PShn+
        Nk3GkmuYJvexDA3o+OInSzk=
X-Google-Smtp-Source: APXvYqz1waNYC3vbwNif+u0bb42PML/ZPlywR9JeKFILVFe+bYycI+uFD/62ARUg+USbM0OFPW4Ojg==
X-Received: by 2002:a63:de0b:: with SMTP id f11mr7488798pgg.89.1581440477065;
        Tue, 11 Feb 2020 09:01:17 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id d3sm3767219pjx.10.2020.02.11.09.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 09:01:16 -0800 (PST)
Date:   Tue, 11 Feb 2020 09:01:10 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     "Victor Kamensky (kamensky)" <kamensky@cisco.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
        "richard.purdie@linuxfoundation.org" 
        <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
Message-ID: <20200211170110.ewrndsh7zzx7ocqi@lantea.localdomain>
References: <20200203233133.38613-1-kamensky@cisco.com>
 <20200203233133.38613-2-kamensky@cisco.com>
 <20200210191424.brqyxs5lq7eqounl@lantea.localdomain>
 <20200210193301.ella5mokkudw3qgs@lantea.localdomain>
 <BL0PR11MB3219374C9349EE1B4F174777CD190@BL0PR11MB3219.namprd11.prod.outlook.com>
 <20200210225229.4px5rljkici4mlrj@lantea.localdomain>
 <BL0PR11MB3219D6C91AAD980EC3BFED14CD180@BL0PR11MB3219.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BL0PR11MB3219D6C91AAD980EC3BFED14CD180@BL0PR11MB3219.namprd11.prod.outlook.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Victor,

Thanks for your detailed debug & explanations :)

On Tue, Feb 11, 2020 at 04:55:21PM +0000, Victor Kamensky (kamensky) wrote:
> I will add few sentences to my commit message explaining why
> we don't have dynamic relocations for static functions case.
> And as you asked in follow up message I will add those options
> unconditionally.
>
> I believe my second patch: build time check for 'jalr t9' in code
> should still be useful, since it verifies that conversion to 'bal' driven
> by -mrelax-pic-calls does happen.
> 
> Please let me know if you have any additional feedback before
> I post v2 set of patches.

That sounds great, and nothing else springs to mind. I'll look out for
v2.

Thanks,
    Paul
