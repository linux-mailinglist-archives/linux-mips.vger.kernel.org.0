Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E47DF888E
	for <lists+linux-mips@lfdr.de>; Tue, 12 Nov 2019 07:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfKLGaB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Nov 2019 01:30:01 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34732 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfKLGaA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Nov 2019 01:30:00 -0500
Received: by mail-wr1-f65.google.com with SMTP id e6so17208454wrw.1;
        Mon, 11 Nov 2019 22:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lAYMmo1eJk0nu5Pp/QFztO4nECppTXXyiwDmyLApAMU=;
        b=CmNQS9o057m02iB3aVZCvD9IKuX8qvcKJgJUgyo4KExtj2bJGSViNfCsIbt5SiuwMO
         vuoCblpkhQtIhImySY2l9xgcSalma2cLx/gmbDWtxOG+KeWeZqQREyCEiZtz2MaeiTEY
         RldTTXX6x5mGp2gTJOMJKKnH3ErtuhTGJVb/oxnV4qflBhEKc0iGhFu9X9Z6Ewwj/nv7
         RJ+bk94WWdoFyERGDm1828mxsXI6cvzgXYdmifbVY3rPGuNlfG2Jz7tz9D0yBEL7amvI
         N9XaeSRhLvOl3rh+bmOKbDc4uYMU01us4xdrDKX0UOdp1yr6ys5I9p7y6gCnhALJgHcw
         WXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=lAYMmo1eJk0nu5Pp/QFztO4nECppTXXyiwDmyLApAMU=;
        b=SuB+rEekAaU3uHUYMv0CsdK8pzV3QhZQiwcHCDzY3zz1Z7UAanvBUcGoqtJ0/Pd3n3
         5VMEkbI57C0HVs00yDCEeHl9PhS0oqiFryZhGQ3fBNTSfLT/fOOZaMWu6Sr8OdnHGhN9
         5c5tRQ7NTdxhsq37lhLHERvcIfTdQ7dNtvZVKB+aVwsKoQ9DAKbhltJuuaCyZWOE5eZU
         3Zl3DiRM8HVujRcu9sfc8uNyALXnpunp1uGfP9BjZv4GnPxeYmqWJqGx39+8PxqYNLk6
         8tIm7dz+nILDChTMsNPy9CCwbtOVj4+TGTTuBb77tW7vGZDFMEkIpavSjJkU12u/OLqY
         8aNw==
X-Gm-Message-State: APjAAAV3Wmoah0Y4hbrHKSAnZ3OTjgdbaYxT8z1SHVkHxYU8bA4gV1Y7
        ABiT6Z44UZ9c5Wj3bRZM+so=
X-Google-Smtp-Source: APXvYqwg7II6op5rkcQCA+kVGqp8JW9qmm3wOv2otknPBBGlW4hCTPNNQNQ0ueZUnows/DjxDY46Ng==
X-Received: by 2002:adf:ab4c:: with SMTP id r12mr23079230wrc.3.1573540195668;
        Mon, 11 Nov 2019 22:29:55 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id 19sm40418570wrc.47.2019.11.11.22.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 22:29:54 -0800 (PST)
Date:   Tue, 12 Nov 2019 07:29:51 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V9] mm/debug: Add tests validating architecture page
 table helpers
Message-ID: <20191112062951.GA100264@gmail.com>
References: <1573532326-24084-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573532326-24084-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


* Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> +config DEBUG_VM_PGTABLE
> +	bool "Debug arch page table for semantics compliance"
> +	depends on MMU
> +	depends on DEBUG_VM
> +	depends on ARCH_HAS_DEBUG_VM_PGTABLE
> +	help
> +	  This option provides a debug method which can be used to test
> +	  architecture page table helper functions on various platforms in
> +	  verifying if they comply with expected generic MM semantics. This
> +	  will help architecture code in making sure that any changes or
> +	  new additions of these helpers still conform to expected
> +	  semantics of the generic MM.
> +
> +	  If unsure, say N.

Since CONFIG_DEBUG_VM is generally disabled in distro kernel packages, 
why not make this 'default y' to maximize testing coverage? The code size 
increase should be minimal, and DEBUG_VM increases size anyway.

Other than that this looks good to me:

  Reviewed-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
