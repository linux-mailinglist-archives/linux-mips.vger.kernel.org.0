Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F1331EA41
	for <lists+linux-mips@lfdr.de>; Thu, 18 Feb 2021 14:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhBRNGF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Feb 2021 08:06:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24337 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231978AbhBRLkB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 18 Feb 2021 06:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613648311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B2lJDd/EmEyicYFjWmTEhtQFprvghSwizmwUF39uDCA=;
        b=SXpBsPcnzFuwYyF6sjgCzEP473x6FRSW4UmpDWrn4es51lSBkXJgUC9y5/lg9/ZcFI+ULo
        ez7mvYllwPzUUNlzo567J+eNBLSSuj6Fgd3rDA0uHdnRhYAc0VqyjbVX4ewDwx0vjBzHPr
        mT81/yT3f3LoNJwPpitXun8zW9bzaY0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-M2x_1eSuPziyY0wGR3Ageg-1; Thu, 18 Feb 2021 06:27:18 -0500
X-MC-Unique: M2x_1eSuPziyY0wGR3Ageg-1
Received: by mail-wm1-f69.google.com with SMTP id t15so3350319wmj.1
        for <linux-mips@vger.kernel.org>; Thu, 18 Feb 2021 03:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=B2lJDd/EmEyicYFjWmTEhtQFprvghSwizmwUF39uDCA=;
        b=YMCCAoxMAHPo5Wa67OHJ+c1mUfwI2Oe8GleVwZ33/5YQ/UJpdmsDeB+sGrm712QsPM
         k11p1luErD/HHfQkr3wpkmNWy/4fh/e30VkZ4KCS3DQ3zRPvLHqPdOMe/2sxeesrApvA
         hEhe2S8E+OchUqWI0c7e2at+IA2e8IScIfWxDfbwAQ1JfzKyve+F0fIx2UR6AJGEQXSU
         J1KMv06X1KVbzgXHreQ/W7+V9nQ0k6Idr43URXerytzK8KL8FuUJHOJcKqUq1aTdYd59
         X4v7mkFe/9bQU8JvLyGepjUjfj478EK1UjB2/xpP4uW6DDQC4fsxTccFlU6rvUJQCE1n
         JdJg==
X-Gm-Message-State: AOAM530ay0P3n4Tfl3eY47vRxoXkbNlw8vXqMzNNKoMQoRoQNgC++INI
        ZEvCbHwFYhnARlfjY4jYkgXyrmrnd9W3IOj6PHoojKU372eWNEzHeZ0+a6fn7Pk5AhL2FHJ8VNm
        6vewCkgDF0EB3/8t+jx6dKIhDoMasBM6st+PIU+aBCdguGEZZaWvswO3FkbMLqYL951NBNQ==
X-Received: by 2002:a5d:5603:: with SMTP id l3mr3844596wrv.381.1613647637572;
        Thu, 18 Feb 2021 03:27:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLyyzkRu11gz+G6nk3c6VOzvN//OlBNN/w5+7pt1wCSevM1IKNiAfU0aiolWZiThh5hiWffQ==
X-Received: by 2002:a5d:5603:: with SMTP id l3mr3844554wrv.381.1613647637334;
        Thu, 18 Feb 2021 03:27:17 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6baa.dip0.t-ipconnect.de. [91.12.107.170])
        by smtp.gmail.com with ESMTPSA id h11sm6573479wmq.26.2021.02.18.03.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Feb 2021 03:27:16 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to prefault/prealloc memory
Date:   Thu, 18 Feb 2021 12:27:14 +0100
Message-Id: <254581A8-3108-436F-80AF-129B3F93CBF4@redhat.com>
References: <50f73055950ff7382f2194134ef0f439@sf-tec.de>
Cc:     Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dave Hansen <dave.hansen@intel.com>,
        Hugh Dickins <hughd@google.com>,
        Rik van Riel <riel@surriel.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org,
        Linux API <linux-api@vger.kernel.org>
In-Reply-To: <50f73055950ff7382f2194134ef0f439@sf-tec.de>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
X-Mailer: iPhone Mail (18D52)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 18.02.2021 um 12:15 schrieb Rolf Eike Beer <eike-kernel@sf-tec.de>:
>=20
> =EF=BB=BF
>>=20
>>> Let's introduce MADV_POPULATE with the following semantics
>>> 1. MADV_POPULATED does not work on PROT_NONE and special VMAs. It works
>>>   on everything else.
>>> 2. Errors during MADV_POPULATED (especially OOM) are reported. If we hit=

>>>   hardware errors on pages, ignore them - nothing we really can or
>>>   should do.
>>> 3. On errors during MADV_POPULATED, some memory might have been
>>>   populated. Callers have to clean up if they care.
>>> 4. Concurrent changes to the virtual memory layour are tolerated - we
>                                                    ^t
>>>   process each and every PFN only once, though.
>>> 5. If MADV_POPULATE succeeds, all memory in the range can be accessed
>>>   without SIGBUS. (of course, not if user space changed mappings in the
>>>   meantime or KSM kicked in on anonymous memory).
>=20
> You are talking both about MADV_POPULATE and MADV_POPULATED here.
>=20

Already fixed up :) thanks!

> Eike
>=20

