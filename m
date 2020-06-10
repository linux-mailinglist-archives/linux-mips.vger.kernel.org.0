Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481771F596E
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 18:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbgFJQud (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 12:50:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36833 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729095AbgFJQub (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Jun 2020 12:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591807830;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
        b=HmDpJKhsOu6i+uvNkS67WV/27yfgCTe34kwlqJ5ictiAtbUaZeNVjGTmhXiRiiGHYZLiF6
        T2fLb9k6+gYCzwSv1OETtf1dr6MA8W7kAmBDb/TtG26LSicGIcHYTUG2JTw6gzchm+JeIb
        uD35kC94iOXHJkfa7ZOpyd0Cl7iOJrY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-67Vrj1aHOWiwiqwKFxn6mQ-1; Wed, 10 Jun 2020 12:50:28 -0400
X-MC-Unique: 67Vrj1aHOWiwiqwKFxn6mQ-1
Received: by mail-qv1-f70.google.com with SMTP id 59so2320256qvb.4
        for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2020 09:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
        b=ic6wqa1z05i3CvY9CPweEfxacVmBukX+TwVtUfrh2DzRc7CCK40R91XT2qwylmUnqL
         QnUaxqI0n5U4DCTbrUpJDf5CvtVusDK51tLYYIxaQoMNoUlIBQqNl5aeKoBupZJy8zGt
         cGOO4+ytoKGPDqRvvf3pnCsplhGGHo+eOJAcA2FYh+FoYFfBA3jy2jco1K1kmclPrJUz
         cQcPk5vrOi1e/TgZPt2HzH8Zl2Bgz8sTwE9E7arNIBOrM8eFfy7EgJP0Tcbv/8T+iIGn
         h9F1CJZDddRqLvw3tqAoo6wTDlXaZcSNKtCmOBWIVPYQ1pt8YyZGF7hDCHyVkzj9GYbS
         d5zg==
X-Gm-Message-State: AOAM533urTt/StotIPZacxHuBDt+VRSxb/NcuLPWufuhoLGUgRjy+5hl
        SntfDU/WpKbPJGZfP975MrHttCLVU+uc1n7Wz8EIrH7T4btJucPstIrD7fFuIeOlp7AXrE9FVs/
        tMjzJL53UKoG6sXUeTgx0VA==
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987568qke.236.1591807826876;
        Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn20TLNz7hD3Ni4blZzJN/2PX0jI8mrO6z2/UHNbD+ObHKXkY/kSbOK73eCMc/XFP0Ereokw==
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987535qke.236.1591807826580;
        Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id 207sm149672qki.134.2020.06.10.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:50:25 -0700 (PDT)
Date:   Wed, 10 Jun 2020 12:50:23 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc:     linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Guan Xuetao <gxt@pku.edu.cn>, linux-xtensa@linux-xtensa.org,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: Possible duplicate page fault accounting on some archs after
 commit 4064b9827063
Message-ID: <20200610165023.GA67179@xz-x1>
References: <20200610174811.44b94525@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610174811.44b94525@thinkpad>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 10, 2020 at 05:48:11PM +0200, Gerald Schaefer wrote:
> Hi,

Hi, Gerald,

> 
> Some architectures have their page fault accounting code inside the fault
> retry loop, and rely on only going through that code once. Before commit
> 4064b9827063 ("mm: allow VM_FAULT_RETRY for multiple times"), that was
> ensured by testing for and clearing FAULT_FLAG_ALLOW_RETRY.
> 
> That commit had to remove the clearing of FAULT_FLAG_ALLOW_RETRY for all
> architectures, and introduced a subtle change to page fault accounting
> logic in the affected archs. It is now possible to go through the retry
> loop multiple times, and the affected archs would then account multiple
> page faults instead of just one.
> 
> This was found by coincidence in s390 code, and a quick check showed that
> there are quite a lot of other architectures that seem to be affected in a
> similar way. I'm preparing a fix for s390, by moving the accounting behind
> the retry loop, similar to x86. It is not completely straight-forward, so
> I leave the fix for other archs to the respective maintainers.

Sorry for not noticing this before.  The accounting part should definitely be
put at least into a check against fault_flag_allow_retry_first() to mimic what
was done before.  And I agree it would be even better to put it after the retry
logic, so if any of the page faults gets a major fault, it'll be accounted as a
major fault which makes more sense to me, just like what x86 is doing now with:

	major |= fault & VM_FAULT_MAJOR;

I'm not sure what's the preference of the arch maintainers, just let me know if
it's preferred to use a single series to address this issue for all affected
archs (or the archs besides s390), then I'll do.

Thanks!

-- 
Peter Xu

