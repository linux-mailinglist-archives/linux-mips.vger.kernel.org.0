Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D5314FCDE
	for <lists+linux-mips@lfdr.de>; Sun,  2 Feb 2020 12:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgBBL0d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Feb 2020 06:26:33 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34137 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgBBL0c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Feb 2020 06:26:32 -0500
Received: by mail-qk1-f195.google.com with SMTP id g3so2836547qka.1
        for <linux-mips@vger.kernel.org>; Sun, 02 Feb 2020 03:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=haUAAZdbmdU3COyJ/sqnDbNti6tUXhiH5WpEb5CUu3o=;
        b=ktqi1Si5IANgowqGSuWt2goxaefj9MArH9hBL4drDxYpQy5gO9eIMpaj4x1g9qz0Ft
         wJg8PZziG/0FMCaYMFvU0R1ed/sRIgt60RVYo/fiPoIuWPHtw5CoKADSbrdPinp59eNX
         GqmqoNXOemL5q0rosXYIx2UJ1orNdlYcFK73Ygg0a/RE2arXPeSnjr+QO/TuQNX54JbP
         bi9ii20//c0h4YooeibM3yZGm2vZjIxTdT2q1agyMmadm90FFuyO+OFJ2urFPdZeXwtw
         AgKWNyLv5Arxyw8debfI90Lt1gaaDIBA8bYeatlKiESPBREuLesS3poug3ybj8+iH21/
         Psqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=haUAAZdbmdU3COyJ/sqnDbNti6tUXhiH5WpEb5CUu3o=;
        b=HY0bt6v8PWt8Mb+j0YUs6aHMGnStuTx0vgCC5Yi8x6FneBNmgyjxU9rKStw0wx9FGQ
         tTGnqDTqaYBazgRjiiqH5hXyps+GLThKiePRopdRA0zzP31zMXgwg5GKEHUIIAXKEfgo
         CJWsSyatPjzAfkZE0c8Zw6CZiPBX+wTezLPYPPB9P/ZfN1iz3n7OJlL/BsDuZETQBBn7
         TXbNT/FU+J351KM15R3fQF6VENJO5/QRkqOQo5cmWeILTN/wyDBe6mfqxe5vKDy9B/fJ
         PSje+ZtEQOSOQji9RbY6OiLdP196VwKJOJ5FTvXf6K6VDiBcC7BkNfIDhhjEElnm4g6U
         2syQ==
X-Gm-Message-State: APjAAAWlXFW2Hi4oqygQr5Oq6FMums0s1gtWzl4rcruM+/jn8+U4jiSi
        w3I1jKIm3ijnkciDOjkPTMAKcQ==
X-Google-Smtp-Source: APXvYqz2LMXXgwCpUXH7EnnO/Ck2Cj8Gc2SWzAj6pxocjOsHmdsAhT1kwXiGUD+liMIX2mq/rCkMKw==
X-Received: by 2002:a05:620a:218d:: with SMTP id g13mr19497581qka.286.1580642791619;
        Sun, 02 Feb 2020 03:26:31 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id s1sm7274932qkm.84.2020.02.02.03.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2020 03:26:30 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page table helpers
Date:   Sun, 2 Feb 2020 06:26:29 -0500
Message-Id: <2C4ADFAE-7BB4-42B7-8F54-F036EA7A4316@lca.pw>
References: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
Cc:     Anshuman Khandual <Anshuman.Khandual@arm.com>, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
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
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        kasan-dev <kasan-dev@googlegroups.com>
In-Reply-To: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
To:     Christophe Leroy <christophe.leroy@c-s.fr>
X-Mailer: iPhone Mail (17C54)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Jan 30, 2020, at 9:13 AM, Christophe Leroy <christophe.leroy@c-s.fr> wr=
ote:
>=20
> config DEBUG_VM_PGTABLE
>    bool "Debug arch page table for semantics compliance" if ARCH_HAS_DEBUG=
_VM_PGTABLE || EXPERT
>    depends on MMU
>    default 'n' if !ARCH_HAS_DEBUG_VM_PGTABLE
>    default 'y' if DEBUG_VM

Does it really necessary to potentially force all bots to run this? Syzbot, k=
ernel test robot etc? Does it ever pay off for all their machine times there=
?=
