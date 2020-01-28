Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2842014C092
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 20:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbgA1THN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 14:07:13 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34825 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbgA1THN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jan 2020 14:07:13 -0500
Received: by mail-qt1-f194.google.com with SMTP id t8so5682418qtr.2
        for <linux-mips@vger.kernel.org>; Tue, 28 Jan 2020 11:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=ZSIv5JurPysNixS3YWSkJ+cqh/2vHLB/JAVHcGR/4Zo=;
        b=rZzl+qEAYLTBtMp9ssPK9Ejc0IQXfIjcMlCwc8RZJ/Poapm8WZnOmSKjpPGU/CRTsz
         s49j6egQsNv+bATXo82MSoiXpQi3N3QHvgnyq6VfzcooOemBU6djud+xflwQG7RGqoPc
         L5M9+QbKcXOUUg0U09rJgFyuy4M0BvZq0fS3S49pfbq8xDC/uRvuAV9T3NJ2dNoyS3t+
         r0VLb2Wpo+pntt9bwsRP15mZe1cOZg5vc4u8F4VRwv/pqDLOhfKGv0d7nyNY7llsOI2p
         sOz+jYkbLFQ6oe89WgJeyG/Pa023GcDt5lsRxS1gRMmySONFqvaE1MUA5AHjPWyKvzIK
         /yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=ZSIv5JurPysNixS3YWSkJ+cqh/2vHLB/JAVHcGR/4Zo=;
        b=XaUkt6Obr+E4+XVjoH3vwVBuFTQESzE51ZTLhtMA7gEErkw2oe8hM8x/AKJfn8T4K+
         Cf94C6LnHh00yFQmJ7OJBcph//Pg+xalxJ88nPwvnR1S0r4aUgfOfSMuagtbuvQ6mofU
         avLJILhJMm8660nEYgeMcCh1kAfjGwRY4vCDZHabpb5Hyys8siTaemDZeMpMA4ZFystu
         va1MpwtLJqyMjEnT/Q1caA5CCK1/ja/2N9afZr3zbUwunjjLj33XaiQVfVoomMEkiAAZ
         0Q9wfPQYjCPtclCvmCBrTV6FPFQd6qqlFWvS5RWeeQdpEsByRS811AIbp/pSm1Y/rRid
         FCxQ==
X-Gm-Message-State: APjAAAXOv3mWH9NQy1W7y7KtRB3bSCBgZ9Xxq68BE4QREAIh3TLFEQuN
        hHcPJWbDiMLyGQPmJdLa+yQmXA==
X-Google-Smtp-Source: APXvYqwfcEAdtsZ+rCamZtj0MvoXkHQbqikImH2K21Z7lN9o0ZlEjUgJncOajxaQBGEujZOyMJYZkQ==
X-Received: by 2002:ac8:2b86:: with SMTP id m6mr23384923qtm.190.1580238432152;
        Tue, 28 Jan 2020 11:07:12 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id f7sm13273329qtp.86.2020.01.28.11.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 11:07:10 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page table helpers
Date:   Tue, 28 Jan 2020 14:07:10 -0500
Message-Id: <69091BA4-18C4-4425-A5E2-31FBE4654AF9@lca.pw>
References: <20200128174709.GK655507@arrakis.emea.arm.com>
Cc:     Anshuman Khandual <Anshuman.Khandual@arm.com>,
        Mark Rutland <Mark.Rutland@arm.com>,
        linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        James Hogan <jhogan@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
        Dave Hansen <dave.hansen@intel.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Steven Price <Steven.Price@arm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Ingo Molnar <mingo@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mark Brown <broonie@kernel.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Dan Williams <dan.j.williams@intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
In-Reply-To: <20200128174709.GK655507@arrakis.emea.arm.com>
To:     Catalin Marinas <catalin.marinas@arm.com>
X-Mailer: iPhone Mail (17C54)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Jan 28, 2020, at 12:47 PM, Catalin Marinas <catalin.marinas@arm.com> wr=
ote:
>=20
> The primary goal here is not finding regressions but having clearly
> defined semantics of the page table accessors across architectures. x86
> and arm64 are a good starting point and other architectures will be
> enabled as they are aligned to the same semantics.

This still does not answer the fundamental question. If this test is simply i=
nefficient to find bugs, who wants to spend time to use it regularly?  If th=
is is just one off test that may get running once in a few years (when intro=
ducing a new arch), how does it justify the ongoing cost to maintain it?

I do agree there could be a need to clearly define this thing but that belon=
gs to documentation rather than testing purpose. It is confusing to mix this=
 with other config options which have somewhat a different purpose, it will t=
hen be a waste of time for people who mistakenly enable this for regular aut=
omatic testing and never found any bug from it.=
